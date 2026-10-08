# Forensic_Analysis_Data_91_Versions — Piece 12/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 12 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Forensic Statistics Summary & Cross-Reference Index

## Global Statistics (91 Versions + 1 Duplicate)

### Code Volume
| Metric | Value | Notes |
|--------|-------|-------|
| Total versions analyzed | 92 | v1.0.0 — v1.0.91 + v1.0.91-dup |
| Total diff files | 364 | 91 transitions × 4 files |
| Total lines added (all files) | 28,616 | From version_changes.csv |
| Total lines removed (all files) | 26,834 | From version_changes.csv |
| Net lines added | +1,782 | Growth over project lifetime |
| MainActivity peak | 1,416 lines | v1.0.91 |
| HTML peak | 770 lines | v1.0.91 |
| APK size peak | 230,826 bytes | v1.0.91 |
| Zip size peak | 837,717 bytes | v1.0.90 (asset-heavy) |

### Anomaly Statistics
| Metric | Count | Percentage |
|--------|-------|------------|
| Total versions | 92 | 100% |
| Clean builds | 84 | 91.3% |
| Build failures (APK=0) | 2 | 2.2% |
| Partial builds (missing HTML) | 2 | 2.2% |
| Corrupt distribution | 1 | 1.1% |
| Duplicate extraction | 1 | 1.1% |

### Growth Rates
| Component | Start (v1.0.0) | End (v1.0.91) | Growth | CAGR* |
|-----------|----------------|---------------|--------|-------|
| MainActivity | 160 | 1,416 | **785%** | ~35%/version |
| HTML | 303 | 770 | 154% | ~10%/version |
| APK Size | 185,687 | 230,826 | 24% | ~2%/version |
| Permissions | 4 | 10 | 150% | Discrete jumps |
| Algorithms | 1 | 6 | 500% | Discrete additions |

*CAGR = Compound Annual Growth Rate (approximated per version)

---

## Version-by-Version Quick Reference

| Ver | Zip KB | APK KB | MA Lines | HTML Lines | Anomaly | Key Feature |
|-----|--------|--------|----------|------------|---------|-------------|
| 1.0.0 | 228 | 186 | 160 | 303 | | Foundation |
| 1.0.3 | 244 | 194 | 314 | 331 | | Wi-Fi scan impl |
| 1.0.10 | 260 | 198 | 422 | 393 | | Permissions |
| 1.0.18 | 275 | 198 | 591 | 417 | | Sensor framework |
| 1.0.25 | 282 | 202 | 639 | 461 | ★ | **Sensor fusion** |
| 1.0.48 | 290 | 206 | 711 | 505 | ★ | **BLE scanning** |
| 1.0.65 | 295 | 206 | 732 | 559 | ★ | **BT restart fix** |
| 1.0.76 | 294 | 206 | 718 | 587 | | Pre-Kalman |
| 1.0.77 | **46** | **0** | 779 | 605 | ❌ | Build fail |
| 1.0.78 | 301 | 210 | 779 | 623 | | Recovery |
| 1.0.79 | 319 | 210 | **1005** | 626 | ★ | **EKF (buggy)** |
| 1.0.80 | 113 | **0** | 1005 | 626 | ❌ | Build fail |
| 1.0.81 | **14** | **0** | **0** | **0** | ❌ | Corrupt |
| 1.0.82 | 156 | **46** | 1007 | **0** | ⚠️ | Partial |
| 1.0.83 | 220 | **46** | 1007 | **0** | ⚠️ | Partial |
| 1.0.84 | 366 | 223 | 1009 | 658 | | Full recovery |
| 1.0.86 | 387 | 227 | **1319** | **750** | ★ | **BT 3D / 6-algo** |
| 1.0.90 | **838** | 227 | 1396 | 766 | ★ | **6-algo fusion** |
| 1.0.91 | 395 | 231 | 1416 | 770 | | Auto-update |
| 1.0.91-dup | 395 | 231 | 1416 | 770 | | Duplicate |

---

## Feature Introduction Timeline

| Feature | Version | File | Lines Added | Status |
|---------|---------|------|-------------|--------|
| Wi-Fi Scan | 1.0.0 | MainActivity | ~30 | Stable |
| Trilateration | 1.0.4 | Trilateration.java | ~150 | Stable |
| Sensor Fusion (Madgwick) | 1.0.25 | SensorFusion.java | ~200 | Stable |
| BLE Scan | 1.0.48 | BleScanner.java | ~120 | Stable |
| BLE Mesh v1 | 1.0.57 | MeshProtocol.java | ~80 | Stable |
| BT Restart Cycle | 1.0.65 | BleScanner.java | +14 | **Critical Fix** |
| EKF (PositionEKF) | 1.0.79 | PositionEKF.java | ~250 | **Buggy (vy)** |
| RTT / 802.11mc | 1.0.86 | RttPositioning.java | ~150 | Stable |
| Particle Filter | 1.0.86 | ParticleFilter.java | ~300 | Stable |
| HMM Zone | 1.0.86 | HmmPositioning.java | ~200 | Stable |
| BT 3D / AoA | 1.0.86 | Bt3DPositioning.java | ~400 | Stable |
| 6-Algo Fusion | 1.0.90 | AlgorithmFusion.java | ~100 | Stable |
| OTA Update | 1.0.91 | UpdateService.java | ~50 | Stable |
| Crash Reporting | 1.0.91 | CrashReporter.java | ~30 | Stable |

