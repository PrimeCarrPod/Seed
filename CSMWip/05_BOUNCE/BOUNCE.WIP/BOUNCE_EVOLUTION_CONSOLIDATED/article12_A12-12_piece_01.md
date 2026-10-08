# Forensic_Analysis_Data_91_Versions — Piece 01/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 01 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Forensic Analysis of 91 Bounce Versions: Overview & Methodology

## Executive Summary

This forensic analysis examines 91 versions of the Bounce Android application (v1.0.0 through v1.0.91, plus a duplicate v1.0.91-dup), spanning approximately 2 years of development. The analysis was conducted by extracting and comparing four key files from each version's APK:

1. **MainActivity.java** - Core positioning, networking, and Android logic
2. **bounce.html** - Three.js/WebGL visualization in WebView
3. **build.sh** - Build script with SDK/NDK/toolchain configuration
4. **AndroidManifest.xml** - Permissions, components, and app metadata

## Methodology

### Extraction Pipeline
```bash
# For each version zip:
unzip -q bounce_v1.0.x.zip -d v1.0.x/
# Extract from APK (if built) or source zip:
apktool d bounce.apk -o v1.0.x_apk/
# Key files located at:
#   v1.0.x/src/main/java/com/carrpod/bounce/MainActivity.java
#   v1.0.x/src/main/assets/bounce.html
#   v1.0.x/build.sh
#   v1.0.x/src/main/AndroidManifest.xml
```

### Diff Generation
- Consecutive version diffs: 91 transitions × 4 files = 364 diff files
- Tool: `diff -u` with context lines
- Stored in: `forensic/diffs/`

### Analysis Artifacts Generated
| Artifact | Description | Size |
|----------|-------------|------|
| `apk_size_analysis.csv` | 92 rows: zip/APK sizes, line counts, anomaly flags | 3.4 KB |
| `version_changes.csv` | 364 rows: lines added/removed per file per transition | 18 KB |
| `version_analysis_log.json` | Full forensic data with feature detection | 278 KB |
| `errors_and_solutions.csv` | Template for error catalog | 64 bytes |

## Scope & Coverage

| Metric | Value |
|--------|-------|
| Versions analyzed | 91 (v1.0.0 → v1.0.91) + 1 duplicate |
| Date range | ~2024-2026 (estimated from version progression) |
| Total diff files | 364 |
| MainActivity growth | 160 → 1,416 lines (785% increase) |
| HTML growth | 303 → 770 lines (154% increase) |
| APK size range | 0 bytes (failed) → 230,826 bytes |
| Anomaly versions flagged | 5 (v1.0.77, 80, 81, 82, 83) |

## Key Findings Preview

1. **Five build-failure anomalies** where APK size = 0 or partial (no HTML)
2. **Three major growth phases**: Foundation (v1.0.0-10), Sensor Fusion (v1.0.25), BLE (v1.0.48), Kalman (v1.0.79), BT 3D (v1.0.86), 6-Algorithm (v1.0.90)
3. **Critical bug found**: EKF vy initialization bug in PositionEKF.java:38 (fixed in v1.0.92)
4. **Build system evolution**: Gradle → custom build.sh with NDK r25c, SDK 34, Java 17

## Data Quality Notes

- v1.0.91-dup: Duplicate of v1.0.91 (same zip size, different extraction)
- v1.0.81: Minimal zip (14KB), all key files missing (0 lines)
- v1.0.82-83: Partial builds (MainActivity present, HTML missing)
- Line counts from extracted source, not decompiled (more accurate)
- Feature detection via keyword search in source (may have false positives)

---