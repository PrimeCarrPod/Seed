# SDK_Tools_Methods_Build_Pipeline — Piece 12/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 12 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## FUTURE SDK/TOOLS ROADMAP

### Planned Upgrades (from Section 7 & 10)

| Item | Current | Target | Priority | Effort | Blocker |
|------|---------|--------|----------|--------|---------|
| FP001 | compileSdk 33 | compileSdk 35 | P0 | Medium | Google Play requirement Aug 2026 |
| FP002 | targetSdk 33 | targetSdk 35 | P0 | Medium | Play Store policy |
| FP003 | build-tools 33.0.1 | build-tools 35.0.0 | P0 | Low | Must match compileSdk |
| FP004 | JDK 17 | JDK 21 (LTS) | P1 | Low | Test compatibility |
| FP005 | AGP 8.1.0 | AGP 8.5+ | P1 | Medium | Gradle 8.7+ required |
| FP006 | Kotlin 1.9.22 | Kotlin 2.0+ | P1 | Medium | AGP 8.5+ compatibility |
| FP007 | Gradle 8.4 | Gradle 8.7+ | P1 | Low | AGP 8.5+ requirement |

### Migration Timeline
```
v1.0.93 (Q4 2026):    JDK 21 test, compileSdk 34 prep
v1.0.94 (Q1 2027):    compileSdk 34, build-tools 34.0.0, AGP 8.3
v1.0.95 (Q2 2027):    compileSdk 35, targetSdk 35, AGP 8.5, Gradle 8.7
v1.0.96 (Q3 2027):    JDK 21 default, Kotlin 2.0
```

### Android 14/15 Compatibility (API 34/35)
- **Foreground Service Types:** Required for background scanning (v1.0.95+)
- **Bluetooth Permissions:** API 34 adds BLUETOOTH_ADVERTISE refinement
- **Media Permissions:** READ_MEDIA_VISUAL_USER_SELECTED for exports
- **Notification Permission:** POST_NOTIFICATIONS for foreground service

---

## BUILD SYSTEM MODERNIZATION (from Section 10)

### RF006: Auto-Detect ANDROID_HOME
- **Current:** Hardcoded fallback paths in build.sh
- **Target:** Robust detection with multiple strategies
- **Effort:** Low

### RF023: CI/CD Pipeline (GitHub Actions)
- **Current:** Manual build.sh runs
- **Target:** Automated build + test + sign + release
- **Effort:** Medium
- **Target Version:** 1.0.95

### RF024: Auto-Version from Git Tags
- **Current:** Manual version in build.sh
- **Target:** `git describe --tags` + changelog generation
- **Effort:** Low
- **Target Version:** 1.0.94

### RF025: ProGuard/R8 Enable
- **Current:** Disabled (no minification)
- **Target:** Enable for size + security
- **Effort:** Low
- **Target Version:** 1.0.94

### RF021: Release Keystore
- **Current:** Debug keystore only
- **Target:** Release keystore + signing config
- **Effort:** High
- **Target Version:** 1.0.93

---

## TOOL ECOSYSTEM WATCH

### Emerging Tools to Evaluate
| Tool | Purpose | Status | Evaluation Target |
|------|---------|--------|-------------------|
| Bazel | Alternative build | Experimental | v1.0.96+ |
| R8 (full) | Shrinking/optimization | Available | v1.0.94 |
| Kotlin Multiplatform | Shared logic | Alpha | v1.0.97+ |
| Compose Multiplatform | UI sharing | Beta | v1.0.98+ |

### Deprecation Watch
| Component | Deprecation | Migration Deadline |
|-----------|-------------|-------------------|
| renderScript | API 31 | Remove by v1.0.94 |
| Android Support Lib | 2021 | Already migrated to AndroidX |
| java.util.Date | — | Use java.time (API 26+) |

---

## PIECE 12 SUMMARY
This piece outlines the future SDK/Tools roadmap: compileSdk/targetSdk upgrade to 35 (P0, Google Play Aug 2026), build-tools 35.0.0, JDK 21 LTS, AGP 8.5+, Gradle 8.7+, Kotlin 2.0 with quarterly migration timeline. Build system modernization includes CI/CD (RF023), auto-versioning (RF024), ProGuard/R8 (RF025), release keystore (RF021). Tool ecosystem watch includes Bazel, R8, Kotlin Multiplatform. Deprecation watch for renderscript removal.

**Next Piece (13):** SDK/Tools Summary + Key Metrics + File Locations