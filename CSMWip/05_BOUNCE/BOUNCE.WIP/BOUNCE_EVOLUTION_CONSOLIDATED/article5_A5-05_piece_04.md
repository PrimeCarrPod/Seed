# Best_Practices_AntiPatterns_Catalog — Piece 04/13
## Article A5: A5-05 — Best Practices AntiPatterns Catalog
**Piece:** 04 of 13  
**Generated:** 2026-10-08 05:07:19 UTC

---
# Android Runtime Best Practices - Permissions & BLE (BP006-BP013)

## Article A5: A5-05 — Best_Practices_AntiPatterns_Catalog
**Piece:** 04 of 13  
**Generated:** 2026-10-08 05:07:52 UTC

---

# BP006: Revert to Proven v1.0.3 Permission Pattern
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.45 | **Confirmed Working:** v1.0.91
**Evidence:** Fixed API33 NEARBY_WIFI_DEVICES issues
**Impact:** Stability | **Applies To:** All versions
**Related:** checkSelfPermission + requestPermissions + handler

### Implementation
```java
// v1.0.3 pattern that works across API 23-33+
private void requestPermissionsSafely() {
    List<String> needed = new ArrayList<>();
    for (String perm : REQUIRED_PERMISSIONS) {
        if (checkSelfPermission(perm) != PackageManager.PERMISSION_GRANTED) {
            needed.add(perm);
        }
    }
    if (!needed.isEmpty()) {
        requestPermissions(needed.toArray(new String[0]), PERM_REQUEST_CODE);
    }
}
```

---

# BP007: Delayed Permission Request with post Handler
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.46 | **Confirmed Working:** v1.0.91
**Evidence:** Avoids permission dialog on startup
**Impact:** UX | **Applies To:** All versions
**Related:** Handler.postDelayed(permissionRequest, 100)

### Implementation
```java
new Handler(Looper.getMainLooper()).postDelayed(() -> {
    requestPermissionsSafely();
}, 100); // Let UI settle first
```

---

# BP008: 5s Bluetooth Scan Restart Cycle
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.65 | **Confirmed Working:** v1.0.91
**Evidence:** Prevents scan death
**Impact:** Continuous scanning | **Applies To:** v1.0.65+
**Related:** Handler.postDelayed(restartScan, 5000)

### Implementation
```java
private final Runnable scanRestarter = new Runnable() {
    @Override public void run() {
        if (scanning && bluetoothLeScanner != null) {
            bluetoothLeScanner.stopScan(scanCallback);
            bluetoothLeScanner.startScan(buildScanFilters(), 
                new ScanSettings.Builder()
                    .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
                    .build(), scanCallback);
        }
        handler.postDelayed(this, 5000);
    }
};
```

---

# BP009: LOW_LATENCY Scan Mode for BLE
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.48 | **Confirmed Working:** v1.0.91
**Evidence:** Fastest device discovery
**Impact:** Responsiveness | **Applies To:** v1.0.48+
**Related:** ScanSettings.SCAN_MODE_LOW_LATENCY

---

# BP010: Conditional Wake Lock (Only When Trail Active)
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.63 | **Confirmed Working:** v1.0.91
**Evidence:** Prevents battery drain
**Impact:** Battery life | **Applies To:** v1.0.63+
**Related:** acquire() only when recording

### Implementation
```java
// Only acquire when actively recording trail
if (isRecordingTrail && !wakeLock.isHeld()) {
    wakeLock.acquire();
} else if (!isRecordingTrail && wakeLock.isHeld()) {
    wakeLock.release();
}
```

---

# BP011: Multi-Method Wi-Fi Direct Fallback
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.14 | **Confirmed Working:** v1.0.91
**Evidence:** Builder → Reflection → Bonjour
**Impact:** Reliability | **Applies To:** v1.0.14+
**Related:** Priority order handles API differences

### Priority Order
1. **WifiP2pManager.Builder** (API 29+)
2. **Reflection** on hidden APIs (API 23-28)
3. **Bonjour/mDNS** discovery (fallback)

---

# BP012: Fixed 5.1s Duty Cycle for SSID Broadcast
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.20 | **Confirmed Working:** v1.0.91
**Evidence:** Consistent timing across devices
**Impact:** Predictability | **Applies To:** v1.0.20+
**Related:** 2.5s ON + 2.6s OFF

### Implementation
```java
private static final int DUTY_ON_MS = 2500;
private static final int DUTY_OFF_MS = 2600;
private static final int DUTY_CYCLE_MS = DUTY_ON_MS + DUTY_OFF_MS; // 5100ms
```

---

# BP013: Comprehensive Runtime Permissions (15 Total)
**Category:** Android | **Type:** Best Practice
**First Observed:** v1.0.3 | **Confirmed Working:** v1.0.91
**Evidence:** Covers all API levels 23-33+
**Impact:** Compatibility | **Applies To:** All versions
**Related:** Handle API29/31/33+ differences

### Permission List by API
| Permission | API 23+ | API 29+ | API 31+ | API 33+ |
|------------|---------|---------|---------|---------|
| ACCESS_FINE_LOCATION | ✓ | ✓ | ✓ | ✓ |
| ACCESS_COARSE_LOCATION | ✓ | ✓ | ✓ | ✓ |
| ACCESS_BACKGROUND_LOCATION | | ✓ | ✓ | ✓ |
| BLUETOOTH_SCAN | | | ✓ | ✓ |
| BLUETOOTH_CONNECT | | | ✓ | ✓ |
| NEARBY_WIFI_DEVICES | | | | ✓ (neverForLocation) |

---

*Next Piece: Android Anti-Patterns (CP004-CP008)*
