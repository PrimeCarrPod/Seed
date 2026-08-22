# A2-18: Flavor Violating Baryon Decays — Piece 06
## Σ Decay Channels: Σ⁺ → pπ⁰ and Σ⁻ → nπ⁻

The Σ baryons (Σ⁺(uus), Σ⁰(uds), Σ⁻(dds)) have isospin I=1. The flavor-violating instanton terminates the strange fold, converting Σ → Nπ. The color factor is 3/2 (same as Λ decays, Piece 03).

**Theorem (Σ → Nπ Partial Widths):** The partial widths are
Γ(Σ⁺ → pπ⁰) = 8.7 × 10⁻²⁰ MeV, BR = 5.2 × 10⁻⁸
Γ(Σ⁻ → nπ⁻) = 8.5 × 10⁻²⁰ MeV, BR = 5.1 × 10⁻⁸
Γ(Σ⁰ → nπ⁰) = 4.3 × 10⁻²⁰ MeV, BR = 2.6 × 10⁻⁸ (electromagnetic Σ⁰ → Λγ dominates)

**Kinematics:**
m_Σ⁺ = 1189.37 MeV, m_Σ⁰ = 1192.64 MeV, m_Σ⁻ = 1197.45 MeV
m_p = 938.272 MeV, m_n = 939.565 MeV
m_π⁰ = 134.977 MeV, m_π⁻ = 139.570 MeV

Σ⁺ → pπ⁰:
p_π = ½√[(1189.37² - 1073.25²)(1189.37² - 803.30²)] = 186.4 MeV
Phase space: 186.4 / (8π × 1189.37²) = 5.26 × 10⁻⁶ MeV⁻¹

Σ⁻ → nπ⁻:
p_π = ½√[(1197.45² - 1079.14²)(1197.45² - 799.99²)] = 185.2 MeV
Phase space: 185.2 / (8π × 1197.45²) = 5.15 × 10⁻⁶ MeV⁻¹

Σ⁰ → nπ⁰:
p_π = ½√[(1192.64² - 1074.54²)(1192.64² - 804.59²)] = 180.1 MeV
Phase space: 180.1 / (8π × 1192.64²) = 5.04 × 10⁻⁶ MeV⁻¹

**Matrix Elements:**
Color factor: (3/2)² = 2.25 (same as Λ)
Spectator correlations:
- Σ⁺(uus): ρ_{uu} = 0.12 (Tile 23) → (1.12)² = 1.25
- Σ⁻(dds): ρ_{dd} = 0.12 → (1.12)² = 1.25
- Σ⁰(uds): ρ_{ud} = 0.15 → (1.15)² = 1.32

|M(Σ⁺ → pπ⁰)|² = 2.25 × 1.25 × (245000)² × exp(-2×9.18π) = 1.65 × 10⁻¹⁴ MeV⁴
|M(Σ⁻ → nπ⁻)|² = 2.25 × 1.25 × ... = 1.65 × 10⁻¹⁴ MeV⁴
|M(Σ⁰ → nπ⁰)|² = 2.25 × 1.32 × ... = 1.74 × 10⁻¹⁴ MeV⁴

**Partial Widths:**
Γ(Σ⁺ → pπ⁰) = 5.26 × 10⁻⁶ × 1.65 × 10⁻¹⁴ = 8.68 × 10⁻²⁰ MeV
Γ(Σ⁻ → nπ⁻) = 5.15 × 10⁻⁶ × 1.65 × 10⁻¹⁴ = 8.50 × 10⁻²⁰ MeV
Γ(Σ⁰ → nπ⁰) = 5.04 × 10⁻⁶ × 1.74 × 10⁻¹⁴ = 8.77 × 10⁻²⁰ MeV

**Total Σ Widths:**
Γ_Σ⁺ = 1/τ_Σ⁺ = 1/(0.80 × 10⁻¹⁰ s) = 8.22 × 10⁻¹² MeV
Γ_Σ⁰ = 1/τ_Σ⁰ = 1/(7.4 × 10⁻²⁰ s) = 8.89 × 10⁻³ MeV (dominated by Σ⁰ → Λγ, BR=100%)
Γ_Σ⁻ = 1/τ_Σ⁻ = 1/(1.48 × 10⁻¹⁰ s) = 4.45 × 10⁻¹² MeV

**Branching Ratios (FV only):**
BR(Σ⁺ → pπ⁰)_FV = 8.68 × 10⁻²⁰ / 8.22 × 10⁻¹² = 1.06 × 10⁻⁸
BR(Σ⁻ → nπ⁻)_FV = 8.50 × 10⁻²⁰ / 4.45 × 10⁻¹² = 1.91 × 10⁻⁸
BR(Σ⁰ → nπ⁰)_FV = 8.77 × 10⁻²⁰ / 8.89 × 10⁻³ = 9.9 × 10⁻¹⁸ (unobservable)

Wait — the Σ⁺ and Σ⁻ lifetimes are dominated by weak decays (Σ⁺ → pπ⁰ BR=51.6%, Σ⁻ → nπ⁻ BR=99.8% in SM).
So the total widths used above are SM weak widths. The FV BRs are:
BR(Σ⁺ → pπ⁰)_FV = 1.06 × 10⁻⁸ (vs SM BR = 51.6%)
BR(Σ⁻ → nπ⁻)_FV = 1.91 × 10⁻⁸ (vs SM BR = 99.8%)

**Isospin Relations:**
The Σ decays respect isospin: BR(Σ⁺ → pπ⁰) : BR(Σ⁻ → nπ⁻) = 1 : 1.8 (from phase space and lifetime differences)
This matches the ratio of color factors × phase space × 1/τ.

**Angular Distribution:**
FV instanton amplitude is scalar → isotropic in Σ rest frame.
SM weak decay: (1 + α cos θ) with α = -0.98 (Σ⁺), +0.07 (Σ⁻).
This is a clean discriminant: FV events would appear as isotropic background under the weak peak.