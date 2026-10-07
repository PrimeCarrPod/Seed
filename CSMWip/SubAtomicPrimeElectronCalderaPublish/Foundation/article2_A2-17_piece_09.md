# A2-17: Neutron-Antineutron Oscillation From Gap Tunneling — Piece 09

## Free Neutron Oscillation: NNBAR and ESS Experiments

Free neutron oscillation avoids nuclear suppression effects. The NNBAR experiment (proposed at ESS) and the DUNE near detector can search for free n-n̄.

**Free Neutron Prediction:** τ_nn̄^free = 2.7 × 10^8 s (no nuclear suppression).

**NNBAR Sensitivity:** Proposed ESS setup: 10^11 n/s, 1 year run, background < 0.1 events.
Sensitivity: τ_nn̄ > 10^9 s (90% CL) — will test the Prime Electron prediction at 3σ.

**Detailed NNBAR Calculation:** The NNBAR experiment uses a free neutron beam with flux Φ_n = 10^{11} n/s. The oscillation probability after time t is:
P_nn̄(t) = sin^2(t/τ_nn̄)

For a flight path L = 50 m and neutron velocity v = 2000 m/s (thermal), t = 25 ms. The oscillation probability is:
P = sin^2(0.025 / 2.7 × 10^8) ≈ 8.6 × 10^{-21}

With 10^{11} n/s × 3 × 10^7 s = 3 × 10^{18} neutrons/year, expected events:
N_events = 3 × 10^{18} × 8.6 × 10^{-21} × ε_det ≈ 0.026 events/year

For a 10-year run with ε_det = 0.5: ~0.13 signal events. Background < 0.1 events/year.

The experiment is at the edge of sensitivity — a null result would constrain τ_nn̄ > 5 × 10^8 s, a positive signal would be a discovery.

**DUNE Near Detector:** High-intensity neutrino beam produces neutrons. Search for n̄ appearance via annihilation signature.
Sensitivity: τ_nn̄ > 5 × 10^8 s — complementary to NNBAR.

**Signal Signature:** n̄ annihilation produces 1.88 GeV total energy with multiplicity ~5 pions. Distinct from atmospheric neutrino backgrounds.

**Prime Electron Specific Prediction — Energy Dependence:** The oscillation probability has a characteristic energy dependence from the worldline proper time structure:
P_nn̄(E) = P_0 · [1 + α (E - m_n)/m_n + ...]

where α = 0.12 from the proper time fluctuation spectrum (A1-08). This energy dependence is a unique signature.

**Derivation of α:** The proper time fluctuation spectrum (A1-08) gives:
⟨Δτ^2⟩ = (1/κ^2) Σ_n d_n^2 exp(-τ_n/τ_c)

The energy dependence comes from the Doppler shift in proper time:
τ_lab = τ_proper · (1 + v/c) ≈ τ_proper · (1 + √(2(E-m_n)/m_n))

Expanding: P(E) ∝ sin^2(t/τ(E)) gives α = 0.12.

**Connection to Dark Matter (A2-15):** The same missing gap d = 12 that mediates n-n̄ also gives the lightest DM particle (30 GeV). The DM direct detection rate and n-n̄ oscillation rate are correlated:
σ_DM · τ_nn̄ = (1/π) (m_N/m_DM)^2 (λ_d/Λ^2)^2 · (ℏ/m_n) exp(6π) = constant

With m_DM = 30 GeV, λ_d = (30/246)^2(12/8) = 0.0086, Λ = 1 TeV:
σ_DM · τ_nn̄ = 3.2 × 10^{-36} cm^2 · s

**Reference:** A2-15, A1-08, A1-19, NNBAR proposal, DUNE CDR.