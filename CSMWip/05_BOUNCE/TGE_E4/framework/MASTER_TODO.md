# TGE_E2 MASTER TODO — Prime Electron Worldline Emulator v2
**Project:** TGE E2 (TGAPP Evolution Version E2)  
**Branch:** `kilo/prime-voxel-vx8`  
**Working Directory:** `CSMWip/05_BOUNCE/TGE_E2/`  
**Last Updated:** 2026-10-11  
**Target:** Single Electron Walking Worldline → Reflections in Eggshell Geometry with Prime Gap Universe + Fleet + Explorer + History + Analysis

---

## OVERVIEW: 39-PIECE PIPELINE (27 Java + 12 HTML)
| Component | Pieces | Status | Description |
|-----------|--------|--------|-------------|
| MainActivity.java | 27 | ✅ | PrimeEngine + WorldlineRenderer + Menu + Sensors + Fleet |
| tge_e2.html | 12 | ✅ | Canvas Renderer + Eggshell + Electron + Prime Gaps + Explorer + History + Analysis |
| **TOTAL** | **39** | ✅ | **Complete 39-piece pipeline** |

---

## PIECE 1: PROJECT FOUNDATION (HTML Piece 1)
- [x] HTML structure: DOCTYPE, head, meta, title
- [x] CSS: Complete styling for canvas, HUD panels, menu overlays
- [x] Modal structures: Prime Explorer, Worldline History, Gap Analysis
- [x] Fleet indicator element
- [x] Canvas element

---

## PIECE 2: TGE CORE INITIALIZATION (HTML Piece 2)
- [x] TGE namespace declaration
- [x] Core state: electron, electrons (fleet), worldline, reflections, steps
- [x] Eggshell geometry object
- [x] Prime gaps array and tracking
- [x] Theory mode, fleet mode, menu visibility
- [x] Prime Explorer, Worldline History, Gap Analysis state objects
- [x] init(), resize(), setupEggshell(), setInsets()

---

## PIECE 3: ANIMATION LOOP + STEP + REFLECTION PHYSICS (HTML Piece 3)
- [x] startLoop() with requestAnimationFrame
- [x] step() - updates all fleet electrons
- [x] handleReflection() - elastic reflection with 1% damping
- [x] Worldline trail recording (2000 points max)
- [x] TGEBridge events for reflections

---

## PIECE 4: PRIME GAP CHECKING + HUD UPDATE + FLEET STATS (HTML Piece 4)
- [x] checkPrimeGaps() - radial distance vs prime gap threshold
- [x] updateHUD() - all 4 HUD panels (Worldline, Prime Engine, Fleet, Theory)
- [x] Fleet reflection counting
- [x] Gap index and current gap display

---

## PIECE 5: RENDER PIPELINE + EGGSHELL + WORLDLINE + FLEET TRAILS (HTML Piece 5)
- [x] render() - clear, eggshell, worldline, gap markers, electrons, reflections
- [x] drawEggshell() - elliptical boundary with slow rotation
- [x] drawWorldline() - gradient path from history (main + fleet)
- [x] Fleet worldline trails with hue variation per electron

---

## PIECE 6: PRIME GAP MARKERS + ELECTRON DRAWING + THEORY VECTORS (HTML Piece 6)
- [x] drawPrimeGapMarkers() - concentric ellipses for crossed gaps
- [x] drawElectrons() - glow + core for each electron
- [x] Theory mode: velocity vector arrow on main electron
- [x] Hue-coded electrons for fleet (prime-seeded colors)

---

## PIECE 7: REFLECTION CIRCLES + THEORY: RIEMANN ZEROS + PRIME DENSITY (HTML Piece 7)
- [x] drawReflectionCircles() - expanding rings at recent reflections
- [x] drawRiemannZeros() - critical line Re(s)=1/2 + first 10 zeros
- [x] drawPrimeDensity() - radial density visualization (x/log x)

---

