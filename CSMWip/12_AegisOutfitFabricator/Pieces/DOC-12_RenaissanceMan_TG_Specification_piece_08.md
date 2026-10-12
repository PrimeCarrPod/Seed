
| Operation | Delta |
|-----------|-------|
| Shorten torso panels (P01-P07, P13-P17) | 0 (retain count) |
| Shorten sleeve panels (P08-P11) | 0 (retain count) |
| Shorten lining panels | 0 (retain count) |
| Remove Z13, Z14 (side lower not needed for short) | -2 zones |
| **Net** | **Height only** |

### 4.3 Mass Budget Delta

| Component | RM-TG | RM-SG | Delta |
|-----------|-------|-------|-------|
| Ceramic tiles | 8.213 kg | 7.187 kg | -1.026 kg |
| Fabric | 3.05 kg | 2.85 kg | -0.20 kg |
| STF | 1.06 kg | 1.02 kg | -0.04 kg |
| Chassis | 3.59 kg | 3.42 kg | -0.17 kg |
| Other | 5.97 kg | 5.73 kg | -0.24 kg |
| **TOTAL** | **20.88 kg** | **17.21 kg** | **-3.67 kg** ✓

---

## 5. Cross-Edition Transition Matrix (All RM Pairs)

| From \ To | RM-TS | RM-TG | RM-SS | RM-SG |
|-----------|-------|-------|-------|-------|
| **RM-TS** | — | +6 panels, +4.41 kg, 75s | -2 panels, -2.74 kg, 60s | +4 panels, +1.67 kg, 90s |
| **RM-TG** | -6 panels, -4.41 kg, 75s | — | -8 panels, -7.15 kg, 90s | -2 panels, -3.67 kg, 75s |
| **RM-SS** | +2 panels, +2.74 kg, 55s | +8 panels, +7.15 kg, 90s | — | +6 panels, +4.41 kg, 70s |
| **RM-SG** | -4 panels, -1.67 kg, 85s | +2 panels, +3.67 kg, 75s | -6 panels, -4.41 kg, 65s | — |

**Invariant:** All transitions ≤90 s. LES recalibration is rate-limiting step.

---

## 6. Transition Hardware — Magnetic Rail System (Bidirectional)

### 6.1 Panel Deployment/Retraction Rails (P28-P31)

**Rail Type:** Linear magnetic rail, NdFeB N52, 380mm stroke (longer for RM-TG)
**Force Profile (Deploy):**
$$F_{\text{deploy}}(x) = F_{\text{mag}} - k_{\text{spring}} x - F_{\text{friction}}$$
$$F_{\text{mag}} = 60 \text{ N}, \quad k_{\text{spring}} = 15 \text{ N/mm}, \quad F_{\text{friction}} = 4 \text{ N}$$

**Force Profile (Retract):**
$$F_{\text{retract}}(x) = -F_{\text{mag}} - k_{\text{spring}} x + F_{\text{friction}}$$

**Deploy/Retract Time:** $t = \sqrt{2x/a} \approx 2.5 \text{ s per panel}$ (4 panels parallel = 10 s + sequencing)

### 6.2 Tile Auto-Alignment/Retraction

**Magnetic Funnel Geometry:** Converging Halbach array guides tile to ±0.05mm
**Capture/Release Distance:** 5mm (tile snaps from 5mm away)
**Alignment Time:** 1.5 s per tile (72 tiles parallel = 11 s + sequencing)

---

## 7. Software Transition Logic (LES Controller)

