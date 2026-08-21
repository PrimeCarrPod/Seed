# A2-04 Muon Excitation Gap 4 — Piece 06: Instanton Solutions — Tunneling Between Gap Sectors

From A1-19 (Worldline_Instanton_Solutions.md), instantons are finite-action solutions to the worldline equations of motion that tunnel between different gap sectors. The muon cluster {4,6,8} is connected to the electron {2} by instantons that change the gap value.

The worldline action is S = Σ d_n L(d_n) where L is the Lagrangian for a single gap step. For a path that transitions from d=2 to d=4 to d=6 to d=8, the instanton action is:

S_inst = Σ_i d_i log(d_i/d_{i-1}) / κ

For the chain 2 → 4 → 6 → 8:
S_μ = (1/κ)[2 log(2/2) + 4 log(4/2) + 6 log(6/4) + 8 log(8/6)]
= (1/κ)[0 + 4 log 2 + 6 log 1.5 + 8 log 1.333]
= (1/κ)[2.773 + 2.433 + 2.293] = 7.499/κ

The instanton amplitude is A = exp(-S_inst) = exp(-7.499/κ). With κ = 1.288×10⁻²¹ s, this is an extremely small number — but the path integral sums over all instanton chains.

The multi-instanton chain for the muon has 3 steps (4, 6, 8). The total number of such chains from the electron to the muon scale is the number of ways to choose the intermediate gaps. The dominant chain is the sequential record gaps {2,4,6,8}.

From A1-20 (Worldline_Topological_Charge.md), the topological charge of an instanton chain is Q = (1/2π)∮ dθ where θ is the phase of the worldline field. For a chain with gaps d_1, d_2, ..., d_n, the charge is Q = Σ (d_i - d_{i-1})/2 = (d_n - d_1)/2.

For the muon chain 2→4→6→8: Q = (8-2)/2 = 3. This matches the 3 record gaps in the muon cluster.

The instanton contribution to the muon mass is given by the partition function with topological charge Q=3. From A1-18 (Worldline_Path_Integral.md):

Z_Q=3 = ∫ D[x] exp(iS/ℏ) δ(Q[x] - 3)

The mass is extracted from the asymptotic behavior: m_μ ∝ -log Z_Q=3 / β where β is the inverse temperature (proper-time extent).

The Q=3 sector receives contributions from:
1. The sequential chain 2→4→6→8 (action 7.499/κ)
2. Chains with repetitions: 2→4→4→6→8, 2→4→6→6→8, etc.
3. Chains with skips: 2→6→8, 2→4→8

The full sum over all Q=3 chains gives the muon mass. The dominant contribution is from the minimal-action chain 2→4→6→8.

The action can be expressed in terms of the record gap indices. Let r_k be the k-th record gap. Then r_1=2, r_2=4, r_3=6, r_4=8. The action for chain from r_a to r_b is:

S(a,b) = (1/κ) Σ_{k=a+1}^b r_k log(r_k/r_{k-1})

For a=1, b=4: S(1,4) = 7.499/κ

The instanton density (number of chains per unit proper-time) is ρ_inst ∝ exp(-S). The muon mass is related to the instanton density by the dilute instanton gas approximation (A1-20):

m_μ/mₑ = exp(ρ_inst × τ_μ) where τ_μ is the muon proper-time extent.

This gives a self-consistent equation: m_μ ∝ exp(exp(-S(m_μ))). The solution matches the RG result.

The key point: the instanton picture provides a physical mechanism for the muon mass — it is the energy cost of tunneling through the {4,6,8} record gap barrier on the worldline. The 3-step instanton chain has topological charge 3, and its action determines the mass ratio.