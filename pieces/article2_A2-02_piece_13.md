# Android_Main_Features_Radio_Positioning — Piece 13/13
## Article A2: A2-02 — Android Main Features Radio Positioning
**Piece:** 13 of 13  
**Generated:** 2026-10-08 04:10:00 UTC

---

## ANDROID MAIN FEATURES — COMPLETE SUMMARY

### Feature Inventory (21 Tracked Features)

| # | Feature | First Ver | Last Ver | Category | Status |
|---|---------|-----------|----------|----------|--------|
| 1 | Wi-Fi Scanning | 1.0.3 | 1.0.91 | Radio | Complete |
| 2 | Wi-Fi Direct GO | 1.0.13 | 1.0.91 | Radio | Complete |
| 3 | BLE Scanning | 1.0.48 | 1.0.91 | Radio | Complete |
| 4 | GPS Tracking | 1.0.4 | 1.0.91 | Positioning | Complete |
| 5 | Sensor Fusion | 1.0.25 | 1.0.91 | Positioning | Complete |
| 6 | Wake Lock | 1.0.63 | 1.0.91 | System | Complete |
| 7 | WebView + JS Bridge | 1.0.0 | 1.0.91 | Architecture | Complete |
| 8 | Auto-Update | 1.0.91 | 1.0.93 | System | Moved to TGAPP |
| 9 | Debug Keystore | 1.0.0 | 1.0.91 | Build | Complete |
| 10 | No-Gradle Build | 1.0.0 | 1.0.91 | Build | Complete |
| 11 | RSSI Kalman (1D) | 1.0.79 | 1.0.91 | Positioning | Complete |
| 12 | Trilateration (WLS) | 1.0.81 | 1.0.91 | Positioning | Complete |
| 13 | EKF (2D CV) | 1.0.90 | 1.0.91 | Positioning | Bug Fixed v1.0.92 |
| 14 | Particle Filter (SIR) | 1.0.90 | 1.0.91 | Positioning | Complete |
| 15 | Zone HMM (Viterbi) | 1.0.90 | 1.0.91 | Positioning | Complete |
| 16 | Wi-Fi RTT | 1.0.81 | 1.0.91 | Positioning | Stub Only (P0-02) |
| 17 | BT 3D Spatial | 1.0.86 | 1.0.91 | Positioning | Complete |
| 18 | Trail Recording | 1.0.49 | 1.0.91 | Visualization | Complete |
| 19 | FAA METAR | 1.0.64 | 1.0.91 | Reference | Complete |
| 20 | Runtime Permissions | 1.0.3 | 1.0.91 | System | Complete |
| 21 | SSID Broadcast | 1.0.22 | 1.0.91 | Radio | Complete |

---

## CROSS-REFERENCES TO OTHER SECTIONS

| Section | Connection | Details |
|---------|------------|---------|
| **Sec 1: HTML Aspects** | JS Bridge | 30 connections mapped (Sec 3) |
| **Sec 3: Connections** | C001-C030 | Android→HTML: 13, HTML→Android: 12, Bidirectional: 2 |
| **Sec 4: SDK/Tools** | Build | build.sh uses aapt2, javac, d8, zipalign, apksigner |
| **Sec 5: Best Practices** | BP001-BP013 | No-Gradle, proven perms, 5s BT restart, conditional wake |
| **Sec 5: Anti-Patterns** | CP001-CP020 | God class, no tests, RTT stub, hardcoded params |
| **Sec 6: Errors** | E001-E030 | 30 errors documented with fixes |
| **Sec 7: Future** | FP001-FP030 | RTT, self-calibration, tests, services, mesh |
| **Sec 8: TGAPP** | TG001-TG032 | Update delivery, premium features, fleet mesh |
| **Sec 9: Working Features** | WF001-WF030 | Feature evolution history |
| **Sec 10: Refinements** | RF001-RF030 | Split MainActivity, implement RTT, adaptive params |
| **Sec 11: Future Thoughts** | FT001-FT030 | Architecture, network, AI, standards, privacy |

