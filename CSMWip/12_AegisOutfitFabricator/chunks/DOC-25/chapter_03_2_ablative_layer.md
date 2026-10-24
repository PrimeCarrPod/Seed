## 2. Ablative Layer

### 2.1 Material Composition and Structure
The outer ablative layer utilizes a silica-based phenolic composite with historical pigment integration:

```
[Exterior] Historical pigment wash (5-10μm)
          ↓
      Silica-phenolic ablative layer (2mm)
          ↓
   Reflective layer (100nm)
          ↓
[Interior] Phase-change layer (1.5mm)
```

### 2.2 Ablation Physics
Material removal occurs through pyrolysis and vaporization:

```
Ablation rate: $dm/dt = (A \cdot \eta \cdot I) / (H_v + 0.5 \cdot c_p \cdot \Delta T)$
where:
  A = absorptivity (0.8-0.9 for carbonaceous surfaces)
  η = laser coupling efficiency (0.7-0.9)
  I = irradiance (W/m²)
  H_v = heat of vaporization (J/kg)
  c_p = specific heat (J/kg·K)
  ΔT = temperature rise from ambient to vaporization point
```

**Additional Ablation Formulas:**

**Pyrolysis Gas Pressure:**
```
$P_{gas} = \frac{\rho_{virgin} R T_{pyro}}{M_{gas}} Y_{char}$
```

**Surface Temperature:**
```
$T_s = T_0 + \frac{q''_{incident}}{h_{conv} + \epsilon \sigma T_s^3}$
```

**Mass Loss Rate (Energy Balance):**
```
$\dot{m} = \frac{q''_{incident} - q''_{rad} - q''_{cond} - q''_{pyr}}{h_{fg} + c_p (T_s - T_0)}$
```

### 2.3 Material Properties
Engineered for controlled ablation:

```
Composition: SiO₂ (60wt%) + phenolic resin (30wt%) + carbon black (10wt%)
Density: 1400 kg/m³
Thermal Conductivity: 0.2 W/m·K (charred state)
Specific Heat: 1200 J/kg·K
Heat of Vaporization: 2.8×10⁶ J/kg
Ablation Threshold: 10⁶ W/m² (100 kW/cm²)
Char Yield: 40% (residual silica-carbon skeleton)
```

### 2.4 Historical Pigment Integration
The outer wash utilizes historical pigments for both aesthetic and functional purposes:

```
Pigment Options: 
  - Umber (Fe₂O₃·MnO₂) for IR absorption and brown tone
  - Ochre (Fe₂O₃·SiO₂) for yellow tone and moderate absorption
  - Sienna (Fe₂O₃·Al₂O₃·SiO₂) for red-brown tone
Application: Historical distemper technique (pigment + rabbit-skin glue binder)
Thickness: 5-10 μm (sufficient for color, minimal impact on ablation)
```
