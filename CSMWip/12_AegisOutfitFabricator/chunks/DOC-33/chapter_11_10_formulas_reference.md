## 10. Formulas Reference

| # | Formula | Description | Section |
|---|---------|-------------|---------|
| 1 | F_target_i = k_i × (L_current - L_target)/L_target | LES tension zone force | 3.6 |
| 2 | t_transition = Σ\|ΔF_i\|/(dF/dt_max) | Morphology transition time | 3.6 |
| 3 | E = v × B | MHD induced electric field | 4.2 |
| 4 | J = σ(E + v × B) | MHD current density | 4.2 |
| 5 | P = J·E = σ(v×B)² | MHD power density | 4.2 |
| 6 | Q = (π×d³×ΔP)/(12×μ×L) × (1-0.63e^(-0.84t/τ)) | Seal leak rate | 4.4 |
| 7 | COP = Q_cooling/W_compressor | Heat pump coefficient of performance | 4.3 |
| 8 | ΔT = T_evap - T_cond | Thermal loop temperature difference | 4.3 |
| 9 | Protection_Factor = C_outside/C_inside | CBRN protection factor | 4.4 |
| 10 | HI = f(core_temp, HR, RR, SpO₂, HI_prev) | Health Index calculation | 4.5 |
| 11 | P_cancel(t) = -α ∫ a_body(τ)h(t-τ)dτ | Bio-acoustic cancellation | 1.3* |
| 12 | Scale matrix S = diag(s_x,s_y,s_z) + non-linear | Garsault proportional scaling | 3.3* |
| 13 | NFP collision detection | Zero-waste nesting (Alcega) | 3.3* |
| 14 | Simulated annealing T(t) = T₀/(1+αt) | Pattern optimization | 3.3* |
| 15 | Shannon capacity C = B log₂(1+SNR) | RF mesh channel capacity | 3.5 |

*From SYNTH-03 (referenced via dependency)

---


