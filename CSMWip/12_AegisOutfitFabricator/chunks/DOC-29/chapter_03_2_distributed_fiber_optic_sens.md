## 2. Distributed Fiber Optic Sensing System

### 2.1 Fiber Bragg Grating (FBG) Array Architecture

#### 2.1.1 FBG Design Parameters
The FBG array provides high-resolution discrete strain and temperature measurements at strategic structural locations (ceramic tile interfaces, auxetic foam boundaries, seal closures):

```
FBG Array Specification:
  - Grating period: Λ = 535 nm (Bragg wavelength λ_B = 1550 nm)
  - Refractive index modulation: Δn = 1×10⁻⁴
  - Grating length: L_g = 5 mm
  - Reflectivity: R > 90% (strong grating)
  - Bandwidth: Δλ = 0.2 nm (FWHM)
  - Side lobe suppression: >15 dB (apodized)
  - Temperature sensitivity: K_T = 10 pm/°C
  - Strain sensitivity: K_ε = 1.2 pm/με
```

#### 2.1.2 Multiplexing Strategy
Wavelength Division Multiplexing (WDM) with 50 FBGs per fiber, 4 fibers per layer, 12 layers = 2400 FBGs total:

```
WDM Channel Allocation:
  Channel spacing: Δλ_ch = 0.8 nm (ITU-T G.694.2 CWDM grid)
  Wavelength range: 1510-1590 nm (80 nm bandwidth)
  Channels per fiber: N_ch = 50 (with 0.4 nm guard band)
  Interrogator: Swept-wavelength laser (1510-1590 nm, 1 kHz sweep)
  Resolution: δλ = 1 pm → δε = 0.83 με, δT = 0.1°C
```

#### 2.1.3 Cross-Sensitivity Compensation
Dual-grating sensor (FBG + reference FBG) for temperature-strain decoupling:

```
Strain-Temperature Decoupling:
  [Δλ₁]   [K_ε1  K_T1] [Δε]
  [Δλ₂] = [K_ε2  K_T2] [ΔT]
  
  Reference FBG: K_ε2 ≈ 0 (loose tube), K_T2 = K_T1
  Solution:
    ΔT = (Δλ₂ - Δλ₁ × K_T2/K_T1) / (K_T2 - K_ε1 × K_T2/K_T1)
    Δε = (Δλ₁ - K_T1 × ΔT) / K_ε1
```

### 2.2 Optical Frequency Domain Reflectometry (OFDR) — Rayleigh Scatter

#### 2.2.1 Continuous Distributed Sensing
OFDR provides continuous strain/temperature profile along entire fiber length using Rayleigh backscatter:

```
OFDR System Parameters:
  - Wavelength sweep: 100 nm (1500-1600 nm)
  - Sweep rate: 100 Hz (continuous), 1 kHz (burst)
  - Spatial resolution: δz = c/(2nΔν) ≈ 5 mm (Δν = 100 nm sweep)
  - Measurement length: 100 m (single fiber, 12 layers × 8 m)
  - Strain resolution: δε = 5 με (at 100 Hz)
  - Temperature resolution: δT = 0.5°C
  - Dynamic range: 40 dB (backscatter level)
```

#### 2.2.2 Complex Transfer Function Analysis
Rayleigh scatter pattern serves as intrinsic fingerprint for correlation-based measurement:

```
Complex Transfer Function:
  H(ν) = ∫₀ᴸ ρ(z) exp(-j2πν n z/c) dz
  Where ρ(z) = Rayleigh scatter coefficient
  
Strain/Temperature Shift Detection:
  ΔH/H ≈ -j2π (Δν/ν₀) + (Δn/n) + (ΔL/L)
  
  Cross-correlation peak shift:
  Δz_peak = (L/2) × (Δλ/λ₀)  (wavelength shift)
  Δz_peak = L × (Δn_eff/n_eff)  (strain/temperature)
```

### 2.3 Brillouin Optical Time Domain Analysis (BOTDA) — Long Range

#### 2.3.1 Distributed Temperature/Strain Over Kilometer Scale
BOTDA provides coarse spatial resolution but long-range coverage for cape/train monitoring:

```
BOTDA Parameters:
  - Pump pulse width: τ = 10 ns → δz = 1 m (spatial resolution)
  - Probe wave: CW, frequency swept around Brillouin shift
  - Brillouin frequency shift: ν_B ≈ 10.8 GHz (1550 nm, silica)
  - Temperature coefficient: C_T = 1.0 MHz/°C
  - Strain coefficient: C_ε = 0.05 MHz/με
  - Measurement range: 2 km (sufficient for full outfit)
  - Resolution: δT = 1°C, δε = 20 με
  - Acquisition time: 10 s (averaging 1000 traces)
```

### 2.4 Fiber Integration in Textile Layers

#### 2.4.1 Fiber Routing Topology
Based on SYNTH-03 Geometric Drafting Kernels (Alcega Developable Surface Engine):

```
Fiber Path Generation (per SYNTH-03 §1.3):
  S(u,v) = D₁(u) + v × (D₂(u) - D₁(u)) / |D₂(u) - D₁(u)|
  
  Fiber follows geodesic paths on developable surface:
  γ(t) = S(u(t), v(t)) where u(t), v(t) minimize ∫ |γ''|² dt
  
  Constraint: Fiber bend radius R_bend ≥ 15 mm (G.657.A2)
  Seam allowance: 13 mm (ASTM D1683 Ssa-1)
  Fiber offset from seam: ≥5 mm (crush protection)
```

#### 2.4.2 Layer-Specific Fiber Allocation
| Layer | Function | FBGs | OFDR Length | BOTDA | Routing Pattern |
|-------|----------|------|-------------|-------|-----------------|
| 1 (Outer Silk) | Environmental | 100 | 8 m | Yes | Herringbone weft |
| 2 (Ceramic Tile) | Ballistic impact | 200 | 8 m | No | Tile perimeter |
| 3 (Auxetic Foam) | Blast deformation | 150 | 8 m | No | Foam cell centers |
| 4 (MXene Brocade) | EMI integrity | 100 | 8 m | No | Warp/weft grid |
| 5 (Thermal UHTC) | Thermal gradient | 100 | 8 m | Yes | Radial from center |
| 6 (Aerogel) | Insulation integrity | 50 | 8 m | No | Quilt pattern |
| 7 (MOF Textile) | Chem/bio breakthrough | 50 | 8 m | No | Pocket perimeters |
| 8 (MR Fluid) | Impact + power | 200 | 8 m | No | Channel walls |
| 9 (Faraday Mesh) | EMI continuity | 100 | 8 m | No | Mesh nodes |
| 10 (Seal) | Hermetic integrity | 100 | 8 m | No | Seal lip |
| 11 (Power/Thermal) | Thermal management | 100 | 8 m | Yes | Heat pipe paths |
| 12 (Inner Silk) | Physiological | 150 | 8 m | Yes | Body contour |

Total: 1400 FBGs, 96 m OFDR, 2 km BOTDA

---
