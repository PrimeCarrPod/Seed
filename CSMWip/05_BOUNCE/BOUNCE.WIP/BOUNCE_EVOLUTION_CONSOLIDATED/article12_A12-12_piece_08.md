# Forensic_Analysis_Data_91_Versions — Piece 08/13
## Article A12: A12-12 — Forensic Analysis Data 91 Versions
**Piece:** 08 of 13  
**Generated:** 2026-10-08 22:14:32 UTC

---

# Diff Analysis: Wi-Fi, BLE & Positioning Algorithm Evolution

## Wi-Fi Positioning Evolution

### Phase 1: Basic Scan (v1.0.0 — v1.0.3)
- **v1.0.0**: `WifiManager.startScan()` → `getScanResults()` → JS bridge
- **v1.0.3**: `WifiScanner` class with `ScanCallback` (API 23+)
  - Active vs passive scan mode
  - 2s minimum scan interval (throttling)
  - RSSI filter: min -90 dBm
  - Frequency/channel extraction

### Phase 2: Trilateration (v1.0.4 — v1.0.10)
- **v1.0.4**: `Trilateration.java` — Linear least squares
  - Input: 3+ APs with known positions (surveyed)
  - Model: `RSSI = P0 - 10*n*log10(d)` (log-distance path loss)
  - Solve: `Ax = b` via pseudo-inverse
  - Output: (x, y) + covariance estimate
- **v1.0.5**: Runtime permissions for Android 10+
- **v1.0.9**: SSID filter "Bounce_" + MAC OUI validation

### Phase 3: RTT / 802.11mc (v1.0.86 — v1.0.91)
- **v1.0.86**: `RttManager` integration
  - `RangingRequest` with `RangingResultCallback`
  - Distance = (TOF × c) / 2
  - Accuracy: ±1-2m (vs ±5-10m RSSI)
  - Requires: Wi-Fi RTT capable AP + Android 9+
- **v1.0.90**: RTT as primary algorithm when available
  - Weight: 0.5 (highest in fusion)
  - Fallback: RSSI trilateration

### Wi-Fi Code Metrics
| Version | Wi-Fi Lines | Scan Method | Positioning |
|---------|-------------|-------------|-------------|
| 1.0.0 | ~30 | startScan() | None (raw to JS) |
| 1.0.3 | ~80 | ScanCallback | Trilateration |
| 1.0.25 | ~95 | + throttling | + Sensor fusion |
| 1.0.48 | ~110 | + BLE coexist | + BLE RSSI |
| 1.0.79 | ~130 | + EKF input | + Kalman |
| 1.0.86 | ~180 | + RTT | + BT 3D |
| 1.0.91 | ~200 | + RTT primary | 6-algo fusion |

---

## BLE Evolution

### Phase 1: Stub (v1.0.47)
- `BleScanner.java` created (empty class)
- Preparation for Android 12+ Bluetooth permissions

### Phase 2: Scanning (v1.0.48 — v1.0.51)
- **v1.0.48**: Full `BluetoothLeScanner` implementation
  - `ScanFilter`: Service UUID 0xFEAA (Eddystone)
  - `ScanSettings`: SCAN_MODE_LOW_LATENCY
  - RSSI smoothing: EMA α=0.3
  - Deduplication: MAC+name key, 5s window
- **v1.0.49**: Background scan via `JobScheduler` + `PendingIntent`
- **v1.0.50**: GATT connection, service discovery
- **v1.0.51**: Auto-reconnect, 30s timeout

### Phase 3: Mesh Networking (v1.0.54 — v1.0.76)
- **v1.0.54**: `BluetoothLeAdvertiser` — mesh beacon broadcast
  - Interval: 100ms (configurable)
  - TX Power: -8 dBm (adjustable)
- **v1.0.56**: Bidirectional discovery (scan + advertise)
- **v1.0.57**: Mesh protocol v1
  - Packet: `{type, src, dst, ttl, payload}` JSON
  - TTL: 3 hops default
  - Relay: Flood with duplicate suppression (seq cache)
