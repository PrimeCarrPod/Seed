## 2. Sewbo Cell Architecture

### 2.1 PVOH Rigidization Protocol (Research Doc 2 §6.1)

The Sewbo protocol temporarily rigidizes limp textile panels using Polyvinyl Alcohol (PVOH) saturation, enabling standard 6-axis robotic manipulation with sub-millimeter precision.

#### 2.1.1 PVOH Solution Formulation

```
PVOH Solution:
- Polyvinyl Alcohol: 8-12% w/v (MW 85,000-124,000, 99% hydrolyzed)
- Deionized water: balance
- Surfactant (Triton X-100): 0.1% w/v (wetting agent)
- Antimicrobial (Kathon CG): 0.05% w/v
- pH: 6.5-7.0 (acetic acid buffer)

Saturation Parameters:
- Bath temperature: 40 ± 2°C
- Immersion time: 120 ± 10 s per panel
- Squeeze roll pressure: 0.8 ± 0.1 MPa (nip)
- Target pickup: 180-220% weight gain
```

The solution viscosity follows $\eta = \eta_0 (1 + 2.5\phi + 6.2\phi^2)$ where $\phi$ is volume fraction.

#### 2.1.2 Drying and Rigidization Kinetics

```
Drying Profile (convective hot air):
T_air = 80°C, v_air = 3 m/s, RH = 15%
Drying time: t_dry = 180 ± 30 s (per 2mm panel stack)

Rigidization modulus development:
E_rigid(t) = E_0 + (E_max - E_0) × (1 - exp(-t/τ_dry))
E_0 ≈ 0.5 GPa (wet), E_max ≈ 3.5 GPa (dry), τ_dry ≈ 45 s

Bending stiffness target: D_panel ≥ 0.8 N·m (per ASTM D7250)
```

#### 2.1.3 PVOH Removal (Post-Assembly)

```
Wash Cycle (closed-loop aqueous):
- Temperature: 40°C
- Detergent: 0.5% non-ionic (Ecolab Neodisher)
- Cycle time: 45 min (wash 20, rinse 15, spin 10)
- PVOH recovery: >98% via ultrafiltration (10 kDa MWCO)
- Fabric property restoration: ΔE/E < 2%, Δhand < 5% (Kawabata)
```

### 2.2 Gantry Kinematics and Work Envelope

**KUKA Quantec KR 210 R3100 ultra** (Research Doc 2 §6.2):
- Payload: 210 kg
- Reach: 3100 mm
- Repeatability: ±0.04 mm (ISO 9283)
- Axes: 6 + 1 external linear axis (7th axis, 4000 mm stroke)

**Work Envelope Definition:**
```
Cylindrical coordinates (robot base = origin):
r ∈ [500, 3100] mm
θ ∈ [-180°, +180°]
z ∈ [-200, 1800] mm

Collision-free zones per edition (pre-computed):
- Exclusion spheres: E_i = {c_i, r_i} for fixtures, tool changers
- Path planning: RRT* with 5000 iterations, 200 ms budget
```

### 2.3 End-Effector Tooling Suite (KSL KL-500/504, Research Doc 2 §6.2)

| Tool ID | Function | Specifications | Change Time |
|---------|----------|----------------|-------------|
| **RS-512** | Single-thread blind stitch | 301 lockstitch, 1.0-5.0 mm stitch length | 8 s |
| **RS-530** | Twin-needle double chain | 401 chainstitch, 2.5-6.0 mm, needle spacing 3-8 mm | 12 s |
| **RC-590** | Ultrasonic cutting | 20/35/40 kHz, 100 μm cut width, 500 W | 10 s |
| **RP-591** | Z-pinning head | Ultrasonic excitation 20 kHz, pin Ø 2.0 mm | 15 s |
| **US-WELD** | Ultrasonic seam welding | 20-40 kHz, rotary anvil, force 0.5-2.0 kN | 10 s |
| **RF-WELD** | RF dielectric welding | 27.12 MHz, 2-5 kW, electrode 200×50 mm | 15 s |
| **VISION** | Machine vision | 2× 5 MP CMOS, telecentric lens, 50 fps | N/A (fixed) |

**Automated Tool Changer (ATC):**
- Carousel: 8 positions (7 tools + 1 empty)
- Repeatability: ±0.015 mm (TCP)
- Air purge: 0.6 MPa dry air during change
- Tool ID: RFID tag + mechanical keying

### 2.4 Vision-Guided Path Correction (Research Doc 2 §6.2)

**Machine Vision System:**
```
Camera: 2× Sony IMX250 (5.0 MP, 2448×2048, global shutter)
Lens: Telecentric, 0.5× mag, WD = 150 mm, DOF = 8 mm
Illumination: 4-quadrant ring LED (660 nm, 50 klux)
Frame rate: 50 fps (triggered), 10 fps (continuous monitoring)

Reference Targets:
- Fiducial type: 10 mm circular retro-reflective (3M 7610)
- Placement: 4 corners + 2 mid-edge per panel
- Detection: Sub-pixel centroid (Cognex PatMax RedLine)
- Accuracy: ±0.02 mm (in-plane), ±0.05 mm (out-of-plane)
```

**Real-Time Path Correction Algorithm:**
```
For each seam segment S_k:
1. Acquire fiducial images at segment start
2. Compute rigid transform T_k: camera → robot base
   T_k = argmin ||Σ w_i · (P_i^meas - T_k · P_i^nom)||²
3. Update robot path: P_robot = T_k · P_nominal + Δ_comp
4. Δ_comp = f(thickness_map, tension_sensor, stitch_type)
5. Execute with 2 ms servo loop (KUKA RSI 4.0)
```

---
