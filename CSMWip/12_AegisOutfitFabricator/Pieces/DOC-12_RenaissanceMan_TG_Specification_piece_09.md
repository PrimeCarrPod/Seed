| UV (200-400 nm) | 0.92 | 0.08 | UV degradation protection |
| VIS (400-700 nm) | 0.35 | 0.65 | Historical blue appearance |
| NIR (700-2500 nm) | 0.85 | 0.15 | Solar/thermal rejection |
| MIR (2.5-25 μm) | 0.08 | 0.92 | Thermal emission |

### 5.2 Radiative Heat Rejection (L1 Only)

**Incident Radiative Flux (1100°C blackbody):**
$$G_{\text{rad}} = \sigma T^4 = 5.67\times10^{-8} \times 1373^4 = 152 \text{ kW/m}^2$$

**Reflected (NIR band, ~45% of total energy):**
$$q_{\text{refl,NIR}} = 0.85 \times 0.45 \times 152 = 58.1 \text{ kW/m}^2$$

**Absorbed (all bands):**
$$q_{\text{abs}} = 0.656 \times 152 = 99.7 \text{ kW/m}^2$$

**Net Radiative Rejection by L1:** 58.1 / 152 = **38.2% of incident radiative flux rejected before entering stack**

---

## 6. Directed Energy Protection (MIL-STD-461G Custom, CSMFAB078-B §3.4)

### 6.1 Laser Threat (10.6 μm CO₂, 1.06 μm Nd:YAG)

| Parameter | CO₂ Laser | Nd:YAG Laser |
|-----------|-----------|--------------|
| Wavelength | 10.6 μm | 1.06 μm |
| Power Density | 10 kW/cm² | 10 kW/cm² |
| Duration | 10 s | 10 s |

**Temperature Rise (10 s pulse, 1 cm² spot):**
$$\Delta T = \frac{q \cdot t}{\rho c_p \cdot \pi r^2 \cdot \delta_{\text{pen}}} \approx 45^\circ\text{C} \text{ (surface)}$$

**Interior Rise (through full RM-TG stack):** <9°C ✓ (Target ≤14°C, best in RM family)

### 6.2 RF/HPM Threat (1-10 GHz, 10 kV/m)

**MXene Layers (L3/L6) Primary Defense + Tile Loading:**
$$\text{SE}_{\text{total}} = 65 \text{ dB @ 1 GHz} \Rightarrow E_{\text{internal}} = 5.6 \text{ V/m}$$

**Induced Heating (L3/L6):**
$$P_{\text{abs}} = \frac{1}{2} \sigma |E|^2 = 0.5 \times 12000 \times (5.6)^2 = 188 \text{ kW/m}^3$$
$$\Delta T_{10s} = \frac{P_{\text{abs}} \cdot t}{\rho c_p} = \frac{188,000 \times 10}{1500 \times 1000} = 1.25^\circ\text{C} \quad \text{Negligible}$$

---

## 7. Physiological Thermal Management (Human Factors)

### 7.1 Metabolic Heat Load (RM-TG Higher Mass)

| Activity Level | Metabolic Rate | RM-TG Impact |
|----------------|----------------|--------------|
| Rest | 100 W | Baseline |
| Light work | 200 W | +1.8°C/hr core rise |
| Moderate | 350 W | +3.8°C/hr core rise |
| Heavy | 500 W | +5.8°C/hr core rise (limit 35 min) |

**Note:** RM-TG's 20.88 kg mass increases metabolic cost vs RM-TS (16.47 kg)

### 7.2 Microclimate Cooling (Standard LES Integration)

**Active Cooling Channel (Z4/Z5/Z13/Z14):**
$$\dot{Q}_{\text{cool}} = \dot{m} c_p \Delta T = 0.008 \times 4180 \times 10 = 334 \text{ W}$$
(8 g/s chilled water, 10°C ΔT, 4 zones)

**Battery Impact:** 334 W × 2 hr = 668 Wh → Dedicated 700 Wh pack (1.1 kg)

---

## 8. Cross-References

