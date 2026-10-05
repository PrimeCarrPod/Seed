# DOC-11: Saturation Diving Decompression Kinetics
## Document 11 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 9001-9900 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a comprehensive mathematical analysis of **saturation diving decompression kinetics** — the physiological and operational protocols for returning humans from pressurized environments (up to 700 msw / 2,300 fsw) to surface pressure. Unlike bounce diving, saturation diving reaches **complete tissue equilibrium** with the inert gas at storage depth, making decompression time **independent of bottom time** and dependent only on storage depth and gas mixture. This document derives the multi-compartment Haldane/Buhlmann models for helium and nitrogen, analyzes the US Navy saturation decompression schedules (6/5/4/3 fsw/hr), examines the thermodynamic basis for the 16/24-hour decompression day, and quantifies the heliox thermal management requirements. The analysis connects directly to the pre-breathe kinetics in DOC-09 and the scrubbing thermodynamics in DOC-10.

**Keywords:** Saturation diving, decompression kinetics, heliox, trimix, US Navy saturation procedures, tissue compartments, half-times, M-values, decompression schedules, thermal management, 16/24-hour day

---

### 11. SATURATION PHYSIOLOGY AND DECOMPRESSION KINETICS

#### 11.1 Saturation Definition & Tissue Equilibrium

**11.1.1 The Saturation State**

A diver is **saturated** when all tissue compartments have reached equilibrium with the inspired inert gas partial pressure at storage depth.

**Mathematical Definition:**
$$P_{tiss,i}(t \to \infty) = P_{I,inert} \quad \forall i \in \{1...N\}$$

Where $P_{I,inert}$ = inspired partial pressure of inert gas (He or N₂).

**Time to Saturation (98% equilibrium):**
$$t_{sat} \approx 6 \times t_{1/2,max}$$

For slowest compartment (fat, $t_{1/2} = 720$ min for He):
$$t_{sat,He} = 6 \times 720 = 4,320 \text{ min} = \mathbf{72 \text{ hours}} \quad (3 \text{ days})$$

For nitrogen ($t_{1/2,max} = 720$ min):
$$t_{sat,N_2} = \mathbf{72 \text{ hours}}$$

**Operational Practice:** **24–48 hours at storage depth** before declaring saturation (allows for safety margin, gas switching).

**11.1.2 Consequence: Decompression Time Independent of Bottom Time**

**Bounce Dive:** Decompression ∝ bottom time (tissues not saturated)
**Saturation Dive:** Decompression = **function of storage depth ONLY**

$$\text{Decompression Time} = f(P_{storage}, \text{gas mix}) \neq f(t_{bottom})$$

**This is the ECONOMIC JUSTIFICATION for saturation diving:**
- 30-day job at 200 msw: 3 days compression + 30 days work + 5 days decompression
- Equivalent bounce dives: 30 × (2 hr bottom + 8 hr deco) = 300 hr deco

**11.1.3 Inspired Gas Composition at Depth**

**Heliox (He/O₂) at Storage Depth:**
- $P_{O_2}$ maintained at **0.4–0.5 bar** (40–50 kPa) — normoxic
- Balance = Helium
- **Example (200 msw = 21 bar):**
  - $P_{O_2} = 0.45$ bar
  - $P_{He} = 21 - 0.45 = 20.55$ bar
  - $F_{He} = 20.55/21 = 97.9\%$

**Trimix (He/N₂/O₂) for HPNS Mitigation:**
- $P_{O_2} = 0.4–0.5$ bar
- $P_{N_2} = 0.8–1.2$ bar (narcotic counterbalance)
- Balance = Helium
- **Example (300 msw = 31 bar):**
  - $P_{O_2} = 0.45$ bar
  - $P_{N_2} = 1.0$ bar
  - $P_{He} = 31 - 0.45 - 1.0 = 29.55$ bar

---

*End of Piece 1 — DOC-11 Lines 9001-9100*
*Next: Piece 2 — Section 11.2 Multi-Compartment Helium/Nitrogen Kinetics*