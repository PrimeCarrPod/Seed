# TODO.md — CSMWip/05_BOUNCE

## Milestone 1: Scaffold Build System
- [ ] Create `build.py` with full No-Gradle build pipeline
- [ ] Create `AndroidManifest.xml` with package `com.csmlabs.bounce`
- [ ] Create `res/values/strings.xml` with app_name="Bounce"
- [ ] Create `res/values/colors.xml` with primary/secondary colors
- [ ] Create `res/layout/activity_main.xml` with basic layout
- [ ] Create `src/com/csmlabs/bounce/MainActivity.java` minimal activity
- [ ] Generate `debug.keystore` if missing
- [ ] Test build: `./build.py` → `bounce.apk`
- [ ] Test install: `adb install -r bounce.apk`

## Milestone 2: Core Game/App Logic
- [ ] Implement bounce physics/rendering (SurfaceView or custom View)
- [ ] Add touch/input handling
- [ ] Add game loop (fixed timestep)
- [ ] Add score/state persistence (SharedPreferences)

## Milestone 3: Polish & Release
- [ ] Add app icon (res/mipmap-*/ic_launcher.png)
- [ ] Add splash screen / theme
- [ ] Optimize APK size (ProGuard/R8 not available — manual shrinking)
- [ ] Create release keystore + signing flow
- [ ] Test on API 21-34 (emulators)

## Milestone 4: TGE_E5 Integration
- [ ] Extract build system to shared `__Python_Tools/build_apk.py`
- [ ] Document build API for TGE_E5 consumption
- [ ] Create TGE_E5 project scaffold using shared build

## Backlog
- [ ] Add native library support (JNI) if needed
- [ ] Add multi-dex support for >64K methods
- [ ] CI/CD: GitHub Actions with Android SDK

## Done
- [x] Project structure created
- [x] AGENTS.md created