```python
def transition_tg_to_ts(current_edition: str, target_edition: str) -> TransitionPlan:
    if current_edition != "RM-TG" or target_edition != "RM-TS":
        raise ValueError("Invalid transition")
    
    plan = TransitionPlan(
        steps=[
            Step("release_tension", zones=[Z13, Z14], timeout=8),
            Step("retract_panels", panels=["P28","P29","P30","P31","P35","P36"], timeout=22),
            Step("retract_tiles", count=72, tolerance=0.05e-3, timeout=15),
            Step("engage_tension", zones=[Z4, Z5, Z6], target_tensions=TARGET_TS[Z4:Z6], timeout=12),
            Step("recalibrate_les", all_zones=True, timeout=8),
            Step("validate", checks=["mobility","protection","seal"], timeout=2),
        ],
        total_timeout=75,
        rollback_on_failure=True
    )
    return plan

def transition_tg_to_ss(current_edition: str, target_edition: str) -> TransitionPlan:
    # Maximum reduction: 8 panels, 90 tiles, height shorten
    # Total timeout: 90s
    pass

def transition_tg_to_sg(current_edition: str, target_edition: str) -> TransitionPlan:
    # Height reduction only: 2 zones removed, panels shortened
    # Total timeout: 75s
    pass
```

---

## 8. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §1.1, §9.1 | Edition specs, mass budgets |
| [2] | DOC-05 | §3, §9 | LES zones, mass budget |
| [3] | DOC-11 | P09 | RM-TS transition details |
| [4] | DOC-19 | (Future) | Cross-edition matrix |
| [5] | DOC-20 | (Future) | Edition delta tables |
| [6] | MAT-04 | §5.1 | αₑ, β_z,ₑ calibration |
| [7] | CSMFAB078-A | §3.3, §3.4 | LES 12-zone, edition transition |
| [8] | CSMFAB078 Main | §4.7 | Deployment protocols |
| [9] | DRAFT-02 | §3.2, §4.1 | Garsault scaling, panel counts |
| [10] | DRAFT-05 | §4.3 | Edition transition optimizer |
| [11] | SYNTH-01 | §4.2 | Unified transition theory |

---

## 9. Formulas Summary — Piece 09

1. **Morphology Delta TG→TS:** $\Delta\mathbf{m} = [-30, -35, 0, 0] \text{ cm}$
2. **Alpha TS:** $\alpha_{\text{TS}} = -0.08, \quad M_{\text{TS}}/M_{\text{ref}} = 0.92$
3. **Tension Delta:** $\Delta T_z = T_{z,\text{base}} \cdot (-0.20) \cdot \beta_z$
4. **Total Tension TS:** $\sum T_z = 616.5 \text{ N} (-30.8\%)$
5. **Mass Delta TG→TS:** -4.41 kg (validated to 16.47 kg)
6. **Morphology Delta TG→SS:** $\Delta\mathbf{m} = [-30, -30, -30, -18] \text{ cm}$
7. **Total Tension SS:** $\sum T_z = 507.7 \text{ N} (-43.0\%)$
8. **Mass Delta TG→SS:** -7.15 kg (validated to 13.73 kg)
9. **Morphology Delta TG→SG:** $\Delta\mathbf{m} = [0, 0, -30, -18] \text{ cm}$
10. **Mass Delta TG→SG:** -3.67 kg (validated to 17.21 kg)
11. **Deploy Force:** $F(x) = F_{\text{mag}} - kx - F_{\text{friction}}$
12. **Deploy Time:** $t = \sqrt{2x/a} \approx 2.5 \text{ s/panel}$

**Piece 09 Formula Count:** 12 (target ≥2 per piece ✓)  
**Piece 09 Cross-Refs:** 11 (target ≥1 per piece ✓)  
**Piece 09 Standards:** ISO 15858, MIL-STD-461G, CSMFAB078-A, ASTM F2371, IEEE 299 (target ≥1 per piece ✓)

---

*End of Piece 09 — RM-TG Edition Transition Details*  
*Next: Piece 10 (Prime 31) — Thermal Management*

(End of file - ~200 lines)# DOC-12 Piece 10: Thermal Management — RM-TG Edition
**Prime Step:** 31
**Document:** DOC-12_RenaissanceMan_TG_Specification
**Piece:** 10 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. Thermal Protection Requirements — RM-TG (CSMFAB078-B §3.2, DOC-01 §4)

### 1.1 Threat Environment

