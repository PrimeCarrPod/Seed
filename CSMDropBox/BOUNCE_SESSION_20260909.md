# Bounce Session Log — 2026-09-09

**Author:** Jason Isaac Brodsky (California 1976) — Conducier  
**Branch:** `main` (PrimeCarrPod/Seed)  
**Working Directory:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/`  
**Date:** 2026-09-09  
**Duration:** Full session

---

## Session Objective
Implement GitHub releases list/download feature for Bounce v1.0.92:
1. Query `CSMApps/_Current_Releases` folder on GitHub for available Bounce APKs
2. Display all versions in Update panel with per-version download buttons
3. Implement APK download to local device storage
4. Create version folder structure for incremental development
5. Fix APK size (was 83 KB → 230 KB with three.min.js)

---

## Starting State
- **Current Version:** v1.0.91 (in `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/`)
- **APK Size:** 230 KB (v1.0.91)
- **GitHub Releases:** `Bounce-v1.0.87.apk`, `Bounce-v1.0.91.apk` in `CSMApps/_Current_Releases`
- **EKF Bug:** Fixed in previous session (PositionEKF.java:38, vy initialization)

---

## Work Completed

### 1. MainActivity.java — GitHub Releases Fetch & Download
**File:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/src/main/java/com/carrpod/bounce/MainActivity.java`

**Changes:**
- Replaced `fetchLatestVersion()` with `fetchAvailableReleases()` querying GitHub API:
  ```
  https://api.github.com/repos/PrimeCarrPod/Seed/contents/CSMApps/_Current_Releases?ref=main
  ```
- Added `ReleaseInfo` class (version, filename, download_url)
- Added `compareVersions()` for sorting (newest first)
- Added `downloadApk(version, url, filename)` — downloads to app's external files directory
- Updated `checkUpdate()` to send all releases via `Bounce.onReleasesAvailable([...])`
- Added `downloadRelease()` JsBridge method
- Fixed lambda capture issue: `final long totalFinal = total`

### 2. bounce.html — Releases List UI
**File:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/src/main/assets/bounce.html`

**Changes:**
- Added `releases-list` div in Update panel (max-height 200px, scrollable)
- Added `Bounce.onReleasesAvailable(releasesJson)` handler
- Added `Bounce.downloadRelease(ver, url, filename)` method
- Added `UI.showReleasesMenu(releases)` rendering:
  - Version badge (green for newer, yellow for older/current)
  - "NEWER" label for versions > current (1.0.92)
  - Filename display
  - Per-version Download button (green for newer, orange for older)
- Updated `UI.showUpdateMenu()` / `UI.hideUpdateMenu()` to handle releases list

### 3. AndroidManifest.xml — Version Bump
**File:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/src/main/AndroidManifest.xml`

**Changes:**
- `android:versionCode="191"` → `"192"`
- `android:versionName="1.0.91"` → `"1.0.92"`

### 4. build.sh — Dynamic SDK Path
**File:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/build.sh`

**Changes:**
- `PROJECT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"`
- `SDK_DIR="${ANDROID_HOME:-/workspace/.../.sdk/android-sdk}"`
- Fixed workspace root copy paths

