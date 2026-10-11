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
