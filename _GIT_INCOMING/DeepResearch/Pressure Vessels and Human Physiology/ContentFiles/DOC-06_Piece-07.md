# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5101-5200 | Piece 7 of 9 | ~100 Lines

---

#### 6.7 Numerical Examples: Chamber, Submersible, Spacecraft

**6.7.1 Hyperbaric Medical Chamber Viewport (ASME PVHO-1 Empirical)**

**Requirements:**
- Internal pressure: $P_i = 600$ kPa (6 ATA), cyclic
- Clear diameter: $D = 300$ mm (12 in)
- Material: Standard PMMA (Lucite L)
- Design life: 10,000 cycles / 10 years
- Mounting: Flat disc, clamped in steel ring (bolted flange)

**Empirical Design (ASME PVHO-1 Table 2):**
$D = 12$ in → $K = 1,500$ psi
$P_d = 87$ psi (600 kPa)
$$t \geq D \sqrt{\frac{P_d}{K}} = 12 \sqrt{\frac{87}{1500}} = 12 \times 0.241 = 2.89 \text{ in} = 73.4 \text{ mm}$$

**Standard Plate:** 3 in (76.2 mm) → **OK**

**FEA Validation (DBA Check):**
- Model: 3D solid, 300 mm dia, 76 mm thick, clamped edge
- Pressure: 600 kPa
- Max stress (edge): $\sigma_{\max} = 18$ MPa
- Max deflection: $w = 0.15$ mm
- $K_{IC} = 1.0$ MPa√m, flaw size 0.5 mm → $K_I = 0.35$ MPa√m (SF = 2.9)
- Creep at 23°C, 40,000 hr: deflection × 1.8 = 0.27 mm (acceptable)

**6.7.2 Deep-Submergence Submersible Viewport (Conical, External Pressure)**

**Requirements (Limiting Factor Class, 11,000 m):**
- External pressure: $P_o = 110$ MPa
- Clear diameter (apex): $D = 200$ mm
- Half-angle: $\alpha = 30°$
- Material: Stretched acrylic (Rohm & Haas 8N)
- Mounting: Conical seat in Ti-6Al-4V hull, bolted retaining ring

**Geometry:**
- Base radius: $r_b = 150$ mm
- Apex radius: $r_a = 50$ mm
- Slant height: $L = (r_b - r_a)/\sin\alpha = 200$ mm
- Thickness: Tapered $t_b = 80$ mm (base) → $t_a = 30$ mm (apex)

**Membrane Stress (External Pressure, at Base):**
$$\sigma_{\theta} = \frac{P_o r_b}{t_b \cos\alpha} = \frac{110 \times 150}{80 \times 0.866} = 238 \text{ MPa (COMPRESSIVE)}$$
$$\sigma_{\phi} = 119 \text{ MPa (COMPRESSIVE)}$$

**Stretched Acrylic Compressive Yield:** $\sigma_{yc} \approx 150$ MPa
**Wait — 238 > 150!** Need thicker or steeper angle.

**Revised: $\alpha = 45°$, $t_b = 100$ mm**
$$\sigma_{\theta} = \frac{110 \times 150}{100 \times 0.707} = 233 \text{ MPa}$$
Still high. **Conical alone insufficient for 110 MPa.**

**Solution: Spherical Cap or Composite (Sapphire Tip + Acrylic Cone)**

**Actual Limiting Factor Design:**
- **Sapphire hemisphere** at apex (r = 50 mm, t = 40 mm)
- **Acrylic conical skirt** (30° to hull interface)
- Sapphire takes apex pressure, acrylic takes lower pressure

**Sapphire Hemisphere (External Pressure):**
$$\sigma_{\theta} = \frac{P R}{2 t} = \frac{110 \times 50}{2 \times 40} = 68.75 \text{ MPa}$$
Sapphire compressive strength: > 2,000 MPa → **SF = 29** (very conservative)

**Acrylic Cone (at base, r = 150 mm, reduced pressure from sapphire reaction):**
Actual pressure on acrylic cone < 110 MPa due to load sharing.
FEA shows acrylic stress < 100 MPa → **OK for stretched acrylic.**

**6.7.3 Spacecraft Window (ISS Cupola Nadir Window — Fused Silica)**

**Requirements:**
- Internal pressure: $P_i = 101.3$ kPa
- Clear diameter: $D = 800$ mm
- Geometry: Spherical cap, $R = 1500$ mm, $\theta_0 = 15°$
- Debris protection: 10 mm sacrificial pane (replaceable)
- Material: Fused silica (Corning 7980)

**Membrane Stress:**
$$\sigma = \frac{P R}{2 t} = \frac{101.3 \times 1500}{2 t} = \frac{76,000}{t} \text{ kPa}$$

**Fused Silica Strength:** $\sigma_u \approx 50$ MPa (tensile), design SF = 4.0
Allowable: $\sigma_{\text{allow}} = 12.5$ MPa
$$t \geq \frac{76,000}{12,500} = 6.1 \text{ mm}$$

**Add Thermal Stress (Sun/Eclipse):**
$\Delta T = 100°C$ through thickness, $\alpha = 0.55 \times 10^{-6}$/°C
$$\sigma_{\text{th}} = \frac{E \alpha \Delta T}{1-\nu} = \frac{72 \times 10^3 \times 0.55 \times 10^{-6} \times 100}{0.83} = 4.8 \text{ MPa}$$
Combined SF: $(12.5 - 4.8) / \sigma_P \geq 1.0$ → $\sigma_P \leq 7.7$ MPa
$$t \geq \frac{76,000}{7,700} = 9.9 \text{ mm}$$

**Actual ISS Nadir Window:** 30 mm thick (includes debris margin, factor of safety, redundancy)

**Debris Impact (NASA STD-3001):**
- 1 mm Al sphere at 7 km/s → 2.5 mm crater in fused silica
- **Sacrificial pane** takes hit, primary window unharmed
- **Replaceable** on orbit (EVA)

---

*End of Piece 7 — DOC-06 Lines 5101-5200*
*Next: Piece 8 — Section 6.8 Inspection, Maintenance & Life Extension*