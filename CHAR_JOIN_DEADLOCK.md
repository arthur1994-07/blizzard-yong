# Character Join Deadlock — Analysis & Fix

## The 7-Step Login Flow

| Step | Who | What |
|------|-----|------|
| 1 | Client | Clicks character in lobby |
| 2 | AgentServer | Runs `CharacterInfoAndJoinAgent` DB job (6 queries — char data, friends, notifications, etc.) |
| 3 | AgentServer | Sends field check (`NET_MSG_FIELDSVR_CHARCHK`) to all FieldServers |
| 4 | FieldServer | Responds with `bExist=true/false` per `RequestFieldSvrCharChk` |
| 5 | AgentServer | All checks pass → sends `NET_GAME_JOIN_FIELDSVR` → FieldServer calls `SetCreatingCharUserID` → queues `CharacterInfoAndJoinField` |
| 6 | FieldServer | `CharacterInfoAndJoinField` DB job runs (loads char into game world, calls `ResetCreatingCharUserID` on completion) |
| 7 | FieldServer → AgentServer | Result sent back → character is live in game |

---

## Where the Deadlock Happens

The deadlock occurs **between steps 5 and 6**, triggered by the client's timeout on a cold server.

```
Step 5: NET_GAME_JOIN_FIELDSVR received
        → SetCreatingCharUserID(UserDbNum)
        → CharacterInfoAndJoinField queued

Step 6: DB job begins executing
        Cold server: first ODBC connection to SQL Server not yet
        established — takes 10–30s on top of actual query time

        ← CLIENT 30s START_WAIT_TIME EXPIRES ←

        Client disconnects and immediately reconnects.
        Retry enters steps 1–4 again.

        Step 4 (field check) arrives at FieldServer:
          RequestFieldSvrCharChk:
            FindCreatingCharUserID(UserDbNum) = TRUE  ← step 6 still running
            → bExist = true
            → "Duplicate game join! RequestFieldSvrCharChk" logged
            → AgentServer receives bExist=true
            → MsgReqFieldSvrCharChkFb fires

        ← STUCK — step 7 never reached ←
```

Every retry hits the same wall because `FindCreatingCharUserID` stays true until step 6 finishes. The client keeps timing out and retrying, each time hitting `bExist=true`.

---

## What Happens When Step 6 Eventually Completes

When `CharacterInfoAndJoinField` finally finishes:

1. `ResetCreatingCharUserID(UserDbNum)` is called — `FindCreatingCharUserID` becomes false.
2. The character is added to the FieldServer game world.
3. The result is sent back to AgentServer with the **original GaeaId** from step 5.

**Problem:** By this point, the original GaeaId has been invalidated. Each retry in the deadlock loop caused `DropOutChar` (either directly or via `CreateCharCheck` ghost eviction), returning that GaeaId to the free pool. AgentServer can't find it — the result is discarded.

**New problem:** The character is now **alive in the FieldServer game world but invisible to AgentServer**. The next retry's field check hits `GetChaByName=true` → `DropOutPC` kicks the char from FieldServer → `bExist=true` again → one more retry needed.

Only after `DropOutPC` clears the char from FieldServer does a field check finally pass `bExist=false`, allowing a clean login.

---

## Why Only a Server Restart Fixes It (Without Our Fixes)

Without the fixes, `MsgReqFieldSvrCharChkFb` when `bExist=true` called `FieldCheckNumReset()` and sent nothing to the client:

```cpp
// Original broken code
pChar->FieldCheckNumReset();  // resets AgentServer tracking state
return TRUE;                  // no message to client → client hangs for 30s
```

`FieldCheckNumReset()` clears the AgentServer's field check tracking, expecting all FieldServers to respond again. But the FieldServer already responded to this specific check request and will not send a second response. `IsFieldCheckComplete` waits forever. The client hangs until the 30-second `START_WAIT_TIME` expires, showing no feedback.

On server restart: all in-memory state is cleared — `CreatingCharUserID`, `m_PCNameMap`, `m_CharNameMap`, etc. — so the login can start fresh.

---

## Root Causes Summary

