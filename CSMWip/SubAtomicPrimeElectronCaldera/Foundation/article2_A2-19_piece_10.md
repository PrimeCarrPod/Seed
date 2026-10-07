# A2-19: Baryon Number Violation in Collisions From Worldline Folds — Piece 10

## Connection to n-n̄ Oscillation (A2-17) and Proton Decay (A2-14) — Unified Collision Framework

All B-violating processes in collisions, n-n̄ oscillation, and proton decay share the same worldline instanton mechanism. The difference is the collision energy and the initial/final state boundary conditions.

**Unified Collision-Instanton Correspondence:**

| Process | Initial State | Final State | Energy Scale | Gap Channel |
|---------|---------------|-------------|--------------|-------------|
| Proton decay | p (B=1) | e⁺π⁰ (B=0) | m_p ~ 1 GeV | d_426 = 1476 |
| n-n̄ oscillation | n (B=1) | n̄ (B=-1) | m_n ~ 1 GeV | d = 12 (missing) |
| pp collision | pp (B=2) | X (B≠2) | √s = 13 TeV | d_eff(√s) |
| e⁺e⁻ collision | e⁺e⁻ (B=0) | B B̄ (B=0) | √s = 91 GeV | d_14 = 14 |
| Heavy ion | AA (B=2A) | X (B≠2A) | √s_NN = 5 TeV | d_eff(√s_NN) |
| Cosmic ray | p + p_atm | X | √s = 430 TeV | d_426 = 1476 |

**Cross Section Unification:**
The cross section for any B-violating collision process is:
σ_B(√s) = (1/s) · C_coll · exp(-π d_eff(√s)/2)

where C_coll encodes the collision geometry and parton luminosities.

For n-n̄ oscillation (vacuum, not a collision):
τ_nn̄ = (ℏ/m_n) exp(π d_tunnel/2)

The relation between collision cross section and oscillation time:
σ_B(√s) × τ_nn̄ = (ℏ/m_n) · (1/s) · C_coll · exp(-π(d_eff - d_tunnel)/2)

At √s = 13 TeV (LHC): d_eff ≈ 1000, d_tunnel = 12
σ × τ ~ (10⁻²³ s) × (10⁻³⁶ cm²) × exp(-π×988/2) ~ 10⁻⁷⁰⁰

**Proton Decay Duality in Collisions:**
Proton decay can be viewed as a "collision" of the proton with the vacuum:
p + vacuum → e⁺π⁰

The vacuum provides the missing energy via the instanton. The rate is:
Γ_p = (1/τ_p) = m_p exp(-738π)

In a collision at √s = m_p + Q, the proton decay rate is enhanced by the collision energy:
Γ_p(Q) = m_p exp(-738π + π Q/κ m_p)

At Q = κ m_p = 5 MeV: enhancement factor exp(π) ~ 23
At Q = 1 GeV: enhancement factor exp(π×200) ~ 10²⁷²

This means high-energy collisions can dramatically enhance proton decay — but the base rate is so small that even 10²⁷² enhancement leaves it unobservable.

**Experimental Program:**
1. Search for n-n̄ in free neutrons (NNBAR) — probes d=12 missing gap
2. Search for dinucleon decay in nuclei (Super-K, Hyper-K, DUNE) — probes d=12 in medium
3. Search for proton decay (Hyper-K, DUNE) — probes d_426 = 1476
4. Search for B violation at LHC/FCC — probes d_eff(√s)
5. Search for UHECR B violation — probes d_426 at highest energies

All are the same physics: worldline instantons through prime gap barriers.

**Reference:** A2-14, A2-17, A1-19, A1-24, A2-18.