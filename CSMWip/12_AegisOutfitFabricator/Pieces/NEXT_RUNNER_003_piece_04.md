| Draft ID | Title | Primary Source | Output |
|----------|-------|----------------|--------|
| **DRAFT-01** | Alcega Developable Surface Engine | Research Doc 1 §4.1, SYNTH-03 §1 | DXF/SVG patterns + cutting layout |
| **DRAFT-02** | Garsault Proportional Scaling System | Research Doc 1 §4.1, SYNTH-03 §2 | Edition-specific patterns (8 editions) |
| **DRAFT-03** | Pleating Kernel | Research Doc 1 §4.2, SYNTH-03 §3 | Watteau 3:1 + Cartridge S-curve math |
| **DRAFT-04** | Farthingale/Pannier Hoop Architecture | Research Doc 1 §5.3, SYNTH-03 §5 | Hoop I, tape tension, deployment kinematics |
| **DRAFT-05** | Zero-Waste Nesting Optimizer | Research Doc 1 §4.1, SYNTH-03 §7 | Cutting plan <5% waste, offcut catalog |

### 3.2 DRAFT-01: Alcega Developable Surface Engine — Detailed Outline

**Sections to Author:**
1. **Historical Foundation** (Research Doc 1 §4.1, Lines 45-51)
   - Juan de Alcega 1589: *Libro de Geometría, Práctica y Traça*
   - Zero-waste algorithms for rectangular loom widths
   - Standard silk loom width: 22 inches (560mm) for 18th C silks

2. **Developable Surface Mathematics** (Research Doc 1 §4.1, Lines 47-51)
   - Convolute surfaces: directrix curves + generatrix ruling
   - Plane moving in space tangent to two directrices
   - Osculating circle tangent for bodice suppression curves
   - Formula: Developable surface = ruled surface with zero Gaussian curvature

3. **Coordinate Transformation Pipeline**
   - 3D body scan → 2D pattern pieces via developable mapping
   - Directrix curve extraction from anthropometric landmarks
   - Generatrix distribution for seam placement
   - Unfolding algorithm: P(3D) → p(2D) with metric preservation

4. **DXF/SVG Output Specification**
   - Layer structure: CUT, FOLD, NOTCH, GRAINLINE, LABEL
   - Units: mm, precision: 0.01mm
   - Seam allowance: 13mm (Ssa-1) default, configurable
   - Notches: 3mm V-notch at match points

5. **Cutting Layout Optimizer**