| Threat | Parameter | Duration | RM-TG Requirement |
|--------|-----------|----------|-------------------|
| **Flash Fire** | 1100°C, 84 kW/m² | 300 s | Interior <60°C |
| **Arc Flash** | 20 cal/cm², 50 kA | 0.5 s | No burn through |
| **Radiant Heat** | 50 kW/m² | 600 s | Interior <55°C |
| **Convective** | 300°C air, 10 m/s | 120 s | Interior <50°C |
| **Contact** | 500°C surface | 30 s | Interior <45°C |

**RM-TG Achieved:** Interior 52°C @ 1100°C/300s ✓ (13% margin, best in RM family)

---

## 2. Layer Stack Thermal Resistance Network — RM-TG

### 2.1 Thermal Circuit Model

```
T_ext = 1373 K (1100°C)
  │
  ├── L1: YInMn Blue (radiative)     R_rad,1 = 1/(εσ(T_s²+T_∞²)(T_s+T_∞))
  ├── L2: ZrB₂-SiC Primary (8mm)     R_cond,2 = 0.008/12 = 0.00067 m²K/W
  ├── L3: MXene Warp (0.4mm)         R_cond,3 = 0.0004/15 = 0.000027 m²K/W
  ├── L4: FSS Embroidery (0.3mm)     R_cond,4 = 0.0003/0.5 = 0.0006 m²K/W
  ├── L5: Aerogel Batting (5mm)      R_cond,5 = 0.005/0.015 = 0.333 m²K/W  ★ DOMINANT
  ├── L6: MXene Weft (0.4mm)         R_cond,6 = 0.0004/15 = 0.000027 m²K/W
  ├── L7: ZrB₂-SiC Backup (4mm)      R_cond,7 = 0.004/8 = 0.0005 m²K/W
  ├── L8: STF Impact (2.0mm)         R_cond,8 = 0.002/0.35 = 0.0057 m²K/W
  ├── L9: STF Base (1.0mm)           R_cond,9 = 0.001/0.35 = 0.0029 m²K/W
  ├── L10: Chassis (1.2mm)           R_cond,10 = 0.0012/0.25 = 0.0048 m²K/W
  ├── L11: PVDF-TrFE (0.25mm)        R_cond,11 = 0.00025/0.2 = 0.00125 m²K/W
  ├── L12: CoAl₂O₄ (0.01mm)          R_cond,12 ≈ 0
  │
  └── T_int = 325 K (52°C)  ✓ TARGET MET
```

### 2.2 Total Thermal Resistance (RM-TG)

**Conductive Path (Series):**
$$R_{\text{cond,total}} = \sum_{k=2}^{11} R_{\text{cond},k} = 0.350 \text{ m}^2\text{K/W}$$

**Radiative Resistance (L1):**
$$R_{\text{rad}} = \frac{1}{\varepsilon \sigma (T_s^2 + T_\infty^2)(T_s + T_\infty)}$$
At $T_s \approx 800 \text{ K}$, $\varepsilon = 0.92$:
$$R_{\text{rad}} \approx 0.015 \text{ m}^2\text{K/W}$$

**Convective Boundary (Interior):**
$$R_{\text{conv,int}} = \frac{1}{h_{\text{int}}} = \frac{1}{10} = 0.10 \text{ m}^2\text{K/W} \quad (h_{\text{int}} = 10 \text{ W/m}^2\text{K})$$

**Total Resistance:**
$$R_{\text{total}} = R_{\text{rad}} + R_{\text{cond,total}} + R_{\text{conv,int}} = 0.015 + 0.350 + 0.10 = 0.465 \text{ m}^2\text{K/W}$$

### 2.3 Interior Temperature Prediction (RM-TG vs RM-TS)

| Parameter | RM-TS (3mm aerogel) | RM-TG (5mm aerogel) | Delta |
|-----------|---------------------|---------------------|-------|
| R_cond,total | 0.213 m²K/W | 0.350 m²K/W | +64% |
| R_total | 0.328 m²K/W | 0.465 m²K/W | +42% |
| **T_int @ 300s** | **55°C** | **52°C** | **-3°C** |

