## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $\text{Baseline}_{k+1} \iff \text{Review}_k \land \text{AI}_k \geq 95\% \land \text{Artifacts}=100\% \land \text{CCB}$ | Baseline transition criteria | 1.2 |
| 2 | $\text{Impact Score} = \sum w_d \cdot \text{Severity}_d$ | Change impact severity | 2.3 |
| 3 | $\text{CMDB Consistency} \iff \forall CI: \text{Git}=\text{PLM} \land \text{Reqs}=\text{Design} \land \text{ECR}=\text{Impl}$ | CMDB integrity | 3.3 |
| 4 | $\text{Implementation \%} = N_{impl}/N_{affected} \times 100\%$ | ECO implementation tracking | 6.3 |
| 5 | $\text{Reproducible} \iff \text{Build}(S,C,T) = \text{Artifact}$ | Build reproducibility | 5.4 |

---
