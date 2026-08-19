# DOC-01: PVHO Taxonomic Framework & Operational Parameters
## Document 1 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 301-400 | Piece 4 of 9 | ~100 Lines

---

#### 1.4 Life-Support Parameter Envelopes

The primary engineering mandate of every PVHO involves maintaining life-support parameters within narrow physiological envelopes while guaranteeing absolute structural integrity. These parameters are non-negotiable; deviation beyond defined limits results in immediate physiological degradation or fatality. The life-support envelope is defined by the 5-tuple:

$$\mathcal{L} = (P_{O_2}, P_{CO_2}, T_{db}, \vec{C}_{toxic}, \dot{V}_{vent})$$

Where each component has hard limits derived from human physiology:

**1.4.1 Normoxic Partial Pressure Envelope ($P_{O_2}$)**

The alveolar gas equation governs the relationship between inspired and alveolar oxygen:

$$P_{A}O_2 = F_{I}O_2 (P_B - P_{H_2O}) - \frac{P_{A}CO_2}{RQ} + F$$

Where:
- $P_{A}O_2$ = Alveolar partial pressure of O₂ [kPa]
- $F_{I}O_2$ = Inspired O₂ mole fraction
- $P_B$ = Barometric pressure [kPa]
- $P_{H_2O}$ = Water vapor pressure at 37°C = 6.3 kPa
- $P_{A}CO_2$ = Alveolar CO₂ partial pressure ≈ 5.3 kPa
- $RQ$ = Respiratory quotient ≈ 0.8
- $F$ = Small correction factor ≈ 0

**Operational $P_{O_2}$ Limits by Domain:**

| Domain | $P_{int}$ [kPa] | $F_{I}O_2$ | $P_{A}O_2$ [kPa] | Margin vs. Hypoxia |
|--------|-----------------|------------|-------------------|---------------------|
| Sea Level | 101.3 | 0.21 | 13.3 | Baseline |
| Aircraft Cabin (2,400 m) | 75.0 | 0.21 | 9.3 | +2.0 kPa |
| Aircraft Cabin (Emergency) | 56.0 | 0.21 | 6.5 | Near limit |
| NASA EMU | 30.0 | 1.00 | 23.7 | +10.4 kPa |
| Russian Orlan | 40.0 | 1.00 | 33.7 | +20.4 kPa |
| Hyperbaric Chamber (Air) | 202.6 | 0.21 | 27.7 | Hyperoxic |
| Hyperbaric Chamber (O₂) | 280.0 | 1.00 | 273.7 | CNS Toxic |
| Saturation (Heliox, 100 msw) | 1,013 | 0.04–0.06 | 13–20 | Normoxic |
| Saturation (Heliox, 300 msw) | 3,039 | 0.01–0.02 | 13–20 | Normoxic |

**Hard Limits:**
- **Hypoxia Threshold:** $P_{A}O_2 < 8.0 \text{ kPa}$ (impaired cognition), $< 6.0 \text{ kPa}$ (unconsciousness)
- **Normoxic Target:** $13.3 \pm 1.3 \text{ kPa}$ (sea-level equivalent)
- **CNS Oxygen Toxicity:** $P_{O_2} > 160 \text{ kPa}$ (seizure risk, exposure < 30 min)
- **Pulmonary Oxygen Toxicity:** $P_{O_2} > 50 \text{ kPa}$ for $> 12 \text{ hr}$ (tracheobronchitis, ARDS)
- **Fire Hazard Threshold:** $P_{O_2} > 30 \text{ kPa}$ at $> 30\%$ O₂ (material flammability increase)

**1.4.2 Carbon Dioxide Partial Pressure Envelope ($P_{CO_2}$)**

CO₂ is the primary metabolic waste gas; accumulation causes respiratory acidosis, narcosis, and increased work of breathing. The alveolar ventilation equation:

$$P_{A}CO_2 = \frac{\dot{V}_{CO_2} \times K}{\dot{V}_A}$$