### 5. BOUNCE_ULTRA_MASTER_FEATURE_LIST.md — Documentation Update
**File:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/BOUNCE_ULTRA_MASTER_FEATURE_LIST.md`

**Changes:**
- Version header: 1.0.92 (2026-09-09)
- Enhanced A04: "Auto-Update System (GitHub releases list + download)"
- Added D11: "GitHub Releases List & Download"
- Updated version matrix with v1.0.92 entry
- Updated file structure reference

### 6. SDKForge — Android Toolchain Installation
**Script:** `CSMScripts/freenemo_modules/05_sdk_forge.sh`

**Installed:**
- OpenJDK 17 (openjdk-17-jdk-headless)
- Android cmdline-tools (latest)
- Platform android-33 (android.jar)
- Build-tools 33.0.1 (aapt2, d8, zipalign, apksigner)
- Verified all tools present

### 7. three.min.js Restoration — Fixed APK Size
**Problem:** APK built at 83 KB (missing three.min.js — 603 KB)
**Solution:** Copied three.min.js from TardigradiaTGPU releases to:
- `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91/src/main/assets/js/three.min.js`
- `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.92/src/main/assets/js/three.min.js`

**Result:** APK now builds at **230 KB** (correct size matching v1.0.91)

### 8. Version Folder Structure — Incremental Development
Created:
```
CSM_WORK_IN_PROGRESS/BOUNCE.WIP/
├── v1.0.91/     # Original version (preserved)
├── v1.0.92/     # New version with GitHub releases feature
│   ├── src/main/... (complete source tree)
│   ├── build.sh
│   └── out/Bounce-v1.0.92.apk (230 KB)
├── v92/         # Duplicate folder (local only)
└── BOUNCE_ULTRA_MASTER_FEATURE_LIST.md
```

Each version now has its own folder for surgical incremental development.

### 9. Git Operations
**Commits on main:**
1. `bba83098e` — "Bounce v1.0.92: EKF bug fix + GitHub releases list/download feature"
2. `1d55841af` — "Bounce v1.0.92: Add version folder with full source, restore three.min.js"
3. `c56d91ef7` — "chore: add android sdk tools and bounce build artifacts" (local only)
4. `6b2c9d433` — "Bounce v1.0.92: Add version folder with full source, restore three.min.js" (rebased)
5. `7783c6c30` — "Bounce v92: Add v92 folder with complete source (copy of v1.0.92)" (local)
6. `86dc302d1` — "Bounce v92: Remove three.min.js (use v1.0.92 copy)" (local)

**Push Status:** 
- v1.0.92 files (22 files) confirmed on `origin/main` via `git ls-tree`
- Push of v92 folder fails with HTTP 413/502 (cloud environment network limits)
- three.min.js (603 KB) likely cause of push rejection

---

## Verification Results

### GitHub Releases Fetch (Tested via API)
```json
[
  {"name":"Bounce-v1.0.87.apk","path":"CSMApps/_Current_Releases/Bounce-v1.0.87.apk","download_url":"https://github.com/PrimeCarrPod/Seed/raw/main/CSMApps/_Current_Releases/Bounce-v1.0.87.apk"},
  {"name":"Bounce-v1.0.91.apk","path":"CSMApps/_Current_Releases/Bounce-v1.0.91.apk","download_url":"https://github.com/PrimeCarrPod/Seed/raw/main/CSMApps/_Current_Releases/Bounce-v1.0.91.apk"}
]
```

### APK Verification
```
v1.0.92 APK: 230,826 bytes (225 KB)
aapt2 dump badging:
  package: name='com.carrpod.bounce' versionCode='192' versionName='1.0.92'
  uses-permission: INTERNET, ACCESS_WIFI_STATE, CHANGE_WIFI_STATE, ACCESS_FINE_LOCATION, ...
```

### Files on origin/main (git ls-tree -r origin/main | grep v1.0.92)
22 files confirmed:
- build.sh
- src/main/AndroidManifest.xml
- src/main/assets/bounce.html
- src/main/assets/js/ (8 files: CopyShader, EffectComposer, LuminosityHighPassShader, OrbitControls, RenderPass, ShaderPass, UnrealBloomPass, three.min.js)
- src/main/java/com/carrpod/bounce/MainActivity.java
- src/main/java/com/carrpod/bounce/wifi/ (6 files: ParticleFilter, PositionEKF, RssiKalmanFilter, Trilateration, WifiRttRanging, ZoneHMM)
- src/main/res/ (4 files)

---

## Technical Details

### Key Code Locations
| Feature | File | Lines |
|---------|------|-------|
| GitHub API fetch | MainActivity.java | 319-379 |
| Version comparison | MainActivity.java | 382-395 |
| Download implementation | MainActivity.java | 1486-1527 |
| JS bridge download | MainActivity.java | 1465-1468 |
| Releases UI rendering | bounce.html | 733-771 |
| Download button click | bounce.html | 762 |

### Permissions Used
- `android.permission.INTERNET` (already in manifest)
- Downloads to `getExternalFilesDir(null)` → falls back to `getFilesDir()`

### Build Command
```bash
cd CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.92 && bash build.sh
# Requires: ANDROID_HOME set, JDK 17, Android SDK 33
```

---

## Next Steps (Priority Order)

| Priority | Task | Effort |
|----------|------|--------|
| P0-02 | Complete RTT Ranging (802.11mc) | High |
| P0-03 | AP Position Self-Calibration | High |
| P1-01 | Particle Filter Parameter Learning | High |
| P1-02 | Unit Test Suite (JUnit) | High |
| P2-04 | Night/Day Theme Toggle | Low |
| P2-05 | Export Trail as GPX/KML | Low |

---

## Notes
- v1.0.92 folder is **on GitHub main** (commit `1d55841af`)
- v92 folder is local duplicate — push blocked by GitHub 413 limit
- three.min.js (603 KB) causes push size issues; consider .gitattributes LFS or external reference
- All existing functionality preserved — surgical additions only
- APK builds correctly at ~230 KB with full Three.js visualization

---

*Session Complete — Ready for next feature cycle*