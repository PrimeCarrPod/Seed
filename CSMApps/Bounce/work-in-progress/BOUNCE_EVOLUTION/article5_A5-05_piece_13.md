# Best_Practices_AntiPatterns_Catalog — Piece 13/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 13 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Summary & Quick Reference

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 13 of 13  
**Generated:** 2026-10-08 05:12:52 UTC

---

# Complete Pattern Catalog Summary

## Best Practices (20 Total)

| ID | Category | Title | Version |
|----|----------|-------|---------|
| BP001 | Build | No-Gradle aapt2 pipeline | 1.0.0 |
| BP002 | Build | Pin SDK versions | 1.0.0 |
| BP003 | Build | Auto-generate debug.keystore | 1.0.0 |
| BP004 | Build | Inject assets via zip after aapt2 link | 1.0.0 |
| BP005 | Build | javac -source 11 -target 11 | 1.0.0 |
| BP006 | Android | Revert to v1.0.3 permission pattern | 1.0.45 |
| BP007 | Android | Delayed permission request (100ms) | 1.0.46 |
| BP008 | Android | 5s BLE scan restart cycle | 1.0.65 |
| BP009 | Android | LOW_LATENCY scan mode | 1.0.48 |
| BP010 | Android | Conditional wake lock | 1.0.63 |
| BP011 | Android | Multi-method Wi-Fi Direct fallback | 1.0.14 |
| BP012 | Android | Fixed 5.1s SSID duty cycle | 1.0.20 |
| BP013 | Android | Comprehensive 15 permissions | 1.0.3 |
| BP014 | HTML/JS | Local Three.js/Chart.js assets | 1.0.0 |
| BP015 | HTML/JS | try/catch wrapper for JS errors | 1.0.52 |
| BP016 | HTML/JS | GPU-safe Three.js disposal | 1.0.54 |
| BP017 | HTML/JS | 2000pt trail FIFO cap | 1.0.62 |
| BP018 | Architecture | *Reserved for future* | - |
| BP019 | Architecture | *Reserved for future* | - |
| BP020 | Architecture | *Reserved for future* | - |

## Anti-Patterns (17 Documented, 20 Slots)

| ID | Category | Title | Versions Affected |
|----|----------|-------|-------------------|
| CP001 | Build | Gradle for simple app | 1.0.80-85 |
| CP002 | Build | Hardcoded SDK paths | All |
| CP003 | Build | Mismatched build-tools | - |
| CP004 | Android | API33 NEARBY_WIFI_DEVICES no flag | 1.0.80-85 |
| CP005 | Android | BLE scan no restart cycle | 1.0.48-64 |
| CP006 | Android | Wake lock always held | 1.0.63 |
| CP007 | Android | Single-method Wi-Fi Direct | 1.0.13 |
| CP008 | Android | **EKF array index typo** | **1.0.90-91** |
| CP009 | HTML/JS | No Three.js disposal | 1.0.49-53 |
| CP010 | Android | Trail no speed threshold | 1.0.49-55 |
| CP011 | HTML/JS | CDN links for libraries | - |
| CP012 | HTML/JS | No JS bridge error handling | 1.0.0-51 |
| CP013 | HTML/JS | Rebuild geometry every frame | 1.0.49-61 |
| CP014 | HTML/JS | Unbounded trail array | 1.0.49-61 |
| CP015 | Architecture | God class MainActivity | All |
| CP016 | Architecture | No unit tests for algorithms | All |
| CP017 | Architecture | RTT ranging stub | 1.0.81+ |
| CP018 | Architecture | AP positions random | 1.0.90+ |
| CP019 | Architecture | Particle params hardcoded | 1.0.90+ |
| CP020 | Architecture | Single debug keystore | All |

---

# Quick Reference Card

## Build Commands (Memorize These)
```bash
# Full clean build
./build.sh clean && ./build.sh

# Build APK only (no clean)
./build.sh

# Install to device
adb install -r app.apk

# View logs
adb logcat -s Bounce:* *:E
```

## Critical Files to Never Break
| File | Purpose | Guard |
|------|---------|-------|
| build.sh | Build pipeline | Test after any change |
| PositionEKF.java:38 | EKF init | **vy = x[3] not x[2]** |
| BleScanService.java | BLE restart | 5s cycle mandatory |
| MainActivity.java | Permissions | v1.0.3 pattern |
| bounce.html | Three.js init | Local assets only |

## Emergency Debugging
```bash
# EKF state dump
adb shell am broadcast -a com.carrpod.bounce.DUMP_EKF

# Trail point count
adb shell am broadcast -a com.carrpod.bounce.DUMP_TRAIL

# BLE scan status
adb shell am broadcast -a com.carrpod.bounce.DUMP_BLE

# Health check
adb shell am broadcast -a com.carrpod.bounce.HEALTH_CHECK
```

---

# Forensic Analysis Context

This catalog is derived from **91 versions** of BOUNCE analyzed forensically:

- **Source:** `forensic/source/` - extracted key files from each version
- **Diffs:** `forensic/diffs/` - 364 consecutive version diffs
- **APK Analysis:** `forensic/analysis/apk_size_analysis.csv` - size anomalies
- **Version Changes:** `forensic/analysis/version_changes.csv` - line-level changes
- **Working Features:** `Working_Features_Versions_Spreadsheet.csv` - feature timeline

## Cross-References
- **Section 1 (HTML Aspects):** Three.js disposal, local assets, trail FIFO
- **Section 2 (Android Features):** Permissions, BLE, wake lock, Wi-Fi Direct
- **Section 3 (Connections):** JS bridge error handling, Android↔HTML pathways
- **Section 4 (SDK/Tools):** aapt2 pipeline, SDK pinning, javac flags
- **Section 6 (Errors):** Repeated errors catalog with fixes
- **Section 9 (Features):** Working features with version history
- **Section 10 (Refinement):** 30 prioritized refactorings
- **Section 12 (Forensic):** Full analysis data

---

# Final Recommendation

**The single most impactful action:** Decompose MainActivity (CP015/P1-03).

Every other anti-pattern is a symptom of the God class:
- No unit tests (CP016) → Can't test 1,416-line class
- RTT stub (CP017) → No place to put it
- Random AP positions (CP018) → Mixed with UI code
- Hardcoded params (CP019) → No config service
- EKF bug (CP008) → No test caught it

**Start with:** Extract `PositioningEngine` (EKF + Particle + Trilateration + Calibration) as a separate class with JUnit tests.

---

*End of Best Practices & Anti-Patterns Catalog (Section 5 / Article A5-05)*
