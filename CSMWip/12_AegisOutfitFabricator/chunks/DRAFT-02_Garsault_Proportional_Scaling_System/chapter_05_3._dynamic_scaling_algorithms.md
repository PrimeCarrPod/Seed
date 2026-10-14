## 3. Dynamic Scaling Algorithms

### 3.1 Base Size → Target Size Transformation Matrix
**Affine Transformation (Per Piece):**
```
[x']   [ S_x  0   ] [ x ]   [ T_x ]
[y'] = [ 0   S_y ] [ y ] + [ T_y ]
```
Where:
- S_x = horizontal scale factor
- S_y = vertical scale factor
- T_x, T_y = translation for alignment

**Non-Uniform Scaling Factors:**
```
S_x = (Target_Girth - Ease) / (Base_Girth - Ease)
S_y = (Target_Length) / (Base_Length)
```
Horizontal vs vertical ease handled separately.

**Homogeneous Coordinates (for concatenation):**
```
[x']   [ S_x  0   T_x ] [ x ]
[y'] = [ 0   S_y T_y ] [ y ]
[ 1 ]   [ 0   0   1  ] [ 1 ]
```

### 3.2 Grade Rules Per Size Increment (2cm Steps)
**Standard Grading (per 2cm bust increment):**
| Measurement | Grade Rule (per size) |
|-------------|----------------------|
| Bust | +2.0 cm |
| Waist | +1.5 cm |
| Hip | +2.0 cm |
| Nape-to-waist | +0.4 cm |
| Shoulder width | +0.5 cm |
| Back width | +0.5 cm |
| Armhole depth | +0.3 cm |
| Bicep | +0.5 cm |
| Sleeve length | +0.6 cm |
| Neck width | +0.3 cm |

**Grade Rule Matrix (Tensor Form):**
```
G = [ ∂M_i/∂S_j ]
```
Where M_i = measurement i, S_j = size variable j.

**Nested Grading (Multi-size layout):**
```
For sizes S_min to S_max step ΔS:
  Pattern_S = Pattern_base + (S - S_base) × G
  Nest all sizes simultaneously for marker efficiency
```

### 3.3 Non-Uniform Scaling: Horizontal vs Vertical Ease
**Horizontal Scaling (Girth):**
```
S_horizontal = (M_target - E_wear - E_design) / (M_base - E_wear_base - E_design_base)
```

**Vertical Scaling (Length):**
```
S_vertical = L_target / L_base
```
Length grading typically follows height proportionality.

**Ease Distribution:**
```
E_total = E_wear + E_design
E_horizontal = E_total × 0.7  (girth ease)
E_vertical = E_total × 0.3    (length ease)
```

**Ease Gradient Across Sizes:**
```
E(S) = E_base + (S - S_base) × ΔE/ΔS
ΔE/ΔS_bust = 0.5 cm per size
ΔE/ΔS_waist = 0.3 cm per size
```

### 3.4 Edition-Specific Scaling: TS, TG, SS, SG for RM & RW
**RenaissanceMan (RM) Editions:**
| Edition | Bust Range (cm) | Scale Factor | Notes |
|---------|-----------------|--------------|-------|
| RM-TS | 80-90 | 0.90-0.95 | Petite |
| RM-TG | 95-105 | 1.00-1.05 | Standard |
| RM-SS | 75-85 | 0.85-0.90 | Small structure |
| RM-SG | 100-110 | 1.05-1.10 | Large structure |

**RenaissanceWoMan (RW) Editions:**
| Edition | Bust Range (cm) | Scale Factor | Notes |
|---------|-----------------|--------------|-------|
| RW-TS | 80-90 | 0.90-0.95 | Petite |
| RW-TG | 95-105 | 1.00-1.05 | Standard |
| RW-SS | 75-85 | 0.85-0.90 | Small structure |
| RW-SG | 100-110 | 1.05-1.10 | Large structure |

**Combined Scaling Function:**
```
Scale(Edition, Morphology, Target_Measurements) = 
  Base_Scale(Morphology) × Edition_Factor(Edition) × Individual_Factor(Measurements)
```

**Morphology Factors (RM vs RW):**
```
RM: Broader shoulders, narrower hips, longer torso
RW: Narrower shoulders, wider hips, shorter torso
Factor_RM = {S_x: 1.02, S_y: 1.01}
Factor_RW = {S_x: 0.98, S_y: 0.99}
```
