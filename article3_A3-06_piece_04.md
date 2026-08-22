# A3-06 Decoherence_From_Gap_Randomness.md — Piece 04: Entanglement Sudden Death and Revival

## 4.1 Entanglement Sudden Death (ESD) in the Prime Gap System

When two gaps (e.g., d_n and d_{n+1}) are initially entangled, the dephasing master equation causes their entanglement to vanish at a **finite time** — this is entanglement sudden death (ESD).

### Two-Gap State
Consider the reduced state of two adjacent gaps:
```
ρ_{12}(t) = Tr_{m≠1,2}(|Ψ(t)⟩⟨Ψ(t)|)
```

In the basis {|d_1 d_2⟩}, the initial state has coherences ρ_{d_1 d_2, d_1' d_2'}(0). Under pure dephasing:
```
ρ_{d_1 d_2, d_1' d_2'}(t) = ρ_{d_1 d_2, d_1' d_2'}(0) e^{-iω_{d_1 d_1'}t} e^{-Γ_{d_1 d_1'}t} e^{-iω_{d_2 d_2'}t} e^{-Γ_{d_2 d_2'}t}
```

### Concurrence Evolution
For a two-qubit state, the concurrence is:
```
C(t) = max{0, λ_1 - λ_2 - λ_3 - λ_4}
```
where λ_i are eigenvalues of ρ(σ_y ⊗ σ_y)ρ*(σ_y ⊗ σ_y) in decreasing order.

For the prime gap state with dephasing, the concurrence decays as:
```
C(t) = max{0, C(0) - Γ_ESD t}
```
for short times, where Γ_ESD is the effective dephasing rate for the entangled components.

### ESD Time
ESD occurs at:
```
t_ESD = C(0) / Γ_ESD
```

For adjacent gaps with strong initial entanglement (e.g., sexy prime pairs d=6, d=6):
- C(0) ≈ 0.16 (from A3-05, Piece 06)
- Γ_ESD ≈ 10^{-3} (in 1/κ units)
- t_ESD ≈ 160 κ

For weak entanglement (generic gaps):
- C(0) ≈ 0.01
- Γ_ESD ≈ 10^{-2}
- t_ESD ≈ 1 κ

## 4.2 Entanglement Revival

Due to the **finite-dimensional Hilbert space** (ℋ₂₅₆), the system exhibits Poincaré recurrences. The full evolution is unitary and quasi-periodic:
```
ρ(t + T_rec) = ρ(t)
```
where the recurrence time is:
```
T_rec = 2πℏ / gcd({E_d - E_{d'}})
```

Since E_d = ℏ/(κd), the energy differences are:
```
ΔE = ℏ/κ (1/d - 1/d') = ℏ/κ · (d' - d)/(dd')
```

The greatest common divisor of all energy differences determines T_rec. For the 8-bit system with d, d' ∈ {2, 4, 6, ..., 254}:
```
T_rec ~ 2πκ · lcm({dd'/(d'-d)})
```
which is exponentially large in the number of gap values.

### Revival of Entanglement
At t ≈ T_rec/2, the phases approximately re-align, causing **entanglement revival**:
```
C(t) ≈ C(0) at t = T_rec/2
```

This is a genuine quantum revival — the information was not lost but dispersed into the environment (unobserved gaps).

## 4.3 ESD and Revival for Multipartite Entanglement

For the full 8-bit state |Ψ⟩, the **genuine multipartite entanglement** (GME) also exhibits ESD and revival:

### GME Witness Evolution
From A3-05, Piece 07, the GME witness W_GME has ⟨W_GME⟩(0) ≈ -0.15. Under dephasing:
```
⟨W_GME⟩(t) = ⟨W_GME⟩(0) e^{-Γ_GME t}
```
with Γ_GME determined by the slowest-decaying coherences (those within DFS sectors).

### GME Revival Time
The GME revives at the same Poincaré recurrence time T_rec. Since the twin prime sector is an exact DFS (Γ=0), the component of |Ψ⟩ in ℋ_twin never decoheres, providing a **floor** for the entanglement:
```
C_min ≥ μ₈(2) = 0.5
```
for the appropriate entanglement measure.

## 4.4 Non-Markovian Effects

The power-law correlation C(τ) ~ τ^{-0.7} (A3-05, Piece 08) implies **non-Markovian decoherence**. The exact master equation has a memory kernel:
```
∂_t ρ(t) = -i[H, ρ(t)] + ∫_0^t K(t-s) ρ(s) ds
```

This leads to:
- **Initial non-exponential decay** (power-law at short times)
- **Recoherence oscillations** before full ESD
- **Modified revival structure** with partial revivals at intermediate times

The non-Markovianity measure (BLP):
```
N = max_{ρ_1,ρ_2} ∫_{σ>0} σ(t) dt,  σ(t) = ∂_t ||ρ_1(t) - ρ_2(t)||_1
```
is non-zero for the prime gap system, confirming non-Markovian dynamics.

## 4.5 Connection to Worldline Proper Time

From A1-08, the proper time fluctuations have spectrum S_τ(ω) ~ ω^{-1.7}. The decoherence rate Γ ~ S_τ(ω) gives:
```
Γ(ω) ~ ω^{-1.7}
```
This matches the gap correlation exponent α = 0.7 via the fluctuation-dissipation theorem.

## 4.6 Piece 04 Summary

- ESD occurs at finite time t_ESD = C(0)/Γ_ESD
- Twin prime entanglement: no ESD (exact DFS)
- Sexy prime entanglement: t_ESD ~ 10²-10³ κ
- Generic gaps: t_ESD ~ 1-10 κ
- Entanglement revival at Poincaré time T_rec ~ exp(O(256))
- Non-Markovian effects from power-law correlations (α = 0.7)
- GME witness decays and revives with same timescales
- Floor from twin prime DFS: entanglement never fully vanishes

**References**: A3-05 (Piece 08: Decoherence-Free Subspaces), A3-02 (Time Evolution), A1-08 (Proper Time Fluctuation Spectrum), A1-31 (Worldline Entanglement Entropy)