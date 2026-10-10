# Future_Progress_Roadmap_P0_P3 — Piece 07/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 07 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# Mesh Network Vision — Traffic, Weather, Trajectory (P1)

## FP023: Traffic Advisory Relay
- **Category:** Network
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.96
- **Description:** Pass traffic info through vehicle chain — congestion, accidents, road closures
- **Dependencies:** Mesh protocol (FP007), message schema, TTL management
- **Success Criteria:** 3km+ range via 3-hop relay; <5s end-to-end latency
- **Blockers:** Latency budget; message prioritization; spam prevention
- **Notes:** Core vision from user — "Waze without cellular"

## FP024: Weather Advisory Relay
- **Category:** Network
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.96
- **Description:** Share weather through vehicle mesh — rain, ice, fog, wind
- **Dependencies:** Mesh protocol, weather data source (onboard sensors + relay)
- **Success Criteria:** Distributed weather map; hyperlocal (<100m resolution)
- **Blockers:** Data source quality; sensor calibration; complement to traffic

## FP025: Trajectory Sharing (Revisited)
- **Category:** Network
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.96
- **Description:** Fleet vehicles share predicted paths for collision avoidance
- **Dependencies:** Mesh protocol + BT 3D Spatial (azimuth/elevation), fleet opt-in
- **Success Criteria:** Path prediction 3s ahead; <50cm error at 2s horizon
- **Blockers:** Privacy concerns; requires fleet opt-in; bandwidth management

---

## Mesh Protocol Design (FP007 + FP023-025)

### Message Format
```json
{
  "type": "TRAFFIC|WEATHER|TRAJECTORY|HAZARD",
  "ttl": 3,
  "hop": 0,
  "origin_id": "device_hash",
  "timestamp": 1700000000,
  "payload": { ... },
  "signature": "ed25519(...)"
}
```

### Relay Rules
1. **TTL Decrement:** Each hop decrements TTL; drop at 0
2. **Deduplication:** Track seen message IDs (LRU cache, 1000 entries)
3. **Prioritization:** HAZARD > TRAJECTORY > TRAFFIC > WEATHER
4. **Rate Limiting:** Max 10 msg/s per peer; backoff on congestion

### Transport Options
| Transport | Range | Bandwidth | Power | Status |
|-----------|-------|-----------|-------|--------|
| Bluetooth Classic | 100m | 2 Mbps | Medium | Implemented (v1.0.86) |
| Wi-Fi Direct | 200m | 250 Mbps | High | Planned |
| BLE Mesh | 50m | 1 Mbps | Low | P3 (FP013) |
| LoRa (external) | 5km | 50 kbps | Low | Future |

---

## FP026: EKF Velocity Bug Fix — COMPLETED
- **Category:** Positioning
- **Priority:** P0 | **Effort:** 5 min | **Target:** v1.0.92
- **Description:** Fix vy initialization in PositionEKF.java:38
- **Bug:** `x[2]=0; x[2]=0;` (vy set twice, vz never initialized)
- **Fix:** `x[2]=0; x[3]=0;` (vx=0, vy=0, vz=0)
- **Status:** DONE in v1.0.92 (pre-built APK exists)
- **Impact:** EKF velocity estimates now correct; was causing drift

---

*End of Piece 07/13 — See Piece 08 for Visualization Polish items*