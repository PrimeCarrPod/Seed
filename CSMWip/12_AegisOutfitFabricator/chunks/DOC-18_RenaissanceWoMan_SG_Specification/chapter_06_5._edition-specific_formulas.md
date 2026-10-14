## 5. Edition-Specific Formulas

### 5.1 RW-SG Morphology Factor

The edition morphology factor αₑ quantifies deviation from reference morphology (RW-TS baseline):

$$\alpha_e = \frac{H_e - H_{ref}}{H_{ref}} \times 0.4 + \frac{B_e - B_{ref}}{B_{ref}} \times 0.35 + \frac{W_e - W_{ref}}{W_{ref}} \times 0.25 = \frac{155 - 192.5}{192.5} \times 0.4 + \frac{105 - 91}{91} \times 0.35 + \frac{95 - 73}{73} \times 0.25 = -0.08$$

Where $H_e$ = edition height midpoint (155 cm), $H_{ref}$ = RW-TS height midpoint (192.5 cm), $B_e$ = edition bust midpoint (105 cm), $B_{ref}$ = RW-TS bust midpoint (91 cm), $W_e$ = edition waist midpoint (95 cm), $W_{ref}$ = RW-TS waist midpoint (73 cm).

### 5.2 Mass Scaling Law

$$M_e = M_{ref} \times \left( \frac{H_e}{H_{ref}} \right)^{0.8} \times \left( \frac{B_e}{B_{ref}} \right)^{0.5} \times \left( \frac{W_e}{W_{ref}} \right)^{0.3} \times \left( \frac{H_{p,e}}{H_{p,ref}} \right)^{0.2} = 15.80 \times 0.805 \times 1.074 \times 1.091 \times 0.978 = 16.78 \text{ kg}$$

Where $H_{p,e}$ = edition hip midpoint (115 cm), $H_{p,ref}$ = RW-TS hip midpoint (115 cm).

### 5.3 Tile Count Formula

$$N_{tiles} = \left\lceil \frac{A_{coverage} \times \rho_{tile}}{A_{tile} \times \eta_{pack}} \right\rceil = \left\lceil \frac{1.48 \times 5.8}{0.0009 \times 0.85} \right\rceil = 175$$

Where $A_{coverage}$ = 1.48 m² (RW-SG body surface area), $\rho_{tile}$ = 5.8 kg/m², $A_{tile}$ = 30×30 mm = 0.0009 m², $\eta_{pack}$ = 0.85.

**Tile Distribution:** 120 primary (30×30×3 mm) + 55 backup (15×15×2 mm)

### 5.4 Farthingale Hoop Scaling

$$N_{hoops} = 4 + \left\lfloor \frac{B_e - 86}{15} \right\rfloor + \left\lfloor \frac{H_{p,e} - 115}{10} \right\rfloor = 4 + \left\lfloor \frac{105 - 86}{15} \right\rfloor + \left\lfloor \frac{115 - 115}{10} \right\rfloor = 6$$

### 5.5 Cartridge Pleat Count

$$N_{pleats} = 25 + \left\lfloor \frac{B_e - 86}{10} \right\rfloor \times 5 + \left\lfloor \frac{W_e - 68}{10} \right\rfloor \times 3 = 25 + 10 + 8 = 30 \quad \text{(capped at 30)}$$

---
