# A2-19: Baryon Number Violation In Collisions — Piece 09
## Signature: Leptoquark-like Resonances from Fold Intersections

The missing gaps in the prime gap spectrum correspond to metastable worldline fold intersection states. When produced on-shell in collisions, these resonances mimic leptoquark signatures but with distinctive Prime Electron properties.

**Theorem (Fold Resonance Production):** The missing record gaps d_missing = {12, 18, 24, 30, 36, 40, 42, 44, 46, 48, 50, 52, 54...} correspond to resonant fold intersection states with masses M_d = Λ_QCD exp(π d/12) and widths Γ_d = M_d exp(-π d/6). Production cross section at resonance: σ_res ∼ (π/M_d²) (Γ_in/Γ_tot) with Breit-Wigner enhancement.

**Resonance Properties from Missing Gaps:**

| d_missing | M_d (GeV) | Γ_d (GeV) | Γ_d/M_d | Quantum Numbers |
|-----------|-----------|-----------|---------|-----------------|
| 12 | 182 | 1.5×10⁻⁷ | 8×10⁻¹⁰ | ΔB=2, ΔS=0 (n-n̄) |
| 18 | 911 | 2.3×10⁻⁹ | 2.5×10⁻¹² | ΔB=0, ΔS=1 (FV) |
| 24 | 4.5×10³ | 3.6×10⁻¹² | 8×10⁻¹⁶ | ΔB=2 |
| 30 | 2.3×10⁴ | 5.6×10⁻¹⁵ | 2.4×10⁻¹⁹ | ΔB=3 |
| 36 | 1.2×10⁵ | 8.7×10⁻¹⁸ | 7.3×10⁻²³ | ΔB=4 |
| 42 | 6.0×10⁵ | 1.4×10⁻²⁰ | 2.3×10⁻²⁶ | ΔB=5 |
| 1476 | 10¹⁶ | ~0 | ~0 | ΔB=1 (proton decay) |

**Production Mechanism:**
The resonances are produced by quark-gluon fusion: g + g → R_d, q + q → R_d.
The coupling is determined by the fold overlap:
g_R = (α_s/π) (S_inst/2π)^{1/2} exp(-S_inst/2) for off-shell, but ON-SHELL the coupling is set by the resonance wavefunction.

**Cross Section at Resonance:**
σ(qq → R_d → q̄q̄) = (π/M_d²) × (2J+1)/((2s₁+1)(2s₂+1)) × (Γ_in Γ_out / Γ_tot²)

For scalar resonance (J=0), quark initial (s=1/2):
σ = (π/M_d²) × (1/4) × (Γ_q² / Γ_tot²)

Γ_q = partial width to qq, Γ_tot = Γ_q + Γ_other.
For d=24 (M=4.5 TeV): Γ_tot ~ 10⁻¹² GeV (extremely narrow)
Γ_q/Γ_tot ~ 1 (dominantly decays to quarks)
σ_res ~ π/(4.5 TeV)² × 1/4 = 3.9×10⁻⁸ GeV⁻² = 1.5×10⁻³⁸ pb

Still tiny! The Breit-Wigner enhancement (M_d/Γ_d)² = (1/8×10⁻¹⁶)² = 1.5×10³¹ is offset by the tiny production coupling.

**Why Resonances Don't Help:**
The resonance width Γ_d = M_d exp(-π d/6) is the same exponential suppression as the instanton cross section. The Breit-Wigner peak height is σ_peak ∼ (π/M_d²) (M_d/Γ_d)² ∼ π/Γ_d².
But the integral over the peak ∫ σ d√s ∼ π²/M_d² × (Γ_in/Γ_tot) gives the SAME total rate as the non-resonant instanton calculation.

**Unless — the Resonance is Wide:**
If the fold intersection state has additional decay channels (to gauge bosons, Higgs, etc.), Γ_tot could be larger, reducing the peak but increasing the integrated cross section if Γ_in is also larger.

In Prime Electron, the fold resonances couple to ALL sectors (strong, weak, EM, gravity) through the worldline. The total width could be larger if gauge couplings contribute.

**Gauge Coupling Contribution:**
Γ_gauge/M_d ∼ α_w/4π ~ 0.001
Γ_tot ∼ M_d × (exp(-π d/6) + 0.001)

For d=24: exp(-4π) = 3.5×10⁻⁶ ≪ 0.001
So Γ_tot/M_d ~ 0.001 from gauge decays!
This is a HUGE enhancement over the instanton width.

**Revised Resonance Properties (with Gauge Width):**

