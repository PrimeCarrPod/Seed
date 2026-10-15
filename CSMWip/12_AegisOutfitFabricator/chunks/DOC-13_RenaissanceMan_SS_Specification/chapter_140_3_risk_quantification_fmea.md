## 3. Risk Quantification — FMEA (MIL-STD-1629, CSMFAB078 Main §6)

### 3.1 FMEA Methodology

**Risk Priority Number (RPN):**
$$RPN = \text{Severity} \times \text{Occurrence} \times \text{Detection}$$

**Scales (1-10):**
- **Severity (S):** 1=No effect, 10=Catastrophic (loss of life)
- **Occurrence (O):** 1=Remote (<0.1%), 10=Certain (>50%)
- **Detection (D):** 1=Certain detection, 10=No detection

**Risk Classification:**
- RPN ≥ 100: **CRITICAL** — Immediate action required
- RPN 50-99: **HIGH** — Action required before deployment
- RPN 20-49: **MEDIUM** — Action required before production
- RPN < 20: **LOW** — Monitor, document

### 3.2 RM-SS FMEA Summary (Top 20)

| Item | Function | Failure Mode | Effect | S | O | D | RPN | Action |
|------|----------|--------------|--------|---|---|---|-----|--------|
| 1 | Thermal Protection | Aerogel degradation | Interior >58°C | 9 | 6 | 4 | **216** | Pyrogel upgrade, monitor |
| 2 | Ballistic | STF gap Z4/Z5 | Penetration oblique | 9 | 5 | 5 | **225** | Expand STF zones |
| 3 | EMI Shielding | MXene abrasion | SE <50 dB | 8 | 7 | 4 | **224** | PTFE topcoat |
| 4 | Thermal | Aerogel dust | MXene contamination | 7 | 5 | 6 | **210** | Chiffon upgrade |
| 5 | Structural | Baleen compression | LES tension loss | 7 | 6 | 5 | **210** | Hydration cycle |
| 6 | Ballistic | Backup tile spall | Secondary injury | 8 | 4 | 6 | **192** | Overlap increase |
| 7 | EMI | MXene loading drift | Mass/Cost/SE change | 6 | 6 | 5 | **180** | Process control |
| 8 | Mobility | Tile articulation bind | ROM <70% | 7 | 5 | 5 | **175** | Gasket optimization |
| 9 | Thermal | L1 optical damage | NIR reflect <90% | 7 | 4 | 6 | **168** | Hardened coating |
| 10 | Operational | Transition time >65s | Mission delay | 5 | 6 | 5 | **150** | Parallel LES |
| 11 | Structural | Steel boning fatigue | Sudden bind | 6 | 4 | 7 | **168** | Inspection interval |
| 12 | EMI | FSS resonance shift | Bandstop fail | 7 | 4 | 6 | **168** | Geometry control |
| 13 | Thermal | L5 aerogel compression | R-value drop | 6 | 5 | 5 | **150** | Stiffness monitor |
| 14 | Ballistic | Ceramic edge chip | V₅₀ reduction | 7 | 5 | 5 | **175** | Edge chamfer QC |
| 15 | Structural | Aglet cleavage | Lacing failure | 8 | 3 | 7 | **168** | Material upgrade |
| 16 | EMI | PVDF fatigue | Telemetry loss | 5 | 5 | 6 | **150** | Life test |
| 17 | Operational | Donning >95s | Mission delay | 4 | 5 | 5 | **100** | Training |
| 18 | Structural | Silk seam failure | Catastrophic tear | 9 | 3 | 8 | **216** | SPI enforcement |
| 18 | Thermal | L7 backup delaminate | Thermal path | 7 | 4 | 6 | **168** | Adhesion QC |
| 19 | EMI | Seam MXene gap | Leakage >20 dB | 6 | 5 | 6 | **180** | Tape QC |
| 20 | Operational | Battery depletion | PVDF fail | 4 | 6 | 4 | **96** | Low-batt alert |

### 3.3 Critical Items (RPN ≥ 200) — Immediate Action

| Item | RPN | Action | Owner | Due | Status |
|------|-----|--------|-------|-----|--------|
| 2 (STF gap) | 225 | Expand STF to Z4,Z5 | Ballistic | Q3 2026 | APPROVED |
| 3 (MXene abrasion) | 224 | PTFE topcoat flex zones | Materials | Q1 2027 | IN PROGRESS |
| 1 (Thermal margin) | 216 | Pyrogel XTF qualification | Thermal | Q1 2027 | IN PROGRESS |
| 18 (Silk seam) | 216 | SPI 20 enforcement | Manufacturing | Immediate | ONGOING |
| 4 (Aerogel dust) | 210 | Chiffon 2-layer envelope | Materials | Q2 2027 | PLANNED |
| 5 (Baleen creep) | 210 | Hydration cycle + spares | Chassis | Immediate | ONGOING |

### 3.4 Risk Reduction Tracking

| Item | Initial RPN | Current RPN | Target RPN | Reduction % |
|------|-------------|-------------|------------|-------------|
| 1 | 216 | 216 | <100 | 0% |
| 2 | 225 | 225 | <100 | 0% |
| 3 | 224 | 224 | <100 | 0% |
| 4 | 210 | 210 | <100 | 0% |
| 5 | 210 | 210 | <100 | 0% |
| 6 | 192 | 192 | <100 | 0% |

**All critical items in mitigation phase — target RPN <100 by CDR (Q3 2026)**

### 3.5 Cross-References

- MIL-STD-1629: FMEA procedure
- CSMFAB078 Main §6: Risk management
- Chapter 138: System-level risks
- Chapter 139: RM-SS specific risks
- Chapter 141: Critical risk deep dives
- Chapter 142: Burn-down plan
- Chapter 137: Conformance (risk gates)

---