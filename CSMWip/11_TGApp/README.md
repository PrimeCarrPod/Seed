## Project Overview
# 11_TGApp

**Category:** CSMWip | **State:** Part of Another Project | **Files:** 228

**Parent Project:** CSMWip

### Summary

TGApp ecosystem — BOUNCE monetization app (license validation, billing, APK delivery). 3 WIP versions: V1 (Gradle/Kotlin + Firebase Billing), V2 (No-Gradle command-line), V3 (Shared build from 05_BOUNCE via `__Python_Tools/build_apk.py`). TGE_E5 active episode using shared No-Gradle pipeline. Surgical extraction from BOUNCE v1.0.91: dual WebView (Antikythera + TGHC overlay), FeatureGate JWT RS256, LICENSE_UPDATED broadcast.

---

## Architecture & Design — Williams Heuristic
### System Boundaries

The **11_TGApp** project operates within the **CSMWip** domain, 
functioning as a **Part of Another Project** with 228 files. 
It is the monetization layer for the BOUNCE ecosystem — handles Pro subscriptions, license validation, and APK delivery to BOUNCE users.

### Core Principles

1. **Surgical Extraction** — Minimal WebView wrapper from BOUNCE v1.0.91 (keep buildWebView, injectJs, setupFullscreen; remove all sensors/Bluetooth/GPS/fleet)
2. **Shared Infrastructure** — Same keystore, same build pipeline, same FeatureGate as BOUNCE
3. **Dual WebView Architecture** — Background: antikytherian.com (Antikythera mechanism); Overlay: tghc.pro (8× google.com windows, transparent)
4. **License-First Design** — Firebase Functions validate Google Play receipts → JWT RS256 → broadcast to BOUNCE

### Component Diagram

```
11_TGApp/
├── TGApp.WIP/                      # V1: Gradle/Kotlin + Firebase Billing
│   ├── app/                        # Android app module
│   │   ├── src/main/
│   │   │   ├── java/com/TGApp/mynewapp/
│   │   │   │   ├── MainActivity.kt     # WebView + billing + license
│   │   │   │   ├── FeatureGate.kt      # JWT validation (shared)
│   │   │   │   └── BillingManager.kt   # Play Billing 6.2.1
│   │   │   ├── assets/tgapp.html       # Dual WebView HTML
│   │   │   ├── res/
│   │   │   └── AndroidManifest.xml
│   ├── build.gradle.kts            # Gradle 8.5 + Kotlin 1.9.20
│   ├── build.sh / build_v101.sh    # No-Gradle alternative
│   ├── BUILD_INSTRUCTIONS.md       # 271-line build guide
│   ├── NEW_APP_RUNNER_TGApp.md     # 612-line app creation runner
│   ├── LESSONS_LEARNED_TGApp.md
│   ├── UPGRADE_PLAN_v101.md
│   └── APK/                        # Output APKs
├── TGApp.WIP.V2/                   # V2: No-Gradle (command-line tools only)
│   ├── src/main/                   # Java source
│   ├── res/                        # Resources
│   ├── AndroidManifest.xml
│   ├── tgapp_electron.apk          # 2.1M APK
│   └── tge_electron_crash_log.txt  # 74M crash log
├── TGApp.WIP.V3/                   # V3: Shared build from 05_BOUNCE
│   ├── build.py                    # Shared from __Python_Tools/build_apk.py
│   ├── build.sh                    # Wrapper
│   ├── src/main/java/com/TGApp/
│   ├── res/
│   ├── AndroidManifest.xml
│   ├── debug.keystore              # Symlink to ../../05_BOUNCE/debug.keystore
│   ├── tgapp_electron.apk          # 2.1M APK
│   ├── tgapp_electron_v3_*.apk     # 44 versioned APKs (v3_010..v3_044)
│   └── tgapp_electron_v3_aligned.apk
├── TGE_E5/                         # Episode 5: Current active
│   ├── AGENTS.md                   # Project conventions
│   ├── TODO.md                     # Task tracking
│   ├── NEXT_runner_001.md          # Next steps
│   ├── RESUME_SESSION_TGE_E5.md    # Session context
│   ├── build.py                    # Shared builder
│   ├── AndroidManifest.xml
│   ├── src/main/java/com/csmlabs/tge/e5/
│   ├── res/
│   ├── debug.keystore              # Symlink to ../../05_BOUNCE/debug.keystore
│   └── tge_e5.apk                  # 17K APK (built)
├── README.md                       # This file
├── README_chunks/                  # 7-chapter template
└── FinishedWork/                   # Completed documents
```

