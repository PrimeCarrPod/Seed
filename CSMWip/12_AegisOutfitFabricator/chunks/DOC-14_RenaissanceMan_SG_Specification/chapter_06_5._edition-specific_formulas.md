## 5. Edition-Specific Formulas

### 5.1 RM-SG Morphology Factor

The edition morphology factor αₑ quantifies deviation from reference morphology (RM-TS):

$$\alpha_e = \frac{H_e - H_{ref}}{H_{ref}} \times 0.5 + \frac{C_e - C_{ref}}{C_{ref}} \times 0.3 + \frac{W_e - W_{ref}}{W_{ref}} \times 0.2 = \frac{162.5 - 190}{190} \times 0.5 + \frac{110 - 90}{90} \times 0.3 + \frac{100 - 75}{75} \times 0.2 = +0.08$$

Where $H_e$ = edition height midpoint (162.5 cm), $H_{ref}$ = RM-TS height midpoint (190 cm), $C_e$ = edition chest midpoint (110 cm), $C_{ref}$ = RM-TS chest midpoint (90 cm), $W_e$ = edition waist midpoint (100 cm), $W_{ref}$ = RM-TS waist midpoint (75 cm).

### 5.2 Mass Scaling Law

$$M_e = M_{ref} \times \left( \frac{H_e}{H_{ref}} \right)^{0.8} \times \left( \frac{C_e}{C_{ref}} \right)^{0.5} \times \left( \frac{W_e}{W_{ref}} \right)^{0.3} = 16.47 \times 0.855 \times 1.106 \times 1.101 = 17.21 \text{ kg}$$

### 5.3 Tile Count Formula

$$N_{tiles} = \left\lceil \frac{A_{coverage} \times \rho_{tile}}{A_{tile} \times \eta_{pack}} \right\rceil = \left\lceil \frac{1.58 \times 5.8}{0.000625 \times 0.85} \right\rceil = 210$$

Where $A_{coverage}$ = 1.58 m² (RM-SG body surface area), $\rho_{tile}$ = 5.8 kg/m² (areal density target), $A_{tile}$ = 25×25 mm = 0.000625 m², $\eta_{pack}$ = 0.85 (hexagonal packing efficiency).

### 5.4 LES Base Tension Calibration

$$T_{base,Z} = T_{ref,Z} \times \left(1 + \alpha_e \times \beta_{Z, RM}\right)$$

Where $\beta_{Z, RM} = [0.8, 0.9, 1.0, 1.0, 1.1, 1.1, 1.0, 0.9, 0.8, 0.7, 0.6, 0.5]$ for zones Z1-Z12 (MAT-04 Table 5.1).

---
