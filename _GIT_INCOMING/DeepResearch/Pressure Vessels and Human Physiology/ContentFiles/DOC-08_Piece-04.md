# DOC-08: EMU Atmospheric Composition & Operating Pressures
## Document 8 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 6601-6700 | Piece 4 of 9 | ~100 Lines

---

#### 8.4 Thermodynamic Constraints on Suit Pressure

**8.4.1 Gas Storage Mass vs. Pressure**

**O₂ Storage (High Pressure Tanks):**
$$m_{O_2} = \frac{P_{tank} V_{tank}}{R_{O_2} T} \cdot M_{O_2}$$

**PLSS O₂ Capacity (ISS EMU):**
- 2 tanks × 0.9 L each = 1.8 L water volume
- Pressure: 5,800 psi (40 MPa)
- Temperature: 20°C (293 K)
- $R = 8.314$ J/mol·K, $M_{O_2} = 32$ g/mol

$$m_{O_2} = \frac{40 \times 10^6 \times 1.8 \times 10^{-3}}{8.314 \times 293} \times 32 = \frac{72,000}{2,436} \times 32 = 29.6 \times 32 = 947 \text{ g} \approx \mathbf{0.95 \text{ kg}}$$

**Consumption Rate:** 0.84 kg/day (metabolic) + 0.2 kg/day (leak/vent) = **~1.05 kg/day**
**8-hr EVA:** 0.35 kg consumed → **0.6 kg margin (adequate)**

**8.4.2 Pressure Regulator & Feed System**

**Two-Stage Regulator:**
- **Primary:** 40 MPa → 700 kPa (intermediate)
- **Secondary:** 700 kPa → 29.6 kPa (suit pressure)

**Flow Capacity:** 1.5 kg/hr peak (emergency purge)
**Lockup Pressure:** < 31 kPa (prevents overpressure)
**Relief Valve:** 34 kPa (cracking), 37 kPa (full flow)

**8.4.3 Suit Leak Rate & Makeup Gas**

**Maximum Allowable Leak (NASA-STD-3001):**
$$\dot{V}_{leak} \leq 1.3 \times 10^{-4} \text{ std cm}^3/\text{s (He)}$$
**O₂ Equivalent:** $\approx 1.5 \times 10^{-4}$ std cm³/s

**Mass Loss Rate:**
$$\dot{m}_{leak} = \frac{P_{suit} \dot{V}_{leak}}{R T} M_{O_2} = \frac{29,600 \times 1.5 \times 10^{-10}}{8.314 \times 293} \times 0.032 = 5.8 \times 10^{-8} \text{ kg/s} = \mathbf{0.21 \text{ g/hr}}$$

**Over 8-hr EVA:** 1.7 g (negligible vs. 350 g metabolic)

**8.4.4 CO₂ Partial Pressure Control**

**Metabolic CO₂ Production:**
$$\dot{V}_{CO_2} = 0.2 \text{ L/min (rest)} \text{ to } 1.5 \text{ L/min (heavy work)}$$

**At Suit Pressure (29.6 kPa):**
$$P_{I}CO_2 = \frac{\dot{V}_{CO_2}}{\dot{V}_{vent}} \times P_{suit}$$

**Ventilation Flow (PLSS Fan):** 170 L/min (6 cfm)
**At Heavy Work (1.5 L/min CO₂):**
$$P_{I}CO_2 = \frac{1.5}{170} \times 29.6 = 0.26 \text{ kPa} \quad (2.0 \text{ mmHg})$$

**Alveolar CO₂:**
$$P_{A}CO_2 = P_{I}CO_2 + \frac{\dot{V}_{CO_2}}{\dot{V}_A} \times K \approx 0.26 + 5.3 = 5.56 \text{ kPa}$$

**Well below 7.5 kPa (6% CO₂) limit for cognitive impairment.**

**8.4.5 Trace Contaminant Accumulation**

**Sources:**
- Off-gassing (materials): 0.1–1 mg/hr per compound
- Metabolic (acetone, isoprene): 0.5–2 mg/hr
- PLSS catalyst bleed: < 0.1 mg/hr

**Activated Carbon Capacity:**
- 0.5 kg carbon in PLSS
- Capacity: 10–20% weight for organics
- **Total capacity:** 50–100 g
- **Mission accumulation (8 hr):** < 5 g → **Adequate**

**8.4.6 Thermal Gas Dynamics**

**Gas Temperature Rise (Compression in Fan):**
$$\Delta T = \frac{T_1}{\eta} \left[ \left(\frac{P_2}{P_1}\right)^{\frac{\gamma-1}{\gamma}} - 1 \right]$$
For $P_2/P_1 = 30/29 = 1.034$, $\gamma = 1.4$, $\eta = 0.7$:
$$\Delta T \approx \frac{293}{0.7} \left[ 1.034^{0.286} - 1 \right] = 418 \times 0.0096 = 4°C$$

**Negligible — gas cooling not required.**

---

*End of Piece 4 — DOC-08 Lines 6601-6700*
*Next: Piece 5 — Section 8.5 Physiological Boundaries: Hypoxia, Hyperoxia, DCS*