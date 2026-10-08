# SDK_Tools_Methods_Build_Pipeline — Piece 13/13
## Article A4: A4-04 — SDK Tools Methods Build Pipeline
**Piece:** 13 of 13  
**Generated:** 2026-10-08 04:35:00 UTC

---

## SDK TOOLS METHODS — COMPLETE SUMMARY

### Tool Inventory (30 Tracked Tools)

| # | Tool | Version | Purpose | Category |
|---|------|---------|---------|----------|
| 1 | JDK | 17 | Java compilation + keytool | Java Toolchain |
| 2 | Android SDK Platform | android-33 | android.jar for compilation | SDK |
| 3 | Build Tools | 33.0.1 | aapt2, d8, zipalign, apksigner | Build Tools |
| 4 | cmdline-tools | latest | sdkmanager command | SDK Manager |
| 5 | Gradle | 8.4/8.5 | Alternative build system | Build System |
| 6 | AGP | 8.1.0 | Android Gradle Plugin | Build System |
| 7 | Kotlin | 1.9.22 | Kotlin compilation | Language |
| 8 | aapt2 | 33.0.1 | Resource compile + link | Build Tools |
| 9 | d8 | 33.0.1 | Dex conversion | Build Tools |
| 10 | zipalign | 33.0.1 | APK alignment | Build Tools |
| 11 | apksigner | 33.0.1 | APK signing | Build Tools |
| 12 | keytool | JDK 17 | Debug keystore generation | Java Toolchain |
| 13 | git | Latest | Version control | VCS |
| 14 | GitHub CLI (gh) | Latest | PR/merge automation | CI/CD |
| 15 | unzip | Latest | Extract source zips | Utility |
| 16 | bc | Latest | Build size calculation | Utility |
| 17 | stat | GNU coreutils | File size checking | Utility |
| 18 | date | GNU coreutils | Timestamps | Utility |
| 19 | nohup | GNU coreutils | Background processes | Process Mgmt |
| 20 | pkill | GNU coreutils | Stop background processes | Process Mgmt |
| 21 | diff | GNU diffutils | Version diffing | Forensics |
| 22 | zip | Latest | Asset injection + zipping | Archive |
| 23 | ADB | Latest | Device install/test | Debug |
| 24 | sdkmanager licenses | Latest | License acceptance | SDK Manager |
| 25 | License hash bypass | Latest | Skip interactive licenses | SDK Manager |
| 26 | ANDROID_HOME | Env var | SDK location | Environment |
| 27 | local.properties | Gradle | Gradle SDK path | Build Config |
| 28 | compileSdk | 33 | Compilation target | SDK Config |
| 29 | targetSdk | 33 | Runtime target | SDK Config |
| 30 | minSdk | 24 | Minimum version | SDK Config |

---

## CROSS-REFERENCES TO OTHER SECTIONS

| Section | Connection | Details |
|---------|------------|---------|
| **Sec 1: HTML** | Build.sh injects assets | Step 3: zip -r base.apk assets/ |
| **Sec 2: Android** | build.sh compiles MainActivity | javac + d8 pipeline |
| **Sec 3: Connections** | Build.sh enables bridge | APK with JS interface |
| **Sec 5: Best Practices** | BP001-BP005 | No-Gradle, pin versions, auto keystore, zip assets, javac 11 |
| **Sec 5: Anti-Patterns** | CP001-CP004 | Gradle hell, hardcoded paths, mismatch, API33 perms |
| **Sec 6: Errors** | E001-E004, E014, E015, E021, E022, E025, E026, E030 | 11 SDK/Tools errors |
| **Sec 7: Future** | FP001-FP007 | SDK upgrades, CI/CD, auto-version |
| **Sec 10: Refinements** | RF006, RF021, RF023, RF024, RF025 | Auto-detect, release keystore, CI/CD, auto-version, ProGuard |

---

## KEY METRICS

