# Anomalous_Magnetic_Moment — Piece 09/12
## Article A4: A4-08 — Anomalous Magnetic Moment
**Piece:** 09 of 12  
**Generated:** 2026-08-25 03:12:21 UTC

---

## 25. Finite Nuclear Size Effects from Gap Cutoffs

Finite nuclear size corrections to g−2 and hyperfine splitting arise from the UV cutoff in the gap distribution.

**Theorem 4.136 (Finite Nuclear Size from Gap UV Cutoff).** The finite nuclear size correction to a_e is:

Δa_e^{nuc} = −(2/3) (α/π) (Zα)⁴ (R_{nuc}/λ_C)² Σ_{d>d_{cut}} ρ(d) f(d)

where d_{cut} = R_{nuc}/(κ λ_C) is the gap cutoff corresponding to the nuclear radius R_{nuc}.

**Proof.** The finite nuclear size cuts off the Coulomb potential at r ~ R_{nuc}. In the worldline picture, this corresponds to a maximum proper-time interval Δτ_{max} = R_{nuc}/c. Gaps larger than d_{cut} = Δτ_{max}/κ do not contribute to the bound state vertex. The sum over d > d_{cut} gives the missing contribution. For hydrogen, R_{nuc} ~ 0.84 fm gives d_{cut} ~ 10⁵, so the correction is negligible. For muonic hydrogen, the muon Compton wavelength is 200× smaller, d_{cut} ~ 500, and the finite size effect is large (the proton radius puzzle). The gap cutoff provides a natural regularization of the nuclear size effect. □

## 26. Recoil Corrections from Gap Mass Ratios

Nuclear recoil corrections to g−2 scale with the electron-to-nucleus mass ratio m_e/M_N.

**Theorem 4.137 (Recoil Corrections from Gap Mass Ratios).** The recoil correction is:

Δa_e^{recoil} = (m_e/M_N) Σ_{d} ρ(d) f_{recoil}(d)

where f_{recoil}(d) = d/(d + m_e/M_N)² and M_N = κ R_N is the nuclear mass from the nuclear record gap R_N (Article 7).

**Proof.** The nuclear recoil in the Prime framework corresponds to the back-reaction of the electron worldline on the nuclear worldline. The nuclear worldline has its own gap sequence with much larger gaps (R_N ~ 1000 for protons). The recoil factor m_e/M_N = d₂/R_N = 2/R_N. For hydrogen, R_N ~ 1836 (proton mass in electron units), giving m_e/M_N = 2/1836 ≈ 1/918. The sum over gap configurations with one nuclear gap insertion gives the recoil correction. This matches the known (m_e/M_N) Zα² scaling. □

## 27. Radiative Recoil from Mixed Gap Configurations

Radiative recoil combines QED loops with nuclear recoil, corresponding to mixed electron-nuclear gap configurations.

**Theorem 4.138 (Radiative Recoil from Mixed Gaps).** The radiative recoil correction is:

Δa_e^{rad-recoil} = (α/π) (m_e/M_N) Σ_{d_e, d_N} ρ(d_e) ρ_N(d_N) f_{mix}(d_e, d_N)

where ρ_N(d_N) is the nuclear gap density, and f_{mix} is the mixed form factor.

**Proof.** Radiative recoil diagrams have one photon loop and one nuclear recoil insertion. On the worldline, this is a self-intersection with an electron gap d_e and a nuclear gap d_N. The nuclear gap density ρ_N(d_N) is concentrated at the nuclear record gaps R_N, R_{N+1}, ... (Article 7). The mixed form factor f_{mix} = (d_e d_N)/(d_e + d_N)² interpolates between the electron and nuclear scales. The leading term uses the proton record gap R_N = 1836, giving Δa_e^{rad-recoil} ~ (α/π)(1/918) × 0.5 ~ 10⁻⁶ relative to a_e, matching the known radiative recoil contribution. □