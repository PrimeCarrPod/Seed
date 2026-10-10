# TGAPP_Monetization_Architecture — Piece 03/13
## Article A8: A8-08 — TGAPP Monetization Architecture
**Piece:** 03 of 13  
**Generated:** 2026-10-08 06:55:00 UTC

---

# Premium Features — Fleet Mesh Network (TG009-TG012)

## TG009: Fleet Mesh Network
- **Category:** Premium Features | **Priority:** P1 | **Effort:** High | **Target:** 1.0.96
- **Description:** Vehicle-to-vehicle relay for fleet operations (P1-05 from master list)
- **Dependencies:** Mesh protocol (FP007), TGAPP valid license
- **Architecture:**
  - Only enabled when `FeatureGate.isEnabled("mesh_premium")`
  - Uses Bluetooth Classic RFCOMM for relay (implemented v1.0.86)
  - TTL=3 hops, deduplication via LRU cache (1000 messages)
- **Fleet Value:** Works without cellular data; peer-to-peer in convoys

## TG010: Traffic Advisory Relay
- **Category:** Premium Features | **Priority:** P1 | **Effort:** High | **Target:** 1.0.96
- **Description:** Pass traffic info through vehicle chain (FP023)
- **Dependencies:** Fleet mesh (TG009), message schema
- **Message Type:** `TRAFFIC` (congestion level, location, heading, speed, jam length)
- **Core Vision:** "Waze without cellular" — user's original request
- **Relay Priority:** HIGH (safety-critical)

## TG011: Weather Advisory Relay
- **Category:** Premium Features | **Priority:** P1 | **Effort:** High | **Target:** 1.0.96
- **Description:** Share weather through vehicle mesh (FP024)
- **Dependencies:** Fleet mesh + onboard sensors (temp, pressure, humidity)
- **Message Type:** `WEATHER` (condition, intensity, temp, wind)
- **Value Add:** Hyperlocal weather (<100m resolution) from distributed sensors
- **Complement:** Traffic + Weather = complete situational awareness

## TG012: Trajectory Sharing
- **Category:** Premium Features | **Priority:** P1 | **Effort:** High | **Target:** 1.0.96
- **Description:** Fleet vehicles share predicted paths for collision avoidance (FP025)
- **Dependencies:** Fleet mesh + BT 3D Spatial (azimuth/elevation from v1.0.86)
- **Message Type:** `TRAJECTORY` (predicted points 10s ahead, confidence)
- **Privacy:** Fleet opt-in only; origin_id rotates every 24h
- **Safety:** Path prediction 3s ahead, <50cm error at 2s horizon

---

## Mesh Message Schema (Protocol Buffers)

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
  string origin_id = 4;        // SHA-256(device_id + salt), rotates daily
  int64 timestamp = 5;         // Unix ms
  bytes payload = 6;           // Type-specific protobuf
  bytes signature = 7;         // Ed25519(fleet_priv_key, hash(payload))
}

message TrafficPayload {
  enum CongestionLevel { FREE=0; MODERATE=1; HEAVY=2; STOPPED=3; }
  CongestionLevel level = 1;
  double lat = 2;
  double lon = 3;
  double heading = 4;
  float speed_kph = 5;
  int32 length_m = 6;
}

message WeatherPayload {
  enum Condition { CLEAR=0; RAIN=1; SNOW=2; ICE=3; FOG=4; WIND=5; }
  Condition condition = 1;
  double lat = 2;
  double lon = 3;
  float intensity = 4;
  float temperature_c = 5;
  float wind_kph = 6;
}

message TrajectoryPayload {
  repeated TrajectoryPoint points = 1;
  float confidence = 2;
}

message TrajectoryPoint {
  double lat = 1;
  double lon = 2;
  float speed_kph = 3;
  float heading = 4;
  int64 offset_ms = 5;
}
```

---

## Fleet Key Hierarchy (TG022)

```
Root Fleet Key (fleet admin in TGAPP)
    │
    ├─► Vehicle Key 1 (HKDF-SHA256, unique per vehicle)
    ├─► Vehicle Key 2
    └─► Vehicle Key N (max 10,000 per TG031)
```

- **Provisioning:** QR code or NFC at onboarding
- **Storage:** Android Keystore (hardware-backed)
- **Rotation:** Every 90 days (TG031 config)
- **Usage:** Sign all mesh messages (proves fleet membership)

---

*End of Piece 03/13 — See Piece 04 for Advanced Positioning & AR Premium Features*