| Metric | Value |
|--------|-------|
| **Build Time (no-Gradle)** | ~3.3 seconds |
| **Build Time (Gradle)** | ~60-120 seconds |
| **APK Size (v1.0.91)** | 230,826 bytes |
| **JDK Version** | 17 (OpenJDK) |
| **compileSdk / targetSdk** | 33 / 33 |
| **minSdk** | 24 (Android 7.0) |
| **Build Tools Version** | 33.0.1 |
| **Platform** | android-33 |
| **License Bypass** | SHA-1 hash (instant) |
| **cmdline-tools Path** | Must be at `latest/` |
| **Asset Injection** | zip -r (post aapt2 link) |
| **Debug Keystore** | Auto-generated |
| **Release Keystore** | Not yet (TD-08) |

---

## CRITICAL LESSONS LEARNED

1. **No-Gradle Wins for Simple Apps** — 4s vs 60s+, no AGP version hell (BP001)
2. **Pin Everything** — compileSdk, build-tools, platform, JDK — match versions (BP002)
3. **License Hash Bypass** — Instant, reliable, no EPIPE (E003)
4. **cmdline-tools at latest/** — Hard requirement, automate the move (E002)
5. **JAVA_HOME Every Session** — Sandbox resets, export in build.sh (E001)
6. **Asset Injection via Zip** — aapt2 link misses assets/, zip after (BP004)
6. **Auto-Generate Keystore** — Build never fails on missing debug.keystore (BP003)
7. **Gradle Only When Needed** — Multi-module only, pin AGP 8.1.0 (CP001, CP003)
8. **Auto-Detect SDK Paths** — Hardcoded paths break portability (CP002, RF006)
9. **Release Keystore Separate** — Debug keystore not for Play Store (TD-08, RF021)
10. **CI/CD Automates All** — GitHub Actions: setup → build → test → sign → release (RF023)

---

## FILE LOCATIONS

| File | Purpose |
|------|---------|
| `SDK_Tools_Methods_Spreadsheet.csv` | 30 tools × 11 columns |
| `build.sh` | 109 lines, no-Gradle pipeline |
| `setup_sdk.sh` | Automated SDK installation |
| `AndroidManifest.xml` | SDK declarations (min/target/compile) |
| `build.gradle.kts` | Gradle config (v1.0.80+) |
| `settings.gradle.kts` | Gradle settings |
| `gradle.properties` | Gradle JVM args |
| `forensic/source/v*/build.sh` | Historical build scripts |
| `forensic/diffs/*build.sh.diff` | Build script evolution |

---

## PIECE 13 SUMMARY
This final piece provides the complete tool inventory (30 tools across Java toolchain, SDK, build tools, build systems, utilities, process management, forensics, environment, config), cross-reference matrix to all 12 other sections, key metrics (3.3s builds, 231 KB APK, JDK 17, SDK 33, license hash bypass), critical lessons learned (10 principles from no-Gradle to CI/CD), and file locations. The toolchain evolved from manual setup to fully automated (setup_sdk.sh + build.sh) with pinned versions ensuring reproducibility across 91 versions.

---

**END OF SECTION 4: SDK TOOLS METHODS BUILD PIPELINE**
*13 pieces covering: JDK/Java Toolchain → SDK Platform/Build Tools → cmdline-tools/Gradle/AGP/Kotlin → License Management/Environment → build.sh Pipeline/Asset Injection → SDK Path Detection/Issues/Metrics → ADB/Licenses/Environment/local.properties → SDK Version Constants/Manifest/Gradle Config → Automated Setup/CI/CD/Troubleshooting → Best Practices/Anti-Patterns/Tool Practices → Error Patterns/Tool Mapping → Future Roadmap/Modernization/Deprecation → Summary/Metrics/Cross-Refs*

*Next: Section 5 — Best Practices/Anti-Patterns (article5_A5-05)*