Where $\dot{V}_{CO_2}$ = metabolic CO₂ production [L/min], $\dot{V}_A$ = alveolar ventilation [L/min], $K$ = 0.863 (unit conversion).

**Operational $P_{CO_2}$ Limits:**

| Condition | $P_{I}CO_2$ [kPa] | $P_{A}CO_2$ [kPa] | Physiological Effect |
|-----------|-------------------|-------------------|---------------------|
| Ambient Air | 0.04 | 5.3 | Baseline |
| ASHRAE Indoor Limit | 0.10 | 5.5 | Minimal |
| Submarine/Chamber Limit | 0.50 | 6.0 | Detectable |
| **PVHO Design Limit** | **0.75** | **6.3** | **Maximum allowable** |
| Mild Hypercapnia | 1.0–2.0 | 7–9 | Dyspnea, headache |
| Moderate Hypercapnia | 2.0–4.0 | 9–12 | Narcosis, confusion |
| Severe Hypercapnia | > 4.0 | > 12 | Unconsciousness, death |

**Scrubbing Capacity Requirement:**
For $N$ occupants at metabolic rate $\dot{M}$ [W]:
$$\dot{V}_{CO_2} = N \times 0.0002 \times \dot{M} \quad [\text{L/min}]$$
Typical: 1 person at rest = 0.2 L/min CO₂; heavy work = 1.5 L/min CO₂.
LiOH capacity: 1 kg LiOH absorbs 0.92 kg CO₂ (420 L at STP).
Soda lime capacity: 1 kg absorbs 0.23 kg CO₂ (105 L at STP).

**1.4.3 Thermal Equilibrium Envelope ($T_{db}, RH$)**

Human thermoregulation maintains core temperature at 37.0 ± 0.5°C. The PVHO must provide an environment where metabolic heat can be dissipated without exceeding physiological strain indices.

**Operational Thermal Limits:**

| Parameter | Comfort Zone | Physiological Limit | Emergency Limit |
|-----------|--------------|---------------------|-----------------|
| Dry Bulb ($T_{db}$) | 22–26°C | 18–32°C | 10–35°C |
| Wet Bulb ($T_{wb}$) | ≤ 18°C | ≤ 25°C | ≤ 28°C |
| Relative Humidity | 30–60% | 20–80% | 10–90% |
| Air Velocity | 0.1–0.25 m/s | 0.05–0.5 m/s | 0–2 m/s |

**Hyperbaric Thermal Physics (Heliox):**
At depth, gas density $\rho \propto P$. Convective heat transfer coefficient $h \propto \rho^{0.8} \propto P^{0.8}$.
At 300 msw (3.1 MPa), $h \approx 30 \times h_{surface}$.
Without active heating, convective loss at 300 msw in heliox:
$$\dot{Q}_{conv} = h A (T_{skin} - T_{gas}) \approx 30 \times 10 \times 1.8 \times (34 - T_{gas}) \text{ [W]}$$
To maintain thermal neutrality at 300 msw: $T_{chamber} = 32–35°C$ (89–95°F).
**Mandatory Range:** 29–35°C (85–95°F) for heliox saturation.

**Hypobaric Thermal Physics (EMU):**
In vacuum, only radiative and conductive (LCVG) heat rejection available.
Metabolic heat: 100 W (rest) to 500 W (EVA work).
LCVG capacity: 500–1,000 W via sublimator.
Sublimator: $\dot{m}_{H_2O} = \dot{Q} / h_{fg}$, $h_{fg} = 2,400 \text{ kJ/kg}$ at 0°C.
For 500 W: $\dot{m}_{H_2O} = 0.2 \text{ g/s} = 720 \text{ g/hr}$.
8-hr EVA requires ≥ 6 kg water (sublimator) + LCVG loop capacity.

---

*End of Piece 4 — DOC-01 Lines 301-400*
*Next: Piece 5 — Section 1.5 Structural Integrity Mandates*