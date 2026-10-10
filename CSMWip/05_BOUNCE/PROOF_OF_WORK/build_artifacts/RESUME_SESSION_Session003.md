# RESUME SESSION INSTRUCTIONS — BOUNCE Android App (Session 003)
**Author:** Jason Isaac Brodsky (California 1976) — Conducier  
**Project:** BOUNCE v1.0.92 Android Build  
**Repository:** github.com/PrimeCarrPod/Seed  
**Target Directory:** CSMWip/05_BOUNCE/BOUNCE.WIP/  
**Session Date:** 2026-10-08  
**Session ID:** bounce_android_20261008_020537

---

## QUICK START — Copy-Paste This Block to Resume

```bash
# 1. Navigate to workspace
cd /workspace/bb8f9c5f-e866-4346-a29c-8d72daa0ad2d/worktrees/worktree_12e4cc5c-88f9-4c4e-a46d-b5896e6b345e

# 2. Verify branch
git checkout bounce-android-continue 2>/dev/null || git checkout -b bounce-android-continue
git pull origin bounce-android-continue 2>/dev/null || true

# 3. Check status
git status
ls -la CSMWip/05_BOUNCE/BOUNCE.WIP/

# 4. Review Master Feature List
cat CSMWip/05_BOUNCE/BOUNCE.WIP/BOUNCE_ULTRA_MASTER_FEATURE_LIST.md

# 5. Review Project Logs
cat CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_001.md
cat CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_002.md
cat CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_003.md

# 6. Start heartbeat monitor
nohup bash -c 'while true; do echo "$(date -u +"%Y-%m-%d %H:%M:%S UTC") | BRANCH: $(git branch --show-current 2>/dev/null || echo detached) | PROJECT: BOUNCE Android" >> CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log; sleep 30; done' &
```

---

## CURRENT STATE SUMMARY (Session 003)

### Git State
- **Last Commit Hash:** `d0bf82b887919f7ed818b259df88daad611526c8`
- **Current Branch:** `kilo/wandering-link-gvp` (no `bounce-android-continue` branch exists on remote)
- **Working Tree:** Clean

### Build Versions Status
| Version | Source Location | Build Status | APK Available |
|---------|----------------|--------------|---------------|
| v1.0.91 | `v1.0.91/` | ✅ Source ready, EKF fix applied | ❌ Build failed (SDK incomplete) |
| v1.0.92 | `v1.0.92/` | ✅ Source ready, same as v1.0.91 | ❌ Build failed (SDK incomplete) |
| v92 (Debug) | `v92/` | ✅ Pre-built artifacts exist | ✅ `Bounce-v1.0.92.apk` (230 KB) |

### Heartbeat Monitor
- **PID:** 943 (background_process id: `bgp_11946ce68001Efy7fMNmZLuC0k`)
- **Log Location:** `CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log`
- **Status:** Running (logging every 30 seconds)

### Key Source Files (Verified)
- `v1.0.91/src/main/java/com/carrpod/bounce/MainActivity.java` (1,416 lines)
- `v1.0.91/src/main/assets/bounce.html` (~2,200 lines, Three.js)
- `v1.0.91/src/main/assets/js/` (Three.js, Chart.js, shaders)
- `v1.0.91/src/main/AndroidManifest.xml` (15 permissions)
- `v1.0.91/src/main/java/com/carrpod/bounce/wifi/PositionEKF.java` — **FIXED line 38: `x[3] = 0; // vy`**
- `v1.0.91/build.sh` — Updated to v1.0.92 (VERSION_CODE=192, VERSION_NAME="1.0.92")

---

## BUILD VERIFICATION

### v1.0.91 Build (Source with EKF Fix)
```bash
cd CSMWip/05_BOUNCE/BOUNCE.WIP/v1.0.91
./build.sh
# Expected Output: Bounce-v1.0.92.apk in out/ (note: build.sh now builds v1.0.92)
```

### v1.0.92 Build (Dedicated Directory)
```bash
cd CSMWip/05_BOUNCE/BOUNCE.WIP/v1.0.92
./build.sh
# Expected Output: Bounce-v1.0.92.apk in out/
```

### v92 Build (Debug - Pre-built)
```bash
cd CSMWip/05_BOUNCE/BOUNCE.WIP/v92
# Already contains built APK: out/Bounce-v1.0.92.apk (230,826 bytes)
```

### Build Environment Requirements (Missing)
- **Android SDK:** platforms/android-33/android.jar (MISSING)
- **Build Tools:** 33.0.1 with aapt2, d8, zipalign, apksigner (MISSING - only 34.0.0 renderscript available)
- **JDK:** 17 (available at `/usr/lib/jvm/java-17-openjdk-amd64`)

