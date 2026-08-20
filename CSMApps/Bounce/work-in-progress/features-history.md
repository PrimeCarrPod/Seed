# Bounce — Features History

Complete feature log from v1.0.0 through present day.

---

## v1.0.0 — TAF/DMV Vehicle Mesh Network
- Initial Android WebView app foundation
- Three.js 3D scene with OrbitControls
- Basic SSID scanner using Android WifiManager
- P2P broadcast via Wi-Fi Direct Bonjour
- Tab-based HUD UI (left/right/update panels)
- Floating window service for overlay mode

## v1.0.1
- SSID broadcast toggle button

## v1.0.2
- Live SSID scanner with dynamic updates
- Static RF cloud visualization
- Dynamic broadcast (changing SSID codes)
- Fixed 3D render + button layouts

## v1.0.3
- Real Android Wi-Fi scanning via WifiManager
- Runtime permission handling (ACCESS_FINE_LOCATION, etc.)
- Restored working 3D + menus after refactor

## v1.0.4
- GPS tracking integration
- Status bar fix for immersive mode
- Tab-tuck responsive behavior
- Fixed `.pointer-events-auto` CSS utility class

## v1.0.5
- Real SSID broadcast via Wi-Fi Direct Bonjour
- Custom SSID name support via WifiP2pConfig.Builder

## v1.0.6
- Momentum-based camera movement
- Scan pulse animation
- Proximity-based highlighting
- P2P device name display

## v1.0.7
- Vertical tab labels without rotation
- Fixed tab rendering on portrait phone

## v1.0.8
- POV (point-of-view) mode
- Persistent SSID nodes in 3D scene

## v1.0.9
- Infinite FLY tour of real SSIDs
- P2P discoverable fix

## v1.0.10
- Fly-only feature on v1.0.8 base

## v1.0.11
- Spring physics fly with billiard-ball bounce

## v1.0.12
- Fly speed control (+/− buttons)

## v1.0.13
- Broadcast via Wi-Fi Direct Group Owner (visible SSID)

## v1.0.14
- Custom Wi-Fi Direct SSID name

## v1.0.15
- WifiP2pConfig.Builder for custom SSID (from research)

## v1.0.16
- Removed double-TA prefix
- Added SSID cycling

## v1.0.17
- Crash-proof SSID transition
- Removed DIRECT- prefix

## v1.0.18
- Defensive broadcast with preflight checks
- Timeout handling for broadcast failures

## v1.0.19
- Removed SSID cycling
- Single stable broadcast

## v1.0.20
- Duty-cycle SSID broadcast (5s ON, 2.5s OFF)

## v1.0.21
- 3-code alternating broadcast
- License plate display

## v1.0.22
- 4th human-readable slot
- 3-digit originator key

## v1.0.23
- 3 broadcast slots
- Half-speed cycle
- 5GHz band support

## v1.0.24
- GPS position in panel
- Abbreviated GPS in TAF broadcast

## v1.0.25
- Magnetometer + accelerometer sensor fusion for heading
- Improved compass accuracy

## v1.0.29
- Timing info moved to header
- Center popup removed

## v1.0.34
- Repositioned Wi-Fi panel to full-width bottom bar

## v1.0.37
- Compacted right panel
- Legend shrunk

## v1.0.40
- Additional UI refinements

## v1.0.42
- Additional UI refinements

## v1.0.45
- Reverted to proven v1.0.3 permission pattern

## v1.0.46
- Delayed permission request with post handler

## v1.0.49
- Additional scanning improvements

## v1.0.50
- Additional scanning improvements

## v1.0.51
- All features from v1.0.49 + v1.0.50 on v1.0.48 base

## v1.0.52
- Crash-proof: try/catch on injectJs
- Slower scan interval
- HTML catch for JS errors

## v1.0.53
- Additional stability fixes

## v1.0.54
- Additional stability fixes

## v1.0.55
- POV zoom buttons
- BT pulse on v1.0.55 base

## v1.0.56
- Trail only records when moving (speed > 1 mph)