| # | Root Cause | Location |
|---|-----------|----------|
| 1 | Cold DB makes `CharacterInfoAndJoinField` take longer than client's 30s wait | FieldServer / DB |
| 2 | `IsCharJoining` guard released too early (top of `MsgAgentReqJoinDA`), allowing retry to queue a new DB job while FieldServer step 6 is still running | `AgentServerMsgGameJoin.cpp` |
| 3 | `MsgReqFieldSvrCharChkFb` called `FieldCheckNumReset()` with no client message → client hung permanently | `GLAgentServerMsg.cpp` |
| 4 | No mechanism to force-reset `FindCreatingCharUserID` on FieldServer from AgentServer side | `GLGaeaServer.cpp` |
| 5 | `CreateCharCheck` ghost eviction sent `DROP_OUT_FORCED` to new client and returned false → error dialog even for recoverable ghost sessions | `GLAgentServer.cpp` |
| 6 | `MsgAgentReqJoinDA` silent returns on slot-closed and char-mismatch cases sent nothing to client → client hung | `AgentServerMsgGameJoin.cpp` |

---

## Fixes Applied

### Fix 1 — `GLAgentServer.cpp` · `CreateCharCheck` · m_PCNameMap block
**Problem:** Ghost eviction sent `DROP_OUT_FORCED` to the NEW client and returned `false`, rejecting the new login even after the ghost was already removed.

**Fix:** Removed `SENDTOCLIENT(ClientSlot, DROP_OUT_FORCED)` to the new client. Removed `return false` — function falls through after ghost eviction. Changed log from ERROR to WARN. The ghost is evicted from all maps via `DropOutChar`, and the new login proceeds through the remaining checks cleanly.

---

### Fix 2 — `AgentServerMsgGameJoin.cpp` · `MsgAgentReqJoinDA` · Silent returns
**Problem:** Three early-return paths sent no message to the client:
- `!IsClientSlot` — slot closed during DB job
- `!IsAccountPass` — account state reset
- Char num mismatch — slot reused by different user

Client received nothing and hung for 30 seconds.

**Fix:**
- `!IsClientSlot`: log and return (slot is dead, nothing to send).
- Added `UserDbNum` comparison after `IsClientSlot` to detect slot reuse — log and return without sending to the new occupant.
- `!IsAccountPass` and char num mismatch: send `EMCJOIN_FB_ERROR` so the client shows a dialog instead of hanging.

---

### Fix 3 — `AgentServerMsgGameJoin.cpp` · `MsgGameJoinCA` · Duplicate DB job guard
**Problem:** Double-clicking a character (or client retries) queued two `CharacterInfoAndJoinAgent` DB jobs for the same user simultaneously. Both completed and both called `CreateChar`, triggering the ghost collision in `CreateCharCheck`.

**Fix:** Added `IsCharJoining` guard (mirroring `IsChaSaving`). Before `AddGameAdoJob`, call `CharJoinAdd(UserDbNum)`. At the top of `MsgAgentReqJoinDA`, call `CharJoinDel(UserDbNum)`. If `IsCharJoining` is true when a new join request arrives, send `EMCJOIN_FB_WAIT` immediately — no second DB job queued.

**Files touched:** `AgentClientMan.h`, `AgentClientMan.cpp` (new `m_JoinUserNum` map + `ChaJoinUserNum*` methods), `GLAgentServer.h`, `GLAgentServerMsg.cpp` (new `IsCharJoining`, `CharJoinAdd`, `CharJoinDel`).

---

### Fix 4 — `AgentServerMsgGameJoin.cpp` · `MsgAgentReqJoinDA` · CreateChar null result
**Problem:** When `CreateChar` returned null (ghost eviction via `CreateCharCheck`), `EMCJOIN_FB_ERROR` was sent — showing a permanent error dialog. The player had to relog entirely instead of retrying character selection.

**Fix:** Changed `EMCJOIN_FB_ERROR` to `EMCJOIN_FB_WAIT`. Ghost eviction is a recoverable condition; the client should retry rather than fail.

---

### Fix 5 — `GLAgentServerMsg.cpp` · `MsgReqFieldSvrCharChkFb` · bExist=true handling
**Problem:** `FieldCheckNumReset()` was called when `bExist=true`, with no message to the client. This reset AgentServer's tracking state but the FieldServer had already responded and would not respond again — `IsFieldCheckComplete` waited forever.

