## 5. Phase-Change Material (PCM) Thermal Buffer

### 5.1 Material Selection and Properties
Microencapsulated PCM provides transient thermal absorption:

```
Selected PCM: RT27HC (Rubitherm Hydrocarbon)
Melting Point: 27°C ±1°C
Latent Heat: 250 kJ/kg
Specific Heat (solid): 2.0 kJ/kg·K
Specific Heat (liquid): 2.5 kJ/kg·K
Density: 900 kg/m³
Encapsulation: PMMA shell (5-10μm diameter)
```

### 5.2 Integration Strategy
PCM layer manages peak temperature transients:

```
Position: Between inner ZrB₂-SiC layer and MR fluid bladder
Thickness: 4mm (optimized for 300s exposure)
Mass/Area: 3.2 kg/m² (900 kg/m³ × 0.004m)
Energy Capacity: 3.2 kg/m² × 250 kJ/kg = 800 kJ/m²

Transient Analysis:
  Heat flux during flash fire: 150 kW/m²
  Energy input over 300s: 150,000 J/m²/s × 300s = 45 MJ/m²
  PCM absorbs initial peak: 800 kJ/m² (1.8% of total)
  Aerogel handles steady-state: 44.2 MJ/m²
```

### 5.3 Thermal Cycling Stability
```
Melting/Freezing Hysteresis: <1°C
Degradation after 1000 cycles: <5% latent heat loss
Leakage Rate: <0.1%/year (microencapsulation barrier)
Compatibility: Stable with ZrB₂-SiC, aerogel, MR fluid
```
