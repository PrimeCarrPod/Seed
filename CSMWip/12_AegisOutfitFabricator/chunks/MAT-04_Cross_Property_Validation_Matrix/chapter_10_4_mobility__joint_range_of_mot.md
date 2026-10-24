## 4. Mobility & Joint Range of Motion

### 4.1 Joint ROM Requirements
| Joint | Required ROM | Critical Motion |
|-------|-------------|-----------------|
| Shoulder | 180° flexion, 60° extension | Overhead reach, cross-body |
| Elbow | 0-150° flexion | Manipulation, tool use |
| Wrist | 80° flex, 70° ext, 30° rad/uln | Fine motor, grip |
| Hip | 120° flex, 20° ext, 40° abd | Walking, climbing, kneeling |
| Knee | 0-140° flexion | Walking, stairs, crouching |
| Ankle | 20° DF, 50° PF | Walking, balance |

### 4.2 Ceramic Tile Articulation
**Tile Overlap Design:**
```
Tile gap at joint: g = 2-3 mm (allows 15-20° bending before contact)
Overlap pattern: imbricated (scale-like) for multi-directional flexion
Tile count per joint zone: 6-12 tiles (scales with edition)
```

**Bending Stiffness (Ceramic + Fabric Composite):**
```
D = E_ceramic × t³ / 12(1-ν²) + E_fabric × t_f³ / 12(1-ν²)
For 4mm ceramic + 2mm fabric: D ≈ 200-500 N·m
Moment for 15° bend over 100mm: M = D × κ = D × (0.26 rad / 0.1m) ≈ 500-1300 N·mm
Torque at shoulder/elbow: well within human capability (<10 Nm)
```

**Tile Contact Mechanics:**
```
Contact pressure: p = E* δ / (π a)
a = √(R δ)  (Hertz contact radius)
R = tile radius of curvature ≈ 50-100 mm
δ = interference = g - g_contact
```

### 4.3 STF Layer Impact on Mobility
- STF-impregnated fabric: 1.5-2× bending rigidity vs base fabric
- At low shear rates (normal movement): η ≈ η₀ (low viscosity)
- At high shear rates (impact): η → η_max (stiffens)
- **Transition shear rate:** γ̇_c ≈ 10-50 s⁻¹ (normal movement <5 s⁻¹)
- Result: Normal movement unimpeded, impact protection active

**Bending Rigidity Increase:**
```
D_STF / D_base = 1 + (E_STF - E_base) × t_STF / E_base × t_base
E_STF ≈ 2-5 × E_base (at high shear)
Increase factor: 1.5-2×
```

### 4.4 Baleen/Steel Chassis Flexibility
**Baleen (Historical):**
- Thermoplastic at body heat → conforms to torso
- Lateral bending: R_min ≈ 50-100 mm
- Springback: slow (viscoelastic), holds shape under lacing tension

**Spiral Steel (Modern Substitute):**
- 2D bending: R_min ≈ 30-50 mm (tighter than baleen)
- Springback: immediate (elastic)
- Requires LES tension zones to prevent gaping

**LES 12-Zone Tension for Mobility:**
```
Zone tensions calibrated per edition:
Shoulders: 15-25 N (allow scapular motion)
Chest: 20-40 N (respiratory expansion)
Waist: 30-60 N (core stability, sitting)
Hips: 20-40 N (walking stride)
Thighs: 15-25 N (knee flexion)
Calves: 10-20 N (ankle motion)
Arms: 10-20 N (full ROM)
```

**Tension Distribution Matrix:**
```
T_i = T_nominal × (1 + k_edition × Δ_edition + k_morphology × Δ_morphology)
k_edition = 0.15 (TG vs TS), k_morphology = 0.20 (SG vs SS)
```

### 4.5 Articulation Index (AI) Metric
```
AI = Σ (ROM_achieved / ROM_required) × w_joint
w_shoulder = 0.20, w_elbow = 0.15, w_hip = 0.20, w_knee = 0.20, w_ankle = 0.15, w_wrist = 0.10
Target AI ≥ 0.90 for all editions
```