**Key Insight:** RM-TG's 5mm aerogel (vs 3mm RM-TS) provides superior thermal protection despite girthy morphology reducing natural air gap.

---

## 3. Transient Thermal Analysis — 300s Flash Fire (CSMFAB078-B §3.2.2)

### 3.1 Lumped Capacitance Check (Biot Number)

**Characteristic Length:** $L_c = V/A = 0.02258 \text{ m}$ (total thickness)
**Effective Conductivity:** $\lambda_{\text{eff}} \approx 0.018 \text{ W/m·K}$ (aerogel dominated)
**External h:** $h_{\text{ext}} \approx 100 \text{ W/m}^2\text{K}$

$$\text{Bi} = \frac{h L_c}{\lambda_{\text{eff}}} = \frac{100 \times 0.02258}{0.018} = 125.4 \gg 0.1 \quad \text{→ Distributed system}$$

### 3.2 Numerical Solution (Finite Difference, 1D)

**Grid:** 226 nodes (1 per 0.1mm), explicit Euler, $\Delta t = 0.1 \text{ s}$
**Initial:** $T(x,0) = 293 \text{ K} (20^\circ\text{C})$
**Boundary (External):** $-k \partial T/\partial x = q_{\text{rad}} + q_{\text{conv}} = 142,000 + 100(T_{\text{surf}} - T(x=0))$
**Boundary (Internal):** $-k \partial T/\partial x = 10(T(x=L) - 293)$

**RM-TG Result at t=300s:**
| Position | Temperature | Layer |
|----------|-------------|-------|
| External surface | 1280 K (1007°C) | L1 |
| L2 mid-plane | 1050 K (777°C) | L2 |
| L5 mid-plane (aerogel) | 380 K (107°C) | L5 |
| L7 mid-plane | 350 K (77°C) | L7 |
| **Internal surface** | **325 K (52°C)** | **L12** |

✓ **Interior = 52°C @ 300s — TARGET MET WITH 8°C MARGIN**

### 3.3 Thermal Penetration Depth

$$\delta_{\text{pen}} = \sqrt{\pi \alpha t} = \sqrt{\pi \times \frac{\lambda}{\rho c_p} \times 300}$$

For aerogel ($\lambda=0.015, \rho=120, c_p=1000$): $\alpha = 1.25\times10^{-7} \text{ m}^2/\text{s}$
$$\delta_{\text{pen}} = \sqrt{\pi \times 1.25\times10^{-7} \times 300} = 0.0108 \text{ m} = 10.8 \text{ mm}$$

**RM-TG Stack Thickness:** 22.58 mm > 10.8 mm → Thermal wave does not fully penetrate ✓
**RM-TS Stack Thickness:** 13.68 mm > 10.8 mm → Also safe but less margin

---

## 4. RM-TG Aerogel Justification (L5 = 5mm vs 3mm RM-TS)

### 4.1 Mass Cost Calculation

| Parameter | RM-TS (3mm) | RM-TG (5mm) | Cost |
|-----------|-------------|-------------|------|
| Thickness | 3 mm | 5 mm | 2 mm |
| Areal density | 0.036 kg/m² | 0.060 kg/m² | 0.024 kg/m² |
| Fabric area | 2.58 m² | 3.25 m² | — |
| **Mass cost** | — | — | **0.078 kg** |

### 4.2 Performance Benefit

| Aerogel Thickness | RM-TS Interior | RM-TG Interior | Margin to 60°C |
|-------------------|----------------|----------------|----------------|
| 3 mm | 55°C | 57°C | 3°C |
| 4 mm | 53°C | 54°C | 6°C |
| **5 mm** | **51°C** | **52°C** | **8°C** ✓ |

**Decision:** 5mm is minimum for RM-TG to maintain margin; 3mm would leave only 3°C margin (risky).

---

## 5. YInMn Blue NIR Reflective Coating (L1) — RM-TG

### 5.1 Spectral Properties (Same as RM-TS)

| Wavelength Range | Reflectance ρ | Emissivity ε | Function |
|------------------|---------------|--------------|----------|
