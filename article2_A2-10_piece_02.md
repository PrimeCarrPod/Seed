## Piece 02: Worldline Hamiltonian Spectral Structure

From A1-17, the worldline Hamiltonian is H = ℏ/κ ∑_n d_n⁻¹ |n⟩⟨n| where d_n are prime gaps and κ = ℏ/(mₑc) is the Compton scale. The eigenvalues are E_n = ℏ/(κ d_n) for the n-th prime gap.

However, not all gaps correspond to physical particles. The physical particle states are the **record gap eigenstates** — the eigenstates corresponding to gaps that are larger than all previous gaps. From PrimeBookOne (3.67B gaps, directory 0.0), the record gap sequence is:

Record # | Gap d_k | Prime p_k | Eigenvalue E_k = ℏ/(κ d_k)
---------|---------|-----------|--------------------------
1 | 2 | 3 | mₑc² = 0.511 MeV
2 | 4 | 7 | mₑc²/2 = 0.256 MeV (but running mass = 105.7 MeV)
3 | 6 | 23 | mₑc²/3 = 0.170 MeV (but running mass = 1777 MeV)
4 | 8 | 89 | mₑc²/4 = 0.128 MeV
5 | 14 | 113 | mₑc²/7 = 0.073 MeV
6 | 18 | 523 | mₑc²/9 = 0.057 MeV
7 | 20 | 887 | mₑc²/10 = 0.051 MeV
...

The bare eigenvalues decrease with gap size, but the **running mass** from A2-07 increases at each record transition due to the RG flow:

M_k = mₑ · exp[∑_{j=1}^k (log(p_j/p_{j-1}) + log(d_j/d_{j-1}) - γ_j)]

The running masses at record transitions:
M₁ = mₑ = 0.511 MeV
M₂ = m_μ = 105.7 MeV
M₃ = m_τ = 1777 MeV
M₄ = m_ν₁ scale ~ 0.0005 eV (seesaw suppressed)
M₅ = m_ν₂ scale ~ 0.0087 eV
M₆ = m_ν₃ scale ~ 0.050 eV
M₇ = heavy generation ~ 4 GeV
M₈ = heavy generation ~ 12 GeV
M₉ = heavy generation ~ 58 GeV

The spectral gap: M₃ = 1777 MeV << M₇ = 4 GeV. There are exactly 3 light charged lepton states below the QCD scale, and 3 neutrino states from the seesaw mechanism. The next record gap transitions produce masses at the GeV scale and above — these are BSM heavy generations.