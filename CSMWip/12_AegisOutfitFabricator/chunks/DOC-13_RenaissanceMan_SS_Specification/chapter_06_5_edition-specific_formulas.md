## 5. Edition-Specific Formulas

### 5.1 RM-SS Morphology Factor

The edition morphology factor αₑ quantifies deviation from reference morphology (RM-TS):

$$\alpha_e = \frac{H_e - H_{ref}}{H_{ref}} \times 0.6 + \frac{C_e - C_{ref}}{C_{ref}} \times 0.4 = \frac{162.5 - 190}{190} \times 0.6 + \frac{81 - 90}{90} \times 0.4 = -0.15$$

Where $H_e$ = edition height midpoint (162.5 cm), $H_{ref}$ = RM-TS height midpoint (190 cm), $C_e$ = edition chest midpoint (81 cm), $C_{ref}$ = RM-TS chest midpoint (90 cm).

### 5.2 Mass Scaling Law

$$M_e = M_{ref} \times \left( \frac{H_e}{H_{ref}} \right)^{0.8} \times \left( \frac{C_e}{C_{ref}} \right)^{0.5} \times \left( \frac{W_e}{W_{ref}} \right)^{0.3} = 16.47 \times 0.855 \times 0.947 \times 0.931 = 13.73 \text{ kg}$$

### 5.3 Tile Count Formula

$$N_{tiles} = \left\lceil \frac{A_{coverage} \times \rho_{tile}}{A_{tile} \times \eta_{pack}} \right\rceil = \left\lceil \frac{1.42 \times 5.8}{0.0004 \times 0.85} \right\rceil = 150$$

Where $A_{coverage}$ = 1.42 m² (RM-SS body surface area), $\rho_{tile}$ = 5.8 kg/m² (areal density target), $A_{tile}$ = 20×20 mm = 0.0004 m², $\eta_{pack}$ = 0.85 (hexagonal packing efficiency).

### 5.4 LES Base Tension Calibration

$$T_{base,Z} = T_{ref,Z} \times \left(1 + \alpha_e \times \beta_{Z, RM}\right)$$

Where $\beta_{Z, RM} = [0.8, 0.9, 1.0, 1.1, 1.2, 1.1, 1.0, 0.9, 0.8, 0.7, 0.6, 0.5]$ for zones Z1-Z12 (MAT-04 Table 5.1).

---
