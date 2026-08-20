# DOC-08: EMU Atmospheric Composition & Operating Pressures
## Document 8 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6301-7200 | Piece 1 of 9 | ~100 Lines

---

### ABSTRACT

This document provides a rigorous mathematical and physiological analysis of **Extravehicular Mobility Unit (EMU) atmospheric composition and operating pressures**. The EMU operates as a **hypobaric pure-oxygen environment** (29.6 kPa / 4.3 psi for NASA, 40 kPa / 5.8 psi for Roscosmos), fundamentally different from the normoxic nitrogen-oxygen cabin atmospheres of spacecraft and stations. This document derives the alveolar gas equation at suit pressures, calculates oxygen partial pressure equivalence, analyzes fire risk in 100% O₂ environments, compares NASA and Russian pressure philosophies, and develops the mathematical framework for pre-breathe protocols. The analysis includes the thermodynamic constraints of suit pressure selection and the physiological boundaries that define the operational envelope.

**Keywords:** EMU atmosphere, pure oxygen, hypobaric, alveolar gas equation, 4.3 psi, 5.8 psi, fire risk, pre-breathe, nitrogen washout, NASA EMU, Orlan, xEMU, partial pressure equivalence

---

### 8. HYPOBARIC MICRO-ENVIRONMENTS: EMU ATMOSPHERIC COMPOSITION & OPERATING PRESSURES

#### 8.1 Alveolar Gas Equation at Hypobaric Conditions

**8.1.1 The Fundamental Equation**

The alveolar partial pressure of oxygen ($P_{A}O_2$) determines tissue oxygenation:

$$P_{A}O_2 = F_{I}O_2 (P_B - P_{H_2O}) - \frac{P_{A}CO_2}{RQ} + F$$

Where:
- $F_{I}O_2$ = Inspired oxygen fraction (1.0 for pure O₂ EMU)
- $P_B$ = Barometric pressure (suit pressure, kPa)
- $P_{H_2O}$ = Water vapor pressure at 37°C = **6.3 kPa** (47 mmHg)
- $P_{A}CO_2$ = Alveolar CO₂ partial pressure = **5.3 kPa** (40 mmHg)
- $RQ$ = Respiratory quotient = **0.8** (typical mixed diet)
- $F$ = Small correction factor ≈ **0** (often omitted)

**Simplified for Pure O₂ ($F_{I}O_2 = 1.0$):**
$$P_{A}O_2 = P_{suit} - 6.3 - \frac{5.3}{0.8} = P_{suit} - 6.3 - 6.625 = P_{suit} - 12.925 \text{ kPa}$$

**8.1.2 NASA EMU (29.6 kPa / 4.3 psi)**

$$P_{A}O_2 = 29.6 - 12.925 = \mathbf{16.675 \text{ kPa}} \quad (125 \text{ mmHg})$$

**Sea Level Reference (101.3 kPa, 21% O₂):**
$$P_{A}O_2 = 0.21(101.3 - 6.3) - 6.625 = 19.95 - 6.625 = \mathbf{13.325 \text{ kPa}} \quad (100 \text{ mmHg})$$

**Result: NASA EMU provides 25% HIGHER alveolar $O_2$ than sea level air!**

**8.1.3 Russian Orlan (40 kPa / 5.8 psi)**

$$P_{A}O_2 = 40.0 - 12.925 = \mathbf{27.075 \text{ kPa}} \quad (203 \text{ mmHg})$$

**Orlan provides 103% HIGHER alveolar $O_2$ than sea level.**

**8.1.4 Physiological Adequacy Thresholds**

| $P_{A}O_2$ [kPa] | Physiological Status | Equivalent Altitude |
|-------------------|---------------------|---------------------|
| **≥ 13.3** | **Normal cognition, full work capacity** | Sea level |
| **10.0–13.3** | Mild hypoxia (night vision ↓, complex tasks ↓) | 1,500–3,000 m |
| **8.0–10.0** | Moderate hypoxia (judgment impaired, headache) | 3,000–4,500 m |
| **6.0–8.0** | Severe hypoxia (unconsciousness risk) | 4,500–6,000 m |
| **< 6.0** | **Unconsciousness, brain damage** | > 6,000 m |

**Both NASA (16.7 kPa) and Orlan (27.1 kPa) provide WIDE MARGIN above 13.3 kPa threshold.**

**8.1.5 Why Not Lower Pressure? (e.g., 20 kPa / 3.0 psi)**

At $P_{suit} = 20$ kPa:
$$P_{A}O_2 = 20 - 12.925 = 7.075 \text{ kPa} \quad \text{→ SEVERE HYPOXIA}$$

**Minimum suit pressure for adequate $P_{A}O_2$:**
$$P_{suit,min} = 13.325 + 12.925 = 26.25 \text{ kPa} \quad (3.8 \text{ psi})$$

**NASA chose 29.6 kPa (4.3 psi) → 3.35 kPa margin above minimum.**
**This margin accounts for:**
- CO₂ retention during heavy work ($P_{A}CO_2 \uparrow$ to 6–7 kPa)
- Suit pressure drop (leak, regulator tolerance ±0.3 psi)
- Individual variability ($RQ$ 0.7–1.0, $P_{H_2O}$ 6.3–6.7 kPa)

---

*End of Piece 1 — DOC-08 Lines 6301-6400*
*Next: Piece 2 — Section 8.2 Fire Risk in 100% Oxygen Environments*