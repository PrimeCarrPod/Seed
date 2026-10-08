# Best_Practices_AntiPatterns_Catalog — Piece 12/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 12 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Future-Proofing & Technical Debt

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 12 of 13  
**Generated:** 2026-10-08 05:12:18 UTC

---

# Technical Debt Inventory (Prioritized)

## P0 - Critical (Blocks Core Functionality)

| ID | Debt Item | Origin | Effort | Risk |
|----|-----------|--------|--------|------|
| P0-01 | EKF vy initialization bug | v1.0.90 | 1 hr | **CRITICAL** - wrong velocity |
| P0-02 | RTT ranging stub | v1.0.81 | 2 weeks | HIGH - accuracy gap |
| P0-03 | AP position self-calibration | v1.0.90 | 2 weeks | HIGH - trilateration garbage |

## P1 - High (Degrades Quality)

| ID | Debt Item | Origin | Effort | Risk |
|----|-----------|--------|--------|------|
| P1-01 | Particle filter parameter learning | v1.0.90 | 1 week | MEDIUM |
| P1-02 | JUnit tests for positioning algorithms | v1.0.0 | 2 weeks | HIGH - unverified math |
| P1-03 | MainActivity decomposition | v1.0.0 | 3 weeks | HIGH - unmaintainable |

## P2 - Medium (Operational)

| ID | Debt Item | Origin | Effort | Risk |
|----|-----------|--------|--------|------|
| P2-01 | Release keystore for Play Store | v1.0.0 | 1 day | MEDIUM - can't publish |
| P2-02 | Automated regression test suite | v1.0.0 | 1 week | MEDIUM - regressions |
| P2-03 | Build script CI/CD integration | v1.0.0 | 3 days | LOW |

## P3 - Low (Nice to Have)

| ID | Debt Item | Origin | Effort | Risk |
|----|-----------|--------|--------|------|
| P3-01 | Documentation site | v1.0.0 | 1 week | LOW |
| P3-02 | Performance benchmarks | v1.0.0 | 3 days | LOW |
| P3-03 | Accessibility audit | v1.0.0 | 1 week | LOW |

---

# Future-Proofing Strategies

## 1. Regression Test Suite (P2-02)
```bash
# run_regression.sh
#!/bin/bash
# Test each critical subsystem
./test_ekf.sh          # EKF with known inputs
./test_particle.sh     # Particle filter convergence
./test_trilateration.sh # Trilateration accuracy
./test_ble_scan.sh     # BLE scan survives 5 min
./test_wake_lock.sh    # Wake lock conditional
./test_trail_memory.sh # Trail stays under 2000 pts
./test_js_bridge.sh    # Bridge error handling
./test_build.sh        # aapt2 build < 10 sec
```

## 2. Health Check Endpoint
```java
// Add to MainActivity
public JSONObject getHealthStatus() {
    JSONObject status = new JSONObject();
    status.put("ekf_state_finite", isFinite(ekf.getState()));
    status.put("trail_points", trailPoints.size());
    status.put("ble_scanning", isBleScanning());
    status.put("wake_lock_held", wakeLock.isHeld());
    status.put("js_bridge_ready", jsBridgeReady);
    status.put("ap_positions_calibrated", areApPositionsCalibrated());
    return status;
}
```

## 3. Version Pinning Policy
| Dependency | Pinning Strategy |
|------------|------------------|
| Android SDK | compileSdk 33, build-tools 33.0.1 |
| JDK | source/target 11 |
| Three.js | r158 (local file) |
| Chart.js | v4.4.1 (local file) |
| Gradle | **NEVER** (use aapt2) |

## 4. Automated Dependency Updates
```bash
# check_updates.sh - run monthly
#!/bin/bash
echo "Checking for security updates..."
# Check Android SDK platform updates
# Check Three.js/Chart.js security advisories
# Check JDK LTS updates (11 → 17 → 21)
# Report but DON'T auto-update - manual validation required
```

---

# Architecture Evolution Roadmap

## Phase 1: Stabilize (v1.0.92-v1.0.95)
- Fix P0-01 (EKF bug) ✓ v1.0.92
- Implement P0-02 (RTT ranging)
- Implement P0-03 (AP self-calibration)
- Add P1-02 (JUnit tests)

## Phase 2: Refactor (v1.0.96-v1.1.0)
- P1-03: Decompose MainActivity
- P1-01: Particle parameter learning
- P2-01: Release keystore
- P2-02: Regression suite in CI

## Phase 3: Harden (v1.1.1-v1.2.0)
- P2-03: CI/CD pipeline
- Automated health checks
- Performance benchmarks
- Play Store release

---

# Anti-Regression Checklist (Per Version)

Before releasing any version, verify:

- [ ] **Build**: aapt2 build completes in < 10 seconds
- [ ] **EKF**: State vector finite, vy initialized to 0
- [ ] **BLE**: Scan survives 5+ minutes with restart cycle
- [ ] **Trail**: Points capped at 2000, geometry rebuilt every 5 frames
- [ ] **Wake Lock**: Only held when trail recording active
- [ ] **Permissions**: All 15 handled for API 23-33+
- [ ] **JS Bridge**: try/catch on all calls, window.onerror set
- [ ] **Three.js**: All geometries/materials disposed on rebuild
- [ ] **Assets**: Three.js/Chart.js loaded from local files
- [ ] **AP Positions**: Not random (calibrated or configured)
- [ ] **RTT**: Ranging functional or explicitly disabled
- [ ] **Particle Filter**: Parameters not hardcoded (or documented)

---

*Next Piece: Summary & Quick Reference*
