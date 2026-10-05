# BOUNCE RESUME SESSION — 2026-08-22 S002
**Date:** 2026-08-22  
**Branch:** `session/bounce-versioning-august-2026`  
**Working Directory:** `CSM_WORK_IN_PROGRESS/BOUNCE.WIP/`  
**Source Repository:** `PrimeCarrPod/Seed` → `CSMApps/Bounce/`  
**Previous Session:** S001 (Analysis & Documentation Complete)

---

## Session Objective
Fix the EKF Velocity Bug (P0-01), build version 1.0.92, install for testing, and prepare for next feature cycle.

---

## Starting State (from S001)
- **Current Version:** v1.0.91 (extracted in `v1.0.91/`)
- **Feature List:** `BOUNCE_ULTRA_MASTER_FEATURE_LIST.md` (complete)
- **Session Log:** `WIP_Bounce_LOG_Session_001.md` (complete)
- **Resume Log:** `CSMLogs/august26/BOUNCE_RESUME_SESSION_20260822-S001.md` (exists)
- **Branch:** `session/bounce-versioning-august-2026` (checked out)

---

## Task 1: Fix EKF Bug (P0-01) — COMPLETED

### Bug Details
**File:** `v1.0.91/src/main/java/com/carrpod/bounce/wifi/PositionEKF.java:38`  
**Issue:** Line 38 incorrectly initializes `x[2] = 0` twice, leaving `x[3]` (vy) uninitialized  
**State Vector:** `[x, y, vx, vy]` → indices `[0, 1, 2, 3]`

### Fix Applied
```java
// BEFORE (line 35-38):
x[0] = 0;  // x
x[1] = 0;  // y
x[2] = 0;  // vx
x[2] = 0;  // vy (BUG: should be x[3])

// AFTER:
x[0] = 0;  // x
x[1] = 0;  // y
x[2] = 0;  // vx
x[3] = 0;  // vy (FIXED)
```

### Verification
- The `initialize(double xPos, double yPos)` method at line 219-223 already correctly sets `x[3] = 0`
- The `getVelocity()` method at line 205-207 returns `[x[2], x[3]]` expecting both to be initialized
- The process noise matrix Q at lines 48-53 has Q[3][3] = 0.1 for vy process noise
- State transition matrix F at lines 84-89 uses both vx (index 2) and vy (index 3)

---

## Task 2: Build Version 1.0.92 — IN PROGRESS

### Build Configuration Update
Need to update `build.sh` for version 1.0.92:
- VERSION_CODE: 191 → 192
- VERSION_NAME: "1.0.91" → "1.0.92"
- PROJECT_DIR: Update to current working directory path

### Build Command
```bash
cd CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91
bash build.sh
```

**Requirements:** Android SDK (build-tools 33.0.1, platform android-33) + JDK 17

---

## Task 3: Install for Testing — PENDING
```bash
adb install out/Bounce-v1.0.92.apk
```

---

## Task 4: Update Documentation — PENDING
- Update `BOUNCE_ULTRA_MASTER_FEATURE_LIST.md` version to 1.0.92
- Update version matrix with v1.0.92 entry
- Mark P0-01 as ✅ Complete
- Update `WIP_Bounce_LOG_Session_002.md` with this session's work

---

## Next Session Preparation

### Quick Start for Next Session
```bash
# 1. Checkout branch
git checkout session/bounce-versioning-august-2026

# 2. Navigate to WIP
cd CSM_WORK_IN_PROGRESS/BOUNCE.WIP/v1.0.91

# 3. Build (requires Android SDK + JDK17)
bash build.sh

# 4. Install APK
adb install out/Bounce-v1.0.92.apk

# 5. Review feature list for next selection
cat ../BOUNCE_ULTRA_MASTER_FEATURE_LIST.md
```

### Recommended Next Tasks (from Feature List Priority)
| Priority | Task | Effort | Module |
|----------|------|--------|--------|
| P0-02 | Complete RTT Ranging (802.11mc) | High | WifiRttRanging.java |
| P0-03 | AP Position Self-Calibration | High | MainActivity.java, Trilateration.java |
| P1-01 | Particle Filter Parameter Learning | High | ParticleFilter.java |
| P1-02 | Unit Test Suite (JUnit) | High | New test/ directory |
| P2-04 | Night/Day Theme Toggle | Low | bounce.html CSS |

---

## Session Checklist
- [x] Fix EKF Bug (P0-01) — Line 38: `x[2] = 0; x[2] = 0;` → `x[2] = 0; x[3] = 0;`
- [ ] Update build.sh for v1.0.92
- [ ] Build v1.0.92 APK
- [ ] Install and verify on device/emulator
- [ ] Update feature list version to 1.0.92
- [ ] Create WIP_Bounce_LOG_Session_002.md
- [ ] Zip, commit, push to GitHub
- [ ] Verify on GitHub (13 ways)

---

*Session S002 — EKF Bug Fix & v1.0.92 Build Preparation*