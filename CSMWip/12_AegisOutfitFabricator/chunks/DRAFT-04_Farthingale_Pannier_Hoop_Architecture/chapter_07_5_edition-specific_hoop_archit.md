## 5. Edition-Specific Hoop Architecture

### 5.1 Hoop Count and Radius by Edition
| Edition | Hoops | r_max (mm) | a/b Ratio | Tapes |
|---------|-------|------------|-----------|-------|
| RM-TS | 4 | 500 | 1.5 | 12 |
| RM-TG | 5 | 600 | 1.7 | 16 |
| RM-SS | 4 | 450 | 1.4 | 12 |
| RM-SG | 6 | 700 | 1.8 | 20 |
| RW-TS | 4 | 550 | 1.6 | 12 |
| RW-TG | 5 | 650 | 1.8 | 16 |
| RW-SS | 4 | 500 | 1.5 | 12 |
| RW-SG | 6 | 750 | 2.0 | 24 |

### 5.2 Hoop Spacing (Vertical)
```
h_i = L_skirt / (N_hoops + 1)
h_1 (waist) = 0.5 × h_i
h_N (hem) = 1.5 × h_i
Intermediate: graded for volume distribution
```

### 5.3 Wire Diameter by Edition
```
t_wire = 1.0 + 0.2 × (Edition_Index)  mm
TS: 1.0mm, TG: 1.2mm, SS: 1.0mm, SG: 1.4mm
```

### 5.4 Hoop Radius Grading Function
```
r_i = r_1 + (r_N - r_1) × ((i-1)/(N-1))^p
p = 1.0 (linear) to 1.5 (accelerated at hem)
```

