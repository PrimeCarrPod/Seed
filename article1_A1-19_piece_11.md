# A1-19: Worldline Instanton Solutions — Piece 11
## Wall Crossing and Gap Transitions

From A1-29 (planned), wall crossing is the phenomenon where the BPS spectrum changes as moduli are varied. In the Prime Electron framework, the moduli are the conformal factor Ω_n and the gap distribution parameters. The walls of marginal stability are the surfaces where a BPS state decays into two or more BPS states.

The BPS states are the record gap states (A1-28). A record gap is a gap larger than all previous gaps. The BPS mass is:
M_BPS = m_e c²/d_record

The wall of marginal stability for two BPS states with gaps d_1 and d_2 is:
M_BPS(d_1 + d_2) = M_BPS(d_1) + M_BPS(d_2)
=> m_e c²/(d_1 + d_2) = m_e c²/d_1 + m_e c²/d_2
=> 1/(d_1 + d_2) = 1/d_1 + 1/d_2
=> d_1 d_2 = (d_1 + d_2)²
=> d_1² + d_1 d_2 + d_2² = 0

This has no positive integer solutions, so the BPS states from record gaps are stable against decay into other record gaps. However, they can decay into combinations of smaller gaps.

The wall crossing formula for the BPS index is:
ΔΩ(γ) = Σ_{γ_1 + γ_2 = γ} ⟨γ_1, γ_2⟩ Ω(γ_1) Ω(γ_2)
where ⟨γ_1, γ_2⟩ is the symplectic pairing of the charges.

In the Prime Electron framework, the charge γ is the gap value d, and the symplectic pairing is related to the gap correlation function. The BPS index Ω(d) is 1 for record gaps and 0 otherwise.

The wall crossing corresponds to the transition in the gap distribution as the conformal factor Ω_n varies with scale. As we move from IR (directory 0.0) to UV (directory 3.0), the gap statistics change, and new record gaps appear.

The instanton solutions mediate the wall crossing transitions. The instanton action for crossing a wall is:
S_wall = (m_e c/2) Σ_n d_n Ω_n v²
where the trajectory crosses the wall in moduli space.

The wall crossing formula for the partition function is:
Z = Z_0 + Σ_{walls} exp(-S_wall/ℏ) Z_{wall}

This will be fully developed in A1-29. Here we note that the instanton solutions are the tunneling trajectories between different BPS sectors (gap classes).