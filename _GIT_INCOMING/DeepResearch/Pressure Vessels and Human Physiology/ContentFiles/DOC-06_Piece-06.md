# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5001-5100 | Piece 6 of 9 | ~100 Lines

---

#### 6.6 Conical & Spherical Viewports (Submersibles, Spacecraft)

**6.6.1 Why Non-Flat Geometries?**

Flat discs have **bending-dominated stress** → high edge stress, thick required.
**Curved geometries** (conical, spherical) develop **membrane stress** → thinner, lighter.

**Stress Comparison (Same $P, r_{\text{clear}}$):**
| Geometry | Stress Type | Thickness Ratio (vs. Flat) | Weight Ratio |
|----------|-------------|---------------------------|--------------|
| **Flat Disc** | Bending | 1.0 (baseline) | 1.0 |
| **Conical (30°)** | Membrane + Bending | 0.4–0.5 | 0.5–0.6 |
| **Spherical Cap** | Membrane | 0.2–0.3 | 0.3–0.4 |

**6.6.2 Conical Viewport — External Pressure (Submersible)**

**Geometry:** Half-angle $\alpha$, base radius $r_b$, thickness $t$.
**Loading:** External pressure $P_o$ (submersible), $P_i = 0.1$ MPa.

**Membrane Theory (Thin, $t/r \ll 1$):**
Meridional stress:
$$\sigma_{\phi} = \frac{P r}{2 t \cos\alpha}$$
Hoop stress:
$$\sigma_{\theta} = \frac{P r}{t \cos\alpha}$$

**At Base ($r = r_b$):**
$$\sigma_{\phi} = \frac{P r_b}{2 t \cos\alpha}, \quad \sigma_{\theta} = \frac{P r_b}{t \cos\alpha}$$

**Bending at Clamped Base (Discontinuity):**
Edge moment $M_0$ and shear $Q_0$ from radial displacement mismatch.
**Bijlaard Equations for Cone-Cylinder Junction:**
$$\Delta u = \frac{P r_b^2}{E t} \left( \frac{1-\nu/2}{\cos\alpha} - \frac{1-\nu/2}{1} \right)$$
$$\text{Requires FEA for accurate stress concentration.}$$

**Design Optimization (Deep-Submergence, e.g., Alvin, Limiting Factor):**
- $\alpha = 30°\text{–}45°$ (steeper = more membrane, less bending)
- $t$ tapered: Thick at base (clamp), thin at apex (optical)
- **Material:** Stretched acrylic (higher $\sigma_y$) or **sapphire** (for > 6000 m)

**6.6.3 Spherical Cap Viewport — Spacecraft (Cupola, Hatches)**

**Geometry:** Spherical radius $R$, cap angle $\theta_0$, thickness $t$.
**Loading:** Internal pressure $P_i$ (spacecraft), $P_o \approx 0$.

**Membrane Stresses (Perfect Sphere):**
$$\sigma_{\phi} = \sigma_{\theta} = \frac{P R}{2 t} \quad \text{(uniform!)}$$

**At Clamped Edge ($\theta = \theta_0$):**
Discontinuity → bending stresses.
**Edge Bending Stress (Clamped Spherical Cap):**
$$\sigma_b = \frac{P R}{2 t} \cdot \beta(\theta_0) \cdot \frac{R}{t}$$
Where $\beta(\theta_0) \approx 0.5\text{–}1.0$ depending on $\theta_0$.

**For Small Cap ($\theta_0 < 30°$):** Bending localized, membrane dominates.

**ISS Cupola Viewports (7 windows):**
- **Center (Nadir):** Spherical cap, $R = 1.5$ m, $t = 30$ mm, fused silica
- **Side (6×):** Trapezoidal, flat, 25 mm thick, fused silica + debris panes
- **Pressure:** 101 kPa internal, 4× safety factor
- **Debris Protection:** 10 mm sacrificial pane (replaceable)

**6.6.4 Acrylic vs. Fused Silica vs. Sapphire — Material Selection**

| Property | PMMA (Acrylic) | Fused Silica | Sapphire (Al₂O₃) |
|----------|----------------|--------------|------------------|
| **Density** | 1.19 g/cm³ | 2.20 g/cm³ | 3.98 g/cm³ |
| **$E$ (GPa)** | 3.2 | 72 | 400 |
| **$\sigma_y$ (MPa)** | 70 | 50 (brittle) | 400 (compressive) |
| **$K_{IC}$ (MPa√m)** | 1.0 | 0.75 | 2.5 |
| **Transmission** | 92% (vis) | 90% (UV-IR) | 85% (UV-MIR) |
| **$T_g$ / Melt** | 105°C | 1600°C | 2050°C |
| **Cost (per kg)** | $50 | $500 | $5,000 |
| **Max Depth (Conical)** | 6,500 m | 11,000 m | **Full ocean** |
| **Fabrication** | Machinable | Grind/polish | Grind/polish (hard) |

**Selection Logic:**
- **< 1,000 m, Internal Pressure:** Acrylic (cheap, tough, sealable)
- **1,000–6,500 m, External Pressure:** Stretched acrylic or conical sapphire
- **> 6,500 m, External Pressure:** Sapphire (only material with compressive strength)
- **Spacecraft (Internal, Debris):** Fused silica + sacrificial panes (optical quality)

**6.6.5 Stretched Acrylic — Enhanced Properties**

**Process:** Extruded PMMA sheet → heated to 90–100°C → biaxially stretched 2–3× → annealed.

**Property Improvements:**
| Property | Standard PMMA | Stretched Acrylic | Improvement |
|----------|---------------|-------------------|-------------|
| Tensile Strength | 70 MPa | 100–110 MPa | +50% |
| Fracture Toughness | 1.0 MPa√m | 1.5–2.0 MPa√m | +100% |
| Crazing Resistance | Poor | Good | Significant |
| Creep Rate (at 20 MPa) | Baseline | 30% of baseline | 3× life |
| Optical Quality | Good | Excellent | Better homogeneity |

**Applications:** **All deep-submergence viewports** (Alvin, Shinkai, Limiting Factor, Titan/Deepsea Challenger)

**6.6.6 Viewport Retaining Ring Design (Lamé + Interference)**

**From DOC-05 §5.4:** Interface pressure $p_c$ from bolt preload + pressure.

**For Conical Viewport (External Pressure):**
Acrylic pushes **outward** on ring → ring in **tension**.
$$p_c(P_o) = \frac{P_o \cdot A_{\text{proj}}}{2\pi r L \sin\alpha} \quad \text{(simplified)}$$

**Bolt Preload Requirement:**
$$F_{b,\text{total}} \geq 1.5 \times p_c(P_{o,\max}) \times 2\pi r L$$

**Seal Design:** O-ring (static) + backup ring (anti-extrusion) in gland on metal ring.
**Groove Dimensions (AS568):**
- Gland depth: $0.85 \times$ O-ring cross-section
- Gland width: $1.3 \times$ O-ring cross-section
- **Backup ring** on low-pressure side (vacuum side for space, water side for subsea)

---

*End of Piece 6 — DOC-06 Lines 5001-5100*
*Next: Piece 7 — Section 6.7 Numerical Examples: Chamber, Submersible, Spacecraft*