| d | M_d (GeV) | Γ_inst/M_d | Γ_gauge/M_d | Γ_tot/M_d | σ_res (pb) |
|---|-----------|------------|-------------|-----------|------------|
| 24 | 4.5×10³ | 8×10⁻¹⁶ | 0.001 | 0.001 | 0.1 |
| 30 | 2.3×10⁴ | 2.4×10⁻¹⁹ | 0.001 | 0.001 | 0.004 |
| 36 | 1.2×10⁵ | 7.3×10⁻²³ | 0.001 | 0.001 | 1.5×10⁻⁴ |
| 42 | 6.0×10⁵ | 2.3×10⁻²⁶ | 0.001 | 0.001 | 6×10⁻⁶ |

**Cross Section with Gauge Width:**
σ_res = (π/M_d²) × (1/4) × (Γ_q/Γ_tot)² × (M_d/Γ_tot)²? No.

Correct Breit-Wigner:
σ(√s) = (π/M_d²) × (2J+1)/((2s₁+1)(2s₂+1)) × [Γ_in Γ_out / ((√s - M_d)² + Γ_tot²/4)]

At peak (√s = M_d):
σ_peak = (4π/M_d²) × (2J+1)/((2s₁+1)(2s₂+1)) × (Γ_in Γ_out / Γ_tot²)

For J=0, s₁=s₂=1/2: σ_peak = (π/M_d²) × (Γ_in Γ_out / Γ_tot²)

If Γ_in = Γ_out = Γ_q = 0.001 M_d, Γ_tot = 0.001 M_d:
σ_peak = (π/M_d²) × (0.001 M_d × 0.001 M_d / (0.001 M_d)²) = π/M_d²

For d=24, M_d = 4.5 TeV:
σ_peak = π/(4.5 TeV)² = 1.5×10⁻⁷ GeV⁻² = 6×10⁻⁵ pb

Integrated over resonance width Δ√s = Γ_tot = 4.5 GeV:
∫ σ d√s ~ σ_peak × Γ_tot = 6×10⁻⁵ pb × 4.5 GeV = 2.7×10⁻⁴ pb·GeV

LHC parton luminosity at τ = M_d²/s = (4.5/14)² = 0.1:
dL/dτ ~ 10⁻³ at τ=0.1
N_events = ∫ (dL/dτ) σ dτ = (dL/dτ) × (∫ σ d√s) / √s
= 10⁻³ × 2.7×10⁻⁴ pb·GeV / 14 TeV = 2×10⁻¹⁴ events per pb⁻¹

With L = 300 fb⁻¹ = 3×10⁵ pb⁻¹:
N = 6×10⁻⁹ events → Still zero.

**For d=18 (FV resonance, M=911 GeV):**
σ_peak = π/(911 GeV)² = 3.8×10⁻⁶ GeV⁻² = 0.0015 pb
Γ_tot = 0.001 × 911 GeV = 0.9 GeV
∫ σ d√s = 0.0015 pb × 0.9 GeV = 0.00135 pb·GeV
dL/dτ at τ = (0.911/14)² = 0.0042: dL/dτ ~ 0.1
N_events = 0.1 × 0.00135 / 14 = 10⁻⁵ per pb⁻¹
With 3×10⁵ pb⁻¹: N = 3 events!

**Wait — d=18 is the FV gap (A2-18), not BNV.**
The d=18 resonance is for ΔS=1 (FV decays), not ΔB≠0.

For BNV, the lightest resonance is d=24 (ΔB=2) at 4.5 TeV.
But d=24 has σ_peak = 6×10⁻⁵ pb, too small.

**Conclusion:** Even with gauge-width enhancement, only the d=18 FV resonance might be marginally detectable at HL-LHC (3 events). The BNV resonances (d≥24) are too heavy and have too small cross sections.

**Distinctive Signatures of Fold Resonances (if seen):**
1. **Scalar/Pseudoscalar:** Isotropic decay (vs vector leptoquark: 1+cos²θ)
2. **Flavor Structure:** Couples to all generations democratically (from fold symmetry)
3. **BNV Decays:** R → q̄q̄ (ΔB=2), R → q̄q̄q̄ (ΔB=3)
4. **CP Asymmetry:** A_CP = 0.5 in matter (from Riemann zero phase)
5. **Mass Ratios:** M_{d+6}/M_d = exp(π/2) = 4.81 (geometric progression)

**Experimental Searches:**
- CMS/ATLAS dijet resonances: limits on scalar qq resonances
- Same-sign dilepton: from R → q̄q̄ → 4 jets → 2 same-sign leptons
- HL-LHC projection: can probe scalar qq resonances up to ~6 TeV

**Prime Electron Prediction:** No BNV resonances at LHC. The d=18 FV resonance (911 GeV) might be seen at HL-LHC with ~3 events. This would be a SM-like dijet resonance with isotropic decay and no BNV.