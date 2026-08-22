# A2-18: Flavor Violating Baryon Decays — Piece 04
## Decay Rate Calculation: Γ(Λ → nπ⁰) from First Principles

The partial width for Λ → nπ⁰ is computed from the instanton amplitude using the standard decay formula, with the matrix element derived from the Prime Electron worldline instanton.

**Theorem (Λ → nπ⁰ Partial Width):** The decay rate is
Γ(Λ → nπ⁰) = (p_π / 8π m_Λ²) |M|²
where p_π = ½√[(m_Λ² - (m_n + m_π)²)(m_Λ² - (m_n - m_π)²)] ≈ 103 MeV
and the matrix element |M|² = (3/2)² (κ_FV)² (1.15)² exp(-2S_inst^eff)

**Kinematics:**
m_Λ = 1115.683 MeV, m_n = 939.565 MeV, m_π⁰ = 134.977 MeV
p_π = ½√[(1115.683² - 1074.542²)(1115.683² - 804.588²)] = 103.2 MeV
Phase space factor: p_π / 8π m_Λ² = 103.2 / (8π × 1115.683²) = 3.31 × 10⁻⁶ MeV⁻¹

**Matrix Element from Instanton:**
From Piece 02: S_inst^eff = 9.18π, κ_FV = √(9/2) Λ_QCD²
Λ_QCD = 340 MeV (from A4-02, PrimeBookOne Tile 12)
κ_FV = √(4.5) × (340 MeV)² = 2.12 × 115600 MeV² = 245,000 MeV²

Color factor: (3/2)² = 2.25
Spectator correlation: (1.15)² = 1.32
Instanton suppression: exp(-2 × 9.18π) = exp(-57.67) = 1.07 × 10⁻²⁵

|M|² = 2.25 × 1.32 × (245000)² × 1.07 × 10⁻²⁵ MeV⁴
= 2.97 × 6.00 × 10¹⁰ × 1.07 × 10⁻²⁵ MeV⁴
= 1.91 × 10⁻¹⁴ MeV⁴

**Partial Width:**
Γ(Λ → nπ⁰) = (3.31 × 10⁻⁶ MeV⁻¹) × (1.91 × 10⁻¹⁴ MeV⁴)
= 6.32 × 10⁻²⁰ MeV

**Branching Ratio:**
Total Λ width: Γ_Λ = 1/τ_Λ = 1/(2.63 × 10⁻¹⁰ s) = 2.51 × 10⁻¹² MeV
BR(Λ → nπ⁰) = Γ(Λ → nπ⁰) / Γ_Λ = 6.32 × 10⁻²⁰ / 2.51 × 10⁻¹²
= 2.52 × 10⁻⁸

**Comparison with Other Channels:**
Λ → pπ⁻: Same color factor, phase space p_π = 100.6 MeV (slightly different)
BR(Λ → pπ⁻) = 2.45 × 10⁻⁸ (ratio 1.03:1 from phase space)

**Prime Electron Prediction vs SM:**
Standard Model (weak): BR(Λ → pπ⁻) = 63.9%, BR(Λ → nπ⁰) = 35.8%
Prime Electron (FV instanton): BR ~ 10⁻⁸ — completely negligible compared to weak decays.
This is a BSM signature: if observed, it would be a clear signal of the Prime Electron instanton.

**Numerical Summary:**
- Γ(Λ → nπ⁰) = 6.3 × 10⁻²⁰ MeV
- BR(Λ → nπ⁰) = 2.5 × 10⁻⁸
- Γ(Λ → pπ⁻) = 6.1 × 10⁻²⁰ MeV
- BR(Λ → pπ⁻) = 2.4 × 10⁻⁸
- Total FV BR for Λ = 4.9 × 10⁻⁸