**Fix:** Removed `FieldCheckNumReset()`. When `bExist=true`:
1. Send `EMCJOIN_FB_WAIT` to client so it can retry.
2. The `FindCreatingCharUserID` state on FieldServer will clear naturally when the DB job completes (`ResetCreatingCharUserID`). On retry, the field check passes and login continues.

---

### Fix 6 — `RanUI` · `SelectCharacterPage.cpp` + `SelectCharacterLeftPage.cpp`
**Problem:** `START_WAIT_TIME(60.0f)` — client waited 60 seconds before timing out.

**Fix:** Reduced to `START_WAIT_TIME(30.0f)`. Matches the realistic window for a cold server to complete both DB jobs (AgentServer + FieldServer).

---

## Key Files Changed

| File | Change |
|------|--------|
| `RanLogicServer/AgentServer/GLAgentServer.cpp` | `CreateCharCheck` ghost eviction — no longer rejects new login |
| `RanLogicServer/AgentServer/GLAgentServerMsg.cpp` | `MsgReqFieldSvrCharChkFb` — sends WAIT instead of hanging |
| `RanLogicServer/AgentServer/GLAgentServer.h` | `IsCharJoining`, `CharJoinAdd`, `CharJoinDel` declarations |
| `RanLogicServer/AgentServer/AgentClientMan.h` | `m_JoinUserNum` map + `ChaJoinUserNum*` declarations |
| `RanLogicServer/AgentServer/AgentClientMan.cpp` | `ChaJoinUserNum*` implementations |
| `RanLogicServer/AgentServer/GLAgentServerMsg.cpp` | `IsCharJoining`, `CharJoinAdd`, `CharJoinDel` implementations |
| `RanLogicServer/Server/AgentServerMsgGameJoin.cpp` | Guard check, silent return fixes, WAIT on null CreateChar |
| `RanUI/OldUI/Interface/SelectCharacterPage.cpp` | 60s → 30s timeout |
| `RanUI/OldUI/Interface/SelectCharacterLeftPage.cpp` | 60s → 30s timeout |

---

## Is the Deadlock the Only Cause of Stuck Character Loading?

No. There are three distinct causes, each with different symptoms:

| Cause | Symptom | Triggered by |
|---|---|---|
| `CreateCharCheck` ghost eviction rejecting new login | Error dialog on character select | Any duplicate session in AgentServer maps |
| `MsgAgentReqJoinDA` silent returns | Client hangs 30s with no feedback | TCP drop during AgentServer DB job window |
| `FindCreatingCharUserID` deadlock | Client hangs repeatedly, only server restart fixes | Cold DB making step 6 slow enough that client times out and retries |

The deadlock is the hardest to hit in production (requires a cold server), but the most damaging — once triggered, retries make it worse. The first two causes are more common during normal operation and are addressed by the fixes in this session.

---

## Remaining Known Limitation and Proper Deadlock Fix

The `IsCharJoining` guard is currently released at the **top of `MsgAgentReqJoinDA`** — before the field check even starts (steps 3–4). This means if the client retries while the FieldServer DB job (step 6) is still running, a new AgentServer DB job can be queued, a new field check sent, and `FindCreatingCharUserID=true` is hit again.

### Proper Fix

Keep `IsCharJoining` active through the entire login flow — all the way until **step 7 completes**. `CharJoinDel` should only be called when the login is truly done or truly failed:

- **Success**: when the FieldServer join result (`NET_CHAR_JOIN_DF`) is processed by AgentServer and the character is confirmed in game
- **Failure**: at each error return path in `MsgAgentReqJoinDA` and `MsgReqFieldSvrCharChkFb`

With this in place, if step 6 is still running when the client retries, `MsgGameJoinCA` sees `IsCharJoining=true` and sends `EMCJOIN_FB_WAIT` immediately — no new AgentServer DB job, no new field check, no second `NET_GAME_JOIN_FIELDSVR`, no collision with `FindCreatingCharUserID`. The client waits until step 7 completes, then retries cleanly.

This requires moving `CharJoinDel` out of the top of `MsgAgentReqJoinDA` and placing it at each exit point of the full login flow.
