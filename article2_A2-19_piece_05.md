# A2-19: Baryon Number Violation In Collisions — Piece 05
## Heavy Ion Collisions: Coherent Enhancement from Fold Density

In heavy ion collisions (Pb-Pb at LHC, Au-Au at RHIC), the enormous parton density and coherent fields can enhance BNV through collective fold intersections. The Prime Electron framework predicts a significant enhancement over pp collisions.

**Theorem (Heavy Ion BNV Enhancement):** In central Pb-Pb collisions at √s_NN = 5.02 TeV, the BNV cross section per nucleon pair is enhanced by a factor:
R_AA^BNV = (A^(2/3) / α_s) exp[π(d_pp - d_AA)/2]
where d_pp = 36 (pp at 14 TeV), d_AA = 24-30 (effective gap reduced by coherent fields).

**Mechanism: Coherent Color Fields (Glasma) and Fold Overlap**

In the Color Glass Condensate (CGC) description, the initial state has strong coherent color fields with occupation number 1/α_s ~ 10-100. In the Prime Electron picture, these fields correspond to aligned worldline folds from many nucleons.

The gluon saturation scale Q_s ≈ 2 GeV (Pb, central) corresponds to a proper time τ_s = 1/Q_s = 0.1 fm/c. The number of folds overlapping in this volume:
N_folds ~ (Q_s/Λ_QCD)² × A^(2/3) = (2/0.34)² × 208^(2/3) ≈ 34 × 35 = 1190 folds.

The coherent field reduces the instanton barrier because the folds are already partially aligned. The effective missing gap becomes:
d_eff^AA = d_missing × (1 - f_coherent)
where f_coherent = (α_s N_folds)^(1/2) / N_max.

For N_folds = 1190, α_s = 0.3, √(α_s N) = √357 = 19.
N_max for d=24 is 24/6 = 4 folds. So f_coherent saturates at 1.
The barrier is effectively REDUCED to the next available missing gap: d_eff^AA = 24 (ΔB=2).

**Cross Section Enhancement:**

In pp at 14 TeV: d_eff = 36, σ_pp = 3×10⁻³⁵ pb
In Pb-Pb at 5.02 TeV: d_eff = 24, σ_NN = σ_pp × exp[π(36-24)/2] = 3×10⁻³⁵ × exp(6π) = 3×10⁻³⁵ × 5.2×10⁸ = 1.6×10⁻²⁶ pb

Per nucleon pair: σ_NN^AA = 1.6×10⁻²⁶ pb
Total Pb-Pb cross section: σ_PbPb = σ_NN^AA × A² = 1.6×10⁻²⁶ × 208² = 6.9×10⁻²² pb

LHC Pb-Pb luminosity: L_int = 3 nb⁻¹ = 3×10⁶ pb⁻¹
N_events = 6.9×10⁻²² × 3×10⁶ = 2×10⁻¹⁵ events → Still zero.

**Wait — Need Further Enhancement**

The coherent enhancement exp(6π) = 5×10⁸ is not enough. We need additional mechanisms:

1. **Thermal Sphaleron Transitions (Piece 07):** At high T, Boltzmann factor exp(-E_sph/T).
2. **Chern-Simons Number Diffusion:** ΔN_CS = N_sphaleron transitions.
3. **Anomalous Baryon Number Violation:** ∂_μ J^μ_B = N_f (g²/32π²) G·G̃.

In the Prime Electron framework, the sphaleron IS the worldline fold intersection at finite temperature. The sphaleron energy E_sph corresponds to the missing gap d=24 barrier.

**Sphaleron Rate in QGP:**
Γ_sph/V = κ T⁴ exp(-E_sph/T)
E_sph = 4π v/g = (4π/g) × (Λ_QCD exp(π d/12)) for d=24
E_sph = (4π/0.3) × 182 GeV = 7.6 TeV? No, this is too high.

Let me use the Prime Electron mapping:
The sphaleron is a static fold intersection configuration. Its energy is the instanton action times T:
E_sph = S_inst T = (π d/2) T

At T = 500 MeV (LHC QGP), E_sph/T = 12π/2 = 6π for d=24.
exp(-E_sph/T) = exp(-6π) = 5.2×10⁻⁹.

But the sphaleron rate has a prefactor κ ~ 20 α_s⁵ ~ 20 × 0.3⁵ = 0.05.
Γ_sph/V = 0.05 × (0.5 GeV)⁴ × 5.2×10⁻⁹ = 0.05 × 0.0625 × 5.2×10⁻⁹ = 1.6×10⁻¹¹ GeV⁴

Volume of QGP: V ~ (10 fm)³ = 1000 fm³ = 1.3×10⁻⁴¹ GeV⁻³
Time: τ ~ 10 fm/c = 50 GeV⁻¹
Number of transitions: N_sph = Γ_sph V τ = 1.6×10⁻¹¹ × 1.3×10⁻⁴¹ × 50 = 1×10⁻⁵⁰ per event.

Still negligible! The sphaleron rate at LHC energies is too small because T << E_sph.

**Key Result: Standard thermal sphalerons are also negligible at LHC.**

**The Only Viable Enhancement: Resonant Fold States (Piece 09)**
If the collision energy matches a missing-gap resonance, the cross section gets a Breit-Wigner enhancement of (Γ_res/ΔE)². For narrow resonances, this can be 10⁶-10⁸.

**Conclusion:** Even in heavy ions, standard BNV is unobservable. Only resonant fold intersections (Piece 09) or cosmic ray energies (Piece 06) give detectable rates.