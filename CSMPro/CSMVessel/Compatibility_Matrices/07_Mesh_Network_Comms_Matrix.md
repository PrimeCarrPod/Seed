# Compatibility Matrix 07 — Mesh Network Comms
## Cross-Vessel Mesh Communication & Data Bus Interoperability
**Scope:** Tadpole-01 through Tadpole-17 | **Category:** Communications | **Date:** 2026-08-11

---

## EXECUTIVE SUMMARY

This matrix evaluates the interoperability of mesh network communication systems across all 17 Tadpole Class vessels. The analysis covers FEATHER LoRa mesh nodes, S-Bus protocol, acoustic modems, data buses, and cybersecurity. All vessels share a common FEATHER LoRa mesh architecture with S-Bus protocol and HMAC-SHA256 authentication, enabling fleet-wide interoperability and ad-hoc mesh formation during Carrington-event RF degradation.

**Key Finding:** 94% of communication components are common across the fleet. The primary divergence occurs at the deep-submergence vessel (Tadpole-16) where underwater acoustic modem (AQ-001) bridges surface-to-subsurface mesh via buoy relay, and the high-capacity ferry (Tadpole-17) where dual FEATHER nodes provide offshore redundancy.

---

## COMPONENT INVENTORY

| Component | Part Number | Spec | Source |
|-----------|-------------|------|--------|
| FEATHER LoRa Node | CSMFAB0115 | 915 MHz, +22 dBm, FHSS, S-Bus | `CSMFAB0115` |
| Underwater Acoustic Modem | CSMFAB-AQ-001 | 6–12 kHz, 500m range, S-Bus acoustic | `CSMVessel-Charlemagne/` |
| PMMA POF Data Bus | CSMFAB-POF-001 | 1 mm core, 100 Mbps, 100m max | `CSMFAB-INCURSION/` |
| CAN-FD Bus | CSMFAB-CAN-001 | 2× shielded twisted pair, 5 Mbps | `CSMFAB059` |
| HMAC-SHA256 Crypto Engine | CSMFAB-CRYPTO-001 | 256-bit key, 128 message types | `CSMFAB-INCURSION/` Ep21 |
| S-Bus Protocol Stack | CSMFAB-SBUS-001 | 64–128 message types, 1 ms cycle | `CSMFAB-INCURSION/` Ep21 |
| AIS Receiver | CSMFAB-AIS-001 | Class A/B, 161.975/162.025 MHz | `CSMFAB0113` |

---

## VESSEL-BY-VESSEL COMPATIBILITY

| Vessel | FEATHER Node | Acoustic Modem | Data Bus | Crypto | AIS | Mesh Topology | Overall Rating |
|--------|--------------|----------------|----------|--------|-----|---------------|----------------|
| Tadpole-01 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-02 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-03 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-04 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-05 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-06 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-07 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-08 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-09 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-10 | 2×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Mesh | **B** |
| Tadpole-11 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-12 | 2×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Mesh | **B** |
| Tadpole-13 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | AIS-001 | Star/Mesh | **B** |
| Tadpole-14 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-15 | 1×0115 | None | POF-001, CAN-001 | CRYPTO-001 | None | Star/Mesh | **A** |
| Tadpole-16 | 2×0115 | AQ-001 | POF-001, CAN-001 | CRYPTO-001 | None | Mesh + Acoustic | **C** |
| Tadpole-17 | 2×0115 | None | POF-001, CAN-001 | CRYPTO-001 | AIS-001 | Mesh | **B** |

**Legend:**
- **A — Direct Fit:** Component interchangeable without modification.
- **B — Minor Mod:** Component requires additional mounting or firmware configuration.
- **C — Redesign Required:** Component incompatible without dedicated acoustic interface or buoy relay.
- **D — Incompatible:** Component fundamentally incompatible.

---

## MESH TOPOLOGY ANALYSIS

