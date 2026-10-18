## 8. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | $s_i = 1 + \mathbf{K}_i (\mathbf{a} - \mathbf{a}_{50})$ | Zone scaling factors | 1.2 |
| 2 | $P_{max} = \max p(x,y) \leq 80 \text{ kPa}$ | Max sustained pressure | 1.3 |
| 3 | $\|\nabla p\|_2 \leq 15 \text{ kPa/cm}$ | Pressure gradient limit | 1.3 |
| 4 | $TLX = \frac{1}{15} \sum w_i r_i$ | NASA-TLX workload index | 2.2 |
| 5 | $C(t) = C_{max} (1 - TLX/100)^\alpha \eta_{arousal}$ | Cognitive throughput | 2.3 |
| 6 | $L_{decision} = H_{task}/C(t) + L_{sensor} + L_{AI} + L_{act}$ | Decision latency | 2.3 |
| 7 | $\tau_{assist,j} = k_{assist,j} \tau_{human,j} \eta_{eff,j}$ | Actuator assist torque | 3.1 |
| 8 | $\dot{E}_{met} = \dot{E}_{basal} + \sum \frac{|\tau \omega|}{\eta}$ | Metabolic rate | 3.2 |
| 9 | $ROM_{compliance} = \frac{1}{N} \sum \mathbb{I}(ROM_{AIMES} \geq 0.95 ROM_{nat})$ | ROM compliance | 3.3 |
| 10 | $\frac{dT_{skin}}{dt} = \frac{1}{C_{skin}}(\dot{Q}_{met} - \dot{Q}_{dry} - \dot{Q}_{evap} - \dot{Q}_{cool})$ | Skin temp dynamics | 4.1 |
| 11 | $PSI = 5 \frac{T_{re}-T_{re,0}}{39.5-T_{re,0}} + 5 \frac{HR-HR_0}{180-HR_0}$ | Physiological strain index | 4.2 |
| 12 | $\dot{m}_{sweat} = 147 e^{0.032 T_{core}} e^{0.016 T_{skin}} (1 - 0.015 RH)$ | Sweat rate | 4.3 |
| 13 | $\rho_{sym} = N_{symbols}/A_{FOV} \leq 0.8 \text{ sym/deg}^2$ | HMD symbology density | 5.2 |
| 14 | $PVT_{score} = \frac{1}{N} \sum 1/RT_i$ | Psychomotor vigilance | 6.3 |

---
