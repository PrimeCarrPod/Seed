## 4. Cross-Property Validation Matrix (from MAT-04, SYNTH-01 §4.7, CSMFAB078-B §4, CSMFAB078 Main §5)

### 4.1 HAS vs PES Trade-Off Curves

**Pareto Frontiers per Edition (from MAT-04 §4.1, SYNTH-01 §4.7):**

$$\mathcal{P}_e = \{(\text{HAS}, \text{PES}) \mid \text{feasible for edition } e\}$$

**Knee Points (Optimal Balance):**

| Edition | HAS* | PES* | Mass (kg) | Dominant Constraint |
|---------|------|------|-----------|---------------------|
| RM-TS | 0.87 | 0.92 | 16.5 | Thermal (L5 thickness) |
| RM-TG | 0.82 | 0.95 | 20.9 | Ballistic (L2/L7 tiles) |
| RM-SS | 0.89 | 0.88 | 13.7 | EMI (L3/L6 density) |
| RM-SG | 0.84 | 0.93 | 17.2 | Trauma (L8/L9 STF) |
| RW-TS | 0.85 | 0.91 | 16.0 | Thermal + Stays geometry |
| RW-TG | 0.80 | 0.94 | 20.1 | Ballistic + Farthingale |
| RW-SS | 0.88 | 0.87 | 13.2 | EMI + Sleeve mobility |
| RW-SG | 0.83 | 0.92 | 16.8 | Trauma + Hoop volume |

### 4.2 Weight Budget Allocation (Validated, per MAT-04 §4.2, CSMFAB078-A §3.4, SYNTH-01 §4.7)

**Total System Mass Equation:**

$$M_{\text{total}} = \sum_{k=1}^{12} \rho_k A_k + M_{\text{textile}} + M_{\text{lacing}} + M_{\text{hardware}} + M_{\text{margin}}$$

**Margin Policy:** $\delta_{\text{manuf}} = 5\%$, $\delta_{\text{contingency}} = 8\%$, total 13% growth allowance.

### 4.3 Thermal Comfort Validation (per MAT-04 §4.3, ISO 11092, ISO 7933, CSMFAB078-B §3.5)

**Sweating Guarded Hot Plate (ISO 11092):**

$$R_{\text{ct}} = \frac{T_{\text{skin}} - T_{\text{amb}}}{H} \quad \text{Target: } R_{\text{ct}} \leq 0.3\text{ m}^2\text{K/W}$$

**Predicted Heat Strain (ISO 7933):**

$$\text{PHS} = \frac{M - W}{\text{MaxEvap}} \quad \text{Target: PHS} < 0.7 \text{ for 60 min duty}$$

---
