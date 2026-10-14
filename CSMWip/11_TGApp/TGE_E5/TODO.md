# TODO.md — TGE_E5

## Milestone 1: Scaffold (Reuse 05_BOUNCE Build)
- [ ] Symlink `debug.keystore` from 05_BOUNCE
- [ ] Create `AndroidManifest.xml` with package `com.csmlabs.tge.e5`
- [ ] Create `res/values/strings.xml` with app_name="TGE Episode 5"
- [ ] Create `res/values/colors.xml` with TGE theme colors
- [ ] Create `res/layout/activity_main.xml` for episode content
- [ ] Create `src/com/csmlabs/tge/e5/MainActivity.java` minimal activity
- [ ] Test shared build: `python3 ../../__Python_Tools/build_apk.py --project . --package com.csmlabs.tge.e5`
- [ ] Verify APK installs and runs

## Milestone 2: Episode 5 Content
- [ ] Implement episode narrative/visualization
- [ ] Add assets (images, audio) — store large in `RESTART_PACKAGE/`
- [ ] Implement navigation between scenes
- [ ] Add save/restore progress

## Milestone 3: Polish
- [ ] App icon (TGE branding)
- [ ] Splash screen
- [ ] Performance optimization
- [ ] Test on API 21-34

## Backlog
- [ ] Extract build to shared module when stable
- [ ] CI/CD pipeline

## Done
- [x] Project structure created
- [x] AGENTS.md created