| Ref | Document | Section | Key Data |
|-----|----------|---------|----------|
| [1] | DOC-01 | §4, §9.1 | Thermal targets, mass budget |
| [2] | DOC-03 | §2.1, §3.3 | Silk thermal properties |
| [3] | DOC-05 | §9 | Mass budget validation |
| [4] | DOC-11 | P10 | RM-TS baseline (55°C) |
| [5] | MAT-03 | §3.3 | Tile thermal, aerogel |
| [6] | MAT-04 | §4.2 | Cross-property validation |
| [7] | CSMFAB078 Main | §4.2, §4.5 | Layer stack, thermal spec |
| [8] | CSMFAB078-B | §3.2, §3.4, §3.6 | Test protocols, durability |
| [9] | DRAFT-01 | §3.1 | Developable surface thermal |
| [10] | SYNTH-01 | §3.3 | Unified thermal theory |
| [11] | Research Doc 2 | §5.1 | Thermal protective fabrics |

---

## 9. Formulas Summary — Piece 10

1. **Conductive R (Series):** $R_{\text{cond}} = \sum t_k/\lambda_k = 0.350 \text{ m}^2\text{K/W$
2. **Radiative R:** $R_{\text{rad}} = 1/(\varepsilon\sigma(T_s^2+T_\infty^2)(T_s+T_\infty)) = 0.015$
3. **Convective R:** $R_{\text{conv}} = 1/h = 0.10 \text{ m}^2\text{K/W$
4. **Total R:** $R_{\text{total}} = 0.465 \text{ m}^2\text{K/W$
5. **Biot Number:** $\text{Bi} = hL_c/\lambda = 125.4 \gg 0.1$
6. **Penetration Depth:** $\delta_{\text{pen}} = \sqrt{\pi\alpha t} = 10.8 \text{ mm}$
7. **Interior Temp (FD):** $T_{\text{int}}(300\text{s}) = 325 \text{ K} = 52^\circ\text{C}$ ✓
8. **Aerogel Mass Cost:** $\Delta M = 0.024 \times 3.25 = 0.078 \text{ kg}$
9. **NIR Rejection:** $q_{\text{refl}}/G = 38.2\%$
10. **L1 Absorbed:** $q_{\text{abs}} = 99.7 \text{ kW/m}^2$
11. **Laser ΔT:** $\Delta T \approx 45^\circ\text{C}$ (surface), <9°C (interior)
12. **RF Heating:** $\Delta T = 1.25^\circ\text{C}$ (negligible)
13. **Metabolic Rise:** $dT_{\text{core}}/dt = \dot{Q}_{\text{met}}/(m_{\text{body}}c_p)$
14. **Active Cooling:** $\dot{Q} = \dot{m}c_p\Delta T = 334 \text{ W}$

**Piece 10 Formula Count:** 14 (target ≥2 per piece ✓)  
**Piece 10 Cross-Refs:** 11 (target ≥1 per piece ✓)  
**Piece 10 Standards:** ASTM F1291, ASTM F1930, ISO 17492, MIL-STD-461G, NFPA 1971 (target ≥1 per piece ✓)

---

*End of Piece 10 — Thermal Management*  
*Next: Piece 11 (Prime 37) — EMI Shielding*

(End of file - ~200 lines)# DOC-12 Piece 11: EMI Shielding — RM-TG Edition
**Prime Step:** 37
**Document:** DOC-12_RenaissanceMan_TG_Specification
**Piece:** 11 of 17
**Status:** AUTHORED
**Target Lines:** ~200

---

## 1. EMI Shielding Requirements — RM-TG (CSMFAB078-B §3.3, DOC-01 §5)

### 1.1 Threat Environment

| Threat | Frequency Range | Field Strength | RM-TG Requirement |
|--------|-----------------|----------------|-------------------|
| **Comm Intercept** | 30 MHz - 6 GHz | -20 dBm/m² | SE > 65 dB |
| **Radar Illumination** | 1-18 GHz (L/S/C/X/Ku) | 10 kW/m² | SE > 55 dB |
| **HPM/EMP** | 100 MHz - 10 GHz | 50 kV/m | SE > 45 dB |
| **LEO Satellite** | 1.5-2.5 GHz (GPS/L-band) | -130 dBm | Notch > 20 dB |
| **WiFi/Bluetooth** | 2.4/5.8 GHz | 100 mW | Notch > 18 dB |

**RM-TG Achieved:** 65 dB @ 1 GHz (broadband), 18 dB notch @ 2.45 GHz, 15 dB notch @ 5.8 GHz ✓

---

## 2. MXene Dual-Layer Architecture + Tile Mass Loading (L3 Warp + L6 Weft + L2/L7)

### 2.1 Material Specification

**MXene:** Ti₃C₂Tₓ (T = O, OH, F), synthesized via HF etching + delamination
**Flake Size:** 1-5 μm lateral, 1-2 nm thickness (monolayer)
**Conductivity (Film):** σ = 12,000 S/m (in-plane), 50 S/m (through-thickness)
**Substrate:** Silk fibroin plain weave, CIETA Taqueté, 50 g/m²
**Coating Method:** Spray coating, 4 passes, 100°C drying between
**Areal Loading:** 0.8 g/m² MXene per layer (1.6 g/m² total)

### 2.2 Warp (L3) / Weft (L6) Orthogonal Shielding

**Warp Layer (L3):** MXene coated on warp threads (0° direction)
**Weft Layer (L6):** MXene coated on weft threads (90° direction)

**Polarization Independence:**
$$\text{SE}_{\text{total}}(\theta) = \text{SE}_{\text{warp}}\cos^2\theta + \text{SE}_{\text{weft}}\sin^2\theta$$

Since warp/weft identical: $\text{SE}_{\text{total}} = \text{SE}_{\text{single}}$

### 2.3 Ceramic Tile Mass Loading Bonus (RM-TG Unique)

**Tile Contribution to EMI SE:**
$$\text{SE}_{\text{tile}} = 20\log_{10}\left(1 + \frac{\sigma_{\text{tile}} t_{\text{tile}}}{\varepsilon_0 \omega \varepsilon_r}\right)$$

For 168 × 50mm tiles + 72 × 25mm tiles:
- Total ceramic area: ~2.1 m² (85% coverage)
- Effective conductivity at 1 GHz: σ_eff ≈ 1,200 S/m (dielectric loss)
- **Tile SE Bonus @ 1 GHz:** +8 dB
- **Tile SE Bonus @ 10 GHz:** +5 dB

### 2.4 Shielding Effectiveness Model

**Single Layer SE (Absorption Dominated):**
$$\text{SE}_{\text{single}} = \text{SE}_R + \text{SE}_A + \text{SE}_M$$

**Reflection Loss:**
$$\text{SE}_R = 20\log_{10}\left(\frac{Z_0}{4Z_s}\right) = 20\log_{10}\left(\frac{377}{4\sqrt{j\omega\mu/\sigma}}\right)$$

**Absorption Loss:**
$$\text{SE}_A = 20\log_{10}(e^{t/\delta}) = 8.686 \frac{t}{\delta}$$
$$\delta = \sqrt{\frac{2}{\omega\mu\sigma}} = \frac{0.0183}{\sqrt{f[\text{Hz}]}} \text{ m}$$

### 2.5 RM-TG Performance (Double Layer + Tile Loading)

| Frequency | δ (μm) | t/δ (per layer) | SE_A (per layer) | SE_R | SE_MXene | SE_Tile | Total SE |
|-----------|--------|-----------------|------------------|------|----------|---------|----------|
| **10 MHz** | 58 | 6.9 | 60 dB | 8 dB | 72 dB | +12 dB | **88 dB** |
| **100 MHz** | 18 | 22 | 191 dB | 14 dB | >100 dB | +15 dB | **>100 dB** |
| **1 GHz** | 5.8 | 69 | 600 dB | 20 dB | 62 dB | +8 dB | **65 dB** ✓ |
| **10 GHz** | 1.8 | 222 | 1929 dB | 26 dB | 54 dB | +5 dB | **58 dB** |
| **100 GHz** | 0.58 | 690 | 6000 dB | 32 dB | 42 dB | +3 dB | **45 dB** |

---

## 3. Fractal Frequency Selective Surface (L4)

### 3.1 Minkowski Fractal Geometry (Iteration 3)

**Initiator:** Square loop, side = 8 mm
**Generator:** Cross shape, scale factor = 1/3
**Iteration 3:** 4³ = 64 elements per unit cell
**Unit Cell:** 24 mm × 24 mm
**Conductor:** Au-Ag alloy (80/20), 50 μm diameter, embroidered

**Fractal Dimension:** $D = \log(5)/\log(3) = 1.465$ (space-filling)

### 3.2 Equivalent Circuit Model

**Unit Cell Impedance:**
$$Z_{\text{FSS}} = j\omega L + \frac{1}{j\omega C} + R$$

**Inductance (Fractal Path Length):**
$$L = \mu_0 \frac{l_{\text{eff}}}{w} \quad l_{\text{eff}} = 8 \times (5/3)^3 = 37 \text{ mm}$$
$$L \approx 4.6 \text{ nH}$$

**Capacitance (Gap Coupling):**
$$C = \varepsilon_0 \varepsilon_r \frac{A_{\text{gap}}}{d} \approx 0.077 \text{ pF}$$

**Resistance (Au-Ag Thread):**
$$R = \rho \frac{l}{A} = 2.5\times10^{-8} \frac{0.037}{\pi(25\times10^{-6})^2} = 0.47 \Omega$$

### 3.3 Notch Frequencies (Dual-Band Design + Tile Loading)

**Primary Notch (GPS/L-band):**
$$f_1 = \frac{1}{2\pi\sqrt{LC}} = 2.65 \text{ GHz} \rightarrow \text{tuned to } 2.45 \text{ GHz via capacitive loading}$$

**Secondary Notch (WiFi 5.8 GHz):**
$$f_2 \approx 3.2 f_1 = 8.5 \text{ GHz} \rightarrow \text{detuned to } 5.8 \text{ GHz via stub tuning}$$

**Tile Loading Effect:** Ceramic dielectric increases effective ε_r → notch shifts down ~2-3%, compensated in design

### 3.4 Transmission Coefficient (Notch Depth)

$$S_{21}(f) = \frac{2Z_0}{2Z_0 + Z_{\text{FSS}} + Z_{\text{substrate}}}$$

**At Notch Center (Parallel Resonance, Stop Band):**
$$|S_{21}|_{\text{min}} \approx \frac{2Z_0}{Z_{\text{FSS}}} \rightarrow 0$$

**Actual Performance (Simulated + Tile Loading):**
| Frequency | |S₂₁| (dB) | Notch Depth | Bandwidth (3dB) |
|-----------|-----------|-------------|-----------------|
| **2.45 GHz** | **-18 dB** | 18 dB | 120 MHz |
| **5.8 GHz** | **-15 dB** | 15 dB | 180 MHz |

---

## 4. Seam & Aperture Leakage Control (36 Panels → 35 Seams)

### 4.1 Panel Seam Treatment

| Seam Type | Length | Leakage Path | Treatment | SE Contribution |
|-----------|--------|--------------|-----------|-----------------|
| Center Front | 510 mm | MXene thread gap | Conductive thread bridge | -0.5 dB |
| Center Back | 510 mm | MXene thread gap | Conductive thread bridge | -0.5 dB |
| Side Seams (4×) | 510 mm each | MXene thread gap | Conductive thread bridge | -2.0 dB |
| **Side Lower Join (4×)** | **380 mm each** | **MXene thread gap** | **Conductive thread bridge** | **-1.5 dB** |
| Shoulder (2×) | 380 mm each | MXene thread gap | Overlap + bridge | -1.0 dB |
| Sleeve Cap (2×) | 400 mm each | MXene thread gap | Overlap + bridge | -1.0 dB |
| Underarm (2×) | 300 mm each | MXene thread gap | Overlap + bridge | -1.0 dB |
| Skirt/Hose (4×) | 480 mm each | MXene thread gap | Conductive thread bridge | -2.0 dB |
| Gusset (2×) | 120 mm each | MXene thread gap | Direct stitch | -0.2 dB |
| Vent (2×) | 200 mm each | MXene thread gap | Overlap + bridge | -0.5 dB |
| **TOTAL SEAM LENGTH** | **~7.2 m** | | **Total seam leakage** | **-10.2 dB** |

### 4.2 Conductive Thread Bridge Specification

**Thread:** Ag-coated nylon, 110 dtex, σ = 5×10⁵ S/m
**Stitch:** Zigzag, 2 mm width, 2 mm pitch
**Bridge Resistance:** <0.1 Ω across 5 mm seam gap
**Current Capacity:** 2 A continuous (ESD protection)

### 4.3 Aperture Shielding (Collar, Cuffs, Vents)

| Aperture | Max Dimension | SE @ 1 GHz | Treatment |
|----------|---------------|------------|-----------|
| Collar opening | 440 mm (larger neck) | -13 dB | Overlap flap + MXene gasket |
| Cuff (×2) | 170 mm | -8 dB | Elastic MXene cuff seal |
| Vent (×2) | 200×50 mm | -6 dB | Honeycomb vent + FSS cover |
