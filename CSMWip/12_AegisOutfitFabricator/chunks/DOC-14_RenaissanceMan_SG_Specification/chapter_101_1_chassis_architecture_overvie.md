## 1. Chassis Architecture Overview (DOC-05, MAT-02, SYNTH-02 §2 Row 10)

The RM-SG structural chassis employs a **full hybrid baleen/steel framework** matching the RM-TS baseline for the broad morphology. Total chassis mass: **1.24 kg** (7.2% of system mass).

### 1.1 Component Summary

| Component | RM-TS Count | **RM-SG Count** | RM-TG Count | Material | Spec Reference |
|-----------|-------------|-----------------|-------------|----------|----------------|
| **Vertical Baleen Stays** | 24 | **24** | 30 | Keratin (E=4.2 GPa hydrated) | MAT-02 §3 |
| **Horizontal Baleen Hoops** | 0 | **0** | 0 | N/A (male edition) | — |
| **Steel Spiral Boning** | 12 | **12** | 18 | Spring steel (E=200 GPa) | MAT-02 §4 |
| **Steel Hoop Wire** | 0 | **0** | 0 | N/A | — |
| **MAX Phase Aglets** | 28 | **28** | 36 | Ti₃AlC₂ ceramic-metal | MAT-02 §5 |
| **Brass Eyelets** | 28 | **28** | 36 | CuZn37 (K_t=3 managed) | MAT-02 §6 |

### 1.2 Chassis Layout (Alcega Pattern Lines)

The chassis follows **Juan de Alcega's 1589 pattern lines** for structural integration:

**Doublet Chassis (16 baleen stays + 10 steel boning):**
- **Center Front (CF):** 2 baleen stays (left/right of lacing)
- **Side Front (SF):** 2 baleen stays (princess seam line)
- **Center Back (CB):** 1 baleen stay (Watteau pleat center)
- **Side Back (SB):** 2 baleen stays (back princess seam)
- **Underarm/Sleeve Cap:** 4 steel spiral boning (2 per arm)
- **Collar:** 2 baleen stays (stand collar structure)
- **Peplum Attachment:** 4 baleen stays (hip level, doublet-to-hose transition)
- **Chest/Bust Expansion:** 2 baleen stays (anterior lateral, accommodate girth)
- **Waist Reinforcement:** 2 steel spiral boning (waistband support)

**Hose Chassis (8 baleen stays + 2 steel boning):**
- **Front Leg:** 2 baleen stays (anterior thigh)
- **Back Leg:** 2 baleen stays (posterior thigh/gluteal)
- **Side Leg:** 2 baleen stays (lateral thigh, hose-to-doublet)
- **Hip Expansion:** 2 baleen stays (accommodate broad hips)
- **Knee Articulation:** 2 steel spiral boning (hinge zone)

### 1.3 Load Path Analysis

**Primary Load Paths:**
1. **Vertical (Gravity):** Ceramic tiles (L2/L7) → STF layers (L8/L9) → Baleen stays → Lacing → Body
2. **Lateral (Ballistic):** Tile impact → MXene gasket → STF hardening → Baleen columns → Lacing
3. **Thermal Expansion:** Aerogel (L5) → Ceramic constraint → Baleen compliance (keratin Tg ≈ 60°C)
4. **EMI Current:** L3/L4/L6 MXene → Conductive thread → Aglets → Ground

**Stress Distribution (FEA Validated):**
- Max baleen stress: 35 MPa (vs. 140 MPa yield) — SF = 4.0
- Max steel boning stress: 480 MPa (vs. 1200 MPa yield) — SF = 2.5
- Lacing tension per eyelet: 65 N (28 eyelets × 65 N = 1820 N total)
- Eyelet stress concentration: K_t = 3 managed via brass reinforcement

### 1.4 Manufacturing Integration

| Step | Process | Tolerance | Equipment |
|------|---------|-----------|-----------|
| 1 | Baleen channel stitching (ISO 300, 20 SPI) | ±0.5 mm position | Hand/backstitch |
| 2 | Baleen insertion (hydrated, 40°C) | Full seating | Manual |
| 3 | Steel boning insertion | ±1 mm alignment | Manual |
| 4 | Eyelet setting (brass, 6 mm flange) | Flush ±0.2 mm | Hand press |
| 5 | MAX phase aglet press-fit | 0.05 mm interference | Arbor press |
| 6 | MXene thread integration | Continuous path | Conductive stitch |

### 1.5 Cross-References

- DOC-05 §3: Structural framework specification
- MAT-02 §3: Baleen material properties
- MAT-02 §4: Steel spiral boning properties
- MAT-02 §5: MAX phase aglet specification
- MAT-02 §6: Brass eyelet specification
- SYNTH-02 §2 Row 10: AIMES L10 chassis mapping
- CSMFAB078-A §3.3: LES zone tension calibration
- DRAFT-01 §5: Alcega structural lines

---
