# Future_Progress_Roadmap_P0_P3 — Piece 09/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 09 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# Architecture Refactoring — Multi-Activity Design (FP005, FP006, FP021)

## Current State: God Class Analysis (v1.0.91)

**MainActivity.java: 1,416 lines handling:**
- Wi-Fi scanning (WifiManager, ScanResult parsing)
- BLE scanning (BluetoothLeScanner, ScanCallback)
- Bluetooth Classic (BluetoothSocket, RFCOMM)
- 6 Positioning Algorithms (Kalman, Particle, EKF, UKF, RSSI-ML, BT-3D)
- Sensor fusion (accelerometer, gyroscope, magnetometer)
- UI rendering (WebView + JavaScript bridge)
- Trail recording (SQLite + GPX export)
- Auto-update (download, verify, install APK)
- Mesh networking (Bluetooth relay, message routing)
- Settings/preferences (SharedPreferences)
- Permissions (runtime request handling)

**Coupling Metrics:**
- 47 imports
- 23 inner classes (anonymous + named)
- 31 public methods
- 18 interfaces implemented
- 0 unit tests

---

## Target Architecture: Service-Based Decomposition

```
┌─────────────────────────────────────────────────────────────┐
│                      BOUNCE APP                             │
├─────────────┬─────────────┬─────────────┬───────────────────┤
│   UI        │  Scanning   │ Positioning │    Mesh           │
│  Activity   │  Service    │  Service    │   Service         │
├─────────────┼─────────────┼─────────────┼───────────────────┤
│ WebView     │ WiFi Scanner│ Kalman      │ BT Classic Relay  │
│ JS Bridge   │ BLE Scanner │ Particle    │ Message Router    │
│ Settings    │ BT Scanner  │ EKF/UKF     │ TTL Manager       │
│ Trail View  │ Sensor Fusion│ RSSI-ML    │ Peer Discovery    │
└─────────────┴─────────────┴─────────────┴───────────────────┘
        │            │             │              │
        └────────────┴─────────────┴──────────────┘
                    ▼
         ┌─────────────────────┐
         │   Shared Storage    │
         │ (Room DB + Prefs)   │
         └─────────────────────┘
```

---

## FP005: Multi-Activity Architecture — Implementation Plan

### Phase 1: Extract ScanningService (v1.0.94)
```kotlin
// ScanningService.kt
@Service
class ScanningService : LifecycleService() {
    private val wifiScanner = WifiScanner()
    private val bleScanner = BleScanner()
    private val btScanner = BtScanner()
    
    // Exposed via AIDL/Binder
    override fun onBind(intent: Intent): IBinder = scannerBinder
    
    // Broadcast scan results via LocalBroadcastManager
    private fun broadcastScanResult(result: ScanResult) { ... }
}
```

### Phase 2: Extract PositioningService (v1.0.94)
```kotlin
// PositioningService.kt
@Service
class PositioningService : LifecycleService() {
    private val algorithms = mapOf(
        "kalman" to KalmanFilter(),
        "particle" to ParticleFilter(),
        "ekf" to PositionEKF(),
        "ukf" to UnscentedKalmanFilter(),
        "rssi_ml" to RssiMLPositioning(),
        "bt_3d" to Bt3DSpatial()
    )
    
    // Receives scan results, outputs position estimates
    private val positionSubject = MutableSharedFlow<PositionEstimate>()
}
```

### Phase 3: Extract MeshService (v1.0.95)
```kotlin
// MeshService.kt
@Service
class MeshService : LifecycleService() {
    private val relayEngine = RelayEngine()
    private val peerManager = PeerManager()
    
    // Handles message routing, TTL, deduplication
}
```

### Phase 4: UI Activity (v1.0.95)
```kotlin
// MainActivity.kt (refactored to ~200 lines)
class MainActivity : AppCompatActivity() {
    private val scanningService: ScanningService by bindService()
    private val positioningService: PositioningService by bindService()
    private val meshService: MeshService by bindService()
    
    // Only handles: WebView, JS bridge, user interactions
}
```

---

## FP006: Background Scanning Service — Foreground Service Design

**Notification Channel:**
```kotlin
val channel = NotificationChannel(
    "scanning_channel",
    "Continuous Scanning",
    NotificationManager.IMPORTANCE_LOW
).apply {
    description = "Maintains Wi-Fi/Bluetooth scanning for positioning"
    setShowBadge(false)
}
```

**Foreground Service:**
```kotlin
class ScanningForegroundService : Service() {
    override fun onStartCommand(intent: Intent, flags: Int, startId: Int): Int {
        val notification = buildScanningNotification()
        startForeground(SCANNING_NOTIFICATION_ID, notification)
        
        // Start scanners with wake lock
        startScanning()
        return START_STICKY
    }
    
    // Battery optimization: batch scans, use JobScheduler for doze
}
```

**Battery Target:** <5%/hour with continuous scanning
- Wi-Fi: Passive scan (no active probe) every 30s
- BLE: Duty-cycled 10% (1s scan / 10s interval)
- BT Classic: Connection-oriented, on-demand

---

## FP021: Split Updater from Bounce — TGAPP Integration

**Current Updater Code (in MainActivity):**
- DownloadManager for APK
- Signature verification (PackageManager)
- Install intent (ACTION_INSTALL_PACKAGE)
- Version check against GitHub releases

**New Design:**
- TGAPP handles all update logic
- Bounce only checks shared preference for "update_available"
- TGAPP downloads, verifies, prompts install
- Reduces Bounce by ~150 lines

---

*End of Piece 09/13 — See Piece 10 for Network/Mesh deep dive*