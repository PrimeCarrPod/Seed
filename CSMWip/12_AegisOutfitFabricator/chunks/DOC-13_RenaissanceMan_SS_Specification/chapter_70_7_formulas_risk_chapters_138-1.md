## 7. Formulas (Risk Chapters 138-147)

### 7.1 Risk Priority Number (MIL-STD-1629)
$$RPN = S \times O \times D$$

Where S=Severity (1-10), O=Occurrence (1-10), D=Detection (1-10)

### 7.2 Thermal Margin
$$\text{Margin} = T_{limit} - T_{predicted} = 58 - 56.8 = 1.2°C$$

**Degradation Model:**
$$\lambda(t) = \lambda_0 + \sum k_i \cdot t^{n_i}$$

### 7.3 STF Penetration Resistance
$$P_{resist} = P_{base} \times (1 + \eta_{STF} \cdot \phi_{STF})$$

Where $\eta_{STF}$ = enhancement factor, $\phi_{STF}$ = STF volume fraction

### 7.4 MXene Shielding Degradation
$$SE(t) = SE_0 \cdot e^{-k_{flex} \cdot N_{cycles} - k_{abrasion} \cdot d_{wear}}$$

### 7.5 Baleen Modulus Decay
$$E(t) = E_0 \cdot (1 - k_{creep} \cdot \sqrt{N_{cycles}})$$

### 7.6 Aerogel Thermal Conductivity Increase
$$\lambda(t) = \lambda_0 + \Delta\lambda_{moisture} + \Delta\lambda_{compression} + \Delta\lambda_{sintering}$$

### 7.7 Risk Burn-Down Rate
$$\frac{d(RPN)}{dt} = -\sum \text{MitigationEffectiveness}_i \cdot \text{Resource}_i$$

### 7.8 Transition Risk
$$R_{trans} = \frac{T_{actual}}{T_{target}} \times \frac{N_{components}}{N_{baseline}} \times RPN_{source}$$

---