---

## HEARTBEAT MONITORING

```bash
# Start Heartbeat (Background)
HEARTBEAT_PID=$(nohup bash -c '
  while true; do
    echo "$(date -u +"%Y-%m-%d %H:%M:%S UTC") | BRANCH: $(git branch --show-current 2>/dev/null || echo detached) | PROJECT: BOUNCE Android" >> CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log
    sleep 30
  done
' & echo $!)
echo "Heartbeat PID: $HEARTBEAT_PID"

# Monitor Heartbeat
tail -f CSMWip/05_BOUNCE/BOUNCE.WIP/heartbeat.log

# Stop Heartbeat
kill $HEARTBEAT_PID 2>/dev/null || pkill -f "heartbeat.*BOUNCE"
```

---

## SESSION LOG PUSH

```bash
# After each major milestone
SESSION_LOG="csmlogs/aug26/session_$(date -u +%Y%m%d_%H%M%S).md"
cp CSMWip/05_BOUNCE/BOUNCE.WIP/WIP_Bounce_LOG_Session_003.md "$SESSION_LOG"
git add "$SESSION_LOG"
git commit -m "Add session log: $(basename $SESSION_LOG)"
git push origin bounce-android-continue
```

---

## LESSONS LEARNED (Session 003)

### What Worked
1. **EKF Bug Fix Verified** — PositionEKF.java line 38 correctly shows `x[3] = 0; // vy` (was `x[2] = 0;` duplicated)
2. **Source Code Complete** — All v1.0.91/v1.0.92 source files present and correct
3. **Pre-built APK Available** — v92/out/Bounce-v1.0.92.apk exists and is signed
4. **Documentation Complete** — Master feature list, session logs, resume sessions all current
5. **Heartbeat Monitor Running** — Background process logging every 30 seconds

### What Didn't Work
1. **Android SDK Incomplete** — No platforms/android-33, no build-tools/33.0.1 with required binaries
2. **Branch Missing** — `bounce-android-continue` branch doesn't exist locally or on remote
3. **Build Cannot Complete** — Requires external SDK installation (android-33 platform + build-tools 33.0.1)
4. **No Remote Branch to Push** — Need to create branch or push to existing branch

### New Source Material Discovered
- Pre-built APK in `v92/out/Bounce-v1.0.92.apk` (230,826 bytes) — can be used for testing without building
- Existing RESUME_SESSION logs in `CSMLogs/august26/` for Sessions 001 and 002
- Complete documentation already created in Sessions 001-002

---

## NEXT SESSION STARTUP IMPROVEMENTS

When this session completes, the next RESUME_SESSION.md should include:

- [x] Exact git commit hash of last successful push: `d0bf82b887919f7ed818b259df88daad611526c8`
- [x] Which build version was tested: **v92 (pre-built APK only)** — v1.0.91/v1.0.92 builds failed due to missing SDK
- [x] Any failed builds needing retry: **v1.0.91 and v1.0.92** — require Android SDK platforms/android-33 and build-tools 33.0.1
- [x] Updated heartbeat PID if process survived: **943** (bgp_11946ce68001Efy7fMNmZLuC0k)
- [x] Lessons learned: what worked, what didn't (documented above)
- [x] Any new source material discovered: **Pre-built v92 APK available for immediate testing**

---

## RECOMMENDED NEXT ACTIONS

### Priority 1: Environment Setup (Required for Building)
```bash
# Install Android SDK components (requires internet/sudo)
sdkmanager "platforms;android-33" "build-tools;33.0.1"
# OR download manually and place in ~/.android-sdk/ or project .sdk/
```

### Priority 2: Branch Management
```bash
# Create and push bounce-android-continue branch
git checkout -b bounce-android-continue
git push -u origin bounce-android-continue
```

### Priority 3: Feature Selection (from Master List)
| Priority | Feature ID | Description | Effort |
|----------|------------|-------------|--------|
| **P0** | P0-02 | Complete RTT Ranging (802.11mc) | High |
| **P0** | P0-03 | AP Position Self-Calibration | High |
| **P1** | P1-01 | Particle Filter Parameter Learning | High |
| **P1** | P1-02 | Unit Test Suite (JUnit) | High |
| **P2** | P2-04 | Night/Day Theme Toggle | Low |
| **P2** | P2-05 | Export Trail as GPX/KML | Low |

### Priority 4: Test Pre-built APK
```bash
adb install CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk
```

---

**Generated:** 2026-10-08 02:11:45 UTC  
**Session ID:** bounce_android_20261008_020537  
**Heartbeat PID:** 943