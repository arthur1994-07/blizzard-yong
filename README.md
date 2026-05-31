# blizzard-yong
Blizzard yong GS EP12 version

See [PATCH_PROCEDURE.md](PATCH_PROCEDURE.md) for the full patch update procedure.

---

# Build Dependency Chain

building dependency chain

SigmaCore
    │
    ├──────────────────┐
    │                  │
  EngineLib          (direct)
    │
    ├──────────────────┐
    │                  │
  RanLogic          RanGfxUI
    │                  │
    │         RanLogicClient
    │                  │
    │               RanUI
    │                  │
    ├──────────────────┤
    │                  │
RanLogicServer    TestConsole
    │             (RanClient.exe)
    │
AgentServer
FieldServer
LoginServer
CacheServer
SessionServer
AuthServer