# DOC-01: PVHO Taxonomic Framework & Operational Parameters
## Document 1 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 501-600 | Piece 6 of 9 | ~100 Lines

---

#### 1.6 Cross-Domain Parameter Comparison Matrix

This section provides a comprehensive quantitative comparison across all seven PVHO classes, enabling cross-domain engineering trades and technology transfer identification. The matrix reveals deep structural and physiological commonalities masked by domain-specific terminology.

**Table 1.6.1: Primary Operating Parameters Across PVHO Classes**

| Parameter | Class I Submersible | Class II Diving Bell | Class III Transfer Capsule | Class IV Hyperbaric Chamber | Class V Aircraft | Class VI EMU | Class VII Saturation Habitat |
|-----------|---------------------|----------------------|----------------------------|-----------------------------|------------------|--------------|-------------------------------|
| **Pressure Direction** | External | External | Internal | Internal | Internal | Internal | ~Neutral |
| **$\Delta P_{max}$ [MPa]** | 110 | 70 | 70 | 0.6 | 0.06 | 0.04 | 70 (emergency) |
| **$P_{int}$ [kPa]** | 101 | 101–70,000 | 101–70,000 | 101–600 | 75–101 | 20–40 | 101–70,000 |
| **$P_{ext}$ [kPa]** | 101–110,000 | 101–70,000 | 101 | 101 | 10–30 | ~0 | 101–70,000 |
| **Cycle Frequency** | 1/mission | 1–2/day | 1/transfer | 1–4/day | 1/flight | 1/EVA | 1/mission |
| **Design Life [cycles]** | 100–500 | 1,000–5,000 | 50–100 | 10,000–50,000 | 50,000–100,000 | 25–50 | 100–500 |
| **Occupants** | 1–3 | 2–3 | 2–6 | 1–28 | 10–850 | 1 | 6–24 |
| **Mission Duration** | 6–12 hr | 4–8 hr | 1–24 hr | 1–5 hr/treatment | 1–18 hr | 6–8 hr | 7–28 days |
| **Gas System** | Air/O₂ (1 atm) | Saturation mix | Saturation mix | Air/O₂/Heliox | Air (bleed) | 100% O₂ | Heliox/Trimix |
| **$F_{I}O_2$** | 0.21 | 0.02–0.21 | 0.02–0.21 | 0.21–1.0 | 0.21 | 1.0 | 0.01–0.21 |
| **Thermal Load** | Cold soak | Cold soak | Neutral | Metabolic | Bleed air heat | Metabolic + vacuum | Heliox convection |

**Table 1.6.2: Structural Architecture Comparison**

| Parameter | Class I | Class II | Class III | Class IV | Class V | Class VI | Class VII |
|-----------|---------|----------|-----------|----------|---------|----------|-----------|
| **Geometry** | Sphere / Cylinder | Cylinder (open) | Cylinder + heads | Cylinder + flats | Monocoque fuselage | Anthropomorphic | Multi-chamber complex |
| **Wall Type** | Thick (t/r > 0.1) | Thick | Thick | Thick (t/r ~ 0.05) | Thin (t/r ~ 0.005) | Softgoods bladder | Thick |
| **Material** | Ti-6Al-4V, HY-130, Composite | HY-100, Ti | HY-80, Ti | Carbon steel, SS | Al 2024/7050, CFRP | Urethane nylon + Dacron | HY-80, Ti, Composite |
| **Viewport** | Conical PMMA / Sapphire | Flat PMMA | Flat PMMA | Flat PMMA / Glass | Stretched acrylic | Helmet visor (polycarbonate) | Flat PMMA |
| **Door/Hatch** | Conical plug | Bottom opening | Flanged trunk | Plug door | Plug door (cargo) | Zipper/hinge (helmet) | Flanged trunk |
| **Joints** | Butt weld + RT | Butt weld | Flanged bolted | Bolted flange | Riveted / welded | Sewn / bonded | Bolted flange |
| **NDI** | UT, RT, MT, VT | UT, MT, VT | UT, MT, VT | UT, MT, VT | ET, UT, VT | Visual, pressure test | UT, MT, VT |

**Table 1.6.3: Life-Support System Comparison**

