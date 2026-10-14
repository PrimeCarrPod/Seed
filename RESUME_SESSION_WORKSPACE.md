# RESUME_SESSION_WORKSPACE.md

## Session Context: Workspace Root (/workspace/app)

### Workspace State
- **Root AGENTS.md**: Updated with project conventions, No-Gradle build, large file strategy
- **Root MEMORY.md**: Cross-project context, decisions, project map
- **Root TOOLS.md**: Build tools, Python scripts, resume scripts documented
- **Root HEARTBEAT.md**: Periodic checks for all projects
- **Root NEXT_runner_001.md**: This file

### Active Projects (Priority)
1. **CSMWip/05_BOUNCE** — No-Gradle APK build (primary)
   - Scaffold complete, needs build verification
   - Resume: `cd CSMWip/05_BOUNCE && cat NEXT_runner_001.md`
2. **CSMWip/11_TGApp/TGE_E5** — Episode 5, same build system
   - Scaffolded, needs manifest/resources
   - Resume: `cd CSMWip/11_TGApp/TGE_E5 && cat NEXT_runner_001.md`
3. **pieces/** — Legacy fragmented storage (13-piece articles)
   - Migration strategy: `__Python_Tools/write_large_file.py`
4. **__Python_Tools/** — Shared automation
   - `build_apk.py` — shared No-Gradle builder
   - `write_large_file.py` — chunked write/compress/split/concat/manifest

### Key Decisions (2026-10-14)
- **No-Gradle Android**: Pure javac + aapt2 + d8 + zipalign + apksigner
- **No AndroidX, No Kotlin** — Java 1.8 + framework classes only
- **Large files**: Replace 13-piece fragmentation with streaming write + gzip + logical chunks + manifest
- **Session continuity**: Root + per-project NEXT_runner_00X + RESUME_SESSION files

### Environment Requirements
```bash
export ANDROID_SDK=/opt/android-sdk
export ANDROID_JAR=$ANDROID_SDK/platforms/android-34/android.jar
export BUILD_TOOLS=$ANDROID_SDK/build-tools/34.0.0
export PATH=$PATH:$BUILD_TOOLS:$ANDROID_SDK/platform-tools
```

### Verification Checklist on Resume
- [ ] `git status` — clean?
- [ ] Android SDK tools present?
- [ ] `CSMWip/05_BOUNCE/build.py build` — works?
- [ ] `CSMWip/11_TGApp/TGE_E5` — shared build works?
- [ ] `memory/YYYY-MM-DD.md` — today's log exists?

---

**Resume Command**:
```bash
cd /workspace/app
cat NEXT_runner_001.md
cat RESUME_SESSION_WORKSPACE.md
git status
```