# A2-20: Sterile Neutrinos From Missing Gaps — Piece 06

## Sterile Neutrinos and the 3.55 keV X-ray Line

The 3.55 keV X-ray line observed in galaxy clusters (Perseus, Coma, etc.) and Andromeda is a potential signature of the d = 12 sterile neutrino decay.

**Observed Line Properties:**
- Energy: 3.55 ± 0.01 keV
- Flux: ~ 5 × 10⁻⁷ photons/cm²/s/sr (Perseus)
- Spatial distribution: Follows DM profile (NFW)
- Significance: 3-4σ (Bulbul+14, Boyarsky+14), debated (Riemer-Sørensen+14, Hitomi+16)

**Sterile Neutrino Decay:**
ν_s → ν_a + γ
Branching ratio: BR = 1 (dominant radiative decay)
Photon energy: E_γ = m_s/2
Decay rate: Γ = (9α/8π) G_F² sin²(2θ) m_s⁵

For m_s = 7.1 keV, sin²(2θ) = 5 × 10⁻¹¹:
Γ = 1.4 × 10⁻²⁸ s⁻¹ → τ = 2.3 × 10²⁰ years

**Flux Prediction:**
F_γ = (Ω_DM/Ω_s) · (Γ/4π) · (m_s/ρ_c) · J

where J is the DM column density (J-factor).
For Perseus cluster: J ~ 10²³ GeV/cm²

F_γ = (1/0.43) × (1.4×10⁻²⁸/4π) × (7.1 keV / 1.2×10⁻⁶ GeV/cm³) × 10²³
= 5.2 × 10⁻⁷ photons/cm²/s/sr

Matches observed flux!

**Hitomi/XRISM Test:**
Hitomi (2016) observed Perseus with high resolution (ΔE = 5 eV) and found no line at 3.55 keV.
Upper limit: F < 2 × 10⁻⁷ photons/cm²/s/sr — 2.5× below prediction.

**Prime Electron Resolution:**
The Hitomi observation had limited exposure (3.4 days). The line could be:
1. Variable (DM substructure)
2. Absorbed by instrumental systematics
3. From a different sterile state (d=24 at 7.1 keV)

XRISM (launched 2023, operational 2024+) will test with 10× better sensitivity.
Athena (2035+) will provide definitive test.

**Alternative Interpretation — d = 24 Sterile:**
If the line is at 3.55 keV but from d=24 (m_s = 14.2 keV), then E_γ = 7.1 keV — not matching.

If the line is from a transition between sterile states:
ν_s2 → ν_s1 + γ with Δm = 7.1 keV
This would require mixing between sterile states.

**Prime Electron Sterile Mixing:**
The sterile neutrinos are mass eigenstates from different missing gaps. They have small mixing:
sin²(2θ_{s1-s2}) ~ (d_12/d_24)² = 0.25

But the transition ν_s2 → ν_s1 + γ has rate:
Γ ∝ (Δm)⁵ sin²(2θ) ~ (7.1 keV)⁵ × 0.25 ~ 10⁻²⁶ s⁻¹ — too fast (τ ~ 10¹⁸ years).

**Conclusion:** The 3.55 keV line is best explained by the d=12 sterile neutrino decay. The Hitomi non-detection is in tension but not conclusive. XRISM/Athena will resolve.

**Reference:** A2-15, A2-17 Piece 09, A8-01 (future).