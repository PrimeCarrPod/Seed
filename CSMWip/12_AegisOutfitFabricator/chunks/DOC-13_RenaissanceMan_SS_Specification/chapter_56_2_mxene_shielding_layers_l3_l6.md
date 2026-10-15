## 2. MXene Shielding Layers (L3, L6) — RM-SS Scaling (MAT-03 §3.2)

### 2.1 MXene Coating Specification (RM-SS)

| Parameter | Value | RM-TS Baseline | Scaling |
|-----------|-------|----------------|---------|
| **Material** | Ti₃C₂Tₓ (MAX phase etched) | Same | — |
| **Concentration** | 5 wt% in H₂O/EtOH (1:1) | 5 wt% | Constant |
| **Coating Method** | Airbrush spray, 3 passes | 5 passes | 0.6× |
| **Dry Thickness** | **20 µm** | 30 µm | 0.67× |
| **Surface Resistivity** | <50 Ω/sq | <30 Ω/sq | Thickness dep. |
| **Substrate (L3)** | Metallic brocade (Au-Ag/silk) | Same | — |
| **Substrate (L6)** | Silk Damask liner | Same | — |
| **Adhesion** | >5 N/mm (ASTM D3359) | >5 N/mm | ✅ |
| **Flexibility Retention** | >90% drape coefficient | >90% | ✅ |

### 2.2 Shielding Effectiveness Model

**Single Layer SE (Schelkunoff):**
$$SE = 20\log_{10}\left(\frac{Z_0}{4Z_s}\right) + 20\log_{10}\left(e^{t/\delta}\right) = R + A$$

Where:
- $Z_0 = 377\ \Omega$ (free space impedance)
- $Z_s = \sqrt{\frac{j\omega\mu}{\sigma}}$ (surface impedance)
- $t$ = thickness, $\delta = \sqrt{\frac{2}{\omega\mu\sigma}}$ (skin depth)
- $\sigma = 2.5 \times 10^6$ S/m (MXene conductivity)

**RM-SS Calculation @ 1 GHz:**
- $\delta = \sqrt{\frac{2}{2\pi \times 10^9 \times 4\pi \times 10^{-7} \times 2.5 \times 10^6}} = 1.0\ \mu m$
- $t/\delta = 20$
- $A = 20\log_{10}(e^{20}) = 174$ dB (absorption dominant)
- $R = 20\log_{10}(\frac{377}{4 \times 0.02}) = 32$ dB (reflection)
- **Single layer SE = 32 + 174 = 206 dB** (theoretical)

**Measured (with substrate, defects, seams):**
- L3 measured: **32 dB** @ 1 GHz
- L6 measured: **32 dB** @ 1 GHz
- **Combined (with coupling): 58.5 dB** @ 1 GHz

### 2.3 Frequency Response (RM-SS)

| Frequency | L3 SE (dB) | L6 SE (dB) | Combined (dB) | Standard |
|-----------|------------|------------|---------------|----------|
| **100 MHz** | 28 | 28 | 54 | MIL-STD-461G |
| **1 GHz** | 32 | 32 | **58.5** | MIL-STD-461G RS103 |
| **2.4 GHz** | 35 | 35 | 62 | IEEE 802.11 |
| **5.8 GHz** | 38 | 38 | 65 | ISM band |
| **9.4 GHz** | 40 | 40 | 68 | X-band radar |
| **18 GHz** | 42 | 42 | 71 | K-band |

---
