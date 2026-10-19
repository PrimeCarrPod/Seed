## 6. Obsolescence Mitigation (DMSMS) — SAE AS6294

### 6.1 DMSMS Management Process

**DMSMS Risk Assessment (Quarterly):**
$$R_{DMSMS} = P_{obs} \times I_{impact} \times U_{urgency}$$

Where:
- $P_{obs}$ = Probability of obsolescence (0–1, from GIDEP/SD-22)
- $I_{impact}$ = Mission impact (1–5: Class A=5, B=4, C=3, D=1)
- $U_{urgency}$ = Time to stockout / lead time (dimensionless)

**Risk Thresholds:**
| Risk Score | Action | Timeline |
|------------|--------|----------|
| **R ≥ 15** | Immediate mitigation | 30 days |
| **10 ≤ R < 15** | Active mitigation | 90 days |
| **5 ≤ R < 10** | Monitor + plan | 180 days |
| **R < 5** | Routine watch | Annual |

### 6.2 Mitigation Strategies (Per SAE AS6294)

| Strategy | Applicability | Lead Time | Cost Factor |
|----------|---------------|-----------|-------------|
| **Last-Time Buy (LTB)** | All classes, sufficient forecast | 6–12 months | 1.5–3× unit cost |
| **Alternate Source Qualification** | Class B/C/D, form-fit-function | 12–24 months | 2–5× NRE |
| **Life-of-Type Buy (LOTB)** | Class A, sole source | 18–36 months | 3–10× unit cost |
| **Redesign / Retrofit** | Class A/B, technology refresh | 24–48 months | 10–50× NRE |
| **Emulation / FPGA** | Neuromorphic ASIC, controllers | 12–18 months | 5–15× NRE |
| **Additive Manufacturing** | Framework, seals, non-critical | 3–6 months | 2–10× unit cost |
| **Phoenix Protocol Recovery** | Ceramics, metals, textiles | Continuous | 0.3–0.6× new cost |

### 6.3 DMSMS Tracking Database (GLO Module)

```
DMSMS RECORD FIELDS (Per SAE AS6294 Appendix A):
  - NSN / Part Number
  - LRU Classification (A/B/C/D)
  - OEM / Cage Code
  - GIDEP Alert ID / SD-22 Notice
  - Risk Score (R_DMSMS)
  - Mitigation Strategy Selected
  - Mitigation Status: PLANNED / IN_PROGRESS / QUALIFIED / DEPLOYED
  - Qualification Data: Test reports, FAI, source approval
  - Cost Estimate / Actual
  - Timeline: Alert Date → Mitigation Complete
  - Configuration Impact: Affected AIMES editions/zones
  - Phoenix Protocol Applicability: YES/NO + recovery rate
```

---
