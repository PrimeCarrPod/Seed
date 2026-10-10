# Future_Progress_Roadmap_P0_P3 — Piece 03/13
## Article A7: A7-07 — Future Progress Roadmap P0 P3
**Piece:** 03 of 13  
**Generated:** 2026-10-08 06:27:18 UTC

---

# P1 — High Priority (Should Have) — Network & Visualization

## FP007: Mesh Network Protocol
- **Category:** Network
- **Priority:** P1 | **Effort:** High | **Target:** v1.0.96
- **Description:** Vehicle-to-vehicle relay protocol with TTL, hop count, and message deduplication
- **Dependencies:** New protocol module, Bluetooth/ Wi-Fi Direct transport
- **Success Criteria:** Multi-hop delivery verified at 3+ hops; <200ms per hop
- **Blockers:** Protocol design complexity; collision avoidance in dense scenarios
- **Notes:** P1-05 from master list; core vision for traffic advisory relay

## FP008: Offline Map Caching
- **Category:** Visualization
- **Priority:** P2 | **Effort:** Medium | **Target:** v1.0.96
- **Description:** Cache Mapbox/OSM vector tiles for offline use with automatic expiry
- **Dependencies:** New cache module, storage quota management
- **Success Criteria:** Works without internet; cache <500MB for city area
- **Blockers:** Storage limits on low-end devices; tile licensing
- **Notes:** P2-01 from master list; critical for tunnel/parking garage scenarios

## FP009: Hazard Reporting (NOTAM-style)
- **Category:** Visualization
- **Priority:** P2 | **Effort:** Medium | **Target:** v1.0.96
- **Description:** User-reported hazards with TTL, severity, and community verification
- **Dependencies:** New reporting module, moderation backend
- **Success Criteria:** Community hazards visible within 30s; <5% false positive rate
- **Blockers:** Moderation needed; spam/abuse prevention
- **Notes:** P2-02 from master list; NOTAM = Notice to Airmen concept adapted for roads

## FP010: Voice Announcements (TTS)
- **Category:** Visualization
- **Priority:** P2 | **Effort:** Low | **Target:** v1.0.95
- **Description:** Text-to-Speech for "Hazard ahead", "Vehicle approaching", "Lane change recommended"
- **Dependencies:** Android TextToSpeech API, voice selection
- **Success Criteria:** Hands-free alerts work at 60mph; <500ms latency
- **Blockers:** Voice quality on older devices; language support
- **Notes:** P2-03 from master list; accessibility + safety feature

---

## Network Evolution Context (Forensic)

| Version | Network Features | Key Milestone |
|---------|-----------------|---------------|
| v1.0.0 | None | Standalone |
| v1.0.3 | Wi-Fi scan | Real AP detection |
| v1.0.48 | BLE scan | Beacon detection |
| v1.0.65 | BT restart cycle | 5s crash recovery |
| v1.0.86 | BT 3D Spatial | Azimuth/elevation |
| v1.0.90 | 6-algo fusion | Multi-source positioning |
| v1.0.91 | Auto-update | Self-updating APK |

**Next:** Mesh protocol (FP007) transforms from centralized to distributed.

---

*End of Piece 03/13 — See Piece 04 for P2 Visualization & P3 Network items*