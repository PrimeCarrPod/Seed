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
CSMApps/
├── Bounce/work-in-progress/BOUNCE_EVOLUTION/forensic/source/1.0.0/v1/build.sh
├── Bounce/work-in-progress/BOUNCE_EVOLUTION/forensic/source/1.0.0/v1/src/main/AndroidManifest.xml
├── Bounce/
├── CarForge/
├── Marmalade/
├── Vertebrae/
├── Vertebrae-Extension/
├── _Current_Releases/
├── _Past_Releases/
├── landolil/
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

