
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
