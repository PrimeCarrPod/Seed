## 2. Cartridge Pleating — Hose Waist Attachment (DRAFT-03 §3.2-3.3, SYNTH-03 §4)

### 2.1 S-Curve Fold Geometry (RM-SS)

Cartridge pleats use **figure-eight (S-curve) folds** perpendicular to waistband for volumetric compression.

**Parametric S-Curve:**
$$\begin{cases}
x(t) = A \sin(\omega t) \\
y(t) = B t \\
z(t) = C \sin(2\omega t)
\end{cases}, \quad t \in [0, N_{pleats}]$$

Where:
- $A$ = pleat depth/2 = 1.8 cm (RM-SS)
- $B$ = pleat spacing = 1.2 cm
- $C$ = lateral offset = 0.3 cm
- $\omega = \pi$ (half-period per pleat)
- $N_{pleats}$ = 20 (RM-SS hose waist)

### 2.2 RM-SS Cartridge Pleat Specifications

| Parameter | RM-TS | RM-SS | RM-TG |
|-----------|-------|-------|-------|
| **Waist Circumference** | 75 cm | **70 cm** | 110 cm |
| **Pleat Count** | 25 | **20** | 35 |
| **Pleat Depth** | 2.2 cm | **1.8 cm** | 2.5 cm |
| **Pleat Spacing** | 1.5 cm | **1.2 cm** | 1.8 cm |
| **Fabric Consumption Ratio** | 3:1 | **3:1** | 3:1 |
| **Unpleated Width** | 225 cm | **210 cm** | 330 cm |

### 2.3 Stress Diffusion at Waistband

Each cartridge pleat anchors individually to waistband, diffusing stress:

$$\sigma_{waist} = \frac{F_{total}}{N_{pleats} \times A_{anchor}} = \frac{50 \text{ N}}{20 \times 12 \text{ mm}^2} = \textbf{0.21 MPa}$$

Where $A_{anchor}$ = 12 mm² (stitch bite area at 20 SPI).

**Silk Matrix Protection:** Stress < 0.5 MPa (silk yield) ✅

### 2.4 Cartridge Pleat Stitching (ISO 400 Chainstitch Equivalent)

- **Stitch Class:** Hand cartridge = ISO 400 mechanical equivalent
- **Thread:** Silk + MXene coated (2.5 mm dia)
- **SPI:** 18-22 (historical high-stress)
- **Bite Depth:** 6 mm (through all layers)
- **Tension per stitch:** 2.5 N (measured)

---
