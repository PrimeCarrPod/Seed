## 4. Thermal Comfort & Metabolic Heat Management (SYNTH-01 §4.4, DOC-06 §4, ISO 7933)

### 4.1 Heat Balance Equation (ISO 7933)

$$S = M - W \pm C \pm R - E_{res} - E_{sk}$$

Where:
- $S$ = Heat storage rate (W/m²)
- $M$ = Metabolic rate (W/m²)
- $W$ = External work (W/m²)
- $C$ = Convective heat transfer (W/m²)
- $R$ = Radiative heat transfer (W/m²)
- $E_{res}$ = Respiratory evaporative heat loss (W/m²)
- $E_{sk}$ = Cutaneous evaporative heat loss (W/m²)

### 4.2 RM-SS Metabolic Scenarios

| Activity | Metabolic Rate (M) | Duration | Clothing Insulation (I_cl) | Required E_max |
|----------|-------------------|----------|---------------------------|----------------|
| **Rest** | 1.0 met = 58 W/m² | ∞ | 0.8 clo (RM-SS) | 45 W/m² |
| **Walk 4 km/h** | 2.8 met = 162 W/m² | 8 hr | 0.8 clo | 140 W/m² |
| **Combat Patrol** | 4.0 met = 232 W/m² | 2 hr | 0.8 clo | 210 W/m² |
| **Sprint/Assault** | 8.0 met = 464 W/m² | 10 min | 0.8 clo | 440 W/m² |
| **Post-Exertion** | 1.5 met = 87 W/m² | 30 min | 0.8 clo | 75 W/m² |

### 4.3 RM-SS Evaporative Capacity

**Maximum Evaporative Heat Loss (E_max):**
$$E_{max} = \frac{P_{sk,sat} - P_a}{R_{e,t}} \times \eta_{vent}$$

Where:
- $P_{sk,sat}$ = Saturation vapor pressure at skin temp (5.6 kPa @ 37°C)
- $P_a$ = Ambient vapor pressure (1.2 kPa @ 50% RH, 25°C)
- $R_{e,t}$ = Total evaporative resistance (clothing + air layer)
- $\eta_{vent}$ = Ventilation efficiency (pumping coefficient)

**RM-SS Evaporative Resistance:**
| Layer | R_et (m²kPa/W) | Notes |
|-------|----------------|-------|
| L1 YInMn Silk | 0.002 | Highly permeable |
| L2-L9 Stack | 0.045 | Aerogel dominates |
| L10 Chassis | 0.008 | Baleen channels vent |
| L11 PVDF | 0.001 | Nanofiber mesh |
| L12 Spinel | 0.0005 | Monolayer |
| **Air Layer (microclimate)** | **0.015** | Pumping-dependent |
| **Total R_et** | **0.0715** | **RM-SS** |

**E_max Calculation (25°C, 50% RH, walking):**
$$E_{max} = \frac{5.6 - 1.2}{0.0715} \times 0.35 = \textbf{215 W/m²}$$

Where $\eta_{vent} = 0.35$ (measured pumping coefficient for RM-SS lacing ventilation)

### 4.4 Heat Stress Indices

**Predicted Heat Strain (PHS, ISO 7933):**
| Scenario | Core Temp @ 2hr | Sweat Loss | Exposure Limit |
|----------|----------------|------------|----------------|
| Walk 4 km/h | 38.2°C | 1.2 L | >8 hr |
| Combat Patrol | 38.8°C | 2.1 L | 3.2 hr |
| Sprint/Assault | 39.5°C | 0.8 L | 18 min |

**WBGT Limit (ACGIH):**
- RM-SS I_cl = 0.8 clo → WBGT limit = 28.5°C (moderate work)
- With cooling vest (optional L5b): WBGT limit = 32.0°C

### 4.5 Active Cooling Features (RM-SS Specific)

**1. Baleen Channel Ventilation (Natural Convection):**
- 20 vertical channels act as chimneys
- $\Delta T$ driven flow: $\dot{V} = C_d A \sqrt{2gH \frac{\Delta T}{T}}$
- Measured: 12 L/min @ $\Delta T = 10°C$ (torso)

**2. Lacing Ventilation Ports:**
- 24 eyelets = 24 micro-vents (3 mm each)
- MXene thread maintains EMI when open
- Pumping coefficient: $\eta_{vent} = 0.35$ (vs. 0.15 sealed)

**3. Aerogel Microperforation:**
- 50 µm holes, 1 mm pitch (laser-drilled)
- Vapor transmission: 2500 g/m²/day (ASTM E96)
- No liquid penetration (hydrophobic TMCS)

**4. PVDF Piezoelectric Cooling (Experimental):**
- L11 PVDF-TrFE: 20 mV/Pa @ 7.83 Hz
- Reverse piezoelectric: Apply 100 V → 0.5°C surface cooling
- Power: 5 mW/cm² (from body motion harvesting)

### 4.6 Cross-References

- SYNTH-01 §4.4: Unified thermal comfort model
- DOC-06 §4: Thermal comfort specifications
- ISO 7933: Analytical determination of heat stress
- ISO 9920: Clothing insulation estimation
- Chapter 66: Full-stack thermal model
- Chapter 65: Aerogel specification (microperforation)
- Chapter 17: Layer specifications (L10 chassis ventilation)
- Chapter 93: Donning procedure (ventilation setup)

---
