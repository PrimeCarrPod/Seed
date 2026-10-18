## 3. Live Fire Test & Evaluation (LFT&E)

### 3.1 LFT&E Strategy — DOT&E Oversight

Per **10 USC §2366** and **DOT&E LFT&E Guide**, AIMES LFT&E:

**Phased Approach**:
1. **Component LFT&E** (DOC-21..26) — DT-1, government witness
2. **Subsystem LFT&E** — Torso + helmet + limbs, threat combinations
3. **System LFT&E** — Full suit on anthropomorphic test device (ATD)
4. **Operational LFT&E** — OT events with live threat simulants

### 3.2 Threat Matrix — Live Fire

| Threat | Simulant / Live | Test Standard | Target Conditions |
|--------|-----------------|---------------|-------------------|
| **7.62×51mm AP** | Live (M993) | NIJ 0101.07 / MIL-STD-662 | 0°, 30°, 45° obliquity |
| **12.7×99mm AP** | Live (M903) | MIL-STD-662 / STANAG 2920 | 0°, 30° |
| **Fragment (17gr FSP)** | Live | MIL-STD-662 / STANAG 2920 | 1500 m/s, 0° |
| **Blast (C4, 2.5 kg)** | Live | MIL-STD-1540 / TOP 4-2-805 | 1m, 2m, 3m standoff |
| **Laser (1.06 μm, CW)** | Live | MIL-STD-810H Mthd 525 | 10 kW/cm², 10 s |
| **HPM (1–3 GHz, UWB)** | Live | IEC 61000-4-36 / DOC-23 | 50 kV/m, 100 ns |
| **Chem (HD, GB, VX)** | Live (Dugway) | MIL-STD-282 / TOP 8-2-501 | 10 g/m², 8 hr |
| **Bio (Anthrax simulant)** | Live (BG spores) | ASTM E2458 / DOC-24 | 10⁶ spores/m² |

### 3.3 ATD Instrumentation — Biofidelity

Per **SAE J211/2570** and **DOC-37 biomechanics**:

| Measurement | Sensor | Locations | Sample Rate |
|-------------|--------|-----------|-------------|
| **Acceleration** | Triaxial piezo (2000g) | Head, chest, pelvis, femur, tibia | 20 kHz |
| **Force** | Load cell (50 kN) | Neck, lumbar, femur, tibia | 10 kHz |
| **Pressure** | Pencil gauge (1 MPa) | Thorax, abdomen, behind armor | 50 kHz |
| **Deflection** | Chest potentiometer | Chest (sternum, spine) | 10 kHz |
| **Temperature** | Thermocouple (Type K) | Skin simulant, microclimate | 1 kHz |
| **Strain** | FBG (DOC-29) | Critical structural joints | 1 kHz |

**Injury Criteria** (per **NHTSA/DoD**):

| Criterion | Limit | Source |
|-----------|-------|--------|
| **HIC₁₅** (Head Injury) | ≤ 700 | FMVSS 208 |
| **BrIC** (Brain Injury) | ≤ 0.89 | NHTSA |
| **Chest Deflection** | ≤ 40 mm | FMVSS 208 |
| **Viscous Criterion (VC)** | ≤ 1.0 m/s | ISO 15205 |
| **Femur Force** | ≤ 10 kN | FMVSS 208 |
| **Neck Tension** | ≤ 3.3 kN | SAE J2570 |
| **Neck Compression** | ≤ 4.0 kN | SAE J2570 |

### 3.4 LFT&E Statistical Analysis — Survivability

**Binomial Proportion** (Clopper-Pearson exact):

$$
\text{CI}_{95\%} = \left[ \text{BetaInv}(0.025, x, n-x+1), \text{BetaInv}(0.975, x+1, n-x) \right]
$$

Where $x$ = survived, $n$ = total shots. Target: Lower bound ≥ 0.90.

**Bayesian Update** (for sequential):

$$
P(\theta | x, n) \sim \text{Beta}(\alpha + x, \beta + n - x)
$$

Prior: $\alpha=9, \beta=1$ (mean 0.90). Posterior mean = $(\alpha+x)/(\alpha+\beta+n)$.

---
