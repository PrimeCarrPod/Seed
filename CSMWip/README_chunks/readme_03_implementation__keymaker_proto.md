## Implementation — Keymaker Protocol
### Technology Stack

| Layer | Technology | Version | Purpose |
|-------|------------|---------|---------|
| Platform | Android | API 24+ | Mobile application |
| Language | Java | 11+ | Core logic |
| Language | Python | 3.8+ | Scripting/Automation |
| Language | JavaScript/TypeScript | ES6+ | Frontend/Web |
| UI | HTML/CSS | WebView | Hybrid UI |
| Docs | Markdown | Latest | Documentation |
| Build | Custom (build.sh — No-Gradle) | — | Build automation |
| Distribution | ZIP/APK | — | Release artifacts |
| Reference | PDF | — | Technical docs |
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
CSMWip/
├── 05_BOUNCE/AndroidManifest.xml
├── 05_BOUNCE/build.sh
├── 05_BOUNCE/TGE_E1/build.gradle.kts
├── 05_BOUNCE/TGE_E1/gradlew
├── 05_BOUNCE/TGE_E1/gradlew.bat
├── 01_SubAtomic_Prime_Electron_Canonical/
├── 02_Caldera_Prime_Pi_Electron/
├── 03_Legal_Enactment/
├── 05_BOUNCE/
├── 06_Land_of_Lil/
├── 07_SubAtomic_Extensions/
├── 08_DeepResearch_SubParticles/
├── 09_Project_Tracking/
├── README.md              # This file
├── AGENTS.md              # Project conventions
├── TODO.md                # Task hierarchy
├── memory/                # Daily session logs
├── README_chunks/         # Chapter chunks (auto-generated)
└── FinishedWork/          # Completed documents
```

### Configuration

Key project files:

- `AGENTS.md` — *To be created*: Project-specific conventions
- `TODO.md` — *To be created*: Task hierarchy
- `memory/` — *To be created*: Session logging directory
- `NEXT_runner_XXX.md` — Next session instructions

### Build System

This project uses **Custom (build.sh — No-Gradle)** for builds.

```bash
# Typical no-Gradle Android build flow:
./build.sh
```