## PIECE 8: SCAN + MENU + THEORY + FLEET INIT/TOGGLE (HTML Piece 8)
- [x] onScanPressed() - random velocity kick (fleet: distributed)
- [x] toggleMenu(), resume(), toggleTheory(), setTheoryMode()
- [x] initFleet() - main electron with prime seed 2
- [x] toggleFleet() - adds 7 electrons (primes 3,5,7,11,13,17,19)

---

## PIECE 9: PRIME EXPLORER MODULE (HTML Piece 9)
- [x] Interactive gap browser with zoom/pan
- [x] Vertical bar visualization of all prime gaps
- [x] Twin prime (gap=2) highlighting in red
- [x] Gap selection with detail panel
- [x] Zoom in/out, pan left/right, reset view

---

## PIECE 10: WORLDLINE HISTORY MODULE (HTML Piece 10)
- [x] Time scrubber for electron journey playback
- [x] Full worldline faint + bright segment to current scrub position
- [x] Play/pause with variable speed
- [x] Current position marker with coordinates and step number
- [x] Eggshell reference for context

---

## PIECE 11: GAP ANALYSIS MODULE (HTML Piece 11)
- [x] Histogram of prime gap distribution
- [x] Log/linear scale toggle
- [x] Twin prime highlighting
- [x] Cramér's conjecture (log² p) reference curve
- [x] Statistics: mean, max, twin count, twin ratio

---

## PIECE 12: MODAL CONTROLS + MOTION SENSORS + RESET (HTML Piece 12)
- [x] show/hide for all 3 modals
- [x] resetSimulation() - clears worldline, resets all electrons
- [x] updateMotion() - accelerometer + gyroscope → electron velocity
- [x] Fleet mode sensor distribution

---

## PIECE 13: JAVA FOUNDATION (MainActivity Piece 1)
- [x] Package declaration + imports
- [x] MainActivity class + SensorEventListener
- [x] InsetFrameLayout for system insets
- [x] Static WebView reference for JS injection

---

## PIECE 14: CLASS DECLARATION + FIELDS (MainActivity Piece 2)
- [x] Class declaration with all fields
- [x] WebView, header, controlBar, buttons
- [x] State flags: cleanMode, theoryMode, menuVisible
- [x] SensorManager, sensors, Handler

---

## PIECE 15: INSETFRAMELAYOUT + STATIC REFS (MainActivity Piece 3)
- [x] InsetFrameLayout inner class
- [x] Static WebView reference
- [x] Static injectJsStatic method

---

## PIECE 16: ONCREATE + SETUPFULLSCREEN (MainActivity Piece 4)
- [x] onCreate: fullscreen, root layout, WebView, header, controlBar
- [x] setupFullscreen() with immersive sticky flags
- [x] SharedPreferences initialization
- [x] PrimeEngine + WorldlineRenderer initialization

---

## PIECE 17: BUILDWEBVIEW PART 1 (MainActivity Piece 5)
- [x] WebView creation with hardware acceleration
- [x] WebSettings: JS enabled, DOM storage, file access
- [x] WebChromeClient setup

---

## PIECE 18: BUILDWEBVIEW PART 2 + WEBVIEWCLIENT (MainActivity Piece 6)
- [x] WebViewClient with onPageFinished
- [x] JavaScript injection: TGEBridge, PrimeEngine, WorldlineRenderer
- [x] Load tge_e2.html from assets
- [x] addJavascriptInterface for TGEBridge

---

## PIECE 19: BUILDHEADER (MainActivity Piece 7)
- [x] Header layout with TGE E2 logo
- [x] Version tag and subtitle
- [x] Semi-transparent background

---

## PIECE 20: BUILDCONTROLBAR PART 1 (MainActivity Piece 8)
- [x] Control bar layout at bottom
- [x] LinearLayout row with 5 buttons
- [x] SCAN, MENU, THEORY, FLEET, CLEAN

---

