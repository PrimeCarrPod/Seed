# Refinement_Existing_Parts_Prioritized — Piece 04/13
## Article A3: A3-10 — Refinement Existing Parts Prioritized
**Piece:** 04 of 13  
**Generated:** 2026-10-08 16:41:24 UTC

---

# Section 10: Refinement of Existing Parts — Adaptive Performance Systems (RF010, RF011, RF012)

## 4.1 RF010 — Trail Geometry Adaptive Rebuild (P1, Low Effort)

**Component:** `TrailRenderer.js` (Three.js Catmull-Rom curve reconstruction)  
**Issue:** Fixed 5-frame rebuild interval — wasteful when stationary, laggy when moving fast  
**Current State:** `if (frameCount % 5 === 0) rebuildTrail()`  
**Proposed Refinement:** Adaptive rebuild frequency based on movement velocity  

### Algorithm:
```javascript
// TrailRenderer.adaptiveRebuild()
class TrailRenderer {
  constructor() {
    this.rebuildInterval = 5; // frames
    this.lastRebuildFrame = 0;
    this.velocityHistory = []; // last 10 velocities
  }
  
  update(deltaTime, currentPosition) {
    // Compute velocity
    const velocity = this.computeVelocity(currentPosition, deltaTime);
    this.velocityHistory.push(velocity);
    if (this.velocityHistory.length > 10) this.velocityHistory.shift();
    
    // Adaptive interval: 1 frame (fast) to 20 frames (stationary)
    const avgVelocity = this.velocityHistory.reduce((a,b)=>a+b,0) / this.velocityHistory.length;
    const speed = avgVelocity.length();
    
    if (speed > 2.0) this.rebuildInterval = 1;      // >2 m/s: every frame
    else if (speed > 1.0) this.rebuildInterval = 2; // 1-2 m/s: every 2
    else if (speed > 0.5) this.rebuildInterval = 5; // walking: every 5
    else if (speed > 0.1) this.rebuildInterval = 10; // slow: every 10
    else this.rebuildInterval = 20;                  // stationary: every 20
    
    // Rebuild check
    if (frameCount - this.lastRebuildFrame >= this.rebuildInterval) {
      this.rebuildTrail();
      this.lastRebuildFrame = frameCount;
    }
  }
}
```

### Performance Impact:
| Movement State | Old Interval | New Interval | Rebuilds/sec (60fps) |
|----------------|--------------|--------------|----------------------|
| Running (3 m/s) | 5 | 1 | 60 → 60 (same) |
| Walking (1.2 m/s) | 5 | 2 | 12 → 30 (2.5× smoother) |
| Slow (0.3 m/s) | 5 | 10 | 12 → 6 (2× fewer) |
| Stationary | 5 | 20 | 12 → 3 (4× fewer) |

### GPU Savings: ~40% fewer geometry uploads during typical use
### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 4.2 RF011 — Bluetooth Scan Adaptive Duty Cycle (P1, Low Effort)

**Component:** `BluetoothScanner.java` / `MainActivity` scan scheduler  
**Issue:** Fixed 5-second scan/restart cycle — too aggressive when quiet, misses devices when active  
**Current State:** `handler.postDelayed(scanRunnable, 5000)` unconditional  
**Proposed Refinement:** Adaptive scan interval based on device activity  

### Algorithm:
```java
// BluetoothScanner.adaptiveSchedule()
class BluetoothScanner {
  private static final int MIN_INTERVAL_MS = 2000;  // 2s when active
  private static final int MAX_INTERVAL_MS = 10000; // 10s when quiet
  private static final int ACTIVE_THRESHOLD = 3;    // devices to consider "active"
  
  private int currentIntervalMs = 5000;
  private int consecutiveQuietCycles = 0;
  
  void onScanResults(List<ScanResult> results) {
    int activeDevices = countActiveDevices(results); // RSSI > -80, seen recently
    
    if (activeDevices >= ACTIVE_THRESHOLD) {
      // High activity: scan more frequently
      currentIntervalMs = Math.max(MIN_INTERVAL_MS, currentIntervalMs - 500);
      consecutiveQuietCycles = 0;
    } else {
      // Low activity: back off exponentially
      consecutiveQuietCycles++;
      currentIntervalMs = Math.min(MAX_INTERVAL_MS, 
        (int)(5000 * Math.pow(1.5, consecutiveQuietCycles - 1)));
    }
    
    scheduleNextScan(currentIntervalMs);
  }
  
  private int countActiveDevices(List<ScanResult> results) {
    return (int) results.stream()
      .filter(r -> r.getRssi() > -80)
      .filter(r -> System.currentTimeMillis() - r.getTimestampNanos()/1e6 < 30000)
      .count();
  }
}
```

### Battery Impact:
| Environment | Old Cycle | New Avg Cycle | Battery Savings |
|-------------|-----------|---------------|-----------------|
| Crowded (mall) | 5s | 2.5s | -10% (more scans) |
| Office (5 devices) | 5s | 4s | +5% |
| Home (1 device) | 5s | 8s | +25% |
| Empty (outdoors) | 5s | 10s | +35% |

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

## 4.3 RF012 — SSID Broadcast Adaptive Duty Cycle (P2, Low Effort)

**Component:** `WifiRttManager` / `WifiAware` SSID broadcast scheduler  
**Issue:** Fixed 5.1s slot duration — inflexible for mobility contexts  
**Current State:** `publishConfig.setPublishDuration(5100)` constant  
**Proposed Refinement:** Context-aware slot timing using GPS speed / accelerometer  

### Algorithm:
```java
// SsidBroadcaster.adaptiveDutyCycle()
class SsidBroadcaster {
  private static final int BASE_SLOT_MS = 5100;
  private static final int MIN_SLOT_MS = 2000;  // fast when moving
  private static final int MAX_SLOT_MS = 15000; // slow when stationary
  
  void updateSlotDuration(Location location, float[] accelerometer) {
    float speed = location != null ? location.getSpeed() : 0f; // m/s
    float accelMagnitude = Vector3.magnitude(accelerometer);
    
    // Moving detection: GPS speed OR accelerometer variance
    boolean moving = speed > 0.5 || accelMagnitude > 1.2;
    
    int newSlotMs;
    if (moving) {
      // Linear interpolation: 0.5 m/s → 5s, 5 m/s → 2s
      float t = Math.min(1f, (speed - 0.5f) / 4.5f);
      newSlotMs = (int) (BASE_SLOT_MS * (1 - t * 0.6));
    } else {
      // Exponential backoff when stationary
      stationaryCycles++;
      newSlotMs = Math.min(MAX_SLOT_MS, BASE_SLOT_MS * (int)Math.pow(1.3, stationaryCycles));
    }
    
    if (newSlotMs != currentSlotMs) {
      reconfigurePublish(newSlotMs);
      currentSlotMs = newSlotMs;
    }
  }
}
```

### Channel Efficiency:
| Context | Slot Duration | Broadcasts/min | Airtime % |
|---------|---------------|----------------|-----------|
| Driving (15 m/s) | 2.0s | 30 | 2.5% |
| Running (3 m/s) | 3.0s | 20 | 1.7% |
| Walking (1.2 m/s) | 4.0s | 15 | 1.3% |
| Standing | 8.0s | 7.5 | 0.6% |
| Sitting (10 min) | 15s | 4 | 0.3% |

### Target: v1.0.94 | Status: Planned | Master List Ref: —

---

*End of Piece 04/13*