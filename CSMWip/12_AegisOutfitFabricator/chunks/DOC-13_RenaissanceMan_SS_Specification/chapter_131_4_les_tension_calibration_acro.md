## 4. LES Tension Calibration Across Editions

### 4.1 Base Tension Vectors (N)

| Zone | RM-SS | RM-TS | RM-SG | RM-TG |
|------|-------|-------|-------|-------|
| Z1 Neck | 50 | 55 | 60 | 70 |
| Z2 Shoulder | 55 | 60 | 70 | 75 |
| Z3 Upper Torso | 60 | 65 | 80 | 85 |
| Z4 Chest | 60 | 65 | 80 | 90 |
| Z5 Waist | 55 | 60 | 85 | 95 |
| Z6 Hip | 50 | 55 | 80 | 90 |
| Z7 Deltoid | 45 | 50 | 65 | 70 |
| Z8 Forearm | 40 | 45 | 55 | 60 |
| Z9 Thigh | 35 | 40 | 50 | 55 |
| Z10 Knee | 30 | 35 | 45 | 50 |
| Z11 Calf | 25 | 30 | 40 | 45 |
| Z12 Ankle | 20 | 25 | 35 | 40 |
| **TOTAL** | **525** | **585** | **785** | **885** |

### 4.2 Transition Tension Formula

$$T_{z,\text{target}} = T_{z,\text{source}} \times \frac{1 + \alpha_{\text{target}} \beta_z}{1 + \alpha_{\text{source}} \beta_z}$$

Where $\beta_z$ = zone sensitivity (from MAT-04 Table 5.1):
$$\beta = [0.8, 0.9, 1.0, 1.0, 1.1, 1.1, 1.0, 0.9, 0.8, 0.7, 0.6, 0.5]$$

---
