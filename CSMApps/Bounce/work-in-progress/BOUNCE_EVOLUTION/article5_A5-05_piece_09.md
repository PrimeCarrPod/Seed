# Best_Practices_AntiPatterns_Catalog — Piece 09/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 09 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Cross-Cutting Patterns & Lessons Learned

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 09 of 13  
**Generated:** 2026-10-08 05:10:38 UTC

---

# Pattern: Version Regression Cycles

### Observation
Features working in earlier versions broke in later versions, then were re-fixed.

| Feature | Working | Broken | Re-Fixed | Root Cause |
|---------|---------|--------|----------|------------|
| BLE Scan | v1.0.48 | v1.0.49-64 | v1.0.65+ | Missing restart cycle (CP005) |
| Permissions | v1.0.3 | v1.0.80-85 | v1.0.46+ | API33 NEARBY_WIFI_DEVICES (CP004) |
| Wake Lock | - | v1.0.63 | v1.0.63+ | Always held (CP006) |
| Trail Memory | - | v1.0.49-61 | v1.0.62+ | Unbounded array (CP014) |

### Lesson
**Never assume a feature stays fixed.** Each version must be validated against regression test suite.

---

# Pattern: Incremental Complexity Without Refactoring

### Code Growth Timeline
| Version | MainActivity Lines | HTML Lines | Major Addition |
|---------|-------------------|------------|----------------|
| 1.0.0   | 160               | 303        | Initial        |
| 1.0.25  | 639               | 461        | Sensor fusion  |
| 1.0.48  | 711               | 505        | BLE            |
| 1.0.79  | 1,005             | 626        | Kalman         |
| 1.0.86  | 1,319             | 750        | BT 3D          |
| 1.0.91  | 1,416             | 770        | 6-algo         |

### Lesson
**Technical debt compounds exponentially.** Each feature added to God class increases coupling and bug surface area. Refactor at ~500 lines, not ~1400.

---

# Pattern: Build System Determines Velocity

### Build Time Comparison
| Version Range | Build System | Build Time | Reliability |
|---------------|--------------|------------|-------------|
| 1.0.0-79      | aapt2 (no Gradle) | 4 sec | 100% |
| 1.0.80-85     | Gradle       | 3-5 min   | ~60% (AGP issues) |
| 1.0.86-91     | aapt2 (no Gradle) | 4 sec | 100% |

### Lesson
**Build system is a feature.** The 20x slowdown with Gradle directly reduced iteration velocity and introduced AGP version conflicts.

---

# Pattern: Silent Failures Are the Most Dangerous

### Categories of Silent Failure
1. **BLE scan death** - no callback, no error, just stops
2. **JS bridge not ready** - calls return undefined, no exception
3. **EKF array typo** - vy uninitialized, wrong output, no crash
4. **RTT stub** - method exists but does nothing, no error
5. **Permission denied** - scan starts but returns no results

### Detection Strategy
- **Heartbeat logging**: Periodic "I'm alive" from each subsystem
- **Health checks**: Validate outputs (EKF state finite, trail points > 0)
- **Watchdogs**: Restart subsystems that go silent
- **Telemetry**: Report subsystem status to Android logcat

---

# Pattern: Offline-First Is Not Optional

### Evidence
- v1.0.0-91: All local assets → works offline
- CP011 (CDN links) would break core 3D visualization
- BLE/WiFi/RTT all work without internet

### Lesson
**Design for air-gapped operation.** Any external dependency (CDN, cloud config, license server) is a single point of failure.

---

*Next Piece: Implementation Guidelines*
