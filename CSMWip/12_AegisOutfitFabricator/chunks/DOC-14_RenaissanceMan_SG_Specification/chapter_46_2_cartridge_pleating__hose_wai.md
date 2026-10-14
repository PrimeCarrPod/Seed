## 2. Cartridge Pleating — Hose Waist Attachment (DRAFT-03 §3.2-3.3, SYNTH-03 §4)

### 2.1 S-Curve Fold Geometry (RM-SG)

Cartridge pleats use **figure-eight (S-curve) folds** perpendicular to waistband for volumetric compression.

**Parametric S-Curve:**
$$\begin{cases}
x(t) = A \sin(\omega t) \\
y(t) = B t \\
z(t) = C \sin(2\omega t)
\end{cases}, \quad t \in [0, N_{pleats}]$$

Where:
- $A$ = pleat depth/2 = 2.3 cm (RM-SG)
- $B$ = pleat spacing = 1.5 cm
- $C$ = lateral offset = 0.4 cm
- $\omega = \pi$ (half-period per pleat)
- $N_{pleats}$ = 28 (RM-SG hose waist)

### 2.2 RM-SG Cartridge Pleat Specifications

| Parameter | RM-SS | RM-SG | RM-TS |
|-----------|-------|-------|-------|
| **Waist Circumference** | 70 cm | **100 cm** | 75 cm |
| **Pleat Count** | 20 | **28** | 25 |
| **Pleat Depth** | 1.8 cm | **2.3 cm** | 2.2 cm |
| **Pleat Spacing** | 1.2 cm | **1.5 cm** | 1.5 cm |
| **Fabric Consumption Ratio** | 3:1 | **3:1** | 3:1 |
| **Unpleated Width** | 210 cm | **300 cm** | 225 cm |

### 2.3 Stress Diffusion at Waistband

Each cartridge pleat anchors individually to waistband, diffusing stress:

$$\sigma_{waist} = \frac{F_{total}}{N_{pleats} \times A_{anchor}} = \frac{75 \text{ N}}{28 \times 12 \text{ mm}^2} = \textbf{0.22 MPa}$$

Where $A_{anchor}$ = 12 mm² (stitch bite area at 20 SPI).

**Silk Matrix Protection:** Stress < 0.5 MPa (silk yield) ✅

### 2.4 Cartridge Pleat Stitching (ISO 400 Chainstitch Equivalent)

- **Stitch Class:** Hand cartridge = ISO 400 mechanical equivalent
- **Thread:** Silk + MXene coated (2.5 mm dia)
- **SPI:** 18-22 (historical high-stress)
- **Bite Depth:** 6 mm (through all layers)
- **Tension per stitch:** 2.5 N (measured)

---
