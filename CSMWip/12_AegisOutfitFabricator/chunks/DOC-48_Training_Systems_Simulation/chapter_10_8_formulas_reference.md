## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $\text{Score} = \sum_i w_i (1 - |t_a - t_t|/t_t) \mathbb{I}(\text{Correct}_i)$ | AAR Automated Scoring | 3.3, 5.2 |
| 2 | $\text{Difficulty}(t) = \text{Base} + \alpha \cdot \text{Proficiency} + \beta \cdot \text{Complexity}$ | AI Adversary Scaling | 3.2 |
| 3 | $\frac{d\text{Proficiency}}{dt} = \eta \cdot (\text{Perf}_{\text{target}} - \text{Perf}_{\text{actual}}) - \lambda \cdot \text{Proficiency}$ | Proficiency Dynamics | 3.2 |
| 4 | $\text{Total FP64 TFLOPS} = N_{\text{GPU}} \times \text{FP64}_{\text{per-GPU}}$ | Compute Capacity | 2.1 |
| 5 | $\text{Total FP32 TFLOPS} = N_{\text{GPU}} \times \text{FP32}_{\text{per-GPU}}$ | Compute Capacity | 2.1 |
| 6 | $\Delta t_{\text{frame}} = \frac{1}{f_{\text{target}}}$ | Frame Budget | 2.2 |
| 7 | $S(N) = \frac{1}{(1-p) + \frac{p}{N} + \alpha \log_2 N}$ | Strong Scaling (Amdahl) | 2.3 |
| 8 | $S(N) = N - \alpha (N-1) \log_2 N$ | Weak Scaling (Gustafson) | 2.3 |
| 9 | $N_{\text{trainees}}^{\text{max}} = \lfloor \text{Total FP32} / \text{TFLOPS}_{\text{per-trainee}} \rfloor$ | Max Trainees | 2.3 |
| 10 | $\text{Stream BW} = \sum_{i} \frac{A_i \cdot R_i \cdot B_{\text{tex}}}{T_{\text{frame}}}$ | Terrain Streaming | 3.1 |
| 11 | $\text{Force Size} = \text{Mission} \times \text{Threat} \times \text{Ratio}$ | CGF Generation | 3.2 |
| 12 | $N_{\text{aggregated}} = \lceil N_{\text{entities}} / E_{\text{per-aggregate}} \rceil$ | Entity Aggregation | 3.2 |
| 13 | $R(t) = R_0 e^{-\lambda t} + (1-e^{-\lambda t}) R_{\infty}$ | Knowledge Retention | 4.4 |
| 14 | $\text{Transfer} = \frac{\text{Perf}_{\text{job}} - \text{Base}_{\text{job}}}{\text{Perf}_{\text{train}} - \text{Base}_{\text{train}}}$ | Transfer of Training | 4.4 |
| 15 | $W_{\text{instructor}} = \sum_i (w_m + w_i I_i + w_a I_a)$ | Instructor Workload | 5.1 |
| 16 | $\text{Final Score} = \sum_m w_m \cdot \text{Score}_m \cdot \text{Reliability}_m$ | Composite Assessment | 5.2 |
| 17 | $L_{\text{total}} = L_{\text{local}} + L_{\text{wan}} + L_{\text{gateway}} + L_{\text{fed}}$ | DMO Latency Budget | 6.1 |
| 18 | $\mathbf{p}(t) = \mathbf{p}_0 + \mathbf{v}_0 \Delta t + \frac{1}{2} \mathbf{a}_0 \Delta t^2$ | Dead Reckoning | 6.2 |
| 19 | $N_{\text{sites}}^{\text{max}} = \lfloor B_{\text{wan}} / B_{\text{per-site}} \rfloor$ | Max Federation Sites | 6.3 |
| 20 | $T_{\text{join}} = T_{\text{conn}} + T_{\text{reg}} + T_{\text{sync}} + T_{\text{val}}$ | Federate Join Time | 6.3 |

---

