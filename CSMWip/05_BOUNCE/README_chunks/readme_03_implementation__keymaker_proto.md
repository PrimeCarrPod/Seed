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
| Version Control | Git | — | Source control |
| Documentation | write_large_file.py | — | Chapter-based authoring |

### Key Files & Directories

```
05_BOUNCE/
├── AndroidManifest.xml
├── build.sh
├── TGE_E1/build.gradle.kts
├── TGE_E1/gradlew
├── TGE_E1/gradlew.bat
├── FINAL_DELIVERABLES/
├── PROOF_OF_WORK/
├── TGAPP.WIP/
├── TGE_E1/
├── TGE_E2/
├── TGE_E3/
├── TGE_E4/
├── build/
├── README.md              # This file
├── AGENTS.md              # Project conventions
├── TODO.md                # Task hierarchy
├── memory/                # Daily session logs
├── README_chunks/         # Chapter chunks (auto-generated)
└── FinishedWork/          # Completed documents
```

### Configuration

Key project files:

- `AGENTS.md` — Project-specific conventions and commands
- `TODO.md` — Hierarchical task breakdown (milestones → tasks → subtasks)
- `memory/` — *To be created*: Session logging directory
- `NEXT_runner_XXX.md` — Next session instructions

### Build System

This project uses **Custom (build.sh — No-Gradle)** for builds.

```bash
# Typical no-Gradle Android build flow:
./build.sh
```