## v1.0.58
- Trail optimization

## v1.0.59
- Additional scanning improvements

## v1.0.60
- Additional scanning improvements

## v1.0.61
- Continuous thicker trail

## v1.0.62
- Smooth CatmullRom trail curves
- 2000pt long tail

## v1.0.63
- Wake lock for background trail recording

## v1.0.65
- Restart BLE scan every 10s to keep alive

## v1.0.66
- Simplified BT handler
- No 3D dots
- try/catch safe

## v1.0.67
- Additional BT improvements

## v1.0.68
- Additional BT improvements

## v1.0.69
- Additional BT improvements

## v1.0.70
- Additional BT improvements

## v1.0.71
- v1.0.63 base + FAA codes + Classic BT + BT permissions

## v1.0.72
- Screen lock with dual-button unlock

## v1.0.73
- Additional UI improvements

## v1.0.74
- Additional UI improvements

## v1.0.75
- BT dots fade in
- Ring outline
- No random drift

## v1.0.76
- Additional BT improvements

## v1.0.77
- Additional BT improvements

## v1.0.78
- Additional BT improvements

## v1.0.79
- Kalman-filtered RSSI
- Log-distance path loss model
- Three-zone proximity (immediate/near/far)

## v1.0.80
- Major stability improvements
- BT 3D spatial foundation

## v1.0.81
- Advanced positioning modules
- Wi-Fi RTT ranging support

## v1.0.82
- MainActivity restructuring
- Wi-Fi triangulation with permissions

## v1.0.83
- Wi-Fi scan window UI

## v1.0.84
- Fixed JS syntax error in bounce.html
- Wi-Fi scan window UI working

## v1.0.85
- Hardware acceleration fix
- Full assets from v1.0.80

## v1.0.86 — Bluetooth 3D Spatial RSSI Tracking
- Full 3D Bluetooth spatial positioning (x, y, z)
- Kalman filter for RSSI smoothing
- Sensor fusion (accelerometer + magnetometer + gyroscope)
- Device brightness re-energizing (×1.5 boost)
- Trajectory tracking (100 points per device)
- Theory Mode toggle for ghost trajectories
- Periodic BT scan restart (5s)
- BT debug logging (`BounceBT` tag)
- BT status display in UI
- Dual callback: `onBtResult` (UI list) + `onBtResult3D` (3D)
- 3 `@JavascriptInterface` methods: `setTheoryMode`, `getTrajectory`, `getAllDevices`
- Volatile phone orientation for thread safety
- Low-pass filter (α=0.15) for sensor jitter reduction

## v1.0.87
- Theory mode refinement
- Version string updates
- Build script updates

## v1.0.90
- Advanced positioning algorithms
- Wi-Fi RTT ranging integration
- Particle filter for non-Gaussian RSSI
- Extended Kalman Filter (EKF) for 2D position tracking
- Zone HMM for zone classification
- Trilateration with weighted AP positions
- Per-BSSID Kalman filters
- Broadcast SSID refresh
- P2P broadcast with group creation
- Bonjour DNS-SD service advertisement
- GPS altitude tracking (feet)
- Wi-Fi scan results with zone classification

## v1.0.91
- In-app update mechanism via WebView bridge
- Update menu UI with pullout panel
- Version check against GitHub Releases
- `Bounce.onUpdateAvailable()` / `Bounce.onUpdateNotAvailable()`
- `UI.showUpdateMenu()` / `UI.hideUpdateMenu()`
- Manual update button in WebView

## v1.0.93
- Restored full update menu (Update, Download APK, Ignore)
- Removed auto-check on startup
- Panel width increased to 320px
- Pullout toggle fixed to start recessed against wall
- `downloadOnly()` and `ignoreUpdate()` JS methods restored

## v1.0.94
- Same menu changes as v1.0.93
- Built on v1.0.91 base instead of v1.0.93

## v1.0.95
- Clean baseline identical to v1.0.91
- No menu changes
- Stable base for v1.0.96 development
