# Future_Progress_Roadmap_P0_P3 — Piece 10/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 10 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# Network/Mesh Deep Dive — Protocol, Relay, Fleet (FP007, FP022-FP025)

## FP007: Mesh Network Protocol — Full Specification

### Design Goals
1. **Decentralized** — No central server; pure peer-to-peer
2. **Low Latency** — <200ms per hop for safety messages
3. **Bandwidth Efficient** — <1KB/message; batch non-critical
4. **Resilient** — Handle churn (vehicles entering/leaving range)
5. **Secure** — Message authentication, replay protection

### Protocol Stack
```
┌─────────────────────────────────────┐
│         Application Messages        │  (Traffic, Weather, Hazard, Trajectory)
├─────────────────────────────────────┤
│         Mesh Routing Layer          │  (TTL, Hop Count, Deduplication)
├─────────────────────────────────────┤
│         Transport Abstraction       │  (BT Classic, Wi-Fi Direct, BLE)
├─────────────────────────────────────┤
│         Link Layer                  │  (Bluetooth RFCOMM, Wi-Fi Direct, BLE)
└─────────────────────────────────────┘
```

### Message Schema (Protocol Buffers for efficiency)
```protobuf
message MeshMessage {
  enum Type {
    TRAFFIC = 1;
    WEATHER = 2;
    HAZARD = 3;
    TRAJECTORY = 4;
    HEARTBEAT = 5;
    FLEET_KEY = 6;
  }
  
  Type type = 1;
  uint32 ttl = 2;              // Max 3 hops
  uint32 hop = 3;              // Current hop count
  string origin_id = 4;        // SHA-256 of device ID (privacy)
  int64 timestamp = 5;         // Unix ms
  bytes payload = 6;           // Type-specific protobuf
  bytes signature = 7;         // Ed25519(origin_priv, hash(payload))
}

message TrafficPayload {
  enum CongestionLevel { FREE=0; MODERATE=1; HEAVY=2; STOPPED=3; }
  CongestionLevel level = 1;
  double lat = 2;
  double lon = 3;
  double heading = 4;
  float speed_kph = 5;
  int32 length_m = 6;          // Jam length
}

message WeatherPayload {
  enum Condition { CLEAR=0; RAIN=1; SNOW=2; ICE=3; FOG=4; WIND=5; }
  Condition condition = 1;
  double lat = 2;
  double lon = 3;
  float intensity = 4;         // 0.0-1.0
  float temperature_c = 5;
  float wind_kph = 6;
}

message HazardPayload {
  enum Type { ACCIDENT=1; DEBRIS=2; CONSTRUCTION=3; POLICE=4; ANIMAL=5; }
  Type type = 1;
  double lat = 2;
  double lon = 3;
  int32 ttl_seconds = 4;       // Auto-expire
  int32 severity = 5;          // 1-5
  string description = 6;
}

message TrajectoryPayload {
  repeated TrajectoryPoint points = 1;  // Predicted path (next 10s)
  float confidence = 2;                  // 0.0-1.0
}

message TrajectoryPoint {
  double lat = 1;
  double lon = 2;
  float speed_kph = 3;
  float heading = 4;
  int64 offset_ms = 5;         // Time from now
}
```

### Relay Algorithm
```kotlin
class RelayEngine {
    private val seenMessages = LruCache<String, Boolean>(1000)
    private val peers = mutableMapOf<String, PeerState>()
    
    fun receive(message: MeshMessage, fromPeer: String) {
        val msgId = "${message.originId}_${message.timestamp}"
        
        // Deduplication
        if (seenMessages.get(msgId) != null) return
        seenMessages.put(msgId, true)
        
        // TTL check
        if (message.ttl == 0) return
        
        // Verify signature
        if (!verifySignature(message)) return
        
        // Increment hop, decrement TTL
        val forward = message.toBuilder()
            .setHop(message.hop + 1)
            .setTtl(message.ttl - 1)
            .build()
        
        // Broadcast to all peers except sender
        peers.values.filter { it.id != fromPeer }
            .forEach { it.send(forward) }
        
        // Deliver to local handlers
        deliverToHandlers(message)
    }
}
```

---

## FP022: Fleet Key System — Key Distribution

### Key Hierarchy
```
Root Fleet Key (held by fleet admin)
    │
    ├─► Vehicle Key 1 (derived, unique per vehicle)
    ├─► Vehicle Key 2
    └─► Vehicle Key N
```

### Provisioning Flow
1. Fleet admin generates root key in TGAPP
2. TGAPP derives per-vehicle keys (HKDF)
3. Keys distributed via QR code or NFC at onboarding
4. Vehicle stores key in Android Keystore (hardware-backed)
5. Key used to sign all mesh messages (proves fleet membership)

### Message Authentication
```kotlin
// Only vehicles with valid fleet key can send TRAJECTORY
fun verifyFleetMessage(message: MeshMessage): Boolean {
    val fleetPubKey = getFleetPublicKey()
    return verifyEd25519(fleetPubKey, message.payload, message.signature)
}
```

---

## FP023-FP025: Traffic/Weather/Trajectory Integration

### Data Fusion in PositioningService
```kotlin
class PositioningService {
    // Fuse mesh data with local positioning
    fun fuseMeshData(localPos: PositionEstimate, meshMessages: List<MeshMessage>): PositionEstimate {
        var fused = localPos
        
        for (msg in meshMessages) {
            when (msg.type) {
                TRAFFIC -> fused = fused.applyTrafficCorrection(msg.payload)
                WEATHER -> fused = fused.applyWeatherCorrection(msg.payload)
                TRAJECTORY -> fused = fused.applyTrajectoryPrediction(msg.payload)
            }
        }
        return fused
    }
}
```

### Privacy Model
- **No persistent identity** — origin_id rotates every 24h
- **No central logging** — mesh is ephemeral
- **Fleet opt-in** — trajectory sharing only within fleet
- **Data minimization** — only position + metadata, no PII

---

## Bandwidth & Power Analysis

| Message Type | Size | Frequency | Daily Data | Battery Impact |
|--------------|------|-----------|------------|----------------|
| Heartbeat | 64B | 10s | 550KB | Low |
| Traffic | 120B | 30s | 340KB | Low |
| Weather | 100B | 60s | 140KB | Low |
| Hazard | 150B | Event | <50KB | Negligible |
| Trajectory | 500B | 1s (fleet) | 43MB* | Medium |

*Fleet-only; typical user sends 0 trajectory messages.

---

*End of Piece 10/13 — See Piece 11 for Monetization/TGAPP deep dive*