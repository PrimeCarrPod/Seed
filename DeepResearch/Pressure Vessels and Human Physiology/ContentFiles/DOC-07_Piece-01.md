# DOC-07: EMU Architecture — Anthropomorphic Pressure Vessels
## Document 7 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5401-6300 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a comprehensive structural and mechanical analysis of **Extravehicular Mobility Units (EMUs)** — the anthropomorphic, anthropodynamic pressure vessels that enable human extravehicular activity (EVA). The EMU is a unique PVHO class: a **softgoods pressure bladder** encapsulated in a **restraint layer** that maintains structural integrity while permitting articulated joint motion. This document covers the layered architecture (LCVG, bladder, restraint, TMG), joint mechanics (bellows, convolutes, planar, rotary), pressure-bladdder stress analysis, restraint layer load distribution, mobility-torque trade space, and the structural lineage from X-15/David Clark suits through Mercury/Gemini/Apollo to the Shuttle/ISS EMU and next-generation xEMU/Axiom suits.

**Keywords:** EMU, spacesuit, pressure bladder, restraint layer, joint mechanics, bellows convolutes, mobility torque, LCVG, TMG, PLSS, NASA EMU, Orlan, Feitian, xEMU, Axiom, David Clark, ILC Dover

---

### 7. HYPOBARIC MICRO-ENVIRONMENTS: EXTRAVEHICULAR MOBILITY UNITS

#### 7.1 EMU Classification as Anthropodynamic PVHO

**7.1.1 Definition & Unique Characteristics**

An EMU is a **PVHO Class VI** (from DOC-01 §1.2):
- **Pressure Direction:** Internal ($P_{int} \approx 30\text{–}40$ kPa, $P_{ext} \approx 0$)
- **Geometry:** Anthropomorphic (human-shaped), not cylindrical/spherical
- **Structural System:** **Membrane bladder + tension restraint** (not rigid shell)
- **Mobility Requirement:** Articulated joints for EVA tasks
- **Life Support:** Self-contained (PLSS) or umbilical

**Key Distinction from Rigid PVHOs:**
- Rigid PVHO: Structure carries pressure load → geometry fixed
- EMU: **Bladder carries pressure, restraint carries load** → geometry changes with joint motion

**7.1.2 EMU Generations & Lineage**

| Generation | Suit | Pressure | Agency | Key Innovation |
|------------|------|----------|--------|----------------|
| **1st** | **X-15 A/P22S-2** (1959) | 24 kPa | USAF/NACA | Full-pressure, link-net restraint |
| **2nd** | **Mercury Mark IV** (1961) | 34.5 kPa | NASA | Custom-fit, aluminized nylon |
| **3rd** | **Gemini G4C/G5C** (1965) | 25.5 kPa | NASA | EVA capability (umbilical/backpack) |
| **4th** | **Apollo A7L/A7LB** (1968) | 25.5 kPa | NASA/ILC | Lunar surface, convolute joints |
| **5th** | **Shuttle EMU** (1981) | 29.6 kPa | NASA | Modular, 15-year life, 25 EVAs |
| **6th** | **ISS EMU** (1998) | 29.6 kPa | NASA | Enhanced gloves, SAFER, 25-year life |
| **7th** | **Orlan-MKS** (2017) | 40 kPa | Roscosmos | Rear-entry, 10-year life |
| **8th** | **Feitian** (2021) | 30 kPa | CNSA | Chinese lunar precursor |
| **9th** | **xEMU / Axiom AxEMU** (2025+) | 29.6/34.5 kPa | NASA/Axiom | Modular, 3D-printed, lunar optimized |

**7.1.3 Operating Pressure Selection — The 4.3 psi (29.6 kPa) Decision**

**NASA EMU: 29.6 kPa (4.3 psi) pure O₂**
**Russian Orlan: 40 kPa (5.8 psi) pure O₂**

**Why 4.3 psi? (From DOC-01 §1.4.1, DOC-02 §2.7.1)**

Alveolar gas equation at suit pressure:
$$P_{A}O_2 = F_{I}O_2 (P_{suit} - 6.3) - \frac{5.3}{0.8}$$

For $P_{suit} = 29.6$ kPa, $F_{I}O_2 = 1.0$:
$$P_{A}O_2 = 1.0 \times (29.6 - 6.3) - 6.6 = 23.3 - 6.6 = 16.7 \text{ kPa}$$

**Sea-level equivalent:** $P_{A}O_2 = 13.3$ kPa → **EMU provides 25% MORE $O_2$ than sea level!**

**Why Not Higher? (Orlan at 40 kPa)**
- Higher pressure → **higher joint torque** (stiffness $\propto P$)
- Higher pressure → **heavier restraint layer** (load $\propto P \cdot r$)
- Higher pressure → **longer pre-breathe** (Orlan: 30 min vs. NASA: 4 hr — but Orlan uses higher cabin pressure protocol)

**Trade Space:**
| Pressure [kPa] | $P_{A}O_2$ [kPa] | Joint Torque | Pre-breathe (from 101 kPa) | Restraint Mass |
|----------------|------------------|--------------|----------------------------|----------------|
| **29.6 (NASA)** | **16.7** | **Baseline** | **4 hr @ 101 kPa** | **Baseline** |
| 34.5 (Apollo) | 20.0 | +17% | 30 min @ 101 kPa | +17% |
| **40 (Orlan)** | **25.4** | **+35%** | **30 min @ 101 kPa** | **+35%** |
| 55 (Future) | 40.7 | +85% | 0 min (8.3 psi cabin) | +85% |

**NASA chose 4.3 psi to MINIMIZE joint torque while maintaining adequate $P_{A}O_2$ with 4-hr pre-breathe.**
**Roscosmos chose 5.8 psi to ELIMINATE long pre-breathe (different cabin ops).**

---

*End of Piece 1 — DOC-07 Lines 5401-5500*
*Next: Piece 2 — Section 7.2 Layered Architecture: LCVG, Bladder, Restraint, TMG*