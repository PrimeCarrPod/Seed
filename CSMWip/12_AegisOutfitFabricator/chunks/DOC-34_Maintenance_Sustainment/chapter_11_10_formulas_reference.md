## 10. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | Ao = MTBF/(MTBF+MTTR) | Operational availability | 1.2 |
| 2 | da/dN = C·(ΔK)^m | Paris Law (fatigue crack growth) | 6.2 |
| 3 | RUL_tile = (K_IC/(Y·σ·√(π·a)))^(2/(2-m)) · (1/C)^(1/(2-m)) | Ceramic tile RUL | 6.2 |
| 4 | dτ_yield/dt = k₁·exp(-Ea/RT)·t^(-0.5) + k₂·N_cycles | MR fluid degradation rate | 6.2 |
| 5 | RUL_calendar = (SOC₀-SOC_EOL)/(k_cal·exp(-Ea/RT)·t^0.5) | Battery calendar RUL | 6.2 |
| 6 | RUL_cycle = (Q₀-Q_EOL)/(k_cyc·DOD^α·rate^β) | Battery cycle RUL | 6.2 |
| 7 | dLeak/dt = A·(ΔP)^n·exp(-Ea/RT)·N_cycles^m | Seal leak rate growth | 6.2 |
| 8 | Safety Stock = z·σ_D·√L | Spare parts safety stock | 5.2 |
| 9 | λ = fleet × cycles/yr × failure_rate | Demand forecast rate | 5.2 |
| 10 | COP = Q_cooling/W_compressor | Heat pump performance | 4.2.3* |
| 11 | Protection_Factor = C_out/C_in | CBRN protection factor | 4.1.2* |
| 12 | HI = f(core_temp, HR, RR, SpO₂, HI_prev) | Health Index | 2.1* |
| 13 | P_cancel(t) = -α ∫ a_body(τ)h(t-τ)dτ | Bio-acoustic cancellation | 1.1* |
| 14 | Scale matrix S = diag(s_x,s_y,s_z) + non-linear | Garsault scaling | 3.3* |
| 15 | Shannon C = B log₂(1+SNR) | RF mesh capacity | 3.5* |

*From referenced documents (DOC-27, 28, 30, 32, SYNTH-03, CSMFAB078)

---
