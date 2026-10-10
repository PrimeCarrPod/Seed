# SDK_Tools_Methods_Build_Pipeline — Piece 11/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 11 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK/TOOLS ERROR PATTERNS (from Section 6)

### E001: JAVA_HOME Invalid
- **Error:** `JAVA_HOME is set to an invalid directory`
- **Frequency:** Every session
- **Root Cause:** Sandbox resets wipe Java
- **Solution:** `export JAVA_HOME=/usr/lib/jvm/java-17-openjdk-amd64` every session
- **Time Lost:** High

### E002: sdkmanager Not Found
- **Error:** `sdkmanager: command not found`
- **Frequency:** Every session
- **Root Cause:** cmdline-tools not at `latest/`
- **Solution:** `mv cmdline-tools/cmdline-tools cmdline-tools/latest`
- **Time Lost:** High

### E003: License Acceptance EPIPE
- **Error:** `yes | sdkmanager --licenses` fails with EPIPE
- **Frequency:** Every session
- **Root Cause:** sdkmanager closes stdin
- **Solution:** printf or license hash bypass
- **Time Lost:** Medium

### E004: AGP 8.2 Incompatibility (Gradle)
- **Error:** `Could not resolve all files for configuration — checkDebugAarMetadata`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** AGP 8.2 + Gradle 8.4+ incompatibility
- **Solution:** Pin AGP 8.1.0 + Gradle 8.4
- **Time Lost:** High

### E005: Unresolved Reference: components (Gradle)
- **Error:** `Unresolved reference: components`
- **Versions:** 1.0.80-1.0.85
- **Root Cause:** Importing non-existent package
- **Solution:** Remove unused imports
- **Time Lost:** Low

### E014: aapt2 Link Fails — Resource Not Found
- **Error:** `aapt2 link fails: resource not found`
- **Frequency:** Occasional
- **Root Cause:** Missing res/ directories or wrong paths
- **Solution:** Verify res/ structure matches AndroidManifest
- **Time Lost:** Medium

### E015: d8 MultiDex Error
- **Error:** `d8: Cannot fit requested classes in a single dex file`
- **Frequency:** Rare (not hit in Bounce)
- **Root Cause:** >64K methods
- **Solution:** Enable multiDex or reduce dependencies
- **Time Lost:** Low

### E021: Gradle Cannot Find Java
- **Error:** `Gradle cannot find Java`
- **Frequency:** Multiple (v1.0.80-1.0.85)
- **Root Cause:** JAVA_HOME not exported before Gradle
- **Solution:** Export JAVA_HOME before gradlew
- **Time Lost:** Medium

### E022: Unresolved Reference: R (Gradle)
- **Error:** `Unresolved reference: R (generated)`
- **Frequency:** Occasional
- **Root Cause:** aapt2 link didn't generate R.java
- **Solution:** Verify aapt2 link --java output dir
- **Time Lost:** Low

### E025: zipalign Command Not Found
- **Error:** `zipalign: command not found`
- **Frequency:** Every session
- **Root Cause:** build-tools not installed
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

### E026: apksigner Command Not Found
- **Error:** `apksigner: command not found`
- **Frequency:** Every session
- **Root Cause:** build-tools not installed
- **Solution:** `sdkmanager "build-tools;33.0.1"`
- **Time Lost:** High

### E030: Missing platforms/android-33/android.jar
- **Error:** `Missing platforms/android-33/android.jar`
- **Frequency:** Cloud environments
- **Root Cause:** SDK platform not installed
- **Solution:** `sdkmanager "platforms;android-33"`
- **Time Lost:** Critical

---

## ERROR → TOOL MAPPING

| Error | Tool | Solution |
|-------|------|----------|
| E001 | javac/keytool/gradle | Export JAVA_HOME |
| E002 | sdkmanager | Move cmdline-tools to latest/ |
| E003 | sdkmanager | printf or license hash |
| E004 | AGP/Gradle | Pin AGP 8.1.0 + Gradle 8.4 |
| E014 | aapt2 | Verify res/ structure |
| E015 | d8 | Enable multiDex |
| E021 | Gradle | Export JAVA_HOME first |
| E022 | aapt2/Gradle | Check --java output dir |
| E025 | zipalign | Install build-tools 33.0.1 |
| E026 | apksigner | Install build-tools 33.0.1 |
| E030 | javac/aapt2 | Install platform android-33 |

---

## PIECE 11 SUMMARY
This piece documents the 11 SDK/Tools specific error patterns from the 30-error catalog: JAVA_HOME invalid, sdkmanager not found, license EPIPE, AGP 8.2 incompatibility, Gradle import issues, aapt2 resource failures, d8 multiDex, Gradle Java/R issues, zipalign/apksigner missing, and missing android-33 platform. Each maps to a specific tool with documented solution. The top 3 (JAVA_HOME, sdkmanager path, license EPIPE) occur every session.

**Next Piece (12):** Future SDK/Tools Roadmap — Upgrades, Migrations, Modernization