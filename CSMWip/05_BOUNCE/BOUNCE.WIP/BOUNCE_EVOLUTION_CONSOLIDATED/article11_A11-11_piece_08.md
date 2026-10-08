# Future_Thoughts_Evaluations_Vision — Piece 08/13
## Article A11: A11-11 — Future Thoughts Evaluations Vision
**Piece:** 08 of 13  
**Generated:** 2026-10-08 22:03:13 UTC

---

# Standards Compliance: V2X & Global Alignment

## FT016 — SAE J2735 / J2945 Compliance (Standards)

**Hypothesis:** Interop with auto industry  
**Feasibility:** High | **Potential Impact:** High - certification  
**Risks:** Spec complexity | **Related Work:** SAE standards  
**Validation Approach:** Join working group | **Timeline:** 12+ months | **Status:** Future  

**SAE J2735 (2024):** Defines V2X message sets (BSM, MAP, SPAT, RSM, etc.). Mandatory for US V2X deployment (FCC 5.9 GHz ruling). Bounce currently uses proprietary JSON over mesh. J2735 compliance enables interop with OEM vehicles (Ford, GM, Toyota V2X-equipped).

**Key Messages for Bounce:**
| Message | J2735 Name | Bounce Equivalent | Use Case |
|---------|------------|-------------------|----------|
| BSM | Basic Safety Message | Beacon broadcast | Position, speed, heading, size |
| MAP | Map Data | Intersection geometry | Lane-level routing |
| SPAT | Signal Phase & Timing | Traffic light state | Green wave optimization |
| RSM | Road Side Alert | Hazard polygon | Work zone, incident |
| TIM | Traveler Info | Fleet broadcast | Weather, congestion |

**BSM Encoding (UPER - Unaligned Packed Encoding Rules):**
```asn1
BasicSafetyMessage ::= SEQUENCE {
    msgCnt        MsgCount (0..127),
    id            VehicleID OCTET STRING (SIZE(4)),
    secMark       MinuteOfTheYear (0..527040),
    lat           Latitude (-900000000..900000000),
    long          Longitude (-1799999999..1800000000),
    elev          Elevation (-4096..61439),
    accuracy      PositionalAccuracy,
    transmission  TransmissionState,
    speed         Speed (0..8191),
    heading       Heading (0..28800),
    angle         SteeringWheelAngle (-126..127),
    accelSet      AccelerationSet4Way,
    brakes        BrakeSystemStatus,
    size          VehicleSize,
    vehicleClass  VehicleClassification
}
```

**Integration Path:**
1. Add `asn1c` (ASN.1 compiler) to NDK build → generates C encoder/decoder
2. JNI wrapper: `J2735Encoder.encodeBSM(Beacon) → byte[]`
3. Mesh payload: `J2735_HEADER(0x01) + UPER_ENCODED_BSM`
4. Receive: Detect J2735 header → decode → map to internal Beacon model
5. Coexist: Proprietary JSON for Bounce-to-Bounce; J2735 for V2X radio

**Certification:** OmniAir (authorized test lab). Test plan: 200+ test cases. Cost: ~$50k. Timeline: 6 months prep + 2 months testing.

**Strategic Value:** 
- Eligible for US DOT V2X deployment funding ($100M+ program)
- OEM partnership: pre-install Bounce on V2X-equipped vehicles
- Regulatory moat: compliance becomes barrier to entry

---

## FT017 — ETSI ITS-G5 / C-V2X Alignment (Standards)

**Hypothesis:** Global deployment ready  
**Feasibility:** Medium | **Potential Impact:** High - regulation  
**Risks:** Regulatory | **Related Work:** ETSI/3GPP  
**Validation Approach:** Regulatory review | **Timeline:** 2+ years | **Status:** Future  

**European Standards (ETSI ITS-G5):**
- ETSI EN 302 637-2: BSM equivalent (CAM - Cooperative Awareness Message)
- ETSI EN 302 637-3: MAP/SPAT equivalent (DENM - Decentralized Environmental Notification)
- ETSI TS 102 894: Application layer (facilities layer)
- Frequency: 5.9 GHz (same as US), 30-50 MHz channels

**C-V2X (Cellular V2X) - 3GPP Rel-14/15/16:**
- PC5 interface (direct device-to-device, no cell tower)
- Uu interface (network-assisted)
- Messages: CAM, DENM, MAPEM, SPATEM (ETSI) or SAE J2735 over LTE/5G
- Mode 3 (scheduled by network) + Mode 4 (autonomous)

**Bounce Dual-Stack Strategy:**
```
Application Layer (Bounce)
    │
    ├─→ SAE J2735 Encoder → US V2X Radio (5.9 GHz DSRC/C-V2X)
    │
    └─→ ETSI ITS Encoder → EU V2X Radio (5.9 GHz ITS-G5/C-V2X)
```

**Regulatory Landscape:**
| Region | Standard | Frequency | Mandate | Timeline |
|--------|----------|-----------|---------|----------|
| US | SAE J2735 + FCC 5.9 GHz | 5.85-5.925 GHz | Voluntary (FCC 2020) | 2025+ deployment |
| EU | ETSI ITS-G5 / C-V2X | 5.875-5.905 GHz | C-ITS Delegated Act | 2025+ mandatory |
| China | GB/T 37144 (C-V2X) | 5.9 GHz | National standard | 2024+ deployment |
| Japan | ARIB STD-T109 (DSRC) | 760 MHz | ITS Connect | 2020+ deployed |

**Implementation Priority:**
1. SAE J2735 (US market, largest TAM)
2. ETSI CAM/DENM (EU market, regulatory push)
3. C-V2X PC5 (global convergence, 5GAA alignment)
4. China GB/T (separate build variant)

**Key Technical Difference:** 
- DSRC/ITS-G5: CSMA/CA (contention-based, latency varies)
- C-V2X Mode 4: Sensing-based semi-persistent scheduling (deterministic latency)
- Bounce mesh must adapt MAC layer per radio type

**Action Item:** Join 5GAA (5G Automotive Association) for C-V2X testbed access.

---