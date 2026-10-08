# Best_Practices_AntiPatterns_Catalog — Piece 01/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 01 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Best Practices & Anti-Patterns Catalog — Overview

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 01 of 13  
**Generated:** 2026-10-08 05:06:12 UTC

---

# Section 1: Executive Summary

This catalog documents **20 Best Practices (BP001-BP020)** and **17 Anti-Patterns (CP001-CP020)** discovered through forensic analysis of **91 BOUNCE Android app versions** (v1.0.0 through v1.0.91).

## Scope
- **Build System**: No-Gradle aapt2 pipeline, SDK pinning, keystore management
- **Android Runtime**: Permissions, BLE scanning, wake locks, Wi-Fi Direct
- **HTML/JS/WebView**: Three.js/Chart.js local assets, error handling, memory management
- **Architecture**: God class decomposition, algorithm verification, technical debt

## Methodology
Each pattern is traced to:
- **First Observed Version**: When the pattern appeared or was discovered
- **Confirmed Working Version**: Version where the practice was validated
- **Evidence**: Concrete proof from version diffs, build logs, or runtime behavior
- **Impact**: Measurable effect on stability, performance, or maintainability

## Key Findings
1. **No-Gradle aapt2 builds** (4-second builds) consistently outperformed Gradle across all 91 versions
2. **EKF array index bug** (x[2]=0; x[2]=0; → x[3]=0) in v1.0.90-91 caused velocity tracking failure
3. **5s BLE scan restart cycle** (v1.0.65+) eliminated scan death that plagued v1.0.48-64
3. **Conditional wake lock** (v1.0.63+) prevented battery drain from always-held locks
4. **2000-point trail FIFO cap** (v1.0.62+) prevented OOM crashes from unbounded arrays

---

*Next Piece: Build System Best Practices (BP001-BP005)*