| Subsystem | Class I | Class II | Class III | Class IV | Class V | Class VI | Class VII |
|-----------|---------|----------|-----------|----------|---------|----------|-----------|
| **O₂ Supply** | Stored liquid/gas | Umbilical | Stored | Compressor/liquid | Bleed air | PLSS tanks | Stored/generator |
| **CO₂ Removal** | LiOH canister | Umbilical | LiOH/swing bed | Soda lime/LiOH | Cabin air recirc | LiOH/METOX | Central scrubber |
| **Thermal** | Passive + heater | Umbilical heat | Battery heater | HVAC | ECS packs | LCVG + sublimator | Heliox heaters/chillers |
| **Humidity** | Desiccant | Umbilical | Desiccant | Condenser | Condenser | LCVG condensation | Central condenser |
| **Trace Contaminants** | Activated carbon | Umbilical | Carbon | Carbon + catalyst | Ozone converter | Activated carbon | Central + carbon |
| **Pressure Control** | Fixed (1 atm) | Depth tracking | Fixed (sat pressure) | Compressor/vacuum | Outflow valve | Regulator (PLSS) | Compressor/vacuum |
| **Monitoring** | O₂, CO₂, P, T | O₂, CO₂, P, T, Depth | O₂, CO₂, P, T | O₂, CO₂, P, T, Fire | O₂, CO₂, P, T, Cabin alt | O₂, CO₂, P, T, Suit P | Full physiological |

**Table 1.6.4: Physiological State & Risk Profile**

| Risk Factor | Class I | Class II | Class III | Class IV | Class V | Class VI | Class VII |
|-------------|---------|----------|-----------|----------|---------|----------|-----------|
| **DCS Risk** | None (1 atm) | High (saturation) | None (maintains sat) | Low (intermittent) | Very Low | High (transition) | High (saturation) |
| **N₂ Narcosis** | None | Severe at depth | Severe at depth | Moderate (air) | None | None (100% O₂) | Managed (He) |
| **HPNS** | None | >120 msw | >120 msw | None | None | None | >120 msw |
| **O₂ Toxicity (CNS)** | None | Managed (low pO₂) | Managed | High (O₂ treatments) | None | Managed (low P) | Managed (low pO₂) |
| **O₂ Toxicity (Pulm)** | None | None | None | Moderate (daily) | None | None | None |
| **Hypoxia Risk** | None | None | None | None | Cabin failure | Suit leak | System failure |
| **Barotrauma** | Hull breach | Bell flood | Hatch seal | Door seal | Fuselage rupture | Suit puncture | Habitat breach |
| **Thermal Stress** | Cold | Cold | Neutral | Neutral | Neutral | Hot (metabolic) | Hot (He convection) |

**Table 1.6.5: Structural Safety Factors & Design Philosophy**

| Aspect | Class I | Class II | Class III | Class IV | Class V | Class VI | Class VII |
|--------|---------|----------|-----------|----------|---------|----------|-----------|
| **Primary SF** | 1.5–2.0 (collapse) | 1.5–2.0 (collapse) | 2.0–3.0 (yield) | 2.0–3.0 (yield) | 1.5–2.0 (fatigue) | 4.0 (burst bladder) | 1.5–2.0 (collapse) |
| **Design Method** | DBA (FEA) | DBA + Empirical | DBA + Empirical | DBA + Empirical | Damage Tolerance | Factor of Safety | DBA + Empirical |
| **Fatigue Life** | Low cycles | Moderate | Low | High | Very High | Low | Low |
| **Buckling Focus** | Critical | Critical | Secondary | Secondary | Stringer/Frame | N/A (membrane) | Critical |
| **Window SF** | 2.0–3.0 | 2.0–3.0 | 2.0–3.0 | 3.0–4.0 | 2.0–3.0 | 2.0 (visor) | 2.0–3.0 |
| **Fire Mitigation** | Materials | Materials | Materials | Deluge + Materials | Inerting | Materials | Deluge + Materials |

**Key Cross-Domain Insights:**

1. **Pressure Vessel Physics is Universal:** Lamé equations govern Classes I, II, III, IV, VII (thick-walled). Thin-wall membrane theory governs Class V. Membrane mechanics govern Class VI.

2. **Physiology Drives Architecture:** The gas composition ($F_{I}O_2$, inert gas) is the primary differentiator, not structure. Class I (1 atm air) and Class V (cabin air) share physiology; Class II, III, VII share saturation physiology; Class VI is unique (hypobaric 100% O₂).

3. **Thermal Management Scales with Gas Density:** Convective heat transfer $\propto P^{0.8}$. Class VII (heliox at 30 MPa) requires 30× surface heating vs. Class I (1 atm). Class VI (vacuum) requires active liquid cooling only.

4. **Viewport Technology Transfer:** PMMA (acrylic) dominates Classes II, III, IV, VII. Conical geometry (Class I) eliminates tensile stress. Polycarbonate (Class VI visor) trades scratch resistance for impact toughness.

5. **Cycle Life Dictates Design Philosophy:** High-cycle (Class V: 10⁵) → Damage Tolerance. Low-cycle (Classes I, III, VII: 10²) → Safe Life / Limit Analysis. Medium-cycle (Classes II, IV: 10³–10⁴) → Hybrid.

---

*End of Piece 6 — DOC-01 Lines 501-600*
*Next: Piece 7 — Section 1.7 Emerging Paradigms: TLV/PFC Integration at Taxonomic Level*