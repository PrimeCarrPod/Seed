# A1-21: Worldline_Winding_Sectors.md — Piece 03

## Sector Partition Function and Free Energy

The partition function for sector Q is:
Z_Q = ∫_{Q-sector} D[x] exp(i S[x]/ℏ)

From A1-16 (Worldline_Action_Principle), the action is S = Σ_n d_n L_n with Lagrangian L_n = (m_e c/2) d_n Ω_n η_μν v^μ_n v^ν_n. The topological term i θ Q is absent since θ = 0 (A1-20, Piece 11). However, sectors with Q ≠ 0 have different boundary conditions on the gauge connection, leading to different effective actions.

The free energy of sector Q is:
F_Q = -ℏ log Z_Q

For the prime electron, the path integral is evaluated using the PrimeBookOne data. Each book provides a discrete approximation to the path integral over its 2^20 gaps. The total partition function is the product over books:
Z = Π_{b=1}^{3500} Z_b

where Z_b is the partition function for book b. For books with Q_b = 0 (3476 books), the path integral is perturbative:
Z_b^{Q=0} = ∫ D[x] exp(i S_0[x]/ℏ) ≈ exp(-F_0/ℏ)

For books with Q_b = 1 (23 books, b = b_3,..., b_24), there is one instanton:
Z_b^{Q=1} = ∫ D[x] exp(i S_0[x]/ℏ) · exp(-S_inst) ≈ Z_b^{Q=0} · exp(-S_inst)

For book 1 with Q_b = 2:
Z_1^{Q=2} = Z_1^{Q=0} · exp(-2 S_inst)

The instanton action S_inst is computed in A1-19 (Worldline_Instanton_Solutions). From Piece 02 there, for a record gap transition d_{prev} → d_{rec}:
S_inst = (8π^2/g^2) ≈ (8π^2/α) · (m_e c^2 / E_gap)

where α is the fine structure constant from gap statistics (A4-01), and E_gap = ℏ/(κ d) is the gap energy scale. For the first record gaps (d=2→4):
S_inst ≈ 8π^2/α · (2/4) ≈ 8π^2/137 · 0.5 ≈ 0.29

For larger record gaps, S_inst grows as d_{rec}/d_{prev}. The sector free energies are:
F_0 = -ℏ log Z^{Q=0} (reference)
F_1 = F_0 + S_inst
F_2 = F_0 + 2 S_inst

The total free energy is:
F = -ℏ log Z = -ℏ log [ (Z_0)^{3476} (Z_1)^{23} (Z_2)^1 ]
= 3476 F_0 + 23 F_1 + F_2
= 3500 F_0 + 25 S_inst

Piece 04 discusses the θ-dependence and vacuum structure.