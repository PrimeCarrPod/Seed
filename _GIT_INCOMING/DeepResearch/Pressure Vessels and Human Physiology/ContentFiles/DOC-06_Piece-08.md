# DOC-06: Viewport Engineering — Acrylic Mechanics & ASME PVHO-1
## Document 6 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 5201-5300 | Piece 8 of 9 | ~100 Lines

---

#### 6.8 Inspection, Maintenance & Life Extension

**6.8.1 ASME PVHO-2 In-Service Inspection Requirements**

**Frequency:**
- **External Visual:** Before each pressurization (chamber) / each dive (submersible)
- **Internal Visual:** Annual (chamber) / post-dive (submersible)
- **Dimensional Check:** Every 2 years (diameter, thickness, deflection)
- **Optical Quality:** Annual (transmission, distortion, crazing)
- **NDI (Crack Detection):** Every 5 years or 2,500 cycles (whichever first)

**6.8.2 Visual Inspection Criteria (ASME PVHO-2 Table 4.1)**

| Defect Type | Acceptable | Requires Repair | Replace |
|-------------|------------|-----------------|---------|
| **Surface Crazing** | < 10% area, depth < 0.1 mm | 10–25% area | > 25% area |
| **Scratches** | < 0.1 mm deep, < 50 mm long | 0.1–0.25 mm deep | > 0.25 mm deep |
| **Chips (Edge)** | < 3 mm from edge | 3–6 mm from edge | > 6 mm from edge |
| **Bubbles/Inclusions** | < 1 mm dia, < 5 per 100 cm² | 1–3 mm dia | > 3 mm dia |
| **Discoloration** | Yellowing < 10% (Yellowness Index) | 10–20% | > 20% |
| **Delamination** | None | Any | Any |

**6.8.3 Non-Destructive Inspection (NDI) Methods**

| Method | Detects | Sensitivity | PVHO Application |
|--------|---------|-------------|------------------|
| **Visual (10× Loupe)** | Surface crazing, scratches | 0.05 mm | Routine, all windows |
| **Polariscopy (Crossed Polars)** | Residual stress, birefringence | 1 MPa stress | Annual, stress mapping |
| **Ultrasonic (Immersion)** | Internal flaws, delamination | 1 mm flaw | Every 5 years, thick windows |
| **Acoustic Emission (AE)** | Active crack growth | Real-time | During proof test |
| **Dye Penetrant** | Surface-breaking cracks | 0.01 mm | After impact, repair |
| **Thermography** | Subsurface disbonds | 2 mm depth | Large windows, quick scan |

**6.8.4 Crack Acceptance & Repair Criteria**

**Through-Thickness Crack (Flat Disc):**
- **Length < 25 mm:** Drill-stop holes (3 mm) at tips, polish, monitor
- **Length 25–50 mm:** **Replace** (stress intensity too high for repair)
- **Any crack at clamp edge:** **Replace** (bending stress concentration)

**Repair Methods:**
1. **Drill-Stop + Polish:** For short surface cracks (< 25 mm)
   - Drill 3 mm hole at crack tip
   - Polish to optical finish
   - **Reduces $K_I$ by ~50%**

2. **Bonded Patch (Structural Repair):**
   - Acrylic patch bonded with PMMA cement (methylene chloride)
   - **Only for non-optical areas** (edge reinforcement)
   - Requires DBA validation

3. **Chemical Polishing (Surface Restoration):**
   - Vapor polish (methylene chloride) or flame polish
   - Removes surface crazing < 0.1 mm
   - **Restores optical quality, not structural**

**6.8.5 Life Extension Beyond Empirical Limits (DBA Pathway)**

**Scenario:** Viewport at 9 years, 8,000 cycles, 30,000 hours — approaching limits but structurally sound.

**DBA Life Extension Process:**
1. **Condition Assessment:** Full NDI (UT, visual, polariscopy), thickness mapping
2. **Material Testing:** Coupons from same lot (or window edge) → $K_{IC}$, creep, $E$
3. **DBA Analysis:** FEA with actual geometry, measured properties, remaining cycles
4. **Proof Test:** $1.3 \times P_{\text{design}}$ (witnessed)
5. **Approval:** Extend life by $\Delta N$ cycles / $\Delta t$ hours / $\Delta y$ years

**Typical Extension:** 5–10 additional years for well-maintained indoor chambers.

**6.8.6 Submersible Viewport — Post-Dive Inspection Protocol**

**After Each Dive:**
1. **External rinse** (fresh water) → remove salt
2. **Visual (10×):** Check for impact damage, marine growth
3. **Seal check:** Pressure test retaining ring bolts (torque verification)
4. **Optical:** Transmission test (laser, 532 nm) — detect internal crazing

**Every 50 Dives / Annual:**
1. **Remove viewport** from hull (if bolted flange)
2. **Full NDI:** UT immersion scan, polariscopy, dimensional
3. **Reface seal surfaces** (lap polish metal ring, inspect acrylic flange)
4. **Reinstall with new O-rings** (FKM/Viton for hydrocarbon, EPDM for steam)

**6.8.7 Spacecraft Window — On-Orbit Inspection**

**ISS Cupola (7 Windows):**
- **External:** Camera inspection (SSRMS/Canadarm2) — monthly
- **Internal:** Crew visual + photo documentation — weekly
- **Scratch/Debris Impact:** Photograph, measure, downlink for analysis
- **Sacrificial Pane Replacement:** EVA required (6-hr EVA per pane)

**Orion/Artemis Windows (4 Panes):**
- **Redundant Panes:** 4 panes per window (2 structural, 2 redundant)
- **Inspection:** Pre-flight only (no EVA access)
- **Life:** Single mission (no reuse for deep space)

---

*End of Piece 8 — DOC-06 Lines 5201-5300*
*Next: Piece 9 — References, Cross-Links, Validation & Document Closure*