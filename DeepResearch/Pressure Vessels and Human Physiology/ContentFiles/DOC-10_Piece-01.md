# DOC-10: Closed-Loop Scrubbing Thermodynamics
## Document 10 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 8101-9000 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a comprehensive thermodynamic analysis of **closed-loop carbon dioxide scrubbing systems** for Pressure Vessels for Human Occupancy (PVHOs). The primary chemical CO₂ removal technologies — **Lithium Hydroxide (LiOH)** and **Soda Lime** — are analyzed through their reaction stoichiometry, exothermic heat generation, kinetic limitations, and integration with thermal control systems (LCVG, sublimator, flash evaporator). The document derives the energy balances, mass flow requirements, and system-level trade-offs for PVHO classes from hyperbaric chambers to EMUs. Advanced concepts including **Metal-Organic Frameworks (MOFs)**, **electrochemical CO₂ removal**, and **solid amine swing-bed** systems are evaluated for next-generation PVHOs.

**Keywords:** CO₂ scrubbing, Lithium Hydroxide, Soda Lime, exothermic reaction, thermal management, LCVG, sublimator, PLSS, Metal-Organic Frameworks, electrochemical CO₂ removal, swing-bed, closed-loop life support

---

### 10. CLOSED-LOOP SCRUBBING THERMODYNAMICS

#### 10.1 CO₂ Generation & Removal Requirements

**10.1.1 Metabolic CO₂ Production**

Human metabolic CO₂ production varies with activity level:

| Activity Level | $\dot{V}O_2$ [L/min] | $\dot{V}CO_2$ [L/min] | RQ | $\dot{m}_{CO_2}$ [g/hr] |
|----------------|---------------------|----------------------|-----|------------------------|
| **Basal (sleep)** | 0.25 | 0.20 | 0.8 | **35** |
| **Rest (seated)** | 0.35 | 0.28 | 0.8 | **49** |
| **Light EVA work** | 0.75 | 0.60 | 0.8 | **105** |
| **Moderate EVA** | 1.25 | 1.00 | 0.8 | **175** |
| **Heavy EVA** | 2.00 | 1.60 | 0.8 | **280** |

**Molar Flow Rate:**
$$\dot{n}_{CO_2} = \frac{\dot{V}CO_2}{V_m} = \frac{\dot{V}CO_2}{22.4} \quad \text{(at STP)}$$

At heavy EVA: $\dot{n}_{CO_2} = 1.60 / 22.4 = 0.0714 \text{ mol/min} = \mathbf{4.28 \text{ mol/hr}}$

**Mass Flow Rate:**
$$\dot{m}_{CO_2} = \dot{n}_{CO_2} \times M_{CO_2} = 4.28 \times 44 = \mathbf{188 \text{ g/hr}}$$

**10.1.2 Scrubber Sizing — Mass & Volume**

**LiOH Reaction:**
$$2 \text{LiOH} + \text{CO}_2 \rightarrow \text{Li}_2\text{CO}_3 + \text{H}_2\text{O}$$

**Stoichiometric Ratio:**
- 2 mol LiOH (47.9 g) per 1 mol CO₂ (44 g)
- **1 g LiOH absorbs 0.92 g CO₂**
- **Theoretical capacity: 920 g CO₂/kg LiOH**

**Practical Capacity (with humidity, flow, bed utilization):**
- **LiOH canister:** 0.6–0.75 g CO₂/g LiOH (65–80% utilization)
- **Soda Lime:** 0.23 g CO₂/g (lower due to moisture dependence)

**8-hr EVA at Heavy Work (188 g/hr):**
- Total CO₂: 1,504 g
- LiOH required (0.7 g/g): **2.15 kg**
- Soda Lime required (0.23 g/g): **6.54 kg**

**Volume (packed density):**
- LiOH: ~1.2 g/cm³ → 1.8 L
- Soda Lime: ~0.9 g/cm³ → 7.3 L

**10.1.3 Partial Pressure Control Target**

**Cabin/Suit $P_{CO_2}$ Limit (from DOC-01 §1.4.2):**
$$P_{CO_2,max} = 0.75 \text{ kPa} \quad (5.6 \text{ mmHg})$$

**Mass Balance in Closed Volume:**
$$V \frac{dP_{CO_2}}{dt} = \dot{n}_{CO_2,gen} RT - \dot{n}_{CO_2,scrub} RT$$

At steady state ($dP/dt = 0$):
$$\dot{n}_{CO_2,scrub} = \dot{n}_{CO_2,gen}$$

**Scrubber Flow Rate Requirement:**
$$\dot{V}_{scrub} = \frac{\dot{n}_{CO_2,gen}}{y_{CO_2,in} - y_{CO_2,out}} \quad \text{(molar basis)}$$

For $y_{CO_2,in} = 0.01$ (1%), $y_{CO_2,out} = 0.001$ (0.1%):
$$\dot{V}_{scrub} = \frac{0.0714}{0.009} = 7.9 \text{ mol/min} = \mathbf{177 \text{ L/min (STP)}}$$

**Actual PLSS Fan:** 170 L/min (6 cfm) — **matches requirement**.

---

*End of Piece 1 — DOC-10 Lines 8101-8200*
*Next: Piece 2 — Section 10.2 Lithium Hydroxide (LiOH) Reaction Thermodynamics*