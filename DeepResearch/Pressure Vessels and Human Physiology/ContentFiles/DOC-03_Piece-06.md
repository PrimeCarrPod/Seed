# DOC-03: Cyclic Fatigue & de Havilland Comet Forensic Analysis
## Document 3 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 2301-2400 | Piece 6 of 9 | ~100 Lines

---

#### 3.6 Modern Applications: Composite Fuselage Fatigue (787 / A350)

The transition from aluminum to **carbon fiber reinforced polymer (CFRP)** fuselages (Boeing 787, Airbus A350) introduced new fatigue and damage-tolerance challenges. While composites don't suffer from metal fatigue in the same way, they exhibit **delamination, matrix cracking, fiber breakage, and barely visible impact damage (BVID)** that require adapted damage-tolerance methodologies.

**3.6.1 787 Fuselage Architecture**

| Parameter | 787-8 | 787-9 | A350-900 |
|-----------|-------|-------|----------|
| **Fuselage Material** | CFRP (Toray T700/Epoxy) | CFRP | CFRP (Hexcel T800/Epoxy) |
| **Diameter** | 5.74 m (226 in) | 5.74 m | 5.96 m (235 in) |
| **Skin Construction** | **One-piece barrel sections** (no circumferential joints) | Same | **Panels + frames** (circumferential joints) |
| **Skin Thickness** | 12–35 mm (tapered) | 12–35 mm | 10–30 mm |
| **ΔP Max** | 63.4 kPa (9.2 psi) | 63.4 kPa | 61.0 kPa (8.85 psi) |
| **Cabin Altitude** | **1,800 m (6,000 ft)** | 1,800 m | 1,800 m |
| **Hoop Stress** | σ_θ = 63,400 × 2.87 / 0.020 = **9.1 MPa** | Same | 8.8 MPa |

**Key Difference:** CFRP hoop stress **~9 MPa** vs. Aluminum **~26 MPa** (377) — **65% reduction** due to thicker skin and higher stiffness. But ΔP is **2.3× higher** (9.2 vs 4.0 psi) for lower cabin altitude.

**3.6.2 Composite Fatigue Mechanisms**

| Mechanism | Metal Equivalent | CFRP Behavior |
|-----------|------------------|---------------|
| **Matrix Cracking** | Slip band formation | Transverse matrix cracks at 0.3–0.5% strain |
| **Delamination** | Crack growth | Interlaminar separation (Mode I/II) |
| **Fiber Breakage** | Ultimate failure | Statistical (Weibull), cluster formation |
| **Fiber/Matrix Debonding** | Void growth | Interface failure, reduces stiffness |
| **BVID** | Corrosion pit | Impact damage barely visible, reduces CAI strength 30–50% |

**No Paris Law for Composites.** Damage accumulation is **stiffness degradation** based:
$$\frac{dD}{dN} = f(\sigma_{max}, R, T, \text{environment})$$

Where D = damage variable (0 = virgin, 1 = failure).

**3.6.3 787 Damage-Tolerance Approach**

**Boeing "No-Growth" Philosophy for Primary Structure:**
- **Design strain** < 0.4% (well below matrix cracking threshold ~0.5%)
- **No fatigue crack growth** expected under normal spectra
- **Damage tolerance = Impact resistance + Inspectability**

**Threat Categories:**
1. **Manufacturing Defects:** Porosity, foreign object debris (FOD), wrinkles
   - **Acceptance:** NDI at production (UT, radiography)
   - **Threshold:** Porosity < 1%, no FOD > 3 mm

2. **In-Service Impact (BVID):** Ramp equipment, hail, bird strike
   - **Design:** Skin thickness ≥ 12 mm for BVID resistance
   - **Threshold:** Impact energy ≤ 15 J (tool drop) → no growth
   - **Inspection:** Visual + Tap test + UT (every 18 months / 6,000 FH)

3. **Discrete Source Damage (DSD):** Large impact, lightning strike
   - **Repair:** Bolted doubler or bonded scarf patch
   - **Analysis:** Residual strength with damage

**3.6.4 Fatigue Testing — 787 Full-Scale Static & Fatigue**

**Test Article: ZY997 (787-8 Static) / ZY998 (Fatigue)**

**Fatigue Test Spectrum:**
- **Pressure Cycles:** 0 → 1.5× ΔP (95 kPa) → 0 (limit load 1.0×, ultimate 1.5×)
- **Mechanical Loads:** Wing bending, tail loads, landing gear
- **Thermal Cycles:** -55°C to +70°C (ground to cruise)
- **Total Cycles:** 165,000 (3× Design Service Objective of 55,000)

**Results (2010–2011):**
- **Zero delaminations** from pressure cycling alone
- **Zero fiber breaks** in primary structure
- **Matrix micro-cracking** observed at stress concentrations (door corners, window cutouts) — **non-propagating**
- **Stiffness loss:** < 2% after 165,000 cycles (within scatter)

