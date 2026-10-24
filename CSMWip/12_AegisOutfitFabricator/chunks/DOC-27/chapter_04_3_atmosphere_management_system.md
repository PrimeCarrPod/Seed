## 3. Atmosphere Management System

### 3.1 CO₂ Removal: Metal-Organic Framework (MOF) Scrubber
Regenerable MOF-based CO₂ capture with thermal swing regeneration:

```
MOF Material: Mg-MOF-74 (Mg₂(dobdc), dobdc⁴⁻ = 2,5-dioxidobenzene-1,4-dicarboxylate)
Properties:
  - CO₂ capacity: 9.2 mmol/g (298 K, 0.04 bar CO₂)
  - Selectivity: CO₂/N₂ > 200, CO₂/H₂O > 50
  - Regeneration: 150°C, 10 kPa vacuum, 30 min cycle
  - Cycle life: >10,000 cycles (0.1% capacity loss/cycle)

System Architecture:
  - Dual bed (Bed A: adsorption, Bed B: regeneration)
  - Bed mass: 2.5 kg MOF each (5 kg total)
  - Cycle time: 4 hours (2h adsorption / 2h regeneration)
  - CO₂ removal rate: 1.5 kg/day (continuous)
  - Power: 85 W (heater + vacuum pump)
  - Volume: 8 L (both beds + valves)
```

**Thermal Swing Cycle:**
```
ADSORPTION (Bed A, 2h):
  1. Suit atmosphere → blower (15 L/min) → Bed A
  2. CO₂ captured, N₂/O₂ pass through
  3. Outlet CO₂ < 500 ppm

REGENERATION (Bed B, 2h):
  1. Heater: 150°C, 60 W
  2. Vacuum pump: 10 kPa, 25 W
  3. Desorbed CO₂ → vent or storage
  4. Cool down: 30 min (passive)

SWITCHOVER: 30 sec (valve actuation)
```

### 3.2 O₂ Supply: Solid-State Electrolyzer + Storage
Electrochemical O₂ generation from water with cryogenic backup:

```
Primary: Solid Oxide Electrolyzer Cell (SOEC)
  - Reaction: H₂O → H₂ + ½O₂ (at cathode/anode)
  - Temperature: 750°C (ceramic electrolyte: YSZ)
  - Efficiency: 90% LHV (1.3 V/cell)
  - Production rate: 0.5 kg/day (10 cells × 50 g/day)
  - Power: 120 W (thermal + electrical)
  - Water consumption: 0.56 kg/day

Backup: Cryogenic O₂ Storage (superinsulated Dewar)
  - Capacity: 2.0 kg (3 days metabolic)
  - Pressure: 1500 kPa (regulated to 30 kPa suit)
  - Boil-off: <0.5%/day (MLI + vacuum jacket)
  - Duration: 72 hours (with resupply)
```

### 3.3 Humidity Control: Membrane + Desiccant
Water vapor management through selective permeation and adsorption:

```
Primary: Nafion® Membrane Humidifier/Dehumidifier
  - Permeation: H₂O selective (H₂O/N₂ > 10,000)
  - Flow: 20 L/min recirculation
  - Dehumidification: 1.2 kg/day (exhaled + metabolic)
  - Humidification: 0.3 kg/day (makeup from recovery)
  - Power: 15 W (blower)

Secondary: Molecular Sieve Desiccant (3A zeolite)
  - Capacity: 0.8 kg H₂O/kg zeolite
  - Regeneration: 250°C, 20 min (thermal swing)
  - Backup for membrane failure
  - Mass: 0.5 kg zeolite
```

### 3.4 Thermal Rejection: Sublimator + Radiator
Heat rejection for vacuum and atmospheric environments:

```
Vacuum Mode: Sublimator (porous plate, water feed)
  - Heat rejection: 500 W (peak), 200 W (continuous)
  - Water consumption: 0.8 kg/hour (peak)
  - Operating pressure: <1 kPa
  - Mass: 1.2 kg (including water reserve)

Atmospheric Mode: Pump-Flow Radiator
  - Fluid: HFE-7100 (non-flammable, low toxicity)
  - Flow rate: 2 L/min
  - Radiator area: 0.5 m² (deployable, integrated in cape)
  - Heat rejection: 300 W (continuous)
  - Power: 25 W (pump)
```

### 3.5 Water Recovery: Forward Osmosis + Distillation
Closed-loop water recovery from humidity condensate and urine:

```
Process Train:
  1. Humidity Condensate → Particulate filter (0.2μm) → UV sterilization
  2. Urine → Pretreatment (acid + biocide) → Forward Osmosis (Aquaporin® membrane)
  3. FO Draw Solution: MgCl₂ (reconcentrated by distillation)
  4. Distillate → Polishing (activated carbon + ion exchange) → Potable storage
  5. Brine → Concentrator → Solid waste storage

Performance:
  - Recovery rate: 90% (humidity), 85% (urine)
  - Production: 2.5 L/day (potable)
  - Power: 45 W (pumps + distillation heater)
  - Mass: 3.0 kg (system + 1 day reserve)
```