## PIECE 21: BUILDCONTROLBAR PART 2 + BUTTONS (MainActivity Piece 9)
- [x] Button creation with mkBtn helper
- [x] Click listeners for each button
- [x] Prime-themed colors

---

## PIECE 22: MKBUTTON + TOGGLEMENU (MainActivity Piece 10)
- [x] mkBtn() helper method
- [x] toggleMenu() with menuVisible state
- [x] JavaScript bridge for menu toggle

---

## PIECE 23: TOGGLETHEORY + INJECTJS + DP (MainActivity Piece 11)
- [x] toggleTheory() with theoryMode state
- [x] injectJs() wrapper with error logging
- [x] dp() helper for density-independent pixels

---

## PIECE 24: RESTORESTATE + SAVESTATE (MainActivity Piece 12)
- [x] restoreState() from SharedPreferences
- [x] saveState() to SharedPreferences
- [x] cleanMode and theoryMode persistence

---

## PIECE 25: INITIALIZEPRIMEENGINE (MainActivity Piece 13)
- [x] Thread-based async PrimeEngine initialization
- [x] UI thread callback with prime count

---

## PIECE 26: STARTWORLDLINESIMULATION + ONSENSORCHANGED (MainActivity Piece 14)
- [x] Handler.postDelayed 16ms simulation loop
- [x] onSensorChanged for accelerometer + gyroscope
- [x] JavaScript bridge for motion updates

---

## PIECE 27: ONACCURACYCHANGED + ONRESUME (MainActivity Piece 15)
- [x] onAccuracyChanged (empty)
- [x] onResume with sensor registration
- [x] SENSOR_DELAY_GAME for responsiveness

---

## PIECE 28: ONPAUSE + ONDESTROY + ONBACKPRESSED (MainActivity Piece 16)
- [x] onPause with sensor unregistration
- [x] onDestroy with handler cleanup
- [x] onBackPressed: menu → webView back → exit

---

## PIECE 29: JSBRIDGE PART 1 (MainActivity Piece 17)
- [x] JsBridge inner class
- [x] onReady: toast notification
- [x] updateHeaderText: dynamic header updates

---

## PIECE 30: JSBRIDGE PART 2 (MainActivity Piece 18)
- [x] setTheoryMode: theory/live mode sync
- [x] onWorldlineReflection: log reflection events
- [x] onPrimeGapEvent: log prime gap crossings

---

## PIECE 31: PRIMEENGINE FIELDS + INITIALIZE (MainActivity Piece 19)
- [x] PrimeEngine singleton with static fields
- [x] initialize() with 4-tile support (Tile00-Tile03)
- [x] Binary prime parsing (4 bytes per prime, big-endian)

---

## PIECE 32: PRIMEENGINE READALLBYTES + PARSEPRIMECOUNT (MainActivity Piece 20)
- [x] readAllBytes() for asset reading
- [x] parsePrimeCount() - tile length / 4

---

## PIECE 33: PRIMEENGINE COMPUTEPRIMEGAPS (MainActivity Piece 21)
- [x] computePrimeGaps() from consecutive primes
- [x] Big-endian byte parsing

---

## PIECE 34: PRIMEENGINE GENERATESYNTHETICPRIMES (MainActivity Piece 22)
- [x] Sieve of Eratosthenes fallback
- [x] Up to 1M primes synthetic generation

---

## PIECE 35: PRIMEENGINE SIEVEOFERATOSTHENES (MainActivity Piece 23)
- [x] Efficient sieve implementation
- [x] Boolean array for prime marking

---

## PIECE 36: PRIMEENGINE GETPRIMECOUNT + GETPRIMEGAPS (MainActivity Piece 24)
- [x] getPrimeCount() accessor
- [x] getPrimeGaps() accessor

---

## PIECE 37: PRIMEENGINE GETPRIMETILEDATA (MainActivity Piece 25)
- [x] getPrimeTileData() for JavaScript injection
- [x] JSON array format for JS consumption

---