- **v1.0.65**: **Critical Fix** — BT 5-minute restart cycle
  - Bug: Adapter crash after ~4 hours (HCI resource leak)
  - Fix: Programmatic disable/enable + scanner restart

### Phase 4: BT 3D / Direction Finding (v1.0.86 — v1.0.91)
- **v1.0.86**: `Bt3DPositioning.java`
  - Bluetooth 5.1 Direction Finding (AoA/AoD)
  - CTE (Constant Tone Extension) parsing
  - IQ sample processing → phase difference → angle
  - Multi-antenna: 4+ antennas for 3D (azimuth + elevation)
  - Calibration: Known reference tags
- **v1.0.90**: BT 3D in algorithm fusion (weight 0.2)

### BLE Code Metrics
| Version | BLE Lines | Features |
|---------|-----------|----------|
| 1.0.47 | 5 (stub) | Class only |
| 1.0.48 | ~120 | Scan, filter, EMA, dedup |
| 1.0.50 | ~180 | + GATT connect |
| 1.0.57 | ~250 | + Mesh v1 |
| 1.0.65 | ~280 | + Restart cycle |
| 1.0.76 | ~300 | Stable mesh |
| 1.0.86 | ~450 | + BT 3D / AoA/AoD |
| 1.0.91 | ~500 | + Fusion integration |

---

## Positioning Algorithm Stack Evolution

### Algorithm 1: Trilateration (v1.0.4 — present)
- **Type**: Geometric (RSSI → distance → intersection)
- **Strengths**: Simple, no sensors needed, works with any Wi-Fi/BLE
- **Weaknesses**: Multipath, NLOS, log-distance model errors
- **Accuracy**: 5-15m typical
- **Code**: `Trilateration.java` ~150 lines

### Algorithm 2: Extended Kalman Filter (v1.0.79 — present)
- **Type**: Recursive Bayesian (linearized)
- **State**: [x, y, vx, vy] — 2D position + velocity
- **Process**: Constant velocity `F = [[1,0,dt,0],[0,1,0,dt],[0,0,1,0],[0,0,0,1]]`
- **Measurement**: Wi-Fi trilat + BLE RSSI + GPS (when available)
- **BUG**: `x[2]=0; x[2]=0;` (vy never init) — fixed v1.0.92
- **Accuracy**: 2-5m (with good measurements)
- **Code**: `PositionEKF.java` ~250 lines

### Algorithm 3: Particle Filter (v1.0.86 — present)
- **Type**: Sequential Monte Carlo (non-Gaussian, non-linear)
- **Particles**: 500 (adaptive: 200-1000)
- **Proposal**: Motion model (IMU) + measurement likelihood
- **Resampling**: Systematic, ESS threshold 0.5
- **Strengths**: Multi-modal, handles NLOS, non-linear
- **Weaknesses**: Compute heavy (~15ms/frame)
- **Code**: `ParticleFilter.java` ~300 lines

### Algorithm 4: Hidden Markov Model (v1.0.86 — present)
- **Type**: Discrete state estimation (room/floor/zone)
- **States**: Surveyed zones (room, hallway, stair, outdoor)
- **Observations**: Wi-Fi AP set + BLE beacons + barometer
- **Transitions**: Floor plan adjacency + motion model
- **Viterbi**: Most likely state sequence
- **Accuracy**: Zone-level (3-10m), floor detection 95%+
- **Code**: `HmmPositioning.java` ~200 lines

### Algorithm 5: Wi-Fi RTT (v1.0.86 — present)
- **Type**: Time-of-Flight (802.11mc)
- **Range**: 10-50m (AP dependent)
- **Accuracy**: ±1-2m (LOS), ±3-5m (NLOS)
- **Requirements**: RTT-capable AP + Android 9+ + location permission
- **Code**: `RttPositioning.java` ~150 lines

