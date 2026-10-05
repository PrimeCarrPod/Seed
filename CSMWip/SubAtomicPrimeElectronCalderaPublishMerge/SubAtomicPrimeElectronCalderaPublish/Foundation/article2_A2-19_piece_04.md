# A2-19: Baryon Number Violation in Collisions From Worldline Folds — Piece 04

## Heavy Ion Collisions and B Violation

Heavy ion collisions at RHIC (√s_NN = 200 GeV) and LHC (√s_NN = 5.02 TeV) create quark-gluon plasma with temperatures T ~ 300-500 MeV. In the Prime Electron framework, the high density of partons enhances the worldline fold intersection probability.

**Worldline in Dense Medium:**
In a heavy ion collision, the worldline experiences a dense medium of color folds (gluons). The proper time flow is modified by the medium (A2-17 Piece 06):
dτ/dt = √(1 - 2Φ_medium/c²)

The medium potential Φ_medium is proportional to the gluon density:
Φ_medium ∝ ρ_g QCD · R²

At LHC Pb-Pb central collisions: dN_ch/dη ~ 1600, ε ~ 15 GeV/fm³.

**Enhanced Fold Intersections:**
The fold intersection rate (B violation) is proportional to the fold density:
Γ_B ∝ ρ_fold² · exp(-S_inst^eff)

In vacuum: ρ_fold ~ 1/fm³ (three quark folds per nucleon)
In QGP: ρ_fold ~ ε/m_N ~ 15 GeV/fm³ / 1 GeV ~ 15/fm³

Enhancement factor: (15)² = 225

**Effective Action in Medium:**
The instanton action is reduced by the medium screening:
S_inst^eff(ρ) = S_inst(0) · (1 - ρ/ρ_c)

where ρ_c is the critical density where the gap barrier vanishes.
From A2-17: ρ_c = 2.8 × 10¹⁴ g/cm³ = 0.17 GeV/fm³

Wait, this is nuclear density, not QGP density. The QGP density ε ~ 15 GeV/fm³ corresponds to ρ ~ 15/0.17 ≈ 88 ρ_c — far above critical density.

At ρ > ρ_c, the worldline orientation flips and B violation is unsuppressed!

**B Violation in QGP:**
For ρ > ρ_c, ε_τ(ρ) = ε_τ(0)(1 - ρ/ρ_c) becomes negative, meaning the forward/backward bias reverses. The B-violating instanton action vanishes:
S_inst^eff → 0 as ρ → ρ_c

The B violation rate in QGP:
Γ_B^QGP = κ T⁴ · (ρ/ρ_c)² (for ρ < ρ_c)
Γ_B^QGP = κ T⁴ (for ρ > ρ_c)

At LHC: T ~ 500 MeV, ρ ~ 88 ρ_c → Γ_B^QGP ~ κ T⁴ ~ (500 MeV)⁴ ~ 10⁻⁵ GeV⁴

**Experimental Signature:**
In central Pb-Pb collisions at LHC, the B violation would produce:
- Net baryon number change ΔB ~ Γ_B^QGP · V · τ_QGP
- V ~ (10 fm)³ = 1000 fm³ = 10⁻³⁶ cm³
- τ_QGP ~ 10 fm/c = 3 × 10⁻²³ s
- ΔB ~ 10⁻⁵ GeV⁴ × 10⁻³⁶ cm³ × 10⁻²³ s ~ 10⁻⁶⁴ (negligible)

Even with the enhancement, the absolute rate is tiny because the fundamental gap barrier is still large (d_426 = 1476).

**Chiral Magnetic Effect Connection:**
The chiral magnetic effect (CME) in heavy ions (A8-08 future) is related to the worldline orientation in the magnetic field. The CME current:
J_CME = (μ₅/2π²) B

where μ₅ is the chiral chemical potential. In the Prime Electron framework, μ₅ is related to the worldline orientation bias ε_τ.

The B violation in heavy ions is correlated with the CME signal — both probe the worldline topology in extreme conditions.

**Reference:** A2-07, A2-16, A2-17 Piece 06, A7-03 (future), A8-08 (future).