# Cross-Version Error Patterns & Timeline

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 10 of 13  
**Generated:** 2026-10-08 05:29:04 UTC

---

# Error Introduction & Resolution Timeline

| Version | Era | New Errors | Resolved Errors | Net Change |
|---------|-----|------------|-----------------|------------|
| 1.0.0   | Foundation | E001,E002,E003,E014,E017,E019,E020,E025,E026,E030 | - | +10 |
| 1.0.4   | - | E019 (GPS) | - | +1 |
| 1.0.13  | - | E017,E018 (WiFi Direct) | - | +2 |
| 1.0.20  | - | - | E017 (drift fix) | -1 |
| 1.0.25  | Sensor Fusion | E020 (azimuth) | - | +1 |
| 1.0.27  | - | - | E019 (speed filter) | -1 |
| 1.0.29  | - | E024 (bg location) | - | +1 |
| 1.0.48  | BLE | E010,E012,E023,E027,E028,E029 | - | +6 |
| 1.0.50  | - | E029 (bloom) | - | +1 |
| 1.0.52  | - | - | E016 (bridge) | -1 |
| 1.0.54  | - | - | E012 (Three.js) | -1 |
| 1.0.56  | - | - | E013 (trail filter) | -1 |
| 1.0.62  | - | - | E028 (CatmullRom) | -1 |
| 1.0.65  | Stabilization | - | E010 (BLE restart) | -1 |
| 1.0.80  | Gradle Exp | E004,E005,E006,E007,E008,E009,E015,E021,E022 | - | +9 |
| 1.0.85  | - | - | E004-E009,E015,E021,E022 | -9 |
| 1.0.90  | Advanced | E011 (EKF bug) | - | +1 |
| 1.0.92  | Post-Fix | - | E011 (EKF fix) | -1 |

---

# Pattern: Build System Regression (v1.0.80-1.0.85)

**7 errors introduced simultaneously** during Gradle experiment:
- E004: AGP 8.2 dependency resolution
- E005: Unused imports from migration
- E006: AppCompatActivity without dependency
- E007: Theme/icon cascade failures
- E008: Missing adaptive icons
- E009: API33 Wi-Fi permission
- E015: MultiDex from dependency bloat
- E021: JAVA_HOME timing with Gradle
- E022: R.java generation path

**All resolved in v1.0.85 by reverting to aapt2 no-Gradle build**

### Lesson
Build system changes introduce cascading failures. The 20x build time increase (4s → 5min) reduced iteration velocity, causing more bugs to slip through.

---

# Pattern: API Level Permission Escalation

| API Level | New Permission Required | Errors |
|-----------|------------------------|--------|
| 23 (6.0) | Runtime permissions | E017, E018, E024 |
| 29 (10.0) | ACCESS_BACKGROUND_LOCATION | E024 |
| 31 (12.0) | BLUETOOTH_SCAN/CONNECT/ADVERTISE | E023 |
| 33 (13.0) | NEARBY_WIFI_DEVICES | E009 |

### Pattern
Each Android version adds granular permissions. Apps must:
1. Declare new permissions in manifest
2. Handle legacy + modern permission paths
3. Request at runtime with proper rationale
4. Test on each API level

---

# Pattern: Silent Failures Are Most Dangerous

| Error | Silent? | Detection | Time to Detect |
|-------|---------|-----------|----------------|
| E010 BLE scan death | Yes - no callback | Manual testing | Hours |
| E011 EKF vy init | Yes - wrong output | Unit test (missing) | 2 versions |
| E012 Three.js OOM | Yes - context lost | Crash log | ~1000 updates |
| E016 Bridge silent | Yes - no error | User reports | Frequent |
| E027 BT name null | No - logs null | Log review | Occasional |

### Detection Strategy Implemented
- **Health checks**: Periodic subsystem validation
- **Unit tests**: For all positioning algorithms (P1-02)
- **Watchdogs**: BLE scan restart, EKF state validation
- **Telemetry**: Error reporting to Android logcat

---

# Error Frequency Analysis

| Frequency | Count | Errors |
|-----------|-------|--------|
| Every session | 8 | E001,E002,E003,E010,E012,E014,E016,E025,E026,E030 |
| Every run | 12 | E006,E007,E008,E009,E011,E013,E017,E019,E020,E023,E024,E027 |
| Multiple | 5 | E004,E005,E006,E007,E008,E009,E021 |
| Occasional | 4 | E014,E015,E018,E022,E028,E029 |
| Few | 3 | E005,E018,E027 |

---

# Version Era Error Summary

| Era | Versions | Total Errors Active | Build Errors | Runtime Errors |
|-----|----------|---------------------|--------------|----------------|
| Foundation | 1.0.0-1.0.12 | 10 | 6 | 4 |
| Sensor Fusion | 1.0.13-1.0.26 | 13 | 6 | 7 |
| BLE | 1.0.27-1.0.47 | 14 | 6 | 8 |
| BLE+Stabilization | 1.0.48-1.0.64 | 20 | 6 | 14 |
| Stabilization | 1.0.65-1.0.79 | 12 | 6 | 6 |
| Gradle Experiment | 1.0.80-1.0.85 | 21 | 12 | 9 |
| Post-Gradle | 1.0.86-1.0.91 | 12 | 6 | 6 |

---

*Next Piece: Root Cause Taxonomy & Prevention*