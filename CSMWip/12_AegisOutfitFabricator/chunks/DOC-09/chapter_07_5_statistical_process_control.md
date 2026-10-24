## 5. Statistical Process Control

### 5.1 Control Charts

| Parameter | Chart Type | Subgroup | Frequency | Action Limits |
|-----------|------------|----------|-----------|---------------|
| Ceramic tile density | X-bar/R | n=5 | Hourly | ±3σ |
| BFRP FVF | X-bar/S | n=3 | Per panel | ±2σ |
| Thread coating thickness | X-bar/R | n=5 | Per batch | ±2σ |
| STF add-on weight | I-MR | n=1 | Per garment | ±3σ |
| Tile dimensions | X-bar/R | n=5 | Per 50 tiles | ±2σ |

**Key Formulas:**
- X-bar chart: $\bar{X} = \frac{1}{n} \sum_{i=1}^{n} x_i$
- R chart: $R = \max(x_i) - \min(x_i)$
- S chart: $S = \sqrt{\frac{1}{n-1} \sum_{i=1}^{n} (x_i - \bar{X})^2}$
- Control limits: $UCL = \bar{X} + A_2 \bar{R}, \; LCL = \bar{X} - A_2 \bar{R}$
- ±3σ limits: $UCL = \mu + 3\sigma, \; LCL = \mu - 3\sigma$
- ±2σ limits: $UCL = \mu + 2\sigma, \; LCL = \mu - 2\sigma$
- I-MR chart: Individual values and moving range $MR_i = |x_i - x_{i-1}|$

### 5.2 Process Capability

```
Target: Cpk ≥ 1.33 for all critical characteristics
Critical characteristics:
  - Ceramic tile density (Cpk ≥ 1.50)
  - BFRP panel FVF (Cpk ≥ 1.33)
  - EMI SE @ 1GHz (Cpk ≥ 1.33)
  - Thermal resistance R-value (Cpk ≥ 1.33)
  - Ballistic BFS (Cpk ≥ 1.50)
```

**Key Formulas:**
- Process capability: $C_p = \frac{USL - LSL}{6\sigma}$
- Process capability index: $C_{pk} = \min\left(\frac{USL - \mu}{3\sigma}, \frac{\mu - LSL}{3\sigma}\right)$
- Target Cpk: $C_{pk} \geq 1.33 \quad (\text{critical: } \geq 1.50)$
- PPM (parts per million): $PPM = 10^6 \times [1 - \Phi(C_{pk} \times 3)]$
- Six Sigma quality: $C_{pk} = 2.0 \rightarrow PPM \approx 3.4$