---

## Diff Hotspots (Most Changed Code Regions)

### MainActivity.java — Top 5 Methods by Diff Count
| Rank | Method | Diffs | Net Lines | Primary Changes |
|------|--------|-------|-----------|-----------------|
| 1 | `onScanResult` | 23 | +142 | Filter tuning, API updates |
| 2 | `trilaterate` | 18 | +98 | Model params, weighting |
| 3 | `bleScanCallback` | 15 | +112 | EMA, background, restart |
| 4 | `meshRelay` | 9 | +67 | TTL, duplicate suppression |
| 5 | `predict` (EKF) | 12 | +89 | Matrix tuning |

### bounce.html — Top 5 Functions by Diff Count
| Rank | Function | Diffs | Net Lines | Primary Changes |
|------|----------|-------|-----------|-----------------|
| 1 | `updateBeacons` | 28 | +156 | Position, trail, color |
| 2 | `renderLoop` | 15 | +42 | Camera modes, performance |
| 3 | `onAndroidMessage` | 12 | +89 | Bridge protocol updates |
| 4 | `initThreeJS` | 8 | +34 | Renderer, shaders, controls |
| 5 | `updateKalmanViz` | 6 | +38 | Ellipse, vectors |

---

## Cross-Reference: Spreadsheet ↔ Forensic Data

| Spreadsheet | Forensic Source | Key Columns |
|-------------|----------------|-------------|
| HTML_Aspects_Spreadsheet.csv | bounce.html diffs | Component, FirstVer, LastVer, PerfImpact |
| Android_Main_Features_Spreadsheet.csv | MainActivity diffs | Feature, Version, Lines, Permission |
| Connection_Pathways_Spreadsheet.csv | JS Bridge diffs | AndroidMethod, JSMethod, DataFlow |
| SDK_Tools_Methods_Spreadsheet.csv | build.sh diffs | Tool, Version, Command, License |
| Repeated_Errors_Catalog_Spreadsheet.csv | Error analysis | Error, Frequency, RootCause, FixVer |
| Working_Features_Versions_Spreadsheet.csv | Feature timeline | Feature, IntroVer, EnhanceVer, Status |
| Future_Thoughts_Evaluations_Spreadsheet.csv | Gap analysis | Hypothesis, Feasibility, Timeline |

---

## Forensic Artifact Inventory

| Artifact | Location | Size | Description |
|----------|----------|------|-------------|
| apk_size_analysis.csv | forensic/analysis/ | 3.4 KB | 92 rows: sizes, lines, flags |
| version_changes.csv | forensic/analysis/ | 18 KB | 364 rows: diffs per transition |
| version_analysis_log.json | forensic/analysis/ | 278 KB | Full extraction log |
| errors_and_solutions.csv | forensic/analysis/ | 64 B | Template (1 header row) |
| *.diff | forensic/diffs/ | ~1.3 MB | 364 unified diffs |
| v1.0.x/ | forensic/source/ | ~50 MB | Extracted key files per version |

---

## Verification Checklist

- [x] All 91 versions unzipped to forensic/source/
- [x] 4 key files extracted per version (MainActivity, bounce.html, build.sh, Manifest)
- [x] 364 consecutive diffs generated (forensic/diffs/)
- [x] APK size anomalies flagged (5 versions)
- [x] Code growth milestones documented (7 major)
- [x] Critical bug identified (EKF vy init)
- [x] Build failure root causes hypothesized (3 categories)
- [x] Pure CLI build validated (v1.0.84+)
- [x] License acceptance automated (hash method)
- [x] Cross-reference to 11 spreadsheets complete

---

## Data Integrity Notes

1. **v1.0.91-dup**: Exact duplicate of v1.0.91 (verification of pipeline)
2. **v1.0.81**: Excluded from growth calculations (corrupt)
3. **v1.0.82-83**: HTML=0 excluded from HTML growth (partial builds)
4. **Line counts**: From source extraction (not decompiled) — more accurate
5. **Feature detection**: Keyword-based (may have false positives/negatives)
6. **APK sizes**: From built APKs where available; 0 = build failure
7. **Timestamps**: Not available in zips; version order inferred from numbering

---

## Recommended Next Forensic Steps

1. **Decompile v1.0.92 APK** (exists at CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/) to verify EKF fix
2. **Extract three.min.js** from CDN or source to fix missing asset
3. **Run ProGuard/R8** on CLI build to reduce APK size
4. **Generate SBOM** (Software Bill of Materials) from build.sh dependencies
5. **Fuzz test** mesh protocol (v1.0.57+) with malformed packets
6. **Benchmark** 6-algorithm fusion on target devices (Pixel 6a, S23, Pixel 8)
7. **Archive** forensic/source/ to cold storage (50MB, 92 versions)

---