## PIECE 38: CLOSING BRACES (MainActivity Piece 26)
- [x] PrimeEngine class closing
- [x] MainActivity class closing

---

## PIECE 39: FINAL CLOSING (MainActivity Piece 27)
- [x] Final package closing
- [x] End of file

---

## PRIME ELECTRON WORLDLINE v2 SPECIFICATIONS

### Electron Behavior (Enhanced from E1)
- Single primary particle at eggshell center (prime seed 2)
- Fleet mode: 7 additional electrons (prime seeds 3,5,7,11,13,17,19)
- Each electron: unique hue, independent physics, shared eggshell
- Initial velocity: (0, 0) - activated by SCAN or sensor input
- Walks worldline: position += velocity each frame
- Reflects off eggshell boundary: perfect elastic reflection with 1% energy loss
- Leaves persistent worldline trail (2000 points main, 1000 fleet, gradient fade)

### Eggshell Geometry
- Elliptical boundary: rx = min(w,h)/2 - 40, ry = rx * 0.75
- Centered on screen
- Slow continuous rotation (0.0001 rad/frame)
- Semi-transparent stroke (#4488FF, 30% opacity)

### Prime Gap Universe (Expanded)
- Prime gaps from PrimeBookOne tiles (up to 4 tiles = ~1M primes)
- Each prime gap = elliptical ring at radius proportional to gap size
- Electron crossing gap threshold → increments gap index
- Visual: orange rings (#F97316), current gap highlighted
- Events sent to Android via TGEBridge.onPrimeGapEvent()

### Prime Explorer (NEW)
- Fullscreen modal with interactive gap browser
- Vertical bar chart of all gaps, zoom/pan capable
- Twin prime (gap=2) highlighting in red
- Selection shows gap index, value, prime number
- Keyboard/mouse/touch navigation

### Worldline History (NEW)
- Fullscreen modal with time scrubber
- Full worldline drawn faint, bright segment to current scrub position
- Play/pause with variable speed
- Current position marker with coordinates and step number
- Eggshell reference for context

### Gap Analysis (NEW)
- Fullscreen modal with histogram of gap distribution
- Log/linear scale toggle
- Twin prime highlighting
- Cramér's conjecture (log² p) reference curve
- Statistics: mean, max, twin count, twin ratio

### Landolil Menu Integration (Enhanced)
- Fullscreen modal overlay (not Android dialog)
- 7 buttons: RESUME, THEORY MODE, PRIME EXPLORER, WORLDLINE HISTORY, GAP ANALYSIS, TOGGLE FLEET, RESET
- Primary/secondary/tertiary/danger button variants
- Theory mode toggles simulation physics vs visualization
- Fleet mode toggle adds/removes 7 electrons
- Back button closes menu first

### Sensor Integration
- Accelerometer + Gyroscope → motion input
- Motion applies force to main electron (fleet: distributed)
- JavaScript receives: updateMotion(ax,ay,az,gx,gy,gz)
- WorldlineRenderer updates electron velocity from sensors

---

## TARGETS
- **APK**: < 4MB debug, < 3MB release
- **FPS**: 60fps on 7+ year old devices
- **Memory**: < 80MB heap
- **Primes**: 1M+ from 4 tiles (Tile00-Tile03)
- **Gaps**: 1M+ gap markers
- **Pieces**: 39 total (27 Java + 12 HTML)

---

## NEXT STEPS (Post E2)
1. **Prime Tile 02/03 Integration**: Add Tile02.prime, Tile03.prime to assets
2. **Release Build**: ProGuard/R8 optimization with config
3. **Zenodo Deposit**: Prime electron research data + APK
4. **Multi-Device Testing**: API 24-34 device matrix
5. **Performance Profiling**: Systrace/Perfetto on low-end devices
6. **TGE E3 Planning**: Multi-electron entanglement, quantum visualization

---

*Generated: 2026-10-11 | TGE E2 v2.0.0-E2 | 39-Piece Pipeline Complete | One Electron Walking Worldline*