## 5. Edition-Specific Formulas

### 5.1 RW-TS Morphology Factor

The edition morphology factor αₑ quantifies deviation from reference morphology (RW-TG baseline):

$$\alpha_e = \frac{H_e - H_{ref}}{H_{ref}} \times 0.5 + \frac{B_e - B_{ref}}{B_{ref}} \times 0.3 + \frac{W_e - W_{ref}}{W_{ref}} \times 0.2 = \frac{192.5 - 192.5}{192.5} \times 0.5 + \frac{91 - 117}{117} \times 0.3 + \frac{73 - 100}{100} \times 0.2 = -0.12$$

Where $H_e$ = edition height midpoint (192.5 cm), $H_{ref}$ = RW-TG height midpoint (192.5 cm), $B_e$ = edition bust midpoint (91 cm), $B_{ref}$ = RW-TG bust midpoint (117 cm), $W_e$ = edition waist midpoint (73 cm), $W_{ref}$ = RW-TG waist midpoint (100 cm).

### 5.2 Mass Scaling Law

$$M_e = M_{ref} \times \left( \frac{H_e}{H_{ref}} \right)^{0.8} \times \left( \frac{B_e}{B_{ref}} \right)^{0.5} \times \left( \frac{W_e}{W_{ref}} \right)^{0.3} = 20.20 \times 1.0 \times 0.882 \times 0.895 = 15.80 \text{ kg}$$

### 5.3 Tile Count Formula

$$N_{tiles} = \left\lceil \frac{A_{coverage} \times \rho_{tile}}{A_{tile} \times \eta_{pack}} \right\rceil = \left\lceil \frac{1.55 \times 5.8}{0.000625 \times 0.85} \right\rceil = 160$$

Where $A_{coverage}$ = 1.55 m² (RW-TS body surface area), $\rho_{tile}$ = 5.8 kg/m², $A_{tile}$ = 25×25 mm = 0.000625 m², $\eta_{pack}$ = 0.85.

### 5.4 Farthingale Hoop Scaling

$$N_{hoops} = 4 + \left\lfloor \frac{H_e - 165}{20} \right\rfloor = 4 + \left\lfloor \frac{192.5 - 165}{20} \right\rfloor = 4$$

### 5.5 Cartridge Pleat Count

$$N_{pleats} = 25 + \left\lfloor \frac{B_e - 86}{10} \right\rfloor \times 5 = 25 + 0 = 25$$

---
