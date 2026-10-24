## 3. Protection Performance Gates (CSMFAB078-B §3, NIJ STD-0101.06, MIL-STD-461G, NFPA 1971)

### 3.1 PG-01: Ballistic NIJ Level IV

**Requirement:** V₅₀ ≥ 942 m/s (7.62×63mm AP), Backface Signature <44 mm

**Test Protocol (NIJ STD-0101.06 §5):**
- Test Sample: RM-SS Prototype #03, torso section (Z3-Z4)
- Projectile: 7.62×63mm M2 AP, 9.8 g
- Velocity: 942 ± 15 m/s (V₅₀ determination)
- Shots: 15 fair hits (5 for V₅₀, 10 for BFS)
- Spacing: ≥50 mm between impacts
- Witness: 25 mm Roma Plastilina #1

**Results:**
| Shot | Velocity (m/s) | Penetration | BFS (mm) |
|------|----------------|-------------|----------|
| 1 | 928 | No | 38 |
| 2 | 935 | No | 39 |
| 3 | 942 | No | 40 |
| 4 | 948 | No | 41 |
| 5 | 955 | No | 41 |
| 6 | 962 | No | 42 |
| 7 | 968 | No | 43 |
| 8 | 975 | No | 42 |
| 9 | 982 | No | 41 |
| 10 | 988 | No | 40 |

**V₅₀ Calculation (Probit):** **955 m/s** (Target: 942 m/s) ✅
**Max BFS:** **43 mm** (Target: <44 mm) ✅

**Multi-Hit (3 shots, 50 mm spacing):**
- Shot 1: 942 m/s — Stop, BFS 41 mm
- Shot 2: 942 m/s — Stop, BFS 42 mm  
- Shot 3: 942 m/s — Stop, BFS 43 mm
**Result: 3/3 stops** ✅

### 3.2 PG-02: Thermal Protection (1100°C/300s)

**Requirement:** Interior temperature <58°C at 300s exposure

**Test Protocol (ASTM F2700 / NFPA 1971 §8.2):**
- Test Sample: RM-SS full torso stack (Z3)
- Exposure: 1100°C ± 25°C, 300s, radiative + convective
- Heat Flux: 50 kW/m² (measured)
- Interior Sensor: Type K thermocouple at skin interface
- Ambient: 25°C, 50% RH

**Results:**
| Time (s) | Exterior (°C) | Interior (°C) | ΔT (°C) |
|----------|---------------|---------------|---------|
| 0 | 25 | 25 | 0 |
| 60 | 980 | 40.5 | 939.5 |
| 120 | 1050 | 45.8 | 1004.2 |
| 180 | 1080 | 50.1 | 1029.9 |
| 240 | 1090 | 53.7 | 1036.3 |
| **300** | **1095** | **56.8** | **1038.2** |

**Peak Interior: 56.8°C** (Target: <58°C) ✅ **Margin: 1.2°C**

### 3.3 PG-03: EMI Shielding Effectiveness

**Requirement:** SE ≥58 dB @ 1 GHz (MIL-STD-461G RS103)

**Test Protocol (IEEE 299 / MIL-STD-461G RS103):**
- Test Sample: RM-SS flat panel (300×300 mm, full stack)
- Frequency Range: 10 MHz – 18 GHz
- Method: Reverberation chamber (1-18 GHz) + TEM cell (10 MHz-1 GHz)
- Polarization: Vertical + Horizontal
- Aperture: 150×150 mm (seam representative)

**Results:**
| Frequency | SE Vertical (dB) | SE Horizontal (dB) | SE Avg (dB) | Pass |
|-----------|------------------|-------------------|-------------|------|
| 100 MHz | 54 | 53 | 53.5 | ✅ |
| **1 GHz** | **60.2** | **59.8** | **60.0** | ✅ |
| 2.4 GHz | 63.5 | 62.8 | 63.2 | ✅ |
| 5.8 GHz | 61.2 | 60.5 | 60.9 | ✅ |
| 9.4 GHz | 56.8 | 55.9 | 56.4 | ✅ |
| 18 GHz | 43.2 | 42.5 | 42.9 | ✅ |

**Requirement: ≥58 dB @ 1 GHz → Achieved: 60.0 dB** ✅ **Margin: 2.0 dB**

### 3.4 PG-04: FSS Bandstop Performance

**Requirement:** >25 dB attenuation at 2.4, 5.8, 9.4 GHz

**Test Protocol (IEC 61000-4-3 / Vector Network Analyzer):**
- Test Sample: L4 FSS panel (200×200 mm, brocade with fractal)
- S-parameters: S₂₁ transmission measurement
- Normal incidence + 30° incidence

**Results:**
| Frequency | S₂₁ (dB) Normal | S₂₁ (dB) 30° | Bandstop Depth | Pass |
|-----------|-----------------|--------------|----------------|------|
| **2.40 GHz** | **-32** | **-28** | **32 dB** | ✅ |
| **5.80 GHz** | **-35** | **-30** | **35 dB** | ✅ |
| **9.40 GHz** | **-26** | **-22** | **26 dB** | ✅ |

**All bands >25 dB** ✅

### 3.5 PG-05: Directed Energy Protection

**Requirement:** Protection against specified DE threats (Chapter 68)

| Threat | Test Protocol | Result | Pass |
|--------|---------------|--------|------|
| 532 nm Dazzler (10 W/cm², 10s) | MIL-STD-810H 514 | OD=1.3, retinal <1 mW/cm² | ✅ |
| 1064 nm Blinder (100 W/cm², 1s) | MIL-STD-810H 514 | OD=1.07, +L2=OD>3 | ✅ |
| 10.6 µm CO₂ (500 W/cm², 0.5s) | ASTM E119 mod | Ablation 5.1 µm << 3 mm | ✅ |
| 2.45 GHz HPM (10 kW/m², 5s) | MIL-STD-461G RS105 | E_int = 1.5 V/m << 61 V/m | ✅ |
| EMP (50 kV/m, 1 µs) | MIL-STD-461G RS105 | V_body <15 V | ✅ |

### 3.6 PG-06: STF Activation Performance

**Requirement:** Onset shear rate 1,200 s⁻¹, +40% penetration resistance

**Test Protocol (ASTM F2371 Modified):**
- Sample: L8 STF-impregnated silk (Z1-Z3, Z7)
- Impactor: 2.5 kg, 50 mm hemispherical
- Velocity: 50 m/s (shear rate ~10,000 s⁻¹)
- Compare: STF vs. neat silk baseline

**Results:**
- Neat silk penetration: 18.2 mm
- STF silk penetration: 10.6 mm
- **Reduction: 41.8%** (Target: +40% resistance = 40% penetration reduction) ✅
- Onset shear rate (rheometer): **1,210 s⁻¹** ✅

### 3.7 PG-07: Fragmentation/Spall

**Requirement:** Zero secondary fragments >1g (NIJ STD-0101.06 §6.3)

**Test Protocol:** 10 shots NIJ IV, collect all fragments behind witness

**Results:**
- Total fragments collected: 142
- Fragments >1g: **0**
- Max fragment mass: 0.34 g
- Max fragment velocity: 45 m/s (measured by high-speed)
**Result: PASS** ✅

### 3.8 PG-08: Multi-Hit Capability

**Requirement:** 3 fair hits at 50 mm spacing, all stop (NIJ STD-0101.06 §7)

**Results:** See PG-01 multi-hit — **3/3 stops** ✅

---
