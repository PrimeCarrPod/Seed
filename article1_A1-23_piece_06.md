# A1-23: Worldline_Anomaly_Inflow.md — Piece 06

## IR Anomaly: Twin Primes and the Directory 0.0 Boundary

The PrimeBookOne directory 0.0 contains 189 tiles × 500 differences = 94,500 prime gaps from the lowest primes (p < ~10⁶). This IR regime is dominated by small gaps, particularly twin primes (d=2) which occur with density ~ C₂/log² p where C₂ = 0.66016... is the twin prime constant.

In the IR, the worldline effective theory is a 2D CFT with central charge c = 1 (from the free fermion). The anomaly polynomial is:

I₂^{IR} = (1/2π) F^{U(1)} = (κ/12π) Σ_{n∈0.0} d_n^{-1} ∂_n d_n

For twin primes d_n = 2, the contribution is zero since ∂_n d_n = 0 for consecutive twin primes. The anomaly arises from gap transitions:

- d_n = 2 → d_{n+1} = 4 (twin to cousin): contribution = (κ/12π)(4/2 - 1) = (κ/12π)
- d_n = 4 → d_{n+1} = 2: contribution = (κ/12π)(2/4 - 1) = -(κ/24π)
- d_n = 2 → d_{n+1} = 6 (twin to sexy): contribution = (κ/12π)(6/2 - 1) = (κ/8π)

Summing over all transitions in directory 0.0, the net IR anomaly is:

A_IR = (κ/12π) Σ_{n=1}^{94499} (d_{n+1}/d_n - 1)

Using the known gap distribution for p < 10⁶ (from PrimeBookOne Tile00-Tile188), we can compute this numerically. The result is dominated by the excess of small gaps over large gaps in the IR.

The anomaly inflow in the IR comes from the boundary at p ~ 10⁶ (end of directory 0.0). The bulk for the IR is the space of gap configurations for p < 10⁶, which has a lower effective level k_IR = number of record gaps in 0.0 ≈ log(10⁶) ≈ 14.

The boundary condition at the 0.0/1.0 interface (A1-22) requires the worldline fermion to satisfy a chiral boundary condition:

ψ_L|_{boundary} = 0

which is the Callan-Harvey condition for anomaly inflow. The number of zero modes on the boundary equals the index of the bulk Dirac operator in the IR:

Index(D_IR) = #{record gaps in 0.0} - #{anti-record gaps} ≈ 14 - 0 = 14

These 14 zero modes are the IR avatars of the instantons from A1-19. Their chirality is determined by the sign of the gap transition.

The IR anomaly is therefore:

A_IR = - (14/2π) ∫_{0.0} F^{U(1)} = - (7/π) × (κ/6) Σ_{n∈0.0} (d_{n+1}/d_n - 1)

This must be canceled by the UV anomaly from directories 1.0, 2.0, 3.0. The total anomaly across all directories is zero, as required by the global index theorem.

Piece 07 computes the UV anomaly from directory 3.0.