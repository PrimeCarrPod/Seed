## 3. LES 12-Zone Anthropometric Mapping (DOC-05 §3.1, CSMFAB078-A Table 3.3)

### 3.1 Zone Anatomical Landmarks — RM-TS Specific

| Zone | Anatomical Landmark | RM-TS Position (cm from cervical) | RM-TS Circumference | Base Tension (N) |
|------|---------------------|-----------------------------------|---------------------|------------------|
| **Z1** | Shoulder apex (acromion) | 12.5 | 45 (shoulder circ.) | 55 |
| **Z2** | Scapular spine (T3) | 18.0 | 90 (chest) | 60 |
| **Z3** | Thoracic spine (T7) | 28.0 | 88 (thoracic) | 65 |
| **Z4** | Lumbar (L3, waist) | 42.0 | **75 (waist)** | 70 |
| **Z5** | Iliac crest | 54.0 | 93 (hip) | 65 |
| **Z6** | Ant. sup. iliac spine | 52.0 | 90 (high hip) | 60 |
| **Z7** | Sternum (manubrium) | 16.0 | 90 (chest) | 50 |
| **Z8** | Costal margin (xiphoid) | 34.0 | 82 (lower chest) | 55 |
| **Z9** | Axillary (mid-axillary) | 24.0 | 88 (thoracic) | 45 |
| **Z10** | Cervical (C7) | 0.0 | 38 (neck) | 40 |
| **Z11** | Occipital (external protuberance) | -4.0 | 56 (head) | 35 |
| **Z12** | Distal sleeve (wrist) | 86 (arm length) | 17 (wrist) | 30 |

### 3.2 RM-TS Calibrated Tensions (Per Edition Formula)

$$T_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot \left(1 + \alpha_{\text{RM-TS}} \cdot \frac{M_{\text{RM-TS}} - M_{\text{ref}}}{M_{\text{ref}}}\right) \cdot \beta_{z,\text{RM-TS}}$$

$$T_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot (1 - 0.08 \times 0.08) \cdot \beta_{z,\text{RM-TS}} = T_{z,\text{base}} \cdot 0.9936 \cdot \beta_{z,\text{RM-TS}}$$

| Zone | Base (N) | β_z,RM-TS | RM-TS Calibrated (N) | Historical Lacing Point |
|------|----------|-----------|---------------------|------------------------|
| Z1 | 55 | 1.00 | **54.6** | Sleeve head attachment |
| Z2 | 60 | 1.00 | **59.6** | Back lacing (doublet) |
| Z3 | 65 | 0.98 | **63.4** | Center back stay |
| Z4 | 70 | **0.95** | **66.1** | Waist lacing (hose) |
| Z5 | 65 | 1.00 | **64.6** | Hose waistband |
| Z6 | 60 | 1.02 | **60.8** | Hose suspension |
| Z7 | 50 | 1.00 | **49.7** | Front doublet lacing |
| Z8 | 55 | 0.98 | **53.7** | Lower front points |
| Z9 | 45 | 1.00 | **44.7** | Side gore lacing |
| Z10 | 40 | 1.00 | **39.7** | Collar/band attachment |
| Z11 | 35 | 1.00 | **34.8** | Coif/hood tie |
| Z12 | 30 | 1.00 | **29.8** | Cuff lacing |

**Total LES Tension (RM-TS):** $\sum T_z = 616.5 \text{ N}$ (vs. 620 N base)

---
