# AGENTS.md — TGE_E5 (The Grid Episode 5)

## Project: TGE Episode 5 Android App
**Type**: Android app — same No-Gradle build system as 05_BOUNCE
**Package**: `com.csmlabs.tge.e5`
**Target API**: 34
**Min API**: 21

## Project Structure
```
TGE_E5/
├── AGENTS.md           # This file
├── memory/             # Daily notes
├── TODO.md             # Task list
├── build.py            # Shared from __Python_Tools/build_apk.py
├── build.sh            # Wrapper
├── src/                # Java source
├── res/                # Android resources
├── AndroidManifest.xml # App manifest
├── debug.keystore      # Shared debug key (symlink to 05_BOUNCE)
├── NEXT_runner_001.md  # Next session instructions
└── RESUME_SESSION_TGE_E5.md  # Resume context
```

## Build System
**Uses shared build from `__Python_Tools/build_apk.py`**:
```bash
python3 ../../__Python_Tools/build_apk.py \
    --project . \
    --package com.csmlabs.tge.e5 \
    --output tge_e5.apk
```

## Dependencies
- **05_BOUNCE build system** — same tools, same flow
- **Shared keystore** — symlink to `../../05_BOUNCE/debug.keystore`

## Episode 5 Specifics
- **Theme**: Continuation of TGE narrative
- **Content**: Interactive story/visualization
- **Assets**: May include larger media (handle via RESTART_PACKAGE/)

## Session Resume
```bash
cd CSMWip/11_TGApp/TGE_E5
cat NEXT_runner_001.md
cat RESUME_SESSION_TGE_E5.md
git status
python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5
```