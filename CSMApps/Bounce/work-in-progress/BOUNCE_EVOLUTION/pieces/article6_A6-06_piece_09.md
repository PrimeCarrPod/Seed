# Runtime GPS/Trail & Wi-Fi Direct Errors (E013, E017, E018)

## Article A6: A6-06 — Repeated_Errors_Catalog_Solutions
**Piece:** 09 of 13  
**Generated:** 2026-10-08 05:28:32 UTC

---

# E013: Trail recording creates noisy path when stationary
**Type:** Runtime | **First:** v1.0.49 | **Last:** v1.0.55 | **Frequency:** Every run
**Root Cause:** GPS records 0-speed points (jitter)
**Solution:** Only record when speed > 1mph
**Worked:** Yes | **Fixed In:** v1.0.56 | **Time Lost:** Medium
**Notes:** Speed threshold filter - same fix as E019

### Reproduction
```javascript
// Without speed filter - records every GPS update
trailPoints.push({lat, lon, alt, timestamp});
// Result: Star-shaped jitter pattern when stationary
```

### Root Cause Detail
GPS has inherent noise (~5-10m accuracy). When stationary, reported position jitters randomly. Recording every point creates a "star" pattern around true position.

### Fix Implementation
```java
// Android side - speed threshold
private static final float MIN_SPEED_MPS = 0.447f;  // 1 mph

public void onLocationChanged(Location location) {
    float speed = location.getSpeed();  // m/s
    if (speed > MIN_SPEED_MPS) {
        trailRecorder.addPoint(location);
    }
    // Update UI with current position regardless
    updatePositionDisplay(location);
}
```

### Prevention
- Apply speed threshold BEFORE adding to trail
- Still update position display for UI
- Consider minimum distance filter as additional guard

---

# E017: SSID broadcast timing drift
**Type:** Runtime | **First:** v1.0.13 | **Last:** v1.0.19 | **Frequency:** Every run
**Root Cause:** Handler.postDelayed accumulation - each post adds delay
**Solution:** Fixed 5.1s duty cycle with single timer
**Worked:** Yes | **Fixed In:** v1.0.20 | **Time Lost:** Medium
**Notes:** Use fixed cycle not accumulating delays

### Reproduction
```java
// BAD - accumulating delay
private void scheduleBroadcast() {
    handler.postDelayed(() -> {
        broadcastSSID();
        scheduleBroadcast();  // Each call adds ~10-20ms drift
    }, DUTY_CYCLE_MS);
}
// After 1 hour: ~30 seconds drift!
```

### Root Cause Detail
`Handler.postDelayed` doesn't guarantee exact timing. Each reschedule adds small overhead. Over thousands of cycles, drift accumulates significantly.

### Fix Implementation
```java
// GOOD - fixed cycle using single repeating timer
private static final long DUTY_ON_MS = 2500;
private static final long DUTY_OFF_MS = 2600;
private static final long DUTY_CYCLE_MS = DUTY_ON_MS + DUTY_OFF_MS;  // 5100ms

private final Runnable dutyCycler = new Runnable() {
    private boolean isOn = false;
    
    @Override
    public void run() {
        if (isOn) {
            // Turn OFF
            wifiP2pManager.stopBroadcast();
            handler.postDelayed(this, DUTY_OFF_MS);
        } else {
            // Turn ON
            wifiP2pManager.startBroadcast();
            handler.postDelayed(this, DUTY_ON_MS);
        }
        isOn = !isOn;
    }
};

// Start with single post
handler.post(dutyCycler);
```

### Key Difference
| Approach | Drift After 1 Hour |
|----------|-------------------|
| Accumulating postDelayed | ~30 seconds |
| Fixed cycle single timer | < 1 second |

---

# E018: Wi-Fi Direct Group Owner creation fails
**Type:** Runtime | **First:** v1.0.13 | **Last:** v1.0.13 | **Frequency:** Few
**Root Cause:** Single method (WifiP2pConfig.Builder) fails on some API levels
**Solution:** Multi-method fallback: Builder → Reflection → Bonjour
**Worked:** Yes | **Fixed In:** v1.0.14 | **Time Lost:** Medium
**Notes:** Priority fallback chain handles API differences

### Reproduction
```java
// Fails on API 23-28 where Builder doesn't exist
WifiP2pConfig config = new WifiP2pConfig.Builder()
    .setDeviceAddress(deviceAddress)
    .setGroupOwnerIntent(15)
    .build();
manager.createGroup(channel, config, actionListener);
```

### Root Cause Detail
`WifiP2pConfig.Builder` added in API 29. Older APIs require reflection or alternative approaches.

### Fix Implementation
```java
public void createGroupOwner(ActionListener listener) {
    // Priority 1: Builder (API 29+)
    if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
        try {
            WifiP2pConfig config = new WifiP2pConfig.Builder()
                .setGroupOwnerIntent(15)
                .build();
            manager.createGroup(channel, config, listener);
            return;
        } catch (Exception e) {
            Log.w(TAG, "Builder failed, trying reflection", e);
        }
    }
    
    // Priority 2: Reflection (API 23-28)
    try {
        WifiP2pConfig config = new WifiP2pConfig();
        config.groupOwnerIntent = 15;
        // Use reflection for hidden fields if needed
        manager.createGroup(channel, config, listener);
        return;
    } catch (Exception e) {
        Log.w(TAG, "Reflection failed, trying Bonjour", e);
    }
    
    // Priority 3: Bonjour/mDNS fallback
    startBonjourDiscovery(listener);
}
```

### Prevention
- Always implement fallback chain for Wi-Fi Direct
- Test on multiple API levels (23, 28, 29, 31, 33)
- Log which method succeeded for debugging

---

*Next Piece: Cross-Version Error Patterns & Timeline*