# Best_Practices_AntiPatterns_Catalog — Piece 11/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 11 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Version-Specific Recommendations

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 11 of 13  
**Generated:** 2026-10-08 05:11:45 UTC

---

# v1.0.0-v1.0.24: Foundation Era
**Status:** Stable baseline
**Key Practices Established:** BP001-BP005 (Build), BP013 (Permissions), BP014 (Local assets)
**No Anti-Patterns Yet**

### Recommendations
- Maintain no-Gradle aapt2 pipeline
- Keep SDK pins at compileSdk 33 / build-tools 33.0.1
- Preserve v1.0.3 permission pattern as template

---

# v1.0.25-v1.0.47: Sensor Fusion Era
**Status:** Growing complexity
**New:** Sensor fusion (accel + gyro + mag)
**Lines:** MainActivity 639, HTML 461

### Emerging Issues
- God class growth (CP015 starting)
- No unit tests for sensor fusion math (CP016)

### Recommendations
- Extract sensor fusion to separate class
- Add JUnit tests for orientation calculation

---

# v1.0.48-v1.0.64: BLE Era (Critical Period)
**Status:** Multiple regressions
**New:** BLE scanning (v1.0.48)
**Broken:** Scan death (v1.0.48-64) → Fixed v1.0.65 (BP008)
**Broken:** Trail memory leak (v1.0.49-61) → Fixed v1.0.62 (BP017)
**Broken:** Trail performance (v1.0.49-61) → Fixed v1.0.62 (BP016)
**Broken:** No speed threshold (v1.0.49-55) → Fixed v1.0.55 (CP010)

### Anti-Patterns Active
- CP005: BLE scan without restart cycle (v1.0.48-64)
- CP009: Three.js disposal missing (v1.0.49-53)
- CP010: Trail without speed threshold (v1.0.49-55)
- CP013: Rebuilding geometry every frame (v1.0.49-61)
- CP014: Unbounded trail array (v1.0.49-61)

### Recommendations
- **Mandatory:** 5s scan restart cycle (BP008)
- **Mandatory:** LOW_LATENCY scan mode (BP009)
- **Mandatory:** GPU-safe disposal (BP016)
- **Mandatory:** 2000pt FIFO cap (BP017)
- **Mandatory:** Speed threshold > 1mph
- **Mandatory:** Rebuild geometry every 5 frames

---

# v1.0.65-v1.0.79: Stabilization Era
**Status:** Major fixes applied
**Fixed:** BLE scan death, trail memory, trail performance
**New:** Conditional wake lock (v1.0.63, BP010)
**New:** Kalman filter (v1.0.79)
**Lines:** MainActivity 1,005, HTML 626

### Remaining Issues
- God class at 1,005 lines (CP015)
- No unit tests for Kalman (CP016)
- Wake lock conditional but not fully validated

### Recommendations
- Begin MainActivity decomposition
- Add EKF unit tests
- Validate wake lock behavior

---

# v1.0.80-v1.0.85: Gradle Experiment (Failed)
**Status:** Build system regression
**Experiment:** Gradle build system
**Result:** Failed - 20x slower, AGP version hell
**Anti-Patterns Active:**
- CP001: Gradle for simple app
- CP004: API33 NEARBY_WIFI_DEVICES without flag

### Lessons Learned
- Never migrate build system mid-project without full validation
- No-Gradle aapt2 is superior for single-activity apps
- API33 permission flags are mandatory

### Recommendations
- Revert to aapt2 immediately (done in v1.0.86)
- Add NEARBY_WIFI_DEVICES with neverForLocation flag
- Document build system decision in README

---

# v1.0.86-v1.0.91: Advanced Positioning Era
**Status:** Feature complete, technical debt peak
**New:** BT 3D visualization, 6-algorithm fusion, Particle filter
**Lines:** MainActivity 1,416, HTML 770
**Critical Bug:** EKF vy initialization (CP008)

### Anti-Patterns Active
- CP008: EKF array index typo (v1.0.90-91) - **CRITICAL**
- CP015: God class 1,416 lines
- CP016: No unit tests for any positioning algorithm
- CP017: RTT ranging stub
- CP018: AP positions random
- CP019: Particle filter params hardcoded
- CP020: No release keystore

### Recommendations (Priority Order)
1. **P0-01:** Fix EKF vy initialization (v1.0.92)
2. **P0-02:** Implement RTT ranging
3. **P0-03:** Self-calibration for AP positions
4. **P1-01:** Particle filter parameter learning
5. **P1-02:** Add JUnit tests for all algorithms
6. **P1-03:** Decompose MainActivity into services
7. **TD-08:** Add release keystore

---

# v1.0.92+: Post-Fix Baseline
**Status:** EKF fixed (pre-built APK exists)
**Available:** CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk

### Next Version Targets
- All P0 items complete
- P1 items in progress
- MainActivity < 800 lines (after decomposition)
- 80%+ unit test coverage on positioning algorithms

---

*Next Piece: Future-Proofing & Technical Debt*
