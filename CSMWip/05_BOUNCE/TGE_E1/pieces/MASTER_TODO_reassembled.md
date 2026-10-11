# TGE_E1 MASTER TODO — Prime Electron Worldline Emulator
**Project:** TGE E1 (TGAPP Evolution Version E1)  
**Branch:** `kilo/tge-e1-wip`  
**Working Directory:** `CSMWip/05_BOUNCE/TGE_E1/`  
**Last Updated:** 2026-10-11  
**Target:** Single Electron Walking Worldline → Reflections in Eggshell Geometry with Prime Gap Universe

---

## OVERVIEW: 27-PIECE PIPELINE (13+14)
| Component | Pieces | Status | Description |
|-----------|--------|--------|-------------|
| MainActivity.kt | 13 | ✅ | PrimeEngine + WorldlineRenderer + Menu + Sensors |
| tge_e1.html | 14 | ✅ | Canvas Renderer + Eggshell + Electron + Prime Gaps |
| **TOTAL** | **27** | ✅ | **Complete 27-piece pipeline** |

---

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
- [x] buildWebView() with hardware acceleration, JS enabled, file access
- [x] WebViewClient with onPageFinished → inject PrimeEngine + WorldlineRenderer
- [x] JavaScript interface: TGEBridge

---

## PIECE 3: UI COMPONENTS (MainActivity.kt pieces 4-6)
- [x] buildHeader(): TGE E1 logo, version tag, prime electron worldline subtitle
- [x] buildControlBar(): 6 buttons (SCAN, MENU, THEORY, FLEET, CLEAN)
- [x] mkBtn() helper for consistent button styling
- [x] Header overlay with semi-transparent background
- [x] Control bar at bottom with prime-themed colors
- [x] Button click handlers: toggleMenu, toggleTheory, cleanMode
- [x] injectJs() wrapper with error logging

---

## PIECE 4: MENU SYSTEM (MainActivity.kt pieces 7-8)
- [x] Landolil-inspired menu overlay (fullscreen modal)
- [x] menuVisible state management
- [x] Menu buttons: RESUME, THEORY MODE, PRIME EXPLORER, WORLDLINE HISTORY, GAP ANALYSIS, RESET
- [x] Button styling: primary, secondary, danger variants
- [x] JavaScript bridge: toggleMenu(visible), setTheoryMode(enabled)
- [x] Back button handling: closes menu first, then webView back, then exit

---

## PIECE 5: PRIME ENGINE (MainActivity.kt pieces 9-10)
- [x] PrimeEngine singleton object
- [x] Load Tile00.prime and Tile01.prime from assets
- [x] Parse prime count from binary tile data (4 bytes per prime)
- [x] Compute prime gaps from consecutive primes
- [x] Synthetic prime generation fallback (Sieve of Eratosthenes)
- [x] getPrimeTileData() for JavaScript injection
- [x] CoroutineScope(Dispatchers.IO) for async initialization
- [x] Prime count display in header

---

## PIECE 6: WORLDLINE SIMULATION (MainActivity.kt pieces 11-12)
- [x] Electron physics: position, velocity, radius
- [x] Eggshell geometry: elliptical boundary (cx, cy, rx, ry, rotation)
- [x] Reflection physics: normal calculation, velocity reflection, energy damping
- [x] Worldline path history (2000 points max)
- [x] Prime gap crossing detection via distance from center
- [x] Sensor integration: accelerometer + gyroscope → motion input
- [x] 60fps simulation loop (16ms step via Handler)

---

## PIECE 7: JAVASCRIPT BRIDGE (MainActivity.kt piece 13)
- [x] JsBridge inner class with @JavascriptInterface methods
- [x] onReady: toast notification
- [x] updateHeaderText: dynamic header updates
- [x] setTheoryMode: theory/live mode sync
- [x] onWorldlineReflection: log reflection events
- [x] onPrimeGapEvent: log prime gap crossings
- [x] Lifecycle: onResume/onPause sensor registration, onDestroy cleanup

---

## PIECE 8: HTML RENDERER CORE (tge_e1.html pieces 14-18)
- [x] Canvas setup: fullscreen, high-DPI, requestAnimationFrame loop
- [x] TGE namespace: init, resize, setInsets, startLoop
- [x] Electron object: x, y, vx, vy, radius
- [x] Worldline array: path history with timestamps
- [x] Eggshell object: elliptical boundary with slow rotation
- [x] Prime gaps array and index tracking
- [x] Theory mode toggle
- [x] HUD panels: position, velocity, reflections, gaps, steps, mode

---

## PIECE 9: PHYSICS ENGINE (tge_e1.html pieces 19-23)
- [x] step(): position update, eggshell collision detection
- [x] handleReflection(): normal calculation, velocity reflection, 0.99 damping
- [x] checkPrimeGaps(): radial distance vs prime gap threshold
- [x] updateHUD(): real-time stats display
- [x] Prime gap events via TGEBridge
- [x] Worldline reflection events via TGEBridge
- [x] onScanPressed(): random velocity kick

