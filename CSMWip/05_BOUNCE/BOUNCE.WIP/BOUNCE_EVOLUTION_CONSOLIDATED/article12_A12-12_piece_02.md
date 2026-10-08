# Forensic_Analysis_Data_91_Versions — Piece 02/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 02 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# APK Size Anomalies: Five Flagged Versions

## Overview

Five versions exhibit anomalous APK sizes indicating build failures or incomplete builds. These represent critical points in the development timeline where the build pipeline broke.

## Anomaly Summary Table

| Version | Zip Size | APK Size | MainActivity Lines | HTML Lines | Build.sh Lines | Anomaly Type |
|---------|----------|----------|-------------------|------------|----------------|--------------|
| v1.0.77 | 45,741 | **0** | 779 | 605 | 113 | **Complete build failure** |
| v1.0.80 | 113,062 | **0** | 1,005 | 626 | 113 | **Complete build failure** |
| v1.0.81 | 14,254 | **0** | **0** | **0** | **0** | **Empty/corrupt zip** |
| v1.0.82 | 156,369 | 45,649 | 1,007 | **0** | 109 | **Partial - no HTML** |
| v1.0.83 | 219,771 | 45,649 | 1,007 | **0** | 109 | **Partial - no HTML** |

## Detailed Analysis

### v1.0.77 — First Complete Build Failure
- **Zip size**: 45,741 bytes (85% smaller than v1.0.76's 294,370)
- **APK size**: 0 bytes (build produced no output)
- **Source present**: MainActivity (779 lines), HTML (605 lines), build.sh (113 lines)
- **Root cause hypothesis**: build.sh v1.0.77 (113 lines vs 109 in v1.0.76) introduced breaking change
- **Recovery**: v1.0.78 zip size returns to 300,864; APK 210,263 bytes

### v1.0.80 — Second Complete Build Failure
- **Zip size**: 113,062 bytes (63% smaller than v1.0.79's 318,723)
- **APK size**: 0 bytes
- **Source present**: MainActivity (1,005 lines), HTML (626 lines)
- **Context**: MainActivity jumped from 779 → 1,005 lines (+226, +29%) between v1.0.78-79
- **Recovery**: v1.0.81 exists but corrupt; v1.0.82 partial

### v1.0.81 — Empty/Corrupt Distribution
- **Zip size**: 14,254 bytes (95% smaller than normal)
- **All key files**: 0 lines (missing from zip)
- **Classification**: Distribution artifact, not a real version
- **Likely cause**: Failed upload, truncated download, or CI artifact corruption

### v1.0.82 — Partial Build (No HTML)
- **Zip size**: 156,369 bytes (47% of normal)
- **APK size**: 45,649 bytes (20% of normal ~220KB)
- **MainActivity**: 1,007 lines (present)
- **HTML**: 0 lines (missing from zip)
- **Build.sh**: 109 lines (reverted from 113)
- **APK analysis**: 45,649 bytes = classes.dex + resources.arsc + Manifest only (no assets/bounce.html)

### v1.0.83 — Partial Build (No HTML, Larger Zip)
- **Zip size**: 219,771 bytes (70% of normal)
- **APK size**: 45,649 bytes (same as v1.0.82)
- **MainActivity**: 1,007 lines (same as v1.0.82)
- **HTML**: 0 lines (still missing)
- **Difference from v1.0.82**: Larger zip suggests extra assets/libs included but HTML still absent

## Recovery Timeline

```
v1.0.76  ████████████████████ 294KB zip, 206KB APK  ✅ NORMAL
v1.0.77  ░░░░░░░░░░░░░░░░░░░  45KB zip,   0KB APK   ❌ BUILD FAIL
v1.0.78  ████████████████████ 300KB zip, 210KB APK  ✅ RECOVERED
v1.0.79  ████████████████████ 318KB zip, 210KB APK  ✅ NORMAL (MainActivity +226 lines)
v1.0.80  ░░░░░░░░░░░░░░░░░░░ 113KB zip,   0KB APK   ❌ BUILD FAIL
v1.0.81  ░░░░░░░░░░░░░░░░░░░  14KB zip,   0KB APK   ❌ CORRUPT
v1.0.82  ░░░░░░░░░░░░░░░░░░░ 156KB zip,  45KB APK   ⚠️ PARTIAL (no HTML)
v1.0.83  ░░░░░░░░░░░░░░░░░░░ 219KB zip,  45KB APK   ⚠️ PARTIAL (no HTML)
v1.0.84  ████████████████████ 366KB zip, 222KB APK  ✅ FULL RECOVERY
```

## Root Cause Hypotheses

| Anomaly | Likely Cause | Evidence |
|---------|--------------|----------|
| v1.0.77 | build.sh regression | build.sh lines 113 vs 109; v1.0.78 reverts to 109 |
| v1.0.80 | MainActivity too large for build memory | 1,005 lines = peak before v1.0.86 (1,319) |
| v1.0.81 | Artifact corruption | All files 0 lines; zip 14KB |
| v1.0.82-83 | Asset packaging failure | HTML missing; APK exactly 45,649 bytes both versions |

## Impact Assessment

- **Development velocity**: 7 versions (77-83) with build issues = ~7% of versions
- **Data loss risk**: v1.0.81 completely unrecoverable from zip
- **Forensic gap**: v1.0.82-83 HTML evolution unknown (gap in visualization features)
- **v1.0.92 fix**: Pre-built APK exists at `CSMWip/05_BOUNCE/BOUNCE.WIP/v92/out/Bounce-v1.0.92.apk` with EKF bug fix

## Recommendations

1. **CI/CD gates**: Add APK size validation (>100KB) and asset verification (bounce.html present)
2. **Artifact integrity**: Checksum validation on upload/download
3. **Build monitoring**: Alert on zip size deviation >50% from rolling average
4. **Archive strategy**: Keep source zips separate from build artifacts

---