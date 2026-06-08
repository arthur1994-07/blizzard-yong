# Patch Update Procedure

## Overview

| Tool | Purpose |
|------|---------|
| **VersionManager.exe** | Compress game files into .cab, upload to FTP/HTTP server |
| **VerMan.exe** | Set patch version numbers, write cVer.bin |
| **LoginServer UI** | Set Game Version and Launcher Version live |
| **Launcher (AutoPatchMan.exe)** | Client-side tool that downloads and applies patches |

---

## Version Number Reference

| Value | Tool | Maps To | Purpose |
|-------|------|---------|---------|
| **PatchVer** | VerMan | LoginServer Launcher Version | Launcher self-update trigger — keep at `1002`, never change |
| **ClientVer** | VerMan | LoginServer Game Version | Game file update trigger — increment every patch |
| **SERVER_VERSION** | LoginServer.xml | sGameVer in launcher | Must match ClientVer — increment every patch |
| **PATCH_VERSION** | LoginServer.xml | sPatchVer in launcher | Keep at `1002` — never change |

### How version comparison works:

```
Launcher connects to LoginServer → receives Game Version and Launcher Version

If Game Version > client local game version  → UPDATE START button appears → downloads game files
If Launcher Version > client local patch ver → UPDATE START button appears → (self-update disabled)
```

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

\data\gui\
    example.xml
```

**Rules:**
- Only add `param.ini` if intentionally pushing a config change to clients
- Do NOT list `cVer.bin` or `cfilelist.bin`
- Every file listed must physically exist in `sourceFile\`

### 4. sourceFile\ folder must match .lst structure
```
sourceFile\
├── launcherpatch.exe    ← copy of AutoPatchMan.exe renamed
├── game.exe
└── data\
    └── gui\
        └── example.xml
```

### 5. Load and compress files
1. Open **VersionManager.exe**
2. **File → Open** → select `filelist.lst`
3. Wait for compression — check log panel for errors

### 6. Save file list
- **File → Save** → generates `filelist.bin.cab` in `patch\`

### 7. Upload to FTP
- Click **FTP button** → uploads all `.cab` files + `filelist.bin.cab`

### 8. Set initial version in VerMan
1. Open **VerMan.exe**
2. Set **PatchVer** = `1002` — never change this
3. Set **ClientVer** = `1002`
4. Click OK → saves `cVer.bin`
5. Copy `cVer.bin` to `C:\xampp\htdocs\yong-patch\VerMan\patch\`

### 9. Set initial version in LoginServer UI
- **Game Version** = `1002`
- **Launcher Version** = `1002` — never change this

---

## Releasing a Patch Update (Every Time)

### Step 1 — Update source files
Replace updated game files in `sourceFile\` with new versions.

### Step 2 — Update filelist.lst (only if adding new files/directories)

Add new entries to `.lst`. Skip if only updating existing files.

**If adding a new subdirectory**, check `filelist.csv` after File → Open to confirm files show the correct path (e.g. `\data\gui\`). If they show `\,` (root), the DB has them in the wrong directory — fix with SQL:
```sql
USE RanPatch;
DELETE FROM ClientFile WHERE cf_name IN ('newfile.xml');
```
Then **File → Open** again.

### Step 3 — Compress in VersionManager
1. Launch **VersionManager.exe**
2. **File → Open** → select `filelist.lst`
3. Changed files are recompressed, unchanged files are skipped (same MD5)
4. Check log panel — no errors should appear

### Step 4 — Save file list
- **File → Save** → regenerates `filelist.bin.cab`

### Step 5 — Upload to FTP
- Click **FTP button** → uploads changed `.cab` files + new `filelist.bin.cab`

### Step 6 — Increment ClientVer in VerMan
1. Open **VerMan.exe**
2. Increment **ClientVer** by 1 (e.g. `1006` → `1007`) — PatchVer stays at `1002`
3. Click OK → saves `cVer.bin`
4. Copy `cVer.bin` to `C:\xampp\htdocs\yong-patch\VerMan\patch\`

### Step 7 — Update LoginServer Game Version
In **LoginServer UI**:
- Set **Game Version** to match new ClientVer (e.g. `1007`)
- Leave **Launcher Version** at `1002` — never change this
- Changes take effect immediately — no restart needed

Note: `LoginServer.xml` only needs updating if you want the version to persist across server restarts.

### Step 8 — Done
Players run Launcher → detects new version → downloads only changed files → game updated

---

## What to update every patch release:

| What | Where | Action |
|------|-------|--------|
| ClientVer | VerMan.exe | Increment by 1 (e.g. `1006` → `1007`) |
| Game Version | LoginServer UI | Increment by 1 (match ClientVer) |
| SERVER_VERSION | LoginServer.xml | Increment by 1 (match ClientVer) — optional if using UI |

## What to NEVER change:

| What | Where | Value |
|------|-------|-------|
| PatchVer | VerMan.exe | `1002` — fixed forever |
| Launcher Version | LoginServer UI | `1002` — fixed forever |
| PATCH_VERSION | LoginServer.xml | `1002` — fixed forever |

---

## Files on HTTP Server (patch folder)

```
C:\xampp\htdocs\yong-patch\VerMan\patch\
├── cVer.bin                  ← copied from VerMan output every patch
├── filelist.bin.cab          ← generated by File → Save every patch
├── launcherpatch.exe.cab     ← copy of AutoPatchMan.exe renamed (never changes)
├── game.exe.cab
└── data\
    └── gui\
        └── example.xml.cab
```

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
   → Receives Game Version from LoginServer
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

The Launcher downloads `param.ini.cab` **before** connecting to LoginServer.
If `param.ini.cab` is on your FTP with wrong/outdated settings, it will
overwrite the client's working `param.ini` and break the patch download silently.

**Rule:** Only include `param.ini` in `filelist.lst` if intentionally pushing
a config change (e.g. changing LoginAddress or HttpAddress).

---

## Troubleshooting

### UPDATE START button doesn't appear
- Game Version in LoginServer UI is ≤ client's local game version
- Increase Game Version above client's current value

### UPDATE START pressed but nothing happens
- Game Version in LoginServer UI is ≤ client's local game version (game already up to date)
- Check launcher log for `[DEBUG]` line: `sGameVer` must be > `cGameVer`
- Increase Game Version

### Launcher shows UPDATE every time even after patching
- Launcher Version in LoginServer UI is > client's local patch version
- Set Launcher Version to `1002` to match client

### Files download from wrong path (launcher hangs on subdirectory files)
- Check `filelist.csv` — subdirectory files must show correct path e.g. `\data\gui\`
- If they show `\,` (root), delete them from DB and reload .lst

### param.ini overwritten with wrong settings
- Remove `param.ini` from `filelist.lst`
- Delete `param.ini.cab` from FTP patch folder

### FTP Upload fails with "550 Permission denied"
- Open FileZilla Server Interface
- Edit → Users → blizzard → Shared Folders
- Enable Write, Delete, Append, Create directories permissions

### "DB Open Failed" on VersionManager startup
- Check SQL Server service is running (services.msc)
- Verify `blizzard` login has access to `RanPatch` database
- Check `VersionManager.xml` credentials are correct

### "Failed to compress X.cab"
- Source file missing from `sourceFile\` folder
- Check `source_path` in `.lst` file points to correct folder

### "The unique value of X is 0" in VersionManager log
- Folder exists on disk but not in DB
- Insert manually:
```sql
USE RanPatch;
INSERT INTO ClientDir (cd_path) VALUES ('\data\gui\');
```
Then **File → Open** again.
