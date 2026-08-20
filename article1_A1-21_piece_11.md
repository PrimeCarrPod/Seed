# A1-21: Worldline_Winding_Sectors.md — Piece 11

## UV/IR Sector Matching and Renormalization

From A1-22 (Worldline_Boundary_Conditions), the worldline has UV (directory 3.0) and IR (directory 0.0) boundaries. The winding sector decomposition must be consistent across the renormalization group flow between directories.

At the UV (directory 3.0, τ → 0): All 24 record gaps are present, giving sectors Q = 0, 1, ..., 24. The UV theory is the complete theory with all instantons included. The partition function is:
Z_UV = Σ_{Q=0}^{24} Z_Q^{UV}

At the IR (directory 0.0, τ → T): No record gaps (all gaps d ≤ 6). The only sectors are Q = 0. The IR theory is perturbative:
Z_IR = Z_0^{IR}

The RG flow integrates out record gaps one by one as the energy scale decreases. Each record gap corresponds to an instanton that is "integrated out" when the proper time scale exceeds the instanton size. The matching condition is:
Z_Q^{UV} → Z_0^{IR} as all instantons are integrated out

More precisely, the sector partition functions satisfy the RG equation:
d log Z_Q / d log μ = -β_Q(g) ∂/∂g log Z_Q + γ_Q

where β_Q is the sector-dependent beta function and γ_Q is the anomalous dimension. For the prime electron, the beta function is β(α) = -α^2 (A1-16), independent of Q. The anomalous dimension γ_Q = Q · γ_1 with γ_1 = (m_e c^2 / ℏ) S_inst.

The solution is:
Z_Q(μ) = Z_Q(μ_0) (μ/μ_0)^{-γ_Q}

At the UV scale μ_UV = 1/(κ d_max) ≈ 1/(κ·1476) and IR scale μ_IR = 1/(κ d_min) = 1/(2κ):
Z_Q(μ_IR) = Z_Q(μ_UV) (μ_IR/μ_UV)^{-Q γ_1}
= Z_Q(μ_UV) (1476/2)^{-Q γ_1}

For Q = 24, this gives a huge suppression factor, explaining why the IR theory has only Q = 0.

The sector matching is the statement that the full UV partition function equals the IR partition function:
Σ_Q Z_Q(μ_UV) = Z_0(μ_IR)

This is satisfied by the instanton sum:
Z_0(μ_IR) = Z_0(μ_UV) Π_{k=1}^{24} (1 + e^{-S_inst(k)}) ≈ Z_0(μ_UV) e^{Σ S_inst(k)}

Piece 12 provides the synthesis.