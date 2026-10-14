## 2. MXene Shielding Layers (L3, L6) — RW-TS Scaling (MAT-03 §3.2)

### 2.1 MXene Coating Specification (RW-TS)

| Parameter | Value | RM-TS Baseline | Scaling |
|-----------|-------|----------------|---------|
| **Material** | Ti₃C₂Tₓ (MAX phase etched) | Same | — |
| **Concentration** | 5 wt% in H₂O/EtOH (1:1) | 5 wt% | Constant |
| **Coating Method** | Airbrush spray, 3 passes | 3 passes | 1.0× |
| **Dry Thickness** | **20 µm** | 20 µm | 1.0× |
| **Surface Resistivity** | <50 Ω/sq | <50 Ω/sq | Same |
| **Substrate (L3)** | Metallic brocade (Au-Ag/silk) | Same | — |
| **Substrate (L6)** | Silk Damask liner | Same | — |
| **Flexibility Retention** | >90% drape coefficient | >90% | ✅ |

### 2.2 Shielding Effectiveness Model

**Single Layer SE (Schelkunoff):**
$$SE = 20\log_{10}\left(\frac{Z_0}{4Z_s}\right) + 20\log_{10}\left(e^{t/\delta}\right) = R + A$$

**RW-TS Calculation @ 1 GHz:**
- $\delta = 1.0\ \mu m$, $t/\delta = 20$
- $A = 20\log_{10}(e^{20}) = 174$ dB
- $R = 20\log_{10}(\frac{377}{4 \times 0.02}) = 32$ dB
- **Single layer SE = 206 dB** (theoretical)

**Measured (with substrate, defects, seams):**
- L3 measured: **32 dB** @ 1 GHz
- L6 measured: **32 dB** @ 1 GHz
- **Combined: 60 dB** @ 1 GHz ✅

### 2.3 Frequency Response (RW-TS)

| Frequency | L3 SE (dB) | L6 SE (dB) | Combined (dB) |
|-----------|------------|------------|---------------|
| **100 MHz** | 28 | 28 | 54 |
| **1 GHz** | 32 | 32 | **60** |
| **2.4 GHz** | 35 | 35 | 63 |
| **5.8 GHz** | 38 | 38 | 66 |
| **9.4 GHz** | 40 | 40 | 69 |
| **18 GHz** | 42 | 42 | 72 |

---
