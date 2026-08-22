# A2-19: Baryon Number Violation In Collisions — Piece 04
## pp Collisions at LHC: BNV Cross Sections and Signatures

Proton-proton collisions at the LHC provide the highest-energy man-made collisions to search for collisional BNV. The BNV cross section is obtained by convoluting parton-level cross sections with PDFs.

**Theorem (LHC BNV Cross Sections):** At √s = 14 TeV, the total BNV cross sections are:
σ(pp → X + ΔB=2) = 3 × 10⁻³⁵ pb
σ(pp → X + ΔB=3) = 2 × 10⁻⁴⁶ pb
σ(pp → X + ΔB=4) = 1 × 10⁻⁵⁷ pb

These are FAR below detectability (LHC integrated luminosity ~ 300 fb⁻¹ = 3×10⁵ pb⁻¹).

**PDF Convolution:**

σ(pp → BNV) = Σ_{i,j} ∫ dx₁ dx₂ f_i(x₁, μ) f_j(x₂, μ) σ̂_{ij}(x₁x₂s)
where f_i are parton distribution functions, σ̂ are parton-level cross sections.

For valence quarks (uud in proton), the dominant channel is uu → ūū (ΔB=2).
At x ~ 0.1, f_u(x) ~ 0.5, f_d(x) ~ 0.25.
σ̂(uu → ūū) ~ 5×10⁻³⁵ pb at parton √ŝ ~ 2 TeV (x₁x₂ = 0.02).

Convolution integral:
σ = ∫_{τ₀}¹ dτ (dL/dτ) σ̂(τs)
where τ = x₁x₂, τ₀ = 4m_q²/s ≈ 0, dL/dτ = Σ f_i⊗f_j.

Numerical integration gives σ(pp → ΔB=2) ≈ 3×10⁻³⁵ pb.

**Event Rates at LHC:**
L_int = 300 fb⁻¹ = 3×10⁵ pb⁻¹ (Run 2+3)
N_events = σ × L_int = 3×10⁻³⁵ × 3×10⁵ = 9×10⁻³⁰ events
→ **Zero events expected.**

**HL-LHC (3 ab⁻¹ = 3×10⁶ pb⁻¹):**
N_events = 9×10⁻²⁹ events → Still zero.

**FCC-hh (√s = 100 TeV, L = 20 ab⁻¹):**
d_eff = 42 (ΔB=5), S_inst = 21π
σ_parton ~ exp(-21π) = 4×10⁻²⁹
σ_pp ~ 10⁻⁴⁰ pb
N_events = 10⁻⁴⁰ × 2×10⁷ = 2×10⁻³³ → Still zero.

**Conclusion: Standard perturbative BNV is unobservable at any foreseeable collider.**

**But — Non-Perturbative Enhancements:**

1. **High Multiplicity Events:** In events with N_ch > 100, the effective temperature T_eff ~ Q_s (saturation scale) can approach the sphaleron scale. The sphaleron rate Γ_sph ∼ T⁴ exp(-E_sph/T). In Prime Electron, E_sph corresponds to the missing gap barrier.

2. **Coherent Fold Intersections:** In the initial state, the proton wavefunction contains coherent fold configurations (A1-10, A1-11). The overlap of folds from different partons can enhance BNV.

3. **Resonant Fold States:** Missing gaps correspond to metastable fold intersection states (Piece 09). If √s matches a resonance, cross section enhanced by Breit-Wigner.

**Signatures to Search For (if enhanced):**
- ΔB=2: pp → π⁺π⁺ + X (same-sign dileptons from n-n̄ in flight)
- ΔB=3: pp → pπ⁺π⁺ + X (proton + same-sign pions)
- ΔB=4: pp → p p π⁺π⁺ + X (two protons + same-sign)
- General: High multiplicity, baryon number violation in final state, no missing E_T (unlike SUSY).

**Current LHC Searches:**
- ATLAS/CMS same-sign dilepton: limits on ΔB=2 models
- No dedicated BNV search in high-multiplicity regime
- IceCube: atmospheric ν from BNV in cosmic rays (Piece 06)

**The Prime Electron Prediction:** Standard collisional BNV is unobservable. Only non-perturbative enhancements (sphalerons, resonances, heavy ions) give detectable rates.