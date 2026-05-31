# blizzard-yong
Blizzard yong GS EP12 version

---

# Patch System Guide

## Tools Overview

| Tool | Purpose |
|------|---------|
| **VersionManager.exe** | Compress files → upload to FTP |
| **VerMan.exe** | Increment version numbers |
| **Launcher (AutoPatchMan.exe)** | Client downloads and applies patch |

---

## Initial Setup (First Time Only)

### 1. Folder Structure
```
C:\xampp\htdocs\yong-patch\VerMan\
├── sourceFile\     ← put game files here
├── patch\          ← .cab files saved here
├── log\
└── result\
```

### 2. VersionManager.xml
Place next to VersionManager.exe:
```xml
<?xml version="1.0" encoding="utf-8"?>
<VERSION_MANAGER>
  <TARGET_PATH>C:\xampp\htdocs\yong-patch\VerMan\patch\</TARGET_PATH>
  <DB>
    <DB_SOURCE>DESKTOP-B51OHP4\SQLEXPRESS</DB_SOURCE>
    <NAME>RanPatch</NAME>
    <USER>blizzard</USER>
    <PASSWORD>123456</PASSWORD>
  </DB>
  <FTP>
    <IP>26.222.180.114</IP>
    <PORT>21</PORT>
    <USER>blizzard</USER>
    <PASSWORD>qwerty123</PASSWORD>
  </FTP>
</VERSION_MANAGER>
```

### 3. filelist.lst
```
source_path	C:\xampp\htdocs\yong-patch\VerMan\sourceFile\
fileVersion_Add	1

\
    launcherpatch.exe
    game.exe
    param.ini

\data\glogic\
    mapslist.lua
```

### 4. sourceFile\ folder must match .lst structure
```
sourceFile\
├── launcherpatch.exe    ← copy of AutoPatchMan.exe renamed
├── game.exe
├── param.ini
└── data\
    └── glogic\
        └── mapslist.lua
```

### 5. Load and compress files
1. Open **VersionManager.exe**
2. **File → Open** → select `filelist.lst`
3. Wait for compression — check log panel for errors

### 6. Save file list
- **File → Save** → generates `filelist.bin.cab` in `patch\`

### 7. Upload to FTP
- Click **FTP button** → uploads all `.cab` files + `filelist.bin.cab`

### 8. Set initial version
- Open **VerMan.exe**
- Set **PatchVer** = `1002`
- Set **ClientVer** = `1002`
- Click OK → saves `cVer.bin`
- Manually upload `cVer.bin` to FTP root

---

## Releasing a Patch Update (Every Time)

### Step 1 — Update source files
Replace updated game files in `sourceFile\` with new versions.

### Step 2 — Update filelist.lst (only if adding new files)
Add new file entries to `.lst`. Skip if only updating existing files.

### Step 3 — Compress in VersionManager
1. Launch **VersionManager.exe**
2. **File → Open** → select `filelist.lst`
3. Only changed files are recompressed (MD5 check)
4. Check log panel — all files should succeed

### Step 4 — Save file list
- **File → Save** → regenerates `filelist.bin.cab`

### Step 5 — Upload to FTP
- Click **FTP button** → uploads changed `.cab` files + new `filelist.bin.cab`

### Step 6 — Increment version in VerMan
1. Open **VerMan.exe**
2. Increment **both PatchVer and ClientVer** by 1 (e.g. `1002` → `1003`)
3. Click OK → saves `cVer.bin`
4. Manually upload `cVer.bin` to FTP root

### Step 7 — Done
Players run Launcher → detects new version → downloads only changed files → game updated

---

## FTP Root Structure

```
FTP Root /
├── cVer.bin              ← uploaded manually via VerMan
├── filelist.bin.cab      ← uploaded via VersionManager
├── launcherpatch.exe.cab
├── game.exe.cab
├── param.ini.cab
└── data\
    └── glogic\
        └── mapslist.lua.cab
```

---

## Version Numbers Explained

| Value | Where | Meaning |
|-------|-------|---------|
| **PatchVer** | cVer.bin / VerMan | Latest patch version available on FTP |
| **ClientVer** | cVer.bin / VerMan | Minimum version required to connect to server |
| **SERVER_VERSION** | LoginServer.xml | Must match PatchVer |
| **PATCH_VERSION** | LoginServer.xml | Must match ClientVer |

Always increment **both PatchVer and ClientVer** together on every patch release.
Clients below ClientVer are rejected by LoginServer until they patch.

---

## Launcher Flow (Client Side)

```
Player runs Launcher
    ↓
1. Downloads param.ini.cab from HTTP server (FIRST thing)
   → Extracts and overwrites local param.ini
   → Reloads HttpAddress, LoginAddress from new param.ini
    ↓
2. Connects to LoginServer using LoginAddress from param.ini
   → Sends client version
   → Receives SERVER_VERSION from LoginServer
    ↓
3. Compares versions
   → If up to date: shows START button → launches game
   → If outdated:   shows UPDATE START button
    ↓
4. Player presses UPDATE START
   → Downloads filelist.bin.cab from HttpAddress
   → Compares each file version vs local
   → Downloads only changed .cab files
   → Extracts files to game folder
    ↓
5. Shows START button → launches game
```

---

## Important: param.ini.cab Warning

The Launcher downloads `param.ini.cab` from FTP **before** connecting to LoginServer.
If `param.ini.cab` is on your FTP and contains wrong/outdated settings, it will
overwrite the client's working `param.ini` and break the patch download silently.

**Rule:** Only include `param.ini` in `filelist.lst` if you are intentionally pushing
a config change to all clients (e.g. changing LoginAddress or HttpAddress).
If param.ini is not changing, **remove it from filelist.lst** to avoid overwriting
client configs.

---

## Notes
- Do NOT include cVer.bin or cfilelist.bin in filelist.lst — they are outputs, not inputs
- launcherpatch.exe is a copy of AutoPatchMan.exe renamed — used for launcher self-update
- The delete function in the Launcher is disabled — removing files from filelist.lst will NOT delete them from client machines
- LoginServer.xml is the only server XML that sets version numbers — all others stay at 0
- param.ini.cab is downloaded before login — wrong FTP copy silently breaks patch downloads

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