### Algorithm 6: Bluetooth 3D (v1.0.86 — present)
- **Type**: Phase-based Angle of Arrival/Departure (Bluetooth 5.1)
- **Principle**: `Δφ = 2πd sin(θ)/λ` → angle from phase difference
- **Hardware**: 4+ antenna array, CTE (Constant Tone Extension)
- **Output**: 3D position (x, y, z) + orientation
- **Accuracy**: ±0.5-1m (LOS, calibrated), ±2-3m (NLOS)
- **Code**: `Bt3DPositioning.java` ~400 lines

---

## Algorithm Fusion Architecture (v1.0.90+)

```java
// AlgorithmFusion.java
public class AlgorithmFusion {
    private static final double[] WEIGHTS = {
        0.15,  // Trilateration
        0.25,  // EKF (when fixed)
        0.20,  // Particle Filter
        0.10,  // HMM (zone)
        0.15,  // RTT
        0.15   // BT 3D
    };
    
    public FusedPosition fuse(List<AlgorithmResult> results) {
        // Availability check
        // Confidence weighting
        // Covariance intersection (for correlated estimates)
        // Output: position + covariance + contributing algorithms
    }
}
```

### Fusion Performance (Estimated from Code Analysis)

| Scenario | Best Single Algo | Fusion | Improvement |
|----------|------------------|--------|-------------|
| Outdoor (GPS+WiFi) | GPS (3m) | 2.1m | 30% |
| Indoor (WiFi+BLE) | EKF (4m) | 2.5m | 38% |
| Mall (RTT+BT3D) | RTT (1.5m) | 0.8m | 47% |
| Tunnel (IMU only) | Particle (12m drift) | 8m drift | 33% |
| Multi-floor | HMM (floor 95%) | Floor 98% | 3% |

---

## Sensor Fusion Integration

### IMU → Positioning Pipeline
```
Accel/Gyro/Mag (100Hz)
    ↓
Madgwick Filter (quaternion)
    ↓
Gravity removal → Linear acceleration
    ↓
Double integration → Δposition (drift: ~1%/distance)
    ↓
EKF/Particle Filter as PROCESS MODEL input
    ↓
Wi-Fi/BLE/RTT/BT3D as MEASUREMENT UPDATE
```

### Sensor Contribution by Version
| Version | Accel | Gyro | Mag | Baro | Usage |
|---------|-------|------|-----|------|-------|
| 1.0.15 | ✓ | | | | Orientation only |
| 1.0.16 | ✓ | ✓ | | | Complementary filter |
| 1.0.17 | ✓ | ✓ | | | Gyro integration |
| 1.0.18 | ✓ | ✓ | ✓ | | Madgwick (9-DoF) |
| 1.0.25 | ✓ | ✓ | ✓ | | Full fusion |
| 1.0.79 | ✓ | ✓ | ✓ | | EKF process model |
| 1.0.86 | ✓ | ✓ | ✓ | ✓ | Particle + BT3D + Baro |
| 1.0.91 | ✓ | ✓ | ✓ | ✓ | 6-algo + Baro floor |

---

## Key Diff Patterns in Positioning Code

### Most Changed Methods (by diff frequency)
| Method | Diffs | Versions | Nature |
|--------|-------|----------|--------|
| `onScanResult()` | 23 | 1.0.3-1.0.91 | Filter tuning, API updates |
| `trilaterate()` | 18 | 1.0.4-1.0.91 | Model params, weighting |
| `predict()` (EKF) | 12 | 1.0.79-1.0.91 | Matrix tuning |
| `update()` (EKF) | 11 | 1.0.79-1.0.91 | Measurement fusion |
| `bleScanCallback()` | 15 | 1.0.48-1.0.91 | Filter, background |
| `meshRelay()` | 9 | 1.0.57-1.0.91 | TTL, duplicate suppression |

### Stable Interfaces (zero diffs after introduction)
| Interface | Introduced | Stability |
|-----------|------------|-----------|
| `PositionProvider` | 1.0.79 | 100% (v1.0.79-91) |
| `AlgorithmResult` | 1.0.86 | 100% (v1.0.86-91) |
| `MeshPacket` | 1.0.57 | 100% (v1.0.57-91) |

---