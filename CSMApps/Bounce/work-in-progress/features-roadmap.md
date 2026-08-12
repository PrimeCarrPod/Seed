# Bounce — Features Roadmap

Desired features to add from now forward.

---

## Immediate (v1.0.96+)

### Update Menu Polish
- [ ] Add progress indicator / spinner during download
- [ ] Add cancel button for in-progress updates
- [ ] Show file size and download ETA
- [ ] Auto-dismiss menu after successful update launch
- [ ] Persist "ignore" choice across app restarts

### Menu Geometry & UX
- [ ] Make pullout start fully recessed against portrait phone wall (only tab visible)
- [ ] Adjust panel width to not exceed 50% of screen width on small devices
- [ ] Add haptic feedback on button press
- [ ] Smooth open/close animation with spring physics

### Stability
- [ ] Verify APK installs on Android 13/14 without compatibility flags
- [ ] Add fallback for devices without BLE support
- [ ] Graceful degradation when Wi-Fi RTT unavailable

## Short Term (v1.0.97–v1.0.99)

### Data & Export
- [ ] Export trail data as GPX/KML
- [ ] Export scan results as CSV
- [ ] Share trail screenshot via Android share intent

### UI Enhancements
- [ ] Dark/light theme toggle
- [ ] Adjustable 3D scene brightness
- [ ] Minimap overlay showing device positions
- [ ] Compass rose / heading indicator
- [ ] Altitude graph over time

### Network
- [ ] HTTP-based APK download with progress callback
- [ ] Checksum verification for downloaded APK
- [ ] Delta updates (only changed assets, not full APK)

## Medium Term (v1.1.0+)

### Advanced Positioning
- [ ] Multi-device trilateration fusion (Wi-Fi + BT + GPS)
- [ ] Indoor map import/overlay
- [ ] Beacon proximity alerts (geofencing)
- [ ] Pedestrian dead reckoning (PDR) with step counting

### Social / Mesh
- [ ] Peer-to-peer device sharing via WebRTC
- [ ] Encrypted broadcast channel
- [ ] Device identity / pairing system
- [ ] Mesh network topology visualization

### Fleet Management
- [ ] Save/load vehicle presets (SSID codes, broadcast profiles)
- [ ] Fleet status dashboard
- [ ] Remote fleet command via broadcast

## Long Term (v2.0.0+)

### Platform
- [ ] iOS port (Swift + WKWebView)
- [ ] Desktop companion app (Electron)
- [ ] Web dashboard for fleet management

### Hardware
- [ ] External GPS/ANT+ support
- [ ] Bluetooth 5.2 direction finding (AoA/AoD)
- [ ] UWB ranging integration

### AI / Automation
- [ ] Predictive zone classification
- [ ] Anomaly detection for signal spoofing
- [ ] Automated broadcast channel selection