---

## KEY METRICS

| Metric | Value |
|--------|-------|
| **MainActivity Lines (v1.0.91)** | 1,416 |
| **MainActivity Lines (v1.0.0)** | 160 |
| **Growth** | 8.85x |
| **Total Permissions** | 15 (API23-33+) |
| **Positioning Algorithms** | 6 (5 working + 1 stub) |
| **JS Bridge Methods** | 30+ |
| **Build Time (No-Gradle)** | ~4 seconds |
| **APK Size (v1.0.91)** | 230,826 bytes |
| **Wake Lock** | Conditional (trail only) |
| **BT Scan Restart** | 5s cycle (mandatory) |
| **SSID Broadcast** | 4-slot, 5.1s/slot |
| **Trail Points Max** | 2000 (FIFO) |
| **BT 3D Points** | 50 active / 100 global |

---

## CRITICAL LESSONS LEARNED

1. **No-Gradle aapt2 Pipeline** — 4s builds vs minutes, transparent, reproducible (BP001)
2. **Proven v1.0.3 Permission Pattern** — Delayed request + handler, handles all API levels (BP006, BP007)
3. **5s Bluetooth Scan Restart** — Mandatory, Android kills continuous scan (BP008, E010)
4. **Conditional Wake Lock** — Only when trail active, prevents battery drain (BP010)
5. **Multi-Method Wi-Fi Direct Fallback** — Builder → Reflection → Bonjour (BP011)
6. **Fixed 5.1s SSID Duty Cycle** — Single timer, no drift accumulation (BP012)
7. **Comprehensive Permissions (15)** — Handle API23/29/31/33+ differences (BP013)
8. **EKF Array Index Bug** — Copy-paste typo, ALWAYS verify indices (CP008, P0-01)
9. **God Class MainActivity** — 1416 lines, split into Services planned (RF001, CP015)
10. **Zero Unit Tests** — Unverified algorithms, regressions in production (CP016, P1-02)

---

## FILE LOCATIONS

| File | Purpose |
|------|---------|
| `Android_Main_Features_Spreadsheet.csv` | 21 features × 12 columns |
| `MainActivity.java` | 1416 lines (God class) |
| `RssiKalmanFilter.java` | 1D Kalman filter |
| `Trilateration.java` | Weighted LS + GDOP |
| `PositionEKF.java` | 2D CV EKF (bug fixed v1.0.92) |
| `ParticleFilter.java` | SIR 200 particles |
| `ZoneHMM.java` | Viterbi 3-state |
| `WifiRttRanging.java` | RTT stub (P0-02) |
| `build.sh` | 109 lines, No-Gradle pipeline |
| `forensic/source/v*/MainActivity.java` | Historical versions (91) |

---

## PIECE 13 SUMMARY
This final piece provides the complete feature inventory (21 tracked), cross-reference matrix to all 12 other sections, key metrics (1,416 lines, 8.85x growth, 6 algorithms, 4s builds), critical lessons learned (10 hard-won principles), and file locations. The Android layer evolved from 160 lines (v1.0.0) to 1,416 lines (v1.0.91) — an 8.85x growth — while maintaining a stable No-Gradle build, comprehensive permissions, and robust radio scanning with mandatory 5s BT restart cycles.

---

**END OF SECTION 2: ANDROID MAIN FEATURES — RADIO POSITIONING**
*13 pieces covering: Wi-Fi/BT/GPS/Sensors → Wake Lock/JS Bridge/Update/Keystore/Build → RSSI Kalman/Trilateration/EKF/Particle/HMM → RTT/BT 3D/Trail/METAR/Perms → Multi-Algo Fusion/AP Estimation/God Class → Error Patterns (Build/Gradle/Runtime) → Error Patterns (BT/EKF/OOM/Trail) → Error Patterns (GPS/Sensors/Gradle/Perms/Build) → Minor Errors/Feature Matrix → Summary/Cross-Refs*

*Next: Section 3 — Connection Pathways (article3_A3-03)*