**Conclusion:** **CFRP fuselage demonstrates "infinite fatigue life" at design strains** — validates no-growth approach.

**3.6.5 Window Cutouts in CFRP — Stress Concentration Management**

**787 Windows (Electrochromic, no shades):**
- **Shape:** Rounded rectangular (larger than metal: 470 × 280 mm)
- **Corner Radius:** 75 mm (vs. 25 mm on 777)
- **Cutout Method:** **Waterjet + hand layup reinforcement** (no drilling)
- **Reinforcement:** **3D woven preform** at corners (through-thickness reinforcement)

**Stress Analysis (FEA):**
- Far-field hoop stress: 9.1 MPa
- K_t at corner (with 3D weave): **1.8** (vs. 2.8 for metal rounded rect)
- Peak stress: 1.8 × 9.1 = **16.4 MPa**
- CFRP transverse tensile strength: **80 MPa** (matrix-dominated)
- **SF = 4.9 on matrix cracking** — no fatigue growth expected

**A350 Windows (Traditional with shades):**
- **Shape:** Rounded rectangular, 400 × 250 mm
- **Corner Radius:** 50 mm
- **Reinforcement:** **Titanium doubler frame** (mechanical attachment)
- **K_t:** ~2.2 (titanium frame carries load)
- **Peak stress:** 2.2 × 8.8 = 19.4 MPa (SF = 4.1)

**3.6.6 Delamination Growth — The Composite "Crack"**

**Mode I (Opening) Delamination:**
$$G_I = \frac{P^2}{2b} \frac{dC}{da} \quad \text{(Energy release rate)}$$

**Paris-Type Law for Delamination:**
$$\frac{da}{dN} = C (G_{max})^m \quad \text{or} \quad \frac{da}{dN} = C (\Delta G)^m$$

**Typical Values (T700/Epoxy):**
- C = 1×10⁻¹⁰, m = 8–12 (very steep — threshold behavior)
- **Threshold ΔG_th ≈ 100–150 J/m²**
- Below threshold: **No growth** (unlike metal)

**Design Strategy:** Keep ΔG < 0.5 ΔG_th at limit load → **No delamination growth**.

**3.6.7 Lightning Strike — Unique Composite Threat**

**787 Lightning Protection:**
- **Copper mesh** (0.1 mm) embedded in outer ply
- **Current capacity:** 200 kA (standard) + 300 kA (enhanced zones)
- **Damage:** Localized heating → matrix vaporization → delamination
- **Repair:** Remove damaged plies, replace with pre-cured patch + mesh

**Fatigue After Lightning:**
- Residual strength tested per **SAE ARP 5416**
- **No fatigue growth** from lightning damage if repaired per SRM

**3.6.8 Comparison: Metal vs. Composite Fatigue Design**

| Aspect | Aluminum (777) | CFRP (787/A350) |
|--------|----------------|-----------------|
| **Fatigue Driver** | Crack growth (Paris) | Stiffness degradation / Delamination |
| **Design Strain** | 800–1,200 µε | 3,000–4,000 µε |
| **Safety Factor** | 1.5 limit, 2.0 ult + DT | 1.5 limit, 2.0 ult + No-growth |
| **Inspection** | Eddy current (cracks) | Visual, UT, Tap test (delam/BVID) |
| **Repair** | Doubler, cold-work | Bonded scarf, bolted doubler |
| **Life Limit** | 60,000–120,000 cycles | **No cycle limit** (calendar/inspection) |
| **Window K_t** | 2.0–2.8 | 1.8–2.2 (with reinforcement) |
| **ΔP** | 55–65 kPa | 61–63 kPa (higher for lower cabin alt) |

**3.6.9 The Comet Lesson Applied to Composites**

The Comet taught: **Geometry → Stress Concentration → Fatigue Initiation → Catastrophe**

For CFRP:
- **Geometry:** Large radii (75 mm), 3D reinforcement at cutouts
- **Stress Concentration:** K_t < 2.0 (vs. 4.2 Comet)
- **Initiation:** Matrix cracking at > 0.5% strain (design < 0.4%)
- **Propagation:** Delamination threshold ΔG_th not exceeded
- **Catastrophe:** **Prevented by design strain margin + no-growth validation**

**The 787/A350 fuselage is the first pressure vessel designed with **fracture mechanics not required for fatigue** — because the material doesn't fatigue in the Paris Law sense at design loads. The Comet's legacy lives on in the **rigorous damage-tolerance validation testing** that proves no-growth.**

---

*End of Piece 6 — DOC-03 Lines 2301-2400*
*Next: Piece 7 — Section 3.7 Mathematical Synthesis: Paris Law Integration for Comet*