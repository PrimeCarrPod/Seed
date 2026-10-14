# MEMORY.md — Workspace Long-Term Memory

## Cross-Project Architecture Decisions

### No-Gradle Android APK Build System (Active)
- **Goal**: Build APKs using only `javac`, `aapt2`, `d8`/`dx`, `zipalign`, `apksigner` from Android SDK command-line tools
- **No Gradle, No AndroidX, No Kotlin** — pure Java + XML resources + Android SDK
- **Core components**: `AndroidManifest.xml`, `res/`, `src/`, `build.sh` / `build.py`
- **SDK tools location**: `$ANDROID_SDK/build-tools/<version>/` + `$ANDROID_SDK/platforms/android-<api>/android.jar`
- **Projects using this**: `CSMWip/05_BOUNCE`, `TGE_E5` (planned)

### Project Map
| Project | Purpose | Status | Build System |
|---------|---------|--------|--------------|
| `CSMWip/05_BOUNCE` | Bounce game/app — primary No-Gradle target | In progress | Custom (javac + aapt2 + d8) |
| `TGE_E5` | Next TGE episode — secondary No-Gradle target | Planned | Same custom system |
| `CSMWip/01_SubAtomic_Prime_Electron_Canonical` | Research canon | Complete | N/A (docs) |
| `CSMWip/10_Prime_Electron_Caldera_Synthesis` | Research synthesis | Complete | N/A (docs) |
| `pieces/` | Fragmented article storage (legacy) | Active | N/A |
| `__Python_Tools/` | Automation scripts | Active | Python |

### Shared Tooling
- `__Python_Tools/` — generation, sanitization, grant drafts, email processing
- `CSMWipScripts/` — resume scripts, heartbeat, verification
- `scripts/` — misc utilities

### Large File Strategy (Replaces Pieces)
**Problem**: Files >10MB cause creation issues; current workaround splits into 13 pieces + zip
**Solution**: 
1. **Streaming writes** — write in chunks via Python script
2. **Compressed artifacts** — store `.gz`/`.zip` in repo, decompress at build time
3. **External storage** — large PDFs/APKs in `RESTART_PACKAGE/` or cloud, reference via manifest
4. **Chunked markdown** — keep logical chapters as separate `.md` files, concat at publish time

### Session Continuity Protocol
- **Root**: `MEMORY.md` + `memory/YYYY-MM-DD.md` + `AGENTS.md` + `TOOLS.md`
- **Per-project**: Each project gets its own `AGENTS.md`, `memory/`, `TODO.md`
- **Resume files**: `NEXT_runner_00X.md` (next steps) + `RESUME_SESSION_<project>.md` (context)

### Key Commands
```bash
# Build APK (template)
./build_apk.sh <project_dir> <output.apk>

# Resume session
cat NEXT_runner_001.md && cat RESUME_SESSION_BOUNCE.md

# Heartbeat check
./CSMWipScripts/heartbeat.sh
```

### Decisions Log
- **2026-10-14**: Adopted workspace-level structure; retiring pieces approach for large files
- **2026-10-14**: Standardized on custom No-Gradle build for CSMWip/05_BOUNCE and TGE_E5
- **2026-10-14**: Created NEXT_runner_001 / RESUME_SESSION pattern for session continuity