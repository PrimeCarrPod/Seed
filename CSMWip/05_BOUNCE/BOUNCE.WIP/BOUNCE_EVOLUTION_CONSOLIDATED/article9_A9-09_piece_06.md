# Working_Features_Versions_History — Piece 06/13
## Article A9: A9-09 — Working Features Versions History
**Piece:** 06 of 13  
**Generated:** 2026-10-08 15:28:33 UTC

---

# System Services: Wake Lock, Permissions, Charts, Broadcast Feedback

## 6.1 WF024 — Wake Lock Background Trail (System)

**Category:** System | **First Working:** v1.0.63 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~30 | **Key Files:** `MainActivity.java` | **Dependencies:** `PowerManager`, `WAKE_LOCK` permission

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.63 | `PARTIAL_WAKE_LOCK` acquired during trail recording | +30 |

### Wake Lock Implementation
```java
// MainActivity.java
private PowerManager.WakeLock wakeLock;

private void acquireWakeLock() {
    PowerManager pm = (PowerManager) getSystemService(POWER_SERVICE);
    wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "Bounce::TrailWakeLock");
    wakeLock.acquire();
}

private void releaseWakeLock() {
    if (wakeLock != null && wakeLock.isHeld()) {
        wakeLock.release();
    }
}

// Lifecycle integration
@Override
protected void onResume() {
    super.onResume();
    if (trailRecording) acquireWakeLock();
}

@Override
protected void onPause() {
    super.onPause();
    releaseWakeLock();
}
```

### Known Limitations
- **Conditional acquire**: Only during active trail recording
- No `FOREGROUND_SERVICE` type for Android 14+ compliance

### Next Planned Enhancement
None — functional for current use case

---

## 6.2 WF026 — Permission Handling (15 Permissions) (System)

**Category:** System | **First Working:** v1.0.3 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~200 | **Key Files:** `MainActivity.java` | **Dependencies:** Android runtime permission framework

### Permission Matrix (v1.0.91)
| Permission | API Level | Purpose | First Version |
|------------|-----------|---------|---------------|
| `ACCESS_FINE_LOCATION` | 1 | GPS + Wi-Fi scan + BLE | v1.0.3 |
| `ACCESS_COARSE_LOCATION` | 1 | Fallback location | v1.0.4 |
| `ACCESS_WIFI_STATE` | 1 | Wi-Fi scan results | v1.0.3 |
| `CHANGE_WIFI_STATE` | 1 | Wi-Fi Direct control | v1.0.13 |
| `ACCESS_BACKGROUND_LOCATION` | 29 | Background GPS | v1.0.63 |
| `BLUETOOTH_SCAN` | 31 | BLE scan (Android 12+) | v1.0.48 |
| `BLUETOOTH_CONNECT` | 31 | BLE connect (Android 12+) | v1.0.48 |
| `BLUETOOTH_ADVERTISE` | 31 | BLE advertise (Android 12+) | v1.0.48 |
| `NEARBY_WIFI_DEVICES` | 33 | Wi-Fi scan without location | v1.0.91 |
| `WAKE_LOCK` | 1 | Background trail | v1.0.63 |
| `FOREGROUND_SERVICE` | 9 | Future foreground service | v1.0.91 |
| `FOREGROUND_SERVICE_LOCATION` | 34 | Location foreground service | v1.0.91 |
| `INTERNET` | 1 | GitHub API auto-update | v1.0.91 |
| `ACCESS_NETWORK_STATE` | 1 | Network check before update | v1.0.91 |
| `WRITE_EXTERNAL_STORAGE` | 19 | APK download (legacy) | v1.0.93 |

### Proven Permission Pattern (v1.0.45+)
```java
// MainActivity.java - requestPermissionsIfNeeded()
private static final String[] REQUIRED_PERMISSIONS = {
    Manifest.permission.ACCESS_FINE_LOCATION,
    Manifest.permission.ACCESS_COARSE_LOCATION,
    Manifest.permission.ACCESS_WIFI_STATE,
    Manifest.permission.CHANGE_WIFI_STATE,
    Manifest.permission.ACCESS_BACKGROUND_LOCATION,
    Manifest.permission.BLUETOOTH_SCAN,
    Manifest.permission.BLUETOOTH_CONNECT,
    Manifest.permission.BLUETOOTH_ADVERTISE,
    Manifest.permission.NEARBY_WIFI_DEVICES,
    Manifest.permission.WAKE_LOCK,
    Manifest.permission.INTERNET,
    Manifest.permission.ACCESS_NETWORK_STATE
};

private void requestPermissionsIfNeeded() {
    List<String> missing = new ArrayList<>();
    for (String perm : REQUIRED_PERMISSIONS) {
        if (ContextCompat.checkSelfPermission(this, perm) != PackageManager.PERMISSION_GRANTED) {
            missing.add(perm);
        }
    }
    if (!missing.isEmpty()) {
        ActivityCompat.requestPermissions(this, 
            missing.toArray(new String[0]), PERMISSION_REQUEST_CODE);
    } else {
        onPermissionsGranted();
    }
}

// Rationale handling for critical permissions
@Override
public void onRequestPermissionsResult(int code, String[] perms, int[] results) {
    if (code == PERMISSION_REQUEST_CODE) {
        boolean allGranted = true;
        for (int r : results) if (r != PackageManager.PERMISSION_GRANTED) allGranted = false;
        if (allGranted) onPermissionsGranted();
        else showPermissionRationaleDialog(perms, results);
    }
}
```

### Known Limitations
- **API 33+ NEARBY_WIFI_DEVICES**: Requires separate rationale (not location-based)
- Background location requires Play Store policy compliance
- No auto-permission helper library (manual implementation)

### Next Planned Enhancement
**Auto-permission helper** — Library abstraction for permission flows

---

## 6.3 WF027 — Chart.js Metrics (Visualization)

**Category:** Visualization | **First Working:** v1.0.86 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~100 | **Key Files:** `bounce.html` | **Dependencies:** Chart.js (local, bundled)

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.86 | Four metrics: Action, Benevolence, Coherence, Glueball | +100 |

### Metrics Dashboard
```javascript
// bounce.html - Chart.js configuration
const METRICS_CONFIG = {
  type: 'radar',
  data: {
    labels: ['Action', 'Benevolence', 'Coherence', 'Glueball'],
    datasets: [{
      label: 'Current Session',
      data: [action, benevolence, coherence, glueball],
      backgroundColor: 'rgba(0, 255, 255, 0.2)',
      borderColor: 'rgba(0, 255, 255, 1)',
      pointBackgroundColor: 'rgba(0, 255, 255, 1)'
    }]
  },
  options: {
    scale: { ticks: { min: 0, max: 100, stepSize: 20 } },
    responsive: true,
    maintainAspectRatio: false
  }
};

// Metric calculations (from algorithm outputs)
function computeMetrics() {
  const action = Math.min(100, trailPoints * 0.1);                    // Activity level
  const benevolence = Math.min(100, beaconCount * 5);                 // Network density
  const coherence = Math.min(100, (1 - ekfCovarianceTrace) * 100);   // Estimate quality
  const glueball = Math.min(100, particleEffectiveSampleSize * 0.5); // Fusion stability
  return { action, benevolence, coherence, glueball };
}
```

### Known Limitations
- Metrics are heuristic; no validated psychological/physical basis
- Chart.js local bundle adds ~80KB to HTML

### Next Planned Enhancement
**More metrics** — Signal quality, algorithm agreement, battery efficiency

---

## 6.4 WF028 — Broadcast Status Feedback (Radio)

**Category:** Radio | **First Working:** v1.0.20 | **Last Enhanced:** v1.0.91 | **Status:** Complete
**Lines Added:** ~50 | **Key Files:** `MainActivity.java` + `bounce.html` | **Dependencies:** JS bridge

### Enhancement History
| Version | Enhancement | Lines Delta |
|---------|-------------|-------------|
| v1.0.20 | Status bar: broadcasting/connected/scanning states | +30 |
| v1.0.90 | Live re-code: SSID payload updated without reconnection | +20 |

### Status Feedback Flow
```
Android (WifiP2pManager) → BroadcastReceiver → MainActivity
    → evaluateJavascript("updateBroadcastStatus('SLOT_2', 'ACTIVE', 'METAR')")
    → bounce.html HUD SCAN panel updates slot indicator
```

### Known Limitations
- **Slot drift fixed**: v1.0.90 uses `SystemClock.elapsedRealtime()` for slot timing
- No historical status log

### Next Planned Enhancement
None — functional

---

*End of Piece 06 — Continue to Piece 07 for Positioning Algorithms Part 1*