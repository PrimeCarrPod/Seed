## 2. MHD Generator System

### 2.1 Principle of Operation
Magnetohydrodynamic (MHD) generation extracts electrical power from the conductive MR fluid circulating in the impact mitigation system (Layer 8, DOC-25):

```
FARADAY'S LAW: E = v × B
CURRENT DENSITY: J = σ(E + v × B)
POWER DENSITY: P = J·E = σ(v×B)² (for load-matched condition)

Where:
  v = fluid velocity (m/s)
  B = magnetic flux density (T)
  σ = fluid electrical conductivity (S/m)
  E = induced electric field (V/m)
  J = current density (A/m²)
```

### 2.2 MR Fluid as Working Medium
The magnetorheological fluid serves dual purpose: impact mitigation + power generation:

```
MR Fluid Properties (DOC-25, MAT-03):
  - Base fluid: Synthetic hydrocarbon (PAO-40)
  - Particles: Carbonyl iron (CI), 3-5μm, 30-40 vol%
  - Conductivity: σ = 500-1000 S/m (particle chain conduction)
  - Viscosity (off): 0.1-0.5 Pa·s
  - Viscosity (on, 0.5T): 50-200 Pa·s
  - Density: 3200 kg/m³
  - Flow rate: 0.5-2.0 L/min (pump driven)
  - Temperature range: -40°C to +120°C
```

### 2.3 MHD Channel Design
Rectangular channel with transverse magnetic field and electrodes:

```
Channel Geometry:
  - Width (electrode spacing): 10 mm
  - Height (pole spacing): 5 mm
  - Length (flow direction): 200 mm
  - Cross-section: 50 mm²
  - Hydraulic diameter: 6.67 mm

Magnetic Circuit:
  - Field strength: B = 0.8 T (NdFeB N52, Halbach array)
  - Pole material: Low-carbon steel (1010) yoke
  - Magnet mass: 1.2 kg (4× 300g segments)
  - Field uniformity: ±5% over channel length

Electrodes:
  - Material: Graphite (POCO AXF-5Q) or Pt-coated Ti
  - Area: 10mm × 200mm = 2000 mm² (each)
  - Contact resistance: <1 mΩ·cm²
  - Corrosion resistance: >10,000 hours
```

### 2.4 Power Output Characteristics
```
Operating Point (Design):
  - Flow velocity: v = 2.0 m/s (1.0 L/min)
  - Conductivity: σ = 800 S/m
  - Magnetic field: B = 0.8 T
  - Induced voltage: E = v×B = 1.6 V/m × 0.2m = 0.32 V
  - Current density: J = σ×v×B = 800×2.0×0.8 = 1280 A/m²
  - Current: I = J × A = 1280 × 0.002 = 2.56 A
  - Power: P = E×I = 0.32 × 2.56 = 0.82 W per channel

Array Configuration:
  - 600 channels in parallel (distributed along MR fluid loop)
  - Total power: 600 × 0.82 W = 492 W ≈ 500 W continuous
  - Total electrode area: 600 × 2000 mm² = 1.2 m²
  - Pressure drop: ΔP = 50 kPa (per channel, 600 parallel = 50 kPa total)
  - Pump power: 15 W (at 2 L/min, 50 kPa)
  - Net output: 485 W (after pump parasitics)
```

### 2.5 Power Conditioning
MHD output is low-voltage, variable-frequency AC requiring conditioning:

```
MHD Output: 0.3-0.5 VAC, 50-200 Hz (proportional to flow)
Conditioning Stages:
  1. Rectifier: Active synchronous (SiC MOSFETs, 98% efficiency)
  2. Boost Converter: 0.5 VDC → 28 VDC (interleaved, 95% efficiency)
  3. Bus Regulator: 28 VDC ±2% (buck/boost, 97% efficiency)
  4. Derived Rails: ±12V, 5V, 3.3V (isolated DC-DC, 94% each)

Overall Efficiency: 0.98 × 0.95 × 0.97 = 90.3%
Total Mass: 2.8 kg (magnets, channels, electronics)
Volume: 3.5 L
```
