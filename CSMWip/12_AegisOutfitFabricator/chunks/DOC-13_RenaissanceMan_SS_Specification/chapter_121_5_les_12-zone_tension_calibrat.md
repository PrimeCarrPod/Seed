## 5. LES 12-Zone Tension Calibration (CSMFAB078-A §3.3, DOC-05 §4, SYNTH-01 §4.2)

### 5.1 Calibration Formula

**Base Equation (CSMFAB078-A Eq. 3.3.4):**
$$T_{z,e} = T_{z,ref} \times \left[1 + \alpha_e \times \beta_{z,RM}\right]$$

Where:
- $T_{z,ref}$ = RM-TS reference tension (N)
- $\alpha_e$ = morphology factor = **-0.15** (RM-SS)
- $\beta_{z,RM}$ = zone sensitivity factor (dimensionless)

### 5.2 RM-SS Zone Tension Table

| Zone | Anatomy | β_z,RM | RM-TS (N) | **RM-SS (N)** | Δ vs RM-TS | Hardware |
|------|---------|--------|-----------|---------------|------------|----------|
| **Z1** | Neck/Cervical | 0.80 | 55 | **50** | -9% | Collar baleen |
| **Z2** | Shoulder | 0.90 | 60 | **55** | -8% | Sleeve cap steel |
| **Z3** | Upper Torso | 1.00 | 65 | **60** | -8% | CF/SF baleen |
| **Z4** | Chest | 1.00 | 65 | **60** | -8% | CF baleen |
| **Z5** | Waist | 1.10 | 60 | **55** | -8% | Waistband steel |
| **Z6** | Hip | 1.10 | 55 | **50** | -9% | Hose side baleen |
| **Z7** | Deltoid | 1.00 | 50 | **45** | -10% | Sleeve cap steel |
| **Z8** | Forearm | 0.90 | 45 | **40** | -11% | Sleeve lower |
| **Z9** | Thigh | 0.80 | 40 | **35** | -12% | Hose front |
| **Z10** | Knee | 0.70 | 35 | **30** | -14% | Knee gusset steel |
| **Z11** | Calf | 0.60 | 30 | **25** | -17% | Hose lower |
| **Z12** | Ankle | 0.50 | 25 | **20** | -20% | Ankle facing |

**Total LES Tension:** 525 N (vs. 585 N RM-TS, 685 N RM-TG) — **10.3% reduction**

### 5.3 Zone Sensitivity Factor Derivation

$\beta_{z,RM}$ derived from **anthropometric scaling sensitivity**:

$$\beta_{z,RM} = \frac{\partial \ln T_z}{\partial \ln M} \approx \frac{\Delta T_z / T_z}{\Delta M / M}$$

Validated via FEA (DOC-05 §4.2) with 50 morphology samples:
- Upper body zones (Z1-Z4): β ≈ 0.8-1.0 (chest/shoulder dominate)
- Mid body zones (Z5-Z6): β ≈ 1.0-1.1 (waist/hip scale with girth)
- Extremity zones (Z7-Z12): β ≈ 0.5-1.0 (limbs scale less with torso)

### 5.4 Lacing Topology & Tension Distribution

**Center Front (8 eyelets):** Z1-Z4 tensions distributed:
$$T_{CF} = \sum_{z=1}^{4} T_{z} \cdot w_{z,CF}$$
Weights: $w_{1,CF}=0.15, w_{2,CF}=0.20, w_{3,CF}=0.35, w_{4,CF}=0.30$

**Side Seams (4+4 eyelets):** Z3, Z5, Z6:
$$T_{side} = 0.4 T_{Z3} + 0.35 T_{Z5} + 0.25 T_{Z6} = \textbf{55 N per eyelet}$$

**Hose Waist (Cartridge pleats, 20 eyelets):** Z5, Z6:
$$T_{hose} = 0.55 T_{Z5} + 0.45 T_{Z6} = \textbf{52 N per pleat}$$

### 5.5 Tension Verification Protocol

| Step | Method | Acceptance |
|------|--------|------------|
| 1 | Don garment, settle 5 min | — |
| 2 | Load cell at each lacing point | ±5% of target |
| 3 | PVDF telemetry (L11) cross-check | ±3% correlation |
| 4 | Wearer ROM test | No binding, full ROM |
| 5 | 1-hr wear, re-measure | Drift < 5% |

### 5.6 Dynamic Tension Adjustment

**Thermal Compensation (Keratin Tg ≈ 60°C):**
$$T_{z,hot} = T_{z,ambient} \times \left[1 - 0.15 \times \frac{T_{body} - 37}{23}\right]$$

At 60°C skin temp: tension drops ~15% → LES auto-tensions via STF hardening (L8)

**Activity Modulation:**
- **Static:** Baseline tensions
- **Dynamic (combat):** +15% Z1-Z4, +20% Z7 (STF activation)
- **Seated:** -20% Z5-Z6, -10% Z9-Z11

### 5.7 Cross-References

- CSMFAB078-A §3.3: LES calibration framework
- DOC-05 §4: Structural framework tensioning
- SYNTH-01 §4.2: Unified tension model
- MAT-02 §3-4: Baleen/steel force-displacement
- Chapter 39: Lacing topology Alcega+LES
- Chapter 95: LES zone verification post-donning

---
