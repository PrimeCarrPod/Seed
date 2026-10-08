# Best_Practices_AntiPatterns_Catalog — Piece 03/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 03 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Build Anti-Patterns (CP001-CP003)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 03 of 13  
**Generated:** 2026-10-08 05:07:18 UTC

---

# CP001: Using Gradle for Simple Single-Activity App
**Category:** Build | **Type:** Anti-Pattern
**Observed:** v1.0.80-v1.0.85 | **Evidence:** Slow builds, AGP version hell
**Impact:** Complexity | **Versions Affected:** 1.0.80-1.0.85
**Fix:** Use no-Gradle aapt2 instead (BP001)

### Failure Mode
- Gradle 7.x/8.x AGP incompatibilities broke builds
- 3-5 minute build times vs 4 seconds with aapt2
- Daemon crashes, cache corruption, dependency resolution failures

### Root Cause
Over-engineering for a single-activity app with no complex dependencies.

---

# CP002: Hardcoding SDK Paths in build.sh
**Category:** Build | **Type:** Anti-Pattern
**Observed:** v1.0.0-v1.0.90 | **Evidence:** Breaks on different machines
**Impact:** Portability | **Versions Affected:** All versions
**Fix:** Use ANDROID_HOME detection (BP001)

### Failure Mode
```bash
# BAD - hardcoded path
ANDROID_HOME=/home/user/Android/Sdk

# GOOD - dynamic detection
ANDROID_HOME=${ANDROID_HOME:-/opt/android-sdk}
if [[ ! -d "$ANDROID_HOME" ]]; then
  echo "ANDROID_HOME not set"; exit 1
fi
```

---

# CP003: Not Matching build-tools to compileSdk
**Category:** Build | **Type:** Anti-Pattern
**Observed:** Multiple versions | **Evidence:** Build failures
**Impact:** Broken builds | **Fix:** Always match versions (BP002)

### Rule
```bash
compileSdk=33  →  build-tools=33.0.1
compileSdk=34  →  build-tools=34.0.0
```

### Why It Matters
aapt2 from build-tools N.M must match the android.jar from compileSdk N.

---

*Next Piece: Android Runtime Best Practices - Permissions (BP006-BP013)*
