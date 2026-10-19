## 4. Cost Estimation

### 4.1 Estimation Methods — GAO Cost Guide Compliance

The AIMES program employs **Multiple Estimation Methods** per **GAO Cost Estimating and Assessment Guide** (2020) Chapter 5:

| Method | WBS Scope | Basis | Uncertainty |
|--------|-----------|-------|-------------|
| **Analogy** | Program Management, SE/PM | Historical: F-35, IVAS, NGCC | ±25% |
| **Parametric (SEER-H)** | Manufacturing, Software | CALIBRATED: DOC-41..50, FAB-RM/RW | ±15% |
| **Engineering Build-Up** | Ceramic Tiles, MXene, Aerogel | Bottom-up: BOM + Labor + Tooling | ±10% |
| **Extrapolation** | Sustainment (20 yr) | DOC-35, Field Data Analogs | ±30% |

### 4.2 Cost Breakdown Structure (CBS) — By Appropriation

| Appropriation | FY26 | FY27 | FY28 | FY29 | FY30 | FY31 | Total (TY$M) |
|---------------|------|------|------|------|------|------|--------------|
| **RDT&E** | 185.2 | 298.7 | 342.1 | 287.4 | 156.8 | 42.3 | 1,312.5 |
| **Procurement** | 0 | 0 | 45.6 | 189.2 | 312.7 | 298.4 | 845.9 |
| **MILCON** | 12.5 | 28.3 | 15.7 | 0 | 0 | 0 | 56.5 |
| **O&M** | 5.2 | 12.8 | 28.4 | 45.6 | 67.3 | 78.9 | 238.2 |
| **Total** | 202.9 | 339.8 | 431.8 | 522.2 | 536.8 | 419.6 | 2,453.1 |

### 4.3 Learning Curve Modeling

Manufacturing cost reduction follows **Crawford Unit Learning Curve**:

$$
Y_x = A \cdot x^b
$$

Where:
- $Y_x$ = Cost of $x$-th unit
- $A$ = Theoretical first unit cost (T1)
- $b = \frac{\ln(LC\%)}{\ln(2)}$ = Learning exponent
- $LC\%$ = Learning curve slope (typically 85–95%)

**AIMES Learning Curves by WBS**:

| WBS Element | LC% | T1 ($K) | Units to 90% |
|-------------|-----|---------|--------------|
| Ceramic Tiles (1.6.4) | 88% | 12.5 | 140 |
| MXene Coating (1.6.5) | 92% | 8.2 | 280 |
| Silk Weaving (1.6.1) | 85% | 45.0 | 95 |
| Aerogel Quilting (1.6.6) | 90% | 22.0 | 180 |
| Final Assembly (1.6.9) | 87% | 180.0 | 120 |

**Cumulative Average Cost** for $N$ units:

$$
\bar{C}_N = \frac{T_1 \cdot N^{b+1}}{b+1}
$$

### 4.4 Should-Cost Initiatives

Per **Better Buying Power 3.0**, the program targets 5% should-cost reduction:

| Initiative | Target Savings | Approach |
|------------|----------------|----------|
| **Ceramic Yield** | $12.4M | Statistical process control, in-situ monitoring |
| **MXene Roll-to-Roll** | $8.7M | Continuous process vs. batch |
| **Silk Automation** | $15.2M | Automated reeling, degumming |
| **Digital Twin** | $6.3M | Virtual qualification, reduced physical tests |
| **PBL Contracting** | $22.1M | Performance-based logistics (DOC-35) |

---