---

## PIECE 10: RENDERING PIPELINE (tge_e1.html pieces 24-28)
- [x] render(): clear, drawEggshell, drawWorldline, drawPrimeGapMarkers, drawElectron, drawReflectionCircles
- [x] drawEggshell(): elliptical stroke with rotation animation
- [x] drawWorldline(): gradient path from history (transparent → prime teal)
- [x] drawPrimeGapMarkers(): concentric ellipses for each crossed gap
- [x] drawElectron(): radial glow + core particle
- [x] drawReflectionCircles(): expanding rings at recent reflection points
- [x] Color scheme: prime teal (#00D4AA), prime orange (#FF6600), gap orange (#F97316), electron cyan (#00FFFF)

---

## PIECE 11: MENU OVERLAY (tge_e1.html pieces 29-32)
- [x] Fullscreen modal overlay with flexbox centering
- [x] Menu title: "TGE E1 MENU" with subtitle
- [x] 7 menu buttons with onclick handlers
- [x] Button variants: primary (RESUME), secondary (explorers), danger (RESET)
- [x] CSS hover/focus states with color transitions
- [x] toggleMenu() visibility management
- [x] Placeholder alerts for future features

---

## PIECE 12: PRIME BOOK ONE INTEGRATION
- [x] Copy Tile00.prime (1MB) and Tile01.prime (1MB) to assets
- [x] PrimeEngine loads both tiles on initialization
- [x] Prime count: ~500K primes total from 2 tiles
- [x] Prime gaps computed and used for gap markers
- [x] Prime gap universe drives eggshell concentric markers
- [x] Electron crosses prime gaps → triggers events
- [x] Fallback synthetic primes if tiles missing

---

## PIECE 13: BUILD & VERIFICATION PIPELINE
- [x] build.sh: Gradle debug APK build with logging
- [x] framework/heartbeat.sh: Session logging with prime engine status
- [x] framework/verify_reassembly.sh: 27-piece diff verification
- [x] framework/verify_github_17ways.sh: GitHub verification for pieces
- [x] framework/process_document.sh: Complete pipeline orchestration
- [x] ALL_PIECES_manifest.json: 27-piece manifest
- [x] TGE_E1_all_pieces.zip: Combined archive
- [x] APK output to apk/ directory

---

## PRIME ELECTRON WORLDLINE SPECIFICATIONS

### Electron Behavior
- Single particle emitted at eggshell center
- Initial velocity: (0, 0) - activated by SCAN or sensor input
- Walks worldline: position += velocity each frame
- Reflects off eggshell boundary: perfect elastic reflection with 1% energy loss
- Leaves persistent worldline trail (2000 points, gradient fade)

### Eggshell Geometry
- Elliptical boundary: rx = min(w,h)/2 - 40, ry = rx * 0.75
- Centered on screen
- Slow continuous rotation (0.0001 rad/frame)
- Semi-transparent stroke (#4488FF, 30% opacity)

### Prime Gap Universe
- Prime gaps from PrimeBookOne tiles drive concentric markers
- Each prime gap = elliptical ring at radius proportional to gap size
- Electron crossing gap threshold → increments gap index
- Visual: orange rings (#F97316), current gap highlighted
- Events sent to Android via TGEBridge.onPrimeGapEvent()

### Landolil Menu Integration
- Fullscreen modal overlay (not Android dialog)
- 7 buttons: RESUME, THEORY MODE, PRIME EXPLORER, WORLDLINE HISTORY, GAP ANALYSIS, RESET
- Primary/secondary/danger button variants
- Theory mode toggles simulation physics vs visualization
- Back button closes menu first

### Sensor Integration
- Accelerometer + Gyroscope → motion input
- motionActive toggle enables sensor listeners
- JavaScript receives: updateMotion(ax,ay,az,gx,gy,gz)
- WorldlineRenderer updates electron velocity from sensors

---

## TARGETS
- **APK**: < 5MB debug, < 3MB release
- **FPS**: 60fps on 5+ year old devices
- **Memory**: < 100MB heap
- **Primes**: 500K+ from 2 tiles
- **Gaps**: 500K+ gap markers
- **Pieces**: 27 total (13+14)

---

## NEXT STEPS (Post E1)
1. Prime Explorer visualization (interactive gap browser)
2. Worldline History playback (time scrubber)
3. Gap Analysis: statistical distribution, twin primes, conjectures
4. Fleet mode: multiple electrons with different prime seeds
5. Theory mode: mathematical visualization overlays
6. Release build with ProGuard/R8 optimization
7. Zenodo deposit with prime electron research data

---

*Generated: 2026-10-11 | TGE E1 Prime Electron Worldline | 27-Piece Pipeline Complete*