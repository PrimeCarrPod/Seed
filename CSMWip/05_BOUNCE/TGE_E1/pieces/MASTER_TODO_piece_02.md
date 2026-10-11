## PIECE 1: PROJECT FOUNDATION
- [x] Create TGE_E1 directory structure at CSMWip/05_BOUNCE/TGE_E1
- [x] Android Gradle project setup (build.gradle.kts, settings.gradle.kts, gradle.properties)
- [x] Gradle wrapper 8.5
- [x] AndroidManifest.xml with fullscreen immersive mode
- [x] TGEApplication.kt application class
- [x] Resource files: strings.xml, themes.xml, colors.xml, network_security_config.xml
- [x] App icons: adaptive icon with prime teal theme

---

## PIECE 2: MAIN ACTIVITY CORE (MainActivity.kt pieces 1-3)
- [x] Package declaration and imports
- [x] MainActivity class with Activity + SensorEventListener
- [x] InsetFrameLayout for system insets handling
- [x] onCreate: fullscreen setup, root layout, webView, header, controlBar
- [x] SharedPreferences for state persistence (cleanMode, theoryMode)
- [x] setupFullscreen() with immersive sticky flags
