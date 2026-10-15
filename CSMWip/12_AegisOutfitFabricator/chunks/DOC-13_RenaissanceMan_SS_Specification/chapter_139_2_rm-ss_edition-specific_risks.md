## 2. RM-SS Edition-Specific Risks

### 2.1 Risk Register

| Risk ID | Description | Likelihood | Impact | Score | Owner | Status |
|---------|-------------|------------|--------|-------|-------|--------|
| **RMSS-001** | Thermal margin exhaustion (1.2°C) | High | High | **20** | Thermal | **CRITICAL** |
| **RMSS-002** | L3/L6 MXene loading drift (7 wt% vs 5 wt%) | Medium | Medium | **12** | Materials | MITIGATING |
| **RMSS-003** | Zone-selective STF gap (Z4-Z6, Z8-Z12) | Medium | High | **15** | Ballistic | MITIGATING |
| **RMSS-004** | Baleen compression set (compact morphology) | High | Medium | **15** | Chassis | MONITORING |
| **RMSS-005** | MXene abrasion at high-flex seams | High | Medium | **15** | EMI | MITIGATING |
| **RMSS-006** | Aerogel dust migration (2mm thin) | Medium | Medium | **12** | Thermal | TESTING |
| **RMSS-007** | LES tension drift (525 N total) | Medium | Medium | **12** | Systems | MONITORING |
| **RMSS-008** | Transition time RM-SS→RM-SG marginal | Medium | Low | **8** | Operations | OPTIMIZING |

### 2.2 RMSS-001: Thermal Margin Exhaustion (CRITICAL)

**Description:** RM-SS interior temp 56.8°C vs 58°C limit — only 1.2°C margin

**Root Cause:** Aerogel reduced to 2mm (vs 3mm baseline) for mass savings

**Consequence:** 
- Any degradation (dust, compression, moisture) → thermal failure
- High ambient (>35°C) or high metabolic (>4 met) → exceed limit
- Directed energy adds thermal load

**Mitigation:**
1. **Aerogel Upgrade:** Pyrogel XTF (λ=0.012 W/m·K) → +0.5°C margin
2. **Operational Limit:** Max 30°C ambient, 3.5 met sustained — SOP update
3. **Real-time Monitor:** PVDF thermal telemetry → auto-alert at 55°C
4. **Variant RM-SS-03:** 3mm aerogel for hot climates — approved

**Burn-Down:** Pyrogel qualification Q1 2027; SOP update immediate

### 2.3 RMSS-002: MXene Loading Drift

**Description:** Production achieved 7 wt% MXene vs 5 wt% spec — improves SE but mass +0.04 kg/layer

**Impact:**
- Mass: +0.08 kg total (within 2% margin)
- SE: +2 dB margin (beneficial)
- Cost: +$1,200/garment (MXene cost)
- Flexibility: -6% drape retention (measured)

**Mitigation:**
- Tighten spec: 5.5 ± 0.5 wt% — process control
- Add PTFE topcoat to compensate flexibility
- Cost model update: absorb in unit cost

### 2.3 RMSS-003: Zone-Selective STF Gap

**Description:** STF only in Z1-Z3, Z7 — Z4-Z6, Z8-Z12 rely on neat silk + UHMWPE

**Risk:** Fragmentation/spall in non-STF zones at oblique angles

**Testing:**
- Oblique 30° 7.62 AP at Z4 (chest): BFS 44 mm (limit) — MARGINAL
- Multi-hit Z5 (waist): 2nd hit penetration — FAIL

**Mitigation:**
1. **STF Expansion:** Add Z4, Z5 (chest/waist) — +0.12 kg, +40% penetration resist
2. **Backup Tile Overlap:** Increase L7 overlap at Z4/Z5 from 2mm → 4mm
3. **Operational:** Avoid direct frontal exposure >30° — TTP update

**Decision:** STF expansion approved for Production Lot 2 (Q3 2026)

### 2.4 RMSS-004: Baleen Compression Set

**Description:** Compact morphology → higher baleen stress (28 MPa vs 22 MPa RM-TS) → faster creep

**Data:** 500-hr test: E-modulus loss 8% (vs 5% RM-TS)

**Mitigation:**
- Baleen hydration cycle: Weekly soak (Chapter 108) — recovers 60% creep
- Spare baleen kit: 4 stays/garment — field replaceable
- Steel boning supplement: Add 2 steel in Z3/Z4 — mass +0.04 kg

### 2.5 RMSS-005: MXene Abrasion

**Description:** High-flex seams (armhole, knee) — MXene delamination after 200 hr

**Data:** SE loss 8 dB @ 1 GHz after 200 hr flex cycling (armhole)

**Mitigation:**
- PTFE topcoat (5 µm) on L3/L6 at flex zones — SE loss <2 dB after 500 hr
- Conductive thread reinforcement at seams — maintains continuity
- Inspection: Monthly SE spot check at flex zones

### 2.6 RMSS-006: Aerogel Dust Migration

**Description:** 2mm aerogel — microperforation (50µm) allows silica dust migration into L6 MXene

**Risk:** MXene contamination → SE degradation; inhalation hazard during maintenance

**Mitigation:**
- Chiffon envelope upgrade: 2-layer (8 momme each) with 10µm pore — blocks dust
- HEPA vacuum protocol for maintenance
- PVDF sensor: Dust detection via acoustic signature

### 2.7 RMSS-007: LES Tension Drift

**Description:** 525 N total — lacing creep 3%/hr under load

**Data:** 8-hr mission: Tension drops 18% average (Z1-Z4 most critical)

**Mitigation:**
- SMA micro-tensioners at aglets (Chapter 37) — auto-compensate
- Lacing cord: Dyneema SK99 (creep <0.5%/hr) — qualified
- Operational: Re-tension at 4-hr mark (5 min) — SOP

### 2.8 RMSS-008: Transition Time Marginal

**Description:** RM-SS→RM-SG 62s mean, 2/5 trials >65s

**Root Cause:** LES verify (120s) serial with donning

**Optimization:** Parallel LES start during donning (firmware v2.1) — saves 30s
**Projected:** 45s mean, 0/5 >65s

### 2.9 Cross-References

- Chapter 138: System-level risks
- Chapter 140: FMEA
- Chapter 141: Critical risk deep dives
- Chapter 142: Burn-down plan
- Chapter 65: Aerogel spec
- Chapter 56: MXene loading
- Chapter 17/18: STF zone-selective
- Chapter 34-38: Baleen/LES
- Chapter 129: Transition optimization

---