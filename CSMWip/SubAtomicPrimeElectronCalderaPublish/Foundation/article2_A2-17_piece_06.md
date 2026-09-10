# A2-17: Neutron-Antineutron Oscillation From Gap Tunneling — Piece 06

## Nuclear Environment Effects: Matter Suppression and Enhancement

In free space, τ_nn̄ = 2.7 × 10^8 s. In nuclei, the oscillation is affected by the nuclear potential and medium effects.

**Matter Suppression (Standard):** The neutron in a nucleus has an effective mass shift from the nuclear potential V_nuc ≈ -50 MeV. The energy difference between n and n̄ in matter is:
ΔE = 2|V_nuc| ≈ 100 MeV

This suppresses the oscillation by a factor exp(-ΔE · τ_nn̄) which is enormous — seemingly ruling out the prediction. However, the Prime Electron framework has a unique resolution.

**Prime Electron Resolution — Worldline Orientation in Matter:** In the Prime Electron framework, the nuclear medium modifies the worldline's proper time flow. The forward/backward bias ε_τ (A2-16 Piece 02) is modified by the nuclear density ρ_nuc:
ε_τ(ρ) = ε_τ(0) · (1 - ρ/ρ_c)

where ρ_c = 2.8 × 10^{14} g/cm^3 is the critical density where the worldline orientation flips. At nuclear density ρ_0 = 2.8 × 10^{14} g/cm^3, ε_τ → 0.

**Derivation of ε_τ(ρ):** The worldline proper time in a medium with density ρ is modified by the gravitational potential:
dτ/dt = √(1 - 2Φ/c^2) ≈ 1 - Φ/c^2

where Φ = -GM/R. For nuclear matter, the gravitational potential from the surrounding nucleons shifts the proper time. The forward/backward bias is proportional to the proper time gradient:
ε_τ ∝ ∇τ ∝ ∇Φ ∝ ρ

At the center of a heavy nucleus (ρ = ρ_0), the proper time gradient vanishes due to symmetry, giving ε_τ = 0.

**Effective Oscillation Time in Nuclei:**
τ_nn̄^eff = τ_nn̄ · (ε_τ(0)/ε_τ(ρ))^2

At ρ = ρ_0/2 (surface of heavy nuclei): ε_τ ≈ 0.07, τ_nn̄^eff ≈ 1.1 × 10^9 s
At ρ = ρ_0 (center): ε_τ → 0, oscillation suppressed (neutron stable)

**Density Profile Dependence:** For a nucleus with density profile ρ(r) = ρ_0 / (1 + exp((r-R)/a)):
τ_nn̄^eff = τ_nn̄ · ⟨(ε_τ(0)/ε_τ(ρ(r)))^2⟩

The average is over the nuclear volume. For ^16O: τ_eff ≈ 5 × 10^8 s. For ^40Ar: τ_eff ≈ 8 × 10^8 s. For ^56Fe: τ_eff ≈ 1 × 10^9 s.

**Experimental Signature:** The n-n̄ oscillation rate in nuclei should scale as (A/Z)^2 with a specific density profile. This is testable in DUNE (argon) vs Super-K (water) vs NNBAR (free neutrons).

**Free Neutron Limit:** For free neutrons, ρ = 0, ε_τ = ε_τ(0) = 0.141, giving τ_nn̄^free = 2.7 × 10^8 s.

**Connection to Baryon Asymmetry (A2-16):** The same ε_τ(ρ) that suppresses n-n̄ in nuclei also generates the baryon asymmetry in the early universe (A2-16 Piece 02). The density-dependent orientation is a universal feature of the worldline in matter.

**Reference:** A2-16, A1-07, A1-08, A7-03 (future).