## 5. Edition-Specific Formulas

### 5.1 RW-SS Morphology Factor

The edition morphology factor αₑ quantifies deviation from reference morphology (RW-TS baseline):

$$\alpha_e = \frac{H_e - H_{ref}}{H_{ref}} \times 0.4 + \frac{B_e - B_{ref}}{B_{ref}} \times 0.35 + \frac{W_e - W_{ref}}{W_{ref}} \times 0.25 = \frac{152.5 - 192.5}{192.5} \times 0.4 + \frac{81 - 91}{91} \times 0.35 + \frac{60 - 73}{73} \times 0.25 = -0.22$$

Where $H_e$ = edition height midpoint (152.5 cm), $H_{ref}$ = RW-TS height midpoint (192.5 cm), $B_e$ = edition bust midpoint (81 cm), $B_{ref}$ = RW-TS bust midpoint (91 cm), $W_e$ = edition waist midpoint (60 cm), $W_{ref}$ = RW-TS waist midpoint (73 cm).

### 5.2 Mass Scaling Law

$$M_e = M_{ref} \times \left( \frac{H_e}{H_{ref}} \right)^{0.8} \times \left( \frac{B_e}{B_{ref}} \right)^{0.5} \times \left( \frac{W_e}{W_{ref}} \right)^{0.3} \times \left( \frac{H_{p,e}}{H_{p,ref}} \right)^{0.2} = 15.80 \times 0.795 \times 0.942 \times 0.931 \times 0.925 = 13.22 \text{ kg}$$

Where $H_{p,e}$ = edition hip midpoint (85 cm), $H_{p,ref}$ = RW-TS hip midpoint (115 cm).

### 5.3 Tile Count Formula

$$N_{tiles} = \left\lceil \frac{A_{coverage} \times \rho_{tile}}{A_{tile} \times \eta_{pack}} \right\rceil = \left\lceil \frac{1.28 \times 5.8}{0.0004 \times 0.85} \right\rceil = 135$$

Where $A_{coverage}$ = 1.28 m² (RW-SS body surface area), $\rho_{tile}$ = 5.8 kg/m², $A_{tile}$ = 20×20 mm = 0.0004 m², $\eta_{pack}$ = 0.85.

**Tile Distribution:** 90 primary (20×20×3 mm) + 45 backup (10×10×1.5 mm)

### 5.4 Farthingale Hoop Scaling

$$N_{hoops} = 4 + \left\lfloor \frac{H_e - 165}{20} \right\rfloor = 4 + \left\lfloor \frac{152.5 - 165}{20} \right\rfloor = 4$$

### 5.5 Cartridge Pleat Count

$$N_{pleats} = 25 + \left\lfloor \frac{B_e - 86}{10} \right\rfloor \times 5 + \left\lfloor \frac{W_e - 68}{10} \right\rfloor \times 3 = 25 + 0 + 0 = 20 \quad \text{(minimum)}$$

---
