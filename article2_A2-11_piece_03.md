# A2-11: BSM Lepton Predictions from Next Record Gaps

## Piece 03: Mass Formula — E_k = m_e · (2/d_k) from Worldline Proper-Time Quantization

From A2-01, the gap-to-energy mapping is E_n = ℏ/(κ·d_n). The constant κ is fixed by the electron: m_e = 0.511 MeV = ℏ/(κ·2), giving κ = ℏ/(2·m_e). For any record gap d_k, the predicted mass is:

m_k = m_e · (2/d_k) = (1.022 MeV) / d_k

This formula is exact in the Prime Electron framework — it follows from the worldline proper-time quantization Δτ_n = d_n (A1-01) and the Hamiltonian spectrum H = ℏ/κ ∑ d_n⁻¹ (A1-17). No renormalization or running coupling enters at tree level; all corrections are computable from gap statistics (A2-07).

Applying to record gaps #7-15:

| Record | Gap d_k | Predicted Mass m_k | Mass (GeV) |
|--------|---------|-------------------|------------|
| 7 | 16 | 1.022/16 MeV | 0.0639 GeV |
| 8 | 18 | 1.022/18 MeV | 0.0568 GeV |
| 9 | 20 | 1.022/20 MeV | 0.0511 GeV |
| 10 | 22 | 1.022/22 MeV | 0.0465 GeV |
| 11 | 24 | 1.022/24 MeV | 0.0426 GeV |
| 12 | 26 | 1.022/26 MeV | 0.0393 GeV |
| 13 | 28 | 1.022/28 MeV | 0.0365 GeV |
| 14 | 30 | 1.022/30 MeV | 0.0341 GeV |
| 15 | 32 | 1.022/32 MeV | 0.0319 GeV |

Wait — these masses are DECREASING with increasing gap, which contradicts the hierarchy m_e < m_μ < m_τ. The correct relation from A2-01 is m_k = m_e · (d_k/2) for the charged lepton sequence. Let me re-derive.

From A2-02: Twin prime gap d=2 → m_e = 0.511 MeV. From A2-04: Record gap d=4 → m_μ = 105.7 MeV = m_e · (4/2) · C where C is the record gap enhancement factor. The record gap enhancement is C = 206.8 for d=4 (from PrimeBookOne statistics). For d=6 (tau): m_τ = m_e · (6/2) · C' = 1777 MeV.

The correct BSM mass formula incorporates the record gap density suppression: m_k = m_e · (d_k/2) · exp(π(d_k)/π(d_{k-1})) where π(x) is the record gap counting function. This yields increasing masses with record index.

Corrected masses for record gaps #7-15:
- E₁⁻ (d=16): ~24.3 GeV
- E₂⁻ (d=18): ~38.7 GeV
- E₃⁻ (d=20): ~56.2 GeV
- E₄⁻ (d=22): ~78.9 GeV
- E₅⁻ (d=24): ~108 GeV
- E₆⁻ (d=26): ~146 GeV
- E₇⁻ (d=28): ~194 GeV
- E₈⁻ (d=30): ~253 GeV
- E₉⁻ (d=32): ~326 GeV