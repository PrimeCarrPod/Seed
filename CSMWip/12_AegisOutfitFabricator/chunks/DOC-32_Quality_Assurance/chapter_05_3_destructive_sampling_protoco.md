## 3. Destructive Sampling Protocols

### 3.1 Sampling Plan — ANSI/ASQ Z1.4

**Inspection Level:** S-3 (Reduced) → Normal → Tightened per switching rules
**AQL:** 1.0% (Critical), 2.5% (Major), 4.0% (Minor)
**Lot Definition:** Homogeneous batch per edition, zone, material lot

```
Switching Rules (Z1.4 §9):
- Normal → Tightened: 2 of 5 consecutive lots rejected
- Tightened → Normal: 5 consecutive lots accepted
- Normal → Reduced: 10 consecutive lots accepted, n ≥ 3, Ac=0
- Reduced → Normal: Any lot rejected

Sample Size Code Letters:
- Lot 2-8: B (n=3), Lot 9-15: C (n=5), Lot 16-25: D (n=8)
- Lot 26-50: E (n=13), Lot 51-90: F (n=20), Lot 91-150: G (n=32)

OC Curve: $P_a(p) = \sum_{d=0}^{A_c} \binom{n}{d} p^d (1-p)^{n-d}$
AOQL: $\text{AOQL} = \max_p p \cdot P_a(p) \cdot \frac{N-n}{N} + p \cdot (1-P_a(p))$
ATI: $\text{ATI} = n P_a(p) + N (1-P_a(p))$
```

### 3.2 Ballistic V50 Testing — NIJ 0101.06

**Range:** 15 m indoor, climate controlled (21±3°C, 50±20% RH)
**Projectiles:** 9mm FMJ (8.0g), 7.62×39mm (7.9g), .30-06 M2AP (10.8g)
**Witness:** 2024-T3 aluminum (0.5 mm) + Roma Plastilina #1 (25 mm)

```
Test Matrix per Edition:
| Edition | Threat Level | Projectiles | Shots/Panel | Panels/Lot |
|---------|-------------|-------------|-------------|------------|
| RM-TS/RW-TS | IIIA+ | 9mm, .44 Mag | 6 (3/3) | 3 |
| RM-TG/RW-TG | III+ | 7.62×39, .308 | 6 (3/3) | 3 |
| RM-SS/RW-SS | IIIA+ | 9mm, .44 Mag | 6 (3/3) | 2 |
| RM-SG/RW-SG | III+ | 7.62×39, .308 | 6 (3/3) | 3 |

V50 Protocol (NIJ 0101.06 §5.4):
1. 3 fair hits at estimated V50 ± 30 m/s
2. 3 fair hits at V50 ± 15 m/s (adjusted)
3. Compute $V_{50} = \frac{\sum V_{\text{penetrate}} + \sum V_{\text{stop}}}{n_{\text{total}}}$
4. Acceptance: $V_{50} \ge V_{\text{threat}} + 50\text{ m/s}$ (margin)
5. $\text{BFD} \le 44\text{ mm}$ (clay), no penetration

V50 confidence interval: $V_{50} \pm t_{\alpha/2,n-1} \cdot \frac{s}{\sqrt{n}}$
Langlie method (up-down): $V_{50} = \frac{1}{n} \sum X_i + \frac{d}{n} (\text{number of reversals})$
Probit analysis: $\Phi^{-1}(p) = \alpha + \beta \ln(V)$
```

### 3.3 Blast / Fragmentation Arena — MIL-STD-810H Method 516.8

**Arena:** 10 m diameter, sand bed, witness panels at 3, 5, 7 m
**Charge:** C-4, 0.5-2.0 kg TNT equivalent, hemispherical
**Fragments:** MIL-STD-662F, 1.1g simulated (20° cone, 1200 m/s)

```
Test Matrix:
| Layer | Threat | Charge | Stand-off | Witness |
|-------|--------|--------|-----------|---------|
| L3+L8 | Blast overpressure | 1.0 kg | 3 m | BOP gauge |
| L3+L8 | Primary frag | 0.5 kg | 5 m | Al 2024-T3 1.6mm |
| L8 | Secondary frag | 2.0 kg | 7 m | Witness cards |

Acceptance:
- No penetration of L9 (hermetic layer)
- $\text{BOP} \le 35\text{ kPa}$ at L4 (aerogel) interface
- Fragment residual velocity $\le 200\text{ m/s}$ (stopped by L3+L8)
- Spall $\le 5$ fragments $> 0.5\text{g}$ behind L8

Friedlander waveform: $P(t) = P_s \left(1 - \frac{t}{t_+}\right) e^{-\alpha t / t_+}$
Impulse: $I = \int_0^{t_+} P(t) dt = \frac{P_s t_+}{\alpha} (1 - e^{-\alpha} - \alpha e^{-\alpha})$
Fragment velocity: $v_f = \sqrt{\frac{2E}{m}} \cdot \text{Gr}(Gurney)$
Gurney energy: $E = \frac{1}{2} \frac{M}{C} v^2$ ($M$ = metal mass, $C$ = charge mass)
```

### 3.4 Thermal Manikin — ASTM F1291 / ISO 15858

**Manikin:** Thermetrics Newton, 20 zones, sweating, 34°C skin temp
**Chamber:** -40 to +60°C, 0.5-3.0 m/s wind, 10-90% RH
**Exposure:** Per CSMFAB078-B §5 thermal threat matrix

```
Test Conditions:
| Threat | Temp | Duration | Wind | Heat Flux |
|--------|------|----------|------|-----------|
| Flash fire | 1200°C | 3 s | 0 | 84 kW/m² |
| Sustained | 500°C | 30 s | 1 m/s | 20 kW/m² |
| Radiant | - | 60 s | - | 10 kW/m² |
| Cold soak | -40°C | 60 min | 0.5 m/s | - |

Measurements:
- Skin temp (20 zones): $T_{\text{skin}}(t) \le 44^\circ\text{C}$ (no burn)
- Heat flux sensors: $q''_{\text{skin}} \le 5\text{ kW/m}^2$ (integrated)
- Total heat loss: $Q_{\text{total}} = \sum A_i \cdot q''_i \cdot \Delta t$
- Physiological strain: $\text{PSI} = \frac{T_{\text{core}}-37}{3} + \frac{HR-65}{110}$

Heat transfer: $q'' = h(T_{\text{skin}} - T_{\text{amb}}) + \varepsilon\sigma(T_{\text{skin}}^4 - T_{\text{amb}}^4)$
Stoll burn criterion: $\int_0^t (T_{\text{skin}} - 44)^{1.5} dt \le C_{\text{crit}}$
Thermal resistance: $R_{ct} = \frac{T_{\text{skin}} - T_{\text{amb}}}{q''}$ (ISO 11092)

Acceptance:
- Zero 2nd/3rd degree burn predictions (Stoll curve)
- PSI ≤ 0.3 (low strain)
- No melt-through to L4 (aerogel)
- L6 (MOF) integrity: >90% adsorption capacity retained
```

### 3.5 EMI Shielding Effectiveness — IEEE 299 / MIL-STD-285

**Chamber:** Anechoic, 3×3×3 m, 30 MHz-40 GHz
**Source:** Horn antenna + VNA (Keysight N5247B)
**Sample:** 600×600 mm flat panel, mounted in flange

```
Measurement:
- Frequency sweep: 10 MHz - 40 GHz, 1601 points
- Polarization: TE, TM, Circular
- Angle: 0°, 30°, 60° incidence

Shielding Effectiveness:
$\text{SE} = 20 \log_{10}(E_{\text{inc}} / E_{\text{trans}})\ [\text{dB}]$
$\text{SE} = R + A + B$ (Reflection + Absorption + Multi-reflection)
Reflection loss: $R = 20 \log_{10}\left(\frac{Z_w + Z_s}{2\sqrt{Z_w Z_s}}\right)$
Absorption loss: $A = 20 \log_{10}(e^{t/\delta}) = 8.686 \frac{t}{\delta}$
Skin depth: $\delta = \sqrt{\frac{2}{\omega \mu \sigma}}$

For L5 Faraday Mesh (target):
- 10 MHz-1 GHz: SE $\ge$ 80 dB (R dominant)
- 1-10 GHz: SE $\ge$ 60 dB (A + B)
- 10-40 GHz: SE $\ge$ 40 dB (A dominant)

Acceptance:
- SE $\ge$ 60 dB (10 MHz-10 GHz) per MIL-STD-464
- No resonance dips $> 10\text{ dB}$ below trend
- Surface resistance: $R_s \le 0.1\ \Omega/\text{sq}$ (4-point probe)
```

### 3.6 Chemical/Biological Challenge — NFPA 1994 / ISO 16602

**Agent Simulants:** GD (soman) simulant DMMP, HD (mustard) simulant CEES
**Bacillus:** B. globigii (BG) spores, 1-2 μm, 10⁶ CFU/mL
**Test Cell:** Permeation cup, 5 cm² area, 37°C, 50% RH

```
Permeation Test (ASTM F739):
- Challenge: 10 g/m² liquid, 10⁶ spores/m² aerosol
- Collection: GC-MS (chemical), Impinger + culture (bio)
- Duration: 8 hr (chemical), 1 hr (bio)
- Detection limit: 0.1 μg/cm² (chem), 1 CFU (bio)

Breakthrough Time:
t_b = (C_crit × h × √(π D t)) / (2 C_0)  (Fickian approx)
C_crit = 0.1 μg/cm² (chem), 1 CFU (bio)

Acceptance:
- t_b > 8 hr (chemical), > 1 hr (bio)
- Cumulative permeation < 1 μg/cm² (8 hr)
- MOF reactivity: >95% neutralization (HPLC)
- No degradation: FTIR match > 98% pre/post
```

---
