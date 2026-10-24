## 2. Baleen Stay Specification (MAT-02 §3, DOC-05 §3.2, Research Doc 1 §5.1)

### 2.1 Material Properties

| Property | Value | Test Standard | Notes |
|----------|-------|---------------|-------|
| **Material** | Baleen (keratin, *Balaena mysticetus*) | — | Historical authentic |
| **Young's Modulus (E)** | 4.2 GPa (hydrated, 37°C) | ISO 13934-1 | Body temp conditioned |
| **Young's Modulus (E)** | 6.8 GPa (dry, 23°C) | ISO 13934-1 | Storage condition |
| **Tensile Strength** | 140 MPa | ISO 13934-1 | Parallel to growth |
| **Compressive Strength** | 95 MPa | ASTM D695 | Perpendicular to growth |
| **Flexural Rigidity (EI)** | 0.018 N·m² | Calculated | 6×1.5 mm section |
| **Density** | 1.35 g/cm³ | ASTM D792 | Keratin baseline |
| **Thermal Transition (Tg)** | ~60°C | DSC | Keratin glass transition |
| **Hydration Equilibrium** | 12-15% MC | ASTM D2654 | At 50% RH, 23°C |

### 2.2 RM-SS Baleen Stay Geometry

| Stay ID | Location | Length | Cross-Section | Qty | Function |
|---------|----------|--------|---------------|-----|----------|
| BS-CF-L/R | Center Front | 380 mm | 6×1.5 mm | 2 | Lacing column |
| BS-SF-L/R | Side Front | 360 mm | 6×1.5 mm | 2 | Princess seam |
| BS-CB | Center Back | 410 mm | 6×1.5 mm | 1 | Watteau column |
| BS-SB-L/R | Side Back | 360 mm | 6×1.5 mm | 2 | Back princess |
| BS-Collar-L/R | Collar Stand | 180 mm | 5×1.2 mm | 2 | Collar structure |
| BS-Peplum-L/R (F/B) | Peplum Hip | 120 mm | 5×1.2 mm | 4 | Doublet-hose transition |
| BS-Hose-F-L/R | Hose Front | 480 mm | 6×1.5 mm | 2 | Thigh anterior |
| BS-Hose-B-L/R | Hose Back | 520 mm | 6×1.5 mm | 2 | Thigh posterior |
| BS-Hose-S-L/R | Hose Side | 500 mm | 6×1.5 mm | 2 | Lateral thigh |

**Total:** 20 stays

### 2.3 Euler Buckling Analysis

**Critical Load (Fixed-Guided, K=0.5):**
$$P_{cr} = \frac{\pi^2 E I}{(K L)^2}, \quad I = \frac{b h^3}{12}$$

For standard stay (L=380 mm, b=6 mm, h=1.5 mm, E=4.2 GPa):
$$I = \frac{6 \times 1.5^3}{12} = 1.6875\ \text{mm}^4$$
$$P_{cr} = \frac{\pi^2 \times 4.2 \times 10^9 \times 1.6875 \times 10^{-12}}{(0.5 \times 0.38)^2} = \textbf{142 N}$$

**Operating Load:** 50-65 N (LES zone tension) → **Safety Factor = 2.18-2.84**

### 2.4 Hydration Conditioning Protocol

1. **Pre-Insertion Soak:** 40°C water, 30 minutes (achieves 15% MC)
2. **Insertion:** While warm/pliable, insert into silk channels
3. **Drying In-Situ:** 23°C, 50% RH, 24 hours (conforms to channel)
4. **Result:** Permanent set matching body curvature

### 2.5 Channel Stitching Specification

- **Stitch Class:** ISO 301 (lockstitch equivalent, hand backstitch)
- **SPI:** 20 (historical high-stress)
- **Thread:** Silk core-spun (poly-cotton core, silk sheath)
- **Channel Width:** 7 mm (allows 6 mm baleen + 0.5 mm ease each side)
- **Seam Allowance:** 10 mm

### 2.6 Cross-References

- MAT-02 §3: Baleen material specification
- Research Doc 1 §5.1: Baleen mechanics, Euler buckling
- DOC-05 §3.2: Structural framework stays
- CSMFAB078-A §3.3: LES zone tensions
- DRAFT-01 §5: Alcega structural lines

---
