## 6. Production Schedule & Capacity

### 6.1 Per-Unit Timeline (Single Edition)

| Phase | Duration | Parallelization |
|-------|----------|-----------------|
| Material production | 72 hr | Batch for 4 editions |
| Component fabrication | 96 hr | Parallel lines |
| Assembly & integration | 48 hr | Single line |
| QA validation | 24 hr | Parallel test cells |
| **Total** | **240 hr (10 days)** | **With batching: 1 unit/2 days** |

**Key Formulas:**
- Material production time: $t_{mat} = 72 \text{ hr}$
- Component fabrication time: $t_{comp} = 96 \text{ hr}$
- Assembly time: $t_{assy} = 48 \text{ hr}$
- QA validation time: $t_{QA} = 24 \text{ hr}$
- Total time: $t_{total} = 240 \text{ hr} = 10 \text{ days}$
- Batched throughput: $R_{batch} = 1 \text{ unit / 2 days}$

### 6.2 Capacity Planning

```
Annual capacity (single shift):
  - Material production: 500 ton basalt → 2000 suits
  - Component fab: 4 parallel lines → 500 suits/line/yr
  - Assembly: 2 lines → 1000 suits/yr
  - Bottleneck: Assembly (1000 suits/yr)
  - Target: 250 suits/yr (all 8 editions)
```

**Key Formulas:**
- Basalt production: $\dot{m}_{basalt} = 500 \text{ ton/yr} \rightarrow 2000 \text{ suits/yr}$
- Component fabrication: $N_{lines} = 4, \; R_{line} = 500 \text{ suits/line/yr}$
- Assembly: $N_{assy\_lines} = 2, \; R_{assy} = 1000 \text{ suits/yr}$
- Bottleneck rate: $R_{bottleneck} = 1000 \text{ suits/yr} \quad (\text{assembly})$
- Target production: $R_{target} = 250 \text{ suits/yr} \quad (\text{all 8 editions})$
- Utilization: $U = \frac{R_{target}}{R_{bottleneck}} \times 100\% = 25\%$