### Star Topology (Tadpole-01, -02, -03, -04, -05, -06, -07, -08, -09, -11, -14, -15)
- **Single FEATHER node** per vessel.
- **Range:** 500m line-of-sight, 200m urban canyon.
- **Fault tolerance:** Single node failure = vessel isolated from mesh.
- **Use case:** Low-density routes, single-vessel taxi operations.

### Mesh Topology (Tadpole-10, -12, -16, -17)
- **Dual FEATHER nodes** per vessel (port/starboard or bow/stern).
- **Range:** 500m per node, combined range 800m with relay.
- **Fault tolerance:** Single node failure = mesh re-routes via remaining node; no isolation.
- **Use case:** Heavy-lift routes, offshore operations, fleet coordination.

### Acoustic Mesh (Tadpole-16)
- **Surface FEATHER mesh** (915 MHz) + **subsurface acoustic mesh** (6–12 kHz).
- **Buoy relay:** Deployable surface buoy with dual-mode transceiver bridges RF-to-acoustic.
- **Range:** 500m RF, 500m acoustic (buoy relay extends to 1,500m).
- **Fault tolerance:** RF jam → acoustic mesh continues; acoustic jam → surface buoy returns to RF.
- **Use case:** Saturation diving operations, underwater infrastructure inspection.

---

## CYBERSECURITY COMPATIBILITY

| Security Feature | Implementation | Fleet Coverage | Vulnerability |
|------------------|----------------|----------------|---------------|
| HMAC-SHA256 Authentication | 256-bit key, 128 message types | 100% (all 17 vessels) | Key rotation required quarterly |
| Spoofed Waypoint Rejection | <50ms HMAC validation | 100% | Replay attack if key compromised |
| Jamming Resilience | Auto-route via alternate nodes | 100% | Protocol-level jamming requires >10W jammer at <100m |
| Acoustic Jamming Resistance | FHSS 6–12 kHz, 100 channels | Tadpole-16 only | Narrowband jamming (1–2 kHz) can degrade range |
| AIS Collision Avoidance | Class A/B receiver, 4s update | Tadpole-13, -17 | AIS spoofing (virtual AIS) requires visual confirmation |

---

## DATA BUS INTEROPERABILITY

| Bus | Standard | Max Length | Max Nodes | Vessel Compatibility |
|-----|----------|------------|-----------|---------------------|
| CAN-FD | ISO 11898-1 | 40m | 64 | 100% (all 17 vessels) |
| PMMA POF | IEC 60794-1 | 100m | 16 | 100% (all 17 vessels) |
| S-Bus over LoRa | Proprietary | 500m | 255 | 100% (all 17 vessels) |
| S-Bus over Acoustic | Proprietary | 500m | 32 | Tadpole-16 only |

---

## SUPPLY CHAIN DEPENDENCIES

| Component | Single Source Risk | Lead Time | Mitigation |
|-----------|-------------------|-----------|------------|
| CSMFAB0115 FEATHER Node | Low (in-house PCB assembly) | 4 weeks | In-house; 30-day safety stock |
| CSMFAB-AQ-001 Acoustic Modem | High (single supplier) | 20 weeks | Strategic partnership; 120-day safety stock |
| CSMFAB-POF-001 PMMA Fiber | Low (commercial fiber) | 2 weeks | Multi-source; 30-day safety stock |
| CSMFAB-CRYPTO-001 | Low (software-defined) | 0 (software) | Open-source core; 90-day key rotation schedule |

---

## RECOMMENDATIONS

1. **Standardize single-node architecture:** All vessels <12m should use 1× FEATHER node; reserve dual-node for vessels >12m or saturation-rated.
2. **Prototype CSMFAB-AQ-002:** Compact acoustic modem (50mm diameter) for micro-Tadpole variants; opens new underwater survey market segment.
3. **Implement mesh health monitoring:** Continuous RSSI/SNR logging on all FEATHER nodes; degraded link auto-triggers buoy deployment on Tadpole-16.
4. **Unify key management:** Implement CSMPro key distribution center (KDC) with quarterly HMAC-SHA256 key rotation; eliminates manual key entry errors.

---

*END OF COMPATIBILITY MATRIX 07 — MESH NETWORK COMMS*