### Episode Structure

| Episode | Location | Build System | Status | APK |
|---------|----------|--------------|--------|-----|
| TGApp V1 | TGApp.WIP/ | Gradle + Kotlin | Template/Reference | ~200KB |
| TGApp V2 | TGApp.WIP.V2/ | No-Gradle (cmd) | Built | 2.1M |
| TGApp V3 | TGApp.WIP.V3/ | Shared (build_apk.py) | 44 versions built | 1.4M |
| **TGE_E5** | TGE_E5/ | **Shared (build_apk.py)** | **Active scaffold** | **17K** |

---

## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Platform | Android | API 24+ / 34 target | Mobile application |
| Language | Kotlin | 1.9.20 | V1: Primary |
| Language | Java | 11+ | V2/V3/E5: Primary |
| Language | Python | 3.8+ | Shared build automation |
| Build V1 | Gradle | 8.5+ | V1: Standard |
| Build V2 | aapt2/javac/d8 | 34.0.0 | V2: Command-line |
| Build V3/E5 | build_apk.py | — | **Shared No-Gradle pipeline** |
| Billing | Play Billing | 6.2.1 | In-app purchases |
| Backend | Firebase | Functions/Firestore | License validation |
| Distribution | Firebase App Dist. | — | APK delivery to BOUNCE |
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
11_TGApp/
├── TGApp.WIP/
│   ├── BUILD_INSTRUCTIONS.md          # Complete build guide (271 lines)
│   ├── NEW_APP_RUNNER_TGApp.md        # App creation runner (612 lines)
│   ├── app_build.gradle.kts           # Module build config
│   ├── build.gradle.kts               # Project build config
│   ├── build_local.sh                 # Local Gradle wrapper
│   ├── build_v101.sh                  # No-Gradle alternative
│   ├── gradlew / gradlew.bat          # Gradle wrapper
│   ├── settings.gradle.kts
│   ├── proguard-rules.pro
│   ├── app/src/main/
│   │   ├── AndroidManifest.xml
│   │   ├── java/com/TGApp/mynewapp/
│   │   │   ├── MainActivity.kt
│   │   │   ├── FeatureGate.kt         # Shared with BOUNCE
│   │   │   └── BillingManager.kt
│   │   ├── assets/tgapp.html          # Dual WebView HTML
│   │   └── res/
│   └── APK/
├── TGApp.WIP.V2/
│   ├── AndroidManifest.xml
│   ├── src/main/java/...
│   ├── res/
│   ├── assets/
│   ├── tgapp_electron.apk
│   └── NEXT_runner_001.md
├── TGApp.WIP.V3/
│   ├── build.py / build.sh
│   ├── src/main/java/com/TGApp/...
│   ├── res/
│   ├── AndroidManifest.xml
│   ├── debug.keystore (symlink)
│   ├── tgapp_electron.apk + 44 versions
│   └── NEXT_runner_001.md
├── TGE_E5/
│   ├── AGENTS.md
│   ├── TODO.md
│   ├── NEXT_runner_001.md
│   ├── RESUME_SESSION_TGE_E5.md
│   ├── build.py (shared)
│   ├── AndroidManifest.xml
│   ├── src/main/java/com/csmlabs/tge/e5/
│   ├── res/
│   ├── debug.keystore (symlink)
│   └── tge_e5.apk
├── __Python_Tools/build_apk.py       # Shared builder (source of truth)
└── 05_BOUNCE/debug.keystore          # Shared keystore (source)
```

### Configuration

Key project files:
- `TGApp.WIP/BUILD_INSTRUCTIONS.md` — Complete build guide (Gradle + No-Gradle + CI/CD)
- `TGApp.WIP/NEW_APP_RUNNER_TGApp.md` — 612-line surgical extraction runner
- `TGE_E5/AGENTS.md` — Episode 5 conventions (shared build, package com.csmlabs.tge.e5)
- `TGE_E5/TODO.md` — Manifest/resources creation tasks
- `TGApp.WIP/LESSONS_LEARNED_TGApp.md` — Anti-patterns from BOUNCE evolution

### Build Pipeline Evolution

| Version | Build System | Key Characteristics |
|---------|--------------|---------------------|
| **V1** | Gradle 8.5 + Kotlin 1.9.20 | Standard Android, Firebase Billing, ProGuard, GitHub Actions CI/CD |
| **V2** | aapt2 + kotlinc + d8 | Command-line only, 2.1M APK, crash log analysis |
| **V3** | `__Python_Tools/build_apk.py` | Shared with 05_BOUNCE, 44 versioned APKs, symlink keystore |
| **E5** | `__Python_Tools/build_apk.py` | **Current active**, minimal scaffold, 17K APK |

### Shared No-Gradle Pipeline (V3/E5/05_BOUNCE)

```bash
# From __Python_Tools/build_apk.py
1. aapt2 compile --dir res -o res.zip
2. aapt2 link -o base.apk -I $ANDROID_JAR res.zip --manifest AndroidManifest.xml --java gen
3. javac -source 1.8 -target 1.8 -bootclasspath $ANDROID_JAR -d build/classes src/**/*.java
4. d8 --output build/dex --lib $ANDROID_JAR build/classes/**/*.class
5. aapt2 link -o app-unaligned.apk -I $ANDROID_JAR res.zip --manifest AndroidManifest.xml
6. zip -r app-unaligned.apk build/dex/classes.dex
7. zipalign -f 4 app-unaligned.apk app-aligned.apk
8. apksigner sign --ks debug.keystore --ks-pass env:ANDROID_KEYSTORE_PASS app-aligned.apk
```

---

## Operations — El Segundo Protocol
### Session Lifecycle

1. **Startup** — Read `TGE_E5/RESUME_SESSION_TGE_E5.md` → `TGE_E5/TODO.md` → `TGE_E5/NEXT_runner_001.md`
2. **Execution** — Create manifest → resources → MainActivity → shared build → test
3. **Heartbeat** — Progress output every 2 minutes (120s interval)
4. **Checkpoint** — Update `TODO.md` and log to `memory/` after each subtask
5. **Handoff** — Create next runner file and update `RESUME_SESSION_TGE_E5.md`

### Episode 5 Status

| Task | Status | Details |
|------|--------|---------|
| Project structure | ✅ | Scaffolded |
| AGENTS.md | ✅ | Conventions defined |
| TODO.md | ✅ | Task tracking |
| NEXT_runner_001.md | ✅ | Next steps documented |
| AndroidManifest.xml | ✅ | Created (package com.csmlabs.tge.e5) |
| Resources (strings/colors/layout) | ⏳ | Next: copy from 05_BOUNCE |
| MainActivity.java | ⏳ | Next: minimal Activity |
| Shared build execution | ⏳ | `python3 ../../__Python_Tools/build_apk.py` |
| Device test | ⏳ | `adb install -r tge_e5.apk` |

### Quality Gates

- APK builds and installs on API 21-34
- Shared keystore produces valid signature (symlink to 05_BOUNCE)
- No-Gradle pipeline matches 05_BOUNCE exactly
- APK size target: <50KB for minimal episode
- Firebase Functions validateReceipt deployed (for license flow)

---

## Three-Pronged Heuristic Integration
This project employs the **Williams/Keymaker/El Segundo** triad:

### Williams Heuristic — Architectural Clarity

- **Purpose**: Define the monetization layer for BOUNCE ecosystem
- **Method**: Surgical extraction (minimal surface), dual WebView (separation of concerns), license broadcast (loose coupling)
- **Output**: `BUILD_INSTRUCTIONS.md`, `NEW_APP_RUNNER_TGApp.md`, episode structure
- **Applied Here**: Clear separation: TGApp = billing/license/delivery; BOUNCE = game/features

### Keymaker Protocol — Implementation Precision

- **Purpose**: Reproducible builds across 4 versions (V1 Gradle, V2 cmd, V3 shared, E5 shared)
- **Method**: Single source of truth (`__Python_Tools/build_apk.py`), symlink keystore, shared FeatureGate
- **Output**: `build_apk.py`, `build.sh` wrappers, `debug.keystore` symlinks, versioned APKs
- **Applied Here**: 44 versioned APKs in V3 prove reproducibility; E5 uses identical pipeline

### El Segundo Protocol — Operational Excellence

- **Purpose**: Episode-based development with session resume
- **Method**: Runner files per episode, shared infrastructure, 30s subtask limit
- **Output**: `NEXT_runner_XXX.md`, `RESUME_SESSION_*.md`, symlink keystore
- **Applied Here**: TGE_E5 scaffolded in minutes using 05_BOUNCE validated pipeline

### Integration Matrix

| Phase | Williams | Keymaker | El Segundo |
|-------|----------|----------|------------|
| Design | Surgical extraction | Single builder source | Episode model |
| Build | Dual WebView | build_apk.py + symlink | Shared pipeline |
| Test | License flow | APK verify + install | Device test |
| Deploy | Firebase App Dist | Signed with Bounce key | Episode release |
| Evolve | New episodes | Template runner | Session resume |

---

## Roadmap & Future Work
### Immediate (Next 1-2 Sessions)

- [ ] Complete TGE_E5 resources (strings.xml, colors.xml, activity_main.xml from 05_BOUNCE)
- [ ] Create TGE_E5 MainActivity.java (minimal, extend Activity not AppCompatActivity)
- [ ] Execute shared build: `python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5`
- [ ] Verify tge_e5.apk installs and runs

### Short Term (Next 5 Sessions)

- [ ] Implement Episode 5 narrative content (interactive story/visualization)
- [ ] Add asset handling for large media (→ `RESTART_PACKAGE/`)
- [ ] Document TGApp.WIP.V3 → V4 migration (if needed)
- [ ] Create `memory/` directory for session logging
- [ ] Add GitHub Actions CI/CD for TGE episodes

### Long Term (Ongoing)

- [ ] New episodes (TGE_E6, TGE_E7...) using same shared pipeline
- [ ] BOUNCE integration: FeatureGate JWT validation, LICENSE_UPDATED broadcast
- [ ] Firebase Functions: validateReceipt, deliverApk deployed
- [ ] Quarterly review: APK sizes, keystore rotation, build pipeline updates
- [ ] Migrate documentation to `write_large_file.py` logical chunks

---

## Appendix — Quick Reference
### Key Commands

```bash
# Session startup (TGE_E5)
cd /workspace/app/CSMWip/11_TGApp/TGE_E5
cat RESUME_SESSION_TGE_E5.md
cat NEXT_runner_001.md
git status

# Build TGE_E5 (shared pipeline)
python3 ../../__Python_Tools/build_apk.py \
    --project . \
    --package com.csmlabs.tge.e5 \
    --output tge_e5.apk

# Install & test
adb install -r tge_e5.apk
adb logcat -s "TGE_E5:*" "AndroidRuntime:*"

# Build TGApp V1 (Gradle)
cd ../../TGApp.WIP
./gradlew assembleRelease

# Build TGApp V3 (shared)
cd ../../TGApp.WIP.V3
python3 ../../__Python_Tools/build_apk.py --project . --package com.TGApp.tgapp

# Document operations
python3 ../../__Python_Tools/write_large_file.py split <input> <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py concat <chunks_dir> <output>
python3 ../../__Python_Tools/write_large_file.py manifest <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py verify <chunks_dir>
python3 ../../__Python_Tools/write_large_file.py compress <file>

# Git workflow
git add -A && git commit -m '<type>: <description>' && git push
```

### File Locations

- **Project Root**: `CSMWip/11_TGApp`
- **TGE_E5 (Active)**: `CSMWip/11_TGApp/TGE_E5/`
- **V1 Template**: `CSMWip/11_TGApp/TGApp.WIP/`
- **V2 No-Gradle**: `CSMWip/11_TGApp/TGApp.WIP.V2/`
- **V3 Shared**: `CSMWip/11_TGApp/TGApp.WIP.V3/`
- **Shared Builder**: `__Python_Tools/build_apk.py`
- **Shared Keystore**: `05_BOUNCE/debug.keystore`
- **Chunks**: `CSMWip/11_TGApp/README_chunks/`
- **Manifest**: `CSMWip/11_TGApp/README_chunks/MANIFEST.json`

### Project Statistics

- **Total Files**: 228
- **File Types**: .java: 49, .apk: 45, .xml: 29, .md: 21, .png: 20, .class: 15, .sh: 6, .kt: 6, .prime: 4
- **Languages**: Java: 49, XML: 29, Markdown: 21, Kotlin: 9, Shell: 6, HTML: 3, JavaScript/TypeScript: 2, Python: 1, JSON: 1
- **Key Directories**: 4 (WIP, WIP.V2, WIP.V3, TGE_E5)
- **APKs Built**: 44 (V3) + 1 (V2) + 1 (E5) = 46 total
- **Documentation**: 883 lines (BUILD_INSTRUCTIONS + NEW_APP_RUNNER)

### Related Projects

- **Parent**: CSMWip (`CSMWip`)
- **Dependency**: 05_BOUNCE (build system, keystore, FeatureGate, APK updates)
- **Consumer**: BOUNCE receives LICENSE_UPDATED broadcast, APK updates
- **Category Peers**: 05_BOUNCE, 10_Prime_Electron_Caldera_Synthesis, 12_AegisOutfitFabricator
- **File Count**: 228 files

---

*README generated for 11_TGApp — Part of Another Project*
*Category: CSMWip | Files: 228 | Parent: CSMWip*
*Generated using write_large_file.py IncrementalDocumentWriter*