# Future_Thoughts_Evaluations_Vision — Piece 10/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 10 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# Resilience: Disaster Mode & Mesh Time Sync

## FT020 — Disaster Mode (No Infrastructure) (Resilience)

**Hypothesis:** Carrington Event ready  
**Feasibility:** High | **Potential Impact:** Very High - mission  
**Risks:** Range limits | **Related Work:** LoRa/MESH  
**Validation Approach:** LoRa integration | **Timeline:** 12+ months | **Status:** Concept  

**Scenario:** Solar flare (Carrington-class) or EMP or hurricane → cell towers down, GPS jammed, internet gone. Bounce must operate as pure peer-to-peer mesh.

**Disaster Mode Architecture:**
```
┌─────────────────────────────────────────────────────────┐
│                   BOUNCE DISASTER MODE                   │
├─────────────────────────────────────────────────────────┤
│  Sensors:     IMU (dead reckoning) + Barometer + Compass│
│  Positioning: Particle Filter (no GPS anchor)           │
│  Network:     Bluetooth LE + Wi-Fi Aware + LoRa         │
│  Time Sync:   Hybrid Logical Clocks (no NTP/GPS)        │
│  Data:        Local SQLite + CRDT mesh sync             │
│  Power:       Background service + wake locks           │
│  UI:          Minimal (hazard alerts, mesh status)      │
└─────────────────────────────────────────────────────────┘
```

**LoRa Integration (Long Range):**
- Hardware: Semtech SX1262 module (UART/SPI) → USB/Bluetooth accessory or built-in
- Frequency: 915 MHz (US), 868 MHz (EU), 470 MHz (CN) - ISM bands
- Range: 5-15 km rural, 1-3 km urban
- Data rate: 0.3-50 kbps (adaptive)
- Mesh protocol: LoRaWAN (star) or custom mesh (Reticulum, Meshtastic)
- Bounce integration: `LoRaRadio` service → `MeshPacket` encapsulation

**Disaster Mode Trigger:**
```kotlin
class DisasterDetector {
    fun evaluate(): Boolean {
        val noCell = !telephonyManager.isNetworkAvailable
        val noGps = !locationManager.isGpsEnabled || gpsAccuracy > 100f
        val noWifi = !wifiManager.isWifiEnabled || wifiScanResults.isEmpty()
        val noInternet = !connectivityManager.activeNetwork?.hasInternet()
        return noCell && noGps && noWifi && noInternet && duration > 5min
    }
}
```

**Positioning Without GPS:**
- IMU dead reckoning: position error grows ~1% distance traveled
- Barometer: altitude constraint (floor detection in buildings)
- Magnetometer: heading constraint (calibrated)
- Map matching: snap to road graph (OpenStreetMap offline tiles)
- Particle filter: 1000 particles, resample on BLE/Wi-Fi landmarks

**Range Extension:** 
- Vehicle-to-vehicle: 100m (BLE) → 200m (Wi-Fi Aware) → 5km (LoRa)
- Multi-hop: 10 hops × 5km = 50km mesh diameter
- Store-and-forward: LoRa packets queued, transmitted on duty cycle (1% airtime)

**Power Management:**
- Doze mode exemption: `REQUEST_IGNORE_BATTERY_OPTIMIZATIONS`
- Foreground service: `FOREGROUND_SERVICE_TYPE_CONNECTED_DEVICE`
- CPU: 1Hz sensor batch, 0.1Hz mesh beacon (adaptive)
- Target: 72hr on 4000mAh phone (vs 24hr normal)

---

## FT021 — Mesh Time Synchronization (Resilience)

**Hypothesis:** Works when GPS/NTP jammed  
**Feasibility:** High | **Potential Impact:** Medium - resilience  
**Risks:** Clock drift | **Related Work:** Hybrid Logical Clocks  
**Validation Approach:** Implement HLC | **Timeline:** 6-12 months | **Status:** Research  

**Problem:** Mesh protocols need synchronized time for: TTL expiry, replay protection, ordering, TDMA scheduling. Current: `SystemClock.elapsedRealtime()` (monotonic, not absolute) + GPS time (when available). GPS fails in disaster/jamming.

**Hybrid Logical Clocks (HLC):**
- Combines physical clock (local `System.currentTimeMillis()`) + logical counter
- Format: `HLC = (physicalTime << 48) | logicalCounter`
- Rules:
  1. On event: `l = max(l, receivedHLClogical) + 1`
  2. On receive: `physical = max(localPhysical, receivedPhysical)`
  3. `logical = max(localLogical, receivedLogical) + 1`
- Guarantees: causal ordering + bounded divergence from physical time

**Mesh Time Sync Protocol:**
```
Periodic (every 30s):
  1. Leader election: lowest MAC → time master
  2. Master broadcasts: TimeSync{hlc, physicalTime, uncertainty}
  3. Followers: adjust local HLC, estimate offset
  4. Uncertainty propagation: ±(networkDelay/2 + clockDrift*interval)
```

**Clock Drift Model:**
- Android `System.currentTimeMillis()`: NTP-synced when online, drifts ~10-50 ppm offline
- 50 ppm = 4.3s/day drift
- HLC bounds: `|HLC.physical - trueTime| ≤ uncertainty`
- Uncertainty grows: `uncertainty += driftRate * interval + networkJitter`

**TDMA Scheduling (for LoRa/Bluetooth):**
- Time divided into slots (100ms)
- Slot assignment: `slot = (HLC.physical / 100) % numSlots`
- Guard time: 10ms (accounts for uncertainty)
- Collision avoidance: listen-before-talk in guard time

**Implementation:**
```kotlin
class MeshTimeSync {
    private var hlc = HLC(0, 0)
    private var uncertaintyMs = 0L
    private val driftRate = 50e-6  // 50 ppm
    
    fun onTimeSyncMsg(msg: TimeSync) {
        val now = System.currentTimeMillis()
        val networkDelay = now - msg.sendTime
        hlc = hlc.receive(msg.hlc, now)
        uncertaintyMs = max(uncertaintyMs, msg.uncertainty) + networkDelay/2
    }
    
    fun getCurrentHLC(): HLC {
        val now = System.currentTimeMillis()
        uncertaintyMs += driftRate * (now - lastUpdate)
        return hlc.tick(now)
    }
}
```

**Validation:** Simulate 100-node mesh, 10% GPS loss, measure max time divergence. Target: <1s after 24hr.

---