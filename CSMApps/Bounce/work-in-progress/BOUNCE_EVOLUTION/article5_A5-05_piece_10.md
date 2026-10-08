# Best_Practices_AntiPatterns_Catalog — Piece 10/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 10 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Implementation Guidelines

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 10 of 13  
**Generated:** 2026-10-08 05:11:12 UTC

---

# Guideline 1: Build Script as Source of Truth

### Principle
The `build.sh` script must be the single authoritative build definition. No Gradle, no IDE-specific configs, no external build tools.

### Checklist
- [ ] SDK paths derived from `ANDROID_HOME` only
- [ ] `compileSdk` and `build-tools` version pinned and matched
- [ ] `debug.keystore` auto-generated if missing
- [ ] Assets injected via `zip` after `aapt2 link`
- [ ] `javac -source 11 -target 11` for compatibility
- [ ] Clean `clean` target removes all build artifacts
- [ ] Verbose logging for each step

---

# Guideline 2: Permission Handling Template

### Required Pattern (from v1.0.3, validated through v1.0.91)
```java
public class PermissionManager {
    private static final String[] PERMISSIONS_API_23 = { ... };
    private static final String[] PERMISSIONS_API_29 = { ... };
    private static final String[] PERMISSIONS_API_31 = { ... };
    private static final String[] PERMISSIONS_API_33 = { ... };
    
    public void requestAllPermissions(Activity activity) {
        List<String> needed = getNeededPermissions(activity);
        if (!needed.isEmpty()) {
            new Handler(Looper.getMainLooper()).postDelayed(() -> {
                activity.requestPermissions(
                    needed.toArray(new String[0]), PERM_REQUEST_CODE);
            }, 100);
        }
    }
}
```

### API Version Matrix
| Permission | API 23 | API 29 | API 31 | API 33 |
|------------|--------|--------|--------|--------|
| ACCESS_FINE_LOCATION | ✓ | ✓ | ✓ | ✓ |
| ACCESS_COARSE_LOCATION | ✓ | ✓ | ✓ | ✓ |
| ACCESS_BACKGROUND_LOCATION | | ✓ | ✓ | ✓ |
| BLUETOOTH_SCAN | | | ✓ | ✓ |
| BLUETOOTH_CONNECT | | | ✓ | ✓ |
| NEARBY_WIFI_DEVICES | | | | ✓* |
| *with neverForLocation flag | | | | |

---

# Guideline 3: BLE Scan Restart Template

### Mandatory Implementation (v1.0.65+)
```java
public class BleScanService {
    private static final long SCAN_RESTART_MS = 5000;
    private Handler handler = new Handler(Looper.getMainLooper());
    
    private final Runnable scanRestarter = () -> {
        if (isScanning && bluetoothLeScanner != null) {
            bluetoothLeScanner.stopScan(scanCallback);
            bluetoothLeScanner.startScan(filters, 
                new ScanSettings.Builder()
                    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                    .build(), scanCallback);
        }
        handler.postDelayed(scanRestarter, SCAN_RESTART_MS);
    };
    
    public void start() {
        isScanning = true;
        handler.post(scanRestarter);
    }
    
    public void stop() {
        isScanning = false;
        handler.removeCallbacks(scanRestarter);
        bluetoothLeScanner?.stopScan(scanCallback);
    }
}
```

---

# Guideline 4: Wake Lock Conditional Template

### Mandatory Implementation (v1.0.63+)
```java
public class WakeLockManager {
    private PowerManager.WakeLock wakeLock;
    private boolean isRecording = false;
    
    public void setRecording(boolean recording) {
        this.isRecording = recording;
        updateWakeLock();
    }
    
    private void updateWakeLock() {
        if (isRecording && !wakeLock.isHeld()) {
            wakeLock.acquire();
        } else if (!isRecording && wakeLock.isHeld()) {
            wakeLock.release();
        }
    }
}
```

---

# Guideline 5: Three.js Memory Management Template

### Mandatory Implementation (v1.0.54+)
```javascript
class ThreeSceneManager {
    constructor() {
        this.scene = new THREE.Scene();
        this.objectsToDispose = new Set();
    }
    
    addTrackedObject(obj) {
        this.objectsToDispose.add(obj);
        this.scene.add(obj);
    }
    
    rebuild() {
        // Dispose all tracked objects
        this.objectsToDispose.forEach(obj => {
            if (obj.geometry) obj.geometry.dispose();
            if (obj.material) {
                Array.isArray(obj.material) 
                    ? obj.material.forEach(m => m.dispose())
                    : obj.material.dispose();
            }
        });
        this.objectsToDispose.clear();
        this.scene = new THREE.Scene();
        this.initScene();
    }
}
```

---

# Guideline 6: Trail Point FIFO Template

### Mandatory Implementation (v1.0.62+)
```javascript
const MAX_TRAIL_POINTS = 2000;
let trailPoints = [];
let frameCount = 0;

function addTrailPoint(lat, lon, alt, speed, timestamp) {
    if (speed < 0.447) return; // Speed threshold: 1 mph
    
    trailPoints.push({lat, lon, alt, speed, timestamp});
    
    if (trailPoints.length > MAX_TRAIL_POINTS) {
        trailPoints.shift(); // FIFO remove oldest
    }
    
    frameCount++;
    if (frameCount % 5 === 0) { // Rebuild every 5 frames
        rebuildTrailGeometry();
    }
}
```

---

*Next Piece: Version-Specific Recommendations*
