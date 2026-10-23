## 2. Material Production (In-House)

### 2.1 Basalt Fiber Production (CSMFAB078 §6 Step 1)

```
Source: Columbia River Basalt
Process:
  1. Crushing: Jaw crusher → cone crusher → 3-5mm feedstock
  2. Melting: 1450°C furnace (induction heated, platinum-rhodium bushing)
  3. Fiberizing: 9-13μm diameter filaments, 200-400 holes/bushing
  4. Sizing: Silane-based sizing (A-1100 equivalent) for Elium® compatibility
  5. Winding: 4800 tex roving packages
Output: 500 ton/yr @ $2.10/kg (60% savings vs. commercial $5.20/kg)
Quality: Tensile > 3000 MPa, modulus > 85 GPa
```

**Key Formulas:**
- Fiber tensile strength: $\sigma_f = \frac{F_{max}}{A_f} \geq 3000 \text{ MPa}$
- Fiber modulus: $E_f = \frac{\sigma_f}{\varepsilon_f} \geq 85 \text{ GPa}$
- Cost savings: $S = \frac{C_{commercial} - C_{inhouse}}{C_{commercial}} \times 100\% = 60\%$
- Production rate: $\dot{m} = 500 \text{ ton/yr} = 15.85 \text{ kg/s}$

### 2.2 Elium® Resin Formulation (CSMFAB078 §6 Step 2)

```
Base: Methyl Methacrylate (MMA) monomer
Additives:
  - Peroxide initiator: t-Butyl peroxybenzoate (TBPB) 1.5 wt%
  - Chain transfer agent (CTA): n-Dodecyl mercaptan 0.3 wt%
  - UV stabilizer: Benzotriazole 0.5 wt%
  - Viscosity modifier: PMMA 5 wt% (target 200-300 mPa·s)
Process: In-line static mixer, degassing at 50 mbar
Output: Elium 150 equivalent @ $4.80/kg (vs. $12/kg commercial)
Pot life: 45 min at 25°C, gel time 8 min at 80°C
```

**Key Formulas:**
- Viscosity target: $\eta_{target} = 200\text{--}300 \text{ mPa·s}$
- Pot life: $t_{pot} = 45 \text{ min} \quad \text{at } T = 25^\circ\text{C}$
- Gel time: $t_{gel} = 8 \text{ min} \quad \text{at } T = 80^\circ\text{C}$
- Cost reduction: $C_{ratio} = \frac{C_{commercial}}{C_{inhouse}} = \frac{12}{4.80} = 2.5\times$

### 2.3 MXene Synthesis (CSMFAB078 §6 Step 6, CSMFAB078-B §7)

```
MAX Phase: Ti₃AlC₂ (in-house synthesized)
  - Ti, Al, C powders: 3:1:2 molar ratio
  - Hot pressing: 1400°C, 30 MPa, 1 hr, argon
  - Crushing: Ball mill to <100μm

Etching: LiF/HCl (35°C, 24 hr)
  - LiF: 3M, HCl: 6M, solid/liquid ratio 1:10
  - Al removal: >98% (verified by XRD)
  - Washing: Centrifuge + DI water until pH >6

Delamination:
  - Intercalation: Tetramethylammonium hydroxide (TMAOH) 1M, 2 hr
  - Sonication: 40 kHz, 100W, 30 min (ice bath)
  - Centrifugation: 3500 rpm, 10 min (collect supernatant)
  - Flake size: 1-5μm lateral, 1-3 layers thick

Output: Ti₃C₂Tₓ MXene dispersion 5-10 mg/mL
Cost: $65/kg (97% savings vs. $2000/kg commercial)
```

**Key Formulas:**
- Molar ratio: $n_{Ti}:n_{Al}:n_{C} = 3:1:2$
- Etching efficiency: $\eta_{etch} = \frac{n_{Al,removed}}{n_{Al,initial}} \times 100\% > 98\%$
- Delamination yield: $Y_{delam} = \frac{m_{supernatant}}{m_{intercalated}} \times 100\%$
- Flake aspect ratio: $AR = \frac{L_{lateral}}{t_{thickness}} \approx \frac{1\text{--}5 \mu\text{m}}{1\text{--}3 \text{ layers}}$
- Cost savings: $S = \left(1 - \frac{C_{inhouse}}{C_{commercial}}\right) \times 100\% = 97\%$
- Electrical conductivity: $\sigma_{MXene} > 10^4 \text{ S/m}$

### 2.4 Aerogel Hybrid Production (CSMFAB078 §6 Step 7)

```
Precursors:
  - TEOS (tetraethyl orthosilicate): Silica source
  - PMDA-ODA (pyromellitic dianhydride-oxydianiline): Polyimide
  - Molar ratio: Si:N = 3:1 (hybrid network)
  - Catalyst: NH₄OH (pH 10), H₂O/TEOS = 4:1

Gelation: 25°C, 24 hr → aging 50°C, 24 hr

Ambient Pressure Drying (TMCS Exchange):
  - Surface modification: Trimethylchlorosilane (TMCS) in hexane
  - Exchange: 3× 24 hr cycles (solvent replacement)
  - Drying: 25°C, 1 atm, 48 hr
  - Shrinkage: <5% linear

Properties:
  - Density: 0.1-0.2 g/cm³
  - Thermal conductivity: λ = 0.010 W/m·K
  - Surface area: 600-800 m²/g
  - Service temperature: 650°C continuous
  - Cost: $68/m² (70% savings vs. $230/m² commercial)
```

**Key Formulas:**
- Molar ratio: $\frac{n_{Si}}{n_{N}} = 3:1$
- Water/TEOS ratio: $R_w = \frac{n_{H_2O}}{n_{TEOS}} = 4:1$
- Shrinkage limit: $\varepsilon_{shrink} = \frac{L_{wet} - L_{dry}}{L_{wet}} < 5\%$
- Thermal conductivity: $\lambda = 0.010 \text{ W/m·K}$
- Cost savings: $S = \left(1 - \frac{68}{230}\right) \times 100\% = 70\%$
- Surface area: $A_{BET} = 600\text{--}800 \text{ m}^2/\text{g}$

### 2.5 YInMn Blue Pigment Synthesis (CSMFAB078 §6 Step 9)

```
Solid-State Reaction:
  Y₂O₃ + In₂O₃ + MnO₂ → 2 YInO₃ (perovskite)
  Molar ratio: Y:In:Mn = 1 : 0.9 : 0.1 (x=0.1)
  Calcination: 1200°C, 12 hr, air, intermediate grinding (2×)
  Milling: Planetary ball mill, 200 rpm, 4 hr, ethanol
  Particle size: 0.5-2 μm (D₅₀ ≈ 1 μm)

Properties:
  - NIR reflectance: 85-92% (700-2500 nm)
  - UV absorption: 94% (<400 nm)
  - Thermal stability: >800°C in air
  - Color: Vivid blue (CIE L*a*b*: 45, -15, -45)
  - Cost: $85-100/kg (in-house with indium-sparing formula)
```

**Key Formulas:**
- Reaction stoichiometry: $\text{Y}_2\text{O}_3 + \text{In}_2\text{O}_3 + \text{MnO}_2 \rightarrow 2\text{YInO}_3$
- Molar ratio: $n_Y : n_{In} : n_{Mn} = 1 : 0.9 : 0.1$
- NIR reflectance: $R_{NIR} = 85\text{--}92\% \quad \text{at } \lambda = 700\text{--}2500 \text{ nm}$
- UV absorption: $A_{UV} = 94\% \quad \text{at } \lambda < 400 \text{ nm}$
- Particle size: $D_{50} \approx 1 \mu\text{m}, \quad D_{range} = 0.5\text{--}2 \mu\text{m}$
- CIE Lab color: $L^* = 45, \; a^* = -15, \; b^* = -45$
