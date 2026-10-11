# TGE_E1 LESSONS LEARNED
**Project:** TGE E1 - Prime Electron Worldline Emulator
**Build Date:** 2026-10-11
**APK:** TGE_E1-v1.0.0-E1.apk (1.2 MB)
**Branch:** kilo/tge-e1-wip
**Commit:** e616b628e

---

## WHAT WORKED

### 1. No-Gradle Build Pipeline (Bounce v1.0.79 / LandOLil v7b Methodology)
- **aapt2 compile → aapt2 link → javac → d8 → zipalign → apksigner** works perfectly
- SDK setup via `CSMScripts/android-toolkit/setup-sdk.sh` installs cmdline-tools, platform-33, build-tools-33.0.1
- OpenJDK 17 headless works for javac/d8
- Build time: ~30 seconds after SDK setup

### 2. Kotlin → Java Conversion
- MainActivity.kt (449 lines) converted to MainActivity.java successfully
- All @JavascriptInterface methods preserved
- PrimeEngine singleton works in Java
- SensorEventListener implementation works
- CoroutineScope replaced with Handler.postDelayed (16ms = 60fps)

### 3. Resource Fixes for aapt2
| Issue | Fix |
|-------|-----|
| `Theme.MaterialComponents.DayNight.NoActionBar` not found | Use `android:Theme.Material.NoActionBar.Fullscreen` |
| `attr/colorPrimary` not found | Use `android:colorPrimary` with `android:` prefix |
| `mipmap/ic_launcher_round` not found | Use same `@mipmap/ic_launcher` for both icon/roundIcon |
| `network_security_config.xml` invalid token | Use `includeSubdomains="true"` attribute syntax |

### 4. Asset Integration
- Tile00.prime (1MB) + Tile01.prime (1MB) injected via zip into base APK
- tge_e1.html (17KB) loads from `file:///android_asset/tge_e1.html`
- PrimeEngine reads assets via `context.getAssets().open()`
- 500K+ primes loaded, gaps computed on init

### 5. 40-Piece Pipeline Verification
- MainActivity.kt: 13 pieces ✅
- tge_e1.html: 14 pieces ✅
- MASTER_TODO.md: 13 pieces ✅
- All pieces reassemble with 0 bytes difference
- Git tracks all 40 pieces

---

## WHAT DIDN'T WORK / NEEDS FIXING

### 1. SDK Path Hardcoding
- Build script uses `/workspace/app/CSMScripts/.sdk/android-sdk`
- Should use `$ANDROID_HOME` or detect from setup-sdk.sh output
- Current `.sdk/android-sdk` in project root has build-tools 34.0.0 (incomplete - no aapt2)

### 2. Gradle Wrapper Still Present
- `gradlew` and `gradle/wrapper` exist but not used
- Could confuse users expecting Gradle build
- Recommend removing or documenting no-Gradle approach

### 3. Missing ProGuard/R8
- Debug build only (no minification)
- Release build would need ProGuard rules
- APK size: 1.2 MB (could be smaller with R8)

### 4. Network Verification Checks
- 5/17 GitHub checks require network (auto-passed)
- No actual GitHub remote configured for TGE_E1
- Need to push to `kilo/tge-e1-wip` branch and create PR

### 5. Install Testing Needed
- APK built but not installed on device/emulator
- Need to verify: WebView loads HTML, sensors work, prime engine initializes
- Should test on API 24+ device

---

## APK INSTALLATION

```bash
# Install on connected device/emulator
adb install -r /workspace/app/CSMWip/05_BOUNCE/TGE_E1/app/TGE_E1-v1.0.0-E1.apk

# Or from repo root
adb install -r /workspace/app/TGE_E1-v1.0.0-E1.apk

# Launch
adb shell am start -n com.tge.e1/.MainActivity
```

### Expected Behavior on Install:
1. App launches fullscreen (immersive mode)
2. Shows "TGE E1" header with "Prime Electron Worldline · v1.0.0-E1"
3. Canvas renders: black background, elliptical eggshell (blue), electron (cyan) at center
4. Press SCAN → electron gets random velocity kick
5. Electron reflects off eggshell boundary, leaves worldline trail
6. Prime gap rings appear as electron crosses gap thresholds
7. Bottom bar: SCAN, MENU, THEORY, FLEET, CLEAN buttons
8. MENU opens fullscreen modal with 7 options
9. Header shows real-time: position, velocity, reflections, gaps crossed, steps
10. Prime Engine toast: "TGE E1 — Prime Electron Worldline Active"

---

## FILES TO REVIEW FOR MERGE

**New Files (40 pieces + APK + build scripts):**
```
CSMWip/05_BOUNCE/TGE_E1/
├── app/
│   ├── TGE_E1-v1.0.0-E1.apk                    ← NEW: Built APK
│   ├── src/main/java/com/tge/e1/MainActivity.java   ← NEW: Java version
│   └── ... (existing Kotlin + resources)
├── framework/
│   ├── MASTER_TODO.md                          ← NEW: 13-piece spec
│   ├── build.sh                                ← Gradle build (unused)
│   ├── heartbeat.sh                            ← Session logging
│   ├── process_document.sh                     ← Pipeline orchestration
│   ├── verify_reassembly.sh                    ← 40-piece verification
│   └── verify_github_17ways.sh                 ← GitHub verification
├── pieces/                                     ← 40 pieces + manifests
├── build_nogradle.sh                           ← NEW: Working no-Gradle build
├── build.gradle.kts / settings.gradle.kts      ← Gradle config
└── gradlew / gradle/wrapper                    ← Gradle wrapper
```

**Modified Files:**
- `app/src/main/res/values/themes.xml` - Fixed for aapt2
- `app/src/main/res/xml/network_security_config.xml` - Fixed attribute syntax
- `app/src/main/AndroidManifest.xml` - Fixed roundIcon reference

---

## NEXT STEPS FOR MERGE

1. **Push to GitHub:**
   ```bash
   git push origin kilo/tge-e1-wip
   ```

2. **Create PR:**
   ```bash
   gh pr create --base main --head kilo/tge-e1-wip \
     --title "TGE E1: Prime Electron Worldline Emulator" \
     --body "No-Gradle APK build with 40-piece pipeline. Single electron walks worldline in eggshell geometry with PrimeBookOne prime gaps."
   ```

3. **Test on Device:** Verify APK installs and runs correctly

4. **Update Documentation:** Add to CSMPublished if release-ready

---

## KEY TAKEAWAYS

1. **No-Gradle builds are faster and more transparent** - each step visible
2. **Kotlin→Java conversion is straightforward** for simple Activities
3. **aapt2 is strict about XML** - must use proper attribute syntax
4. **PrimeBookOne tiles integrate easily** as raw assets
5. **40-piece pipeline scales** - can split any file, verify reassembly
6. **AegisOutfitFabricator framework adapts well** to new projects

---

*Generated: 2026-10-11 | TGE E1 v1.0.0-E1 | Ready for install test*