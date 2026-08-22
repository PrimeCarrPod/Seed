# A3-02 Time Evolution Operator — Piece 06: Vertex Operators and Interactions

## 6.1 Need for Off-Diagonal Evolution

The free time evolution U_0(t) = exp(-iĤt/ℏ) is diagonal — it preserves the residue quantum number k. Physical processes (pair creation, scattering, decays) require transitions between different k. These are mediated by **vertex operators** V.

## 6.2 Vertex Operators from Article 1

Article 1 (A1-06, A1-07) identified interaction vertices at primes p_n with gap d_n:
- **Pair creation**: forward/backward time branches (e⁻/e⁺)
- **Self-intersection**: γ(τ_n) = γ(τ_m)
- **Instanton tunneling**: A1-19

In the 256-dimensional space, a vertex at step n with gap d_n induces a transition:

```
|k⟩ → |k ± d_n mod 256⟩
```

The sign ± corresponds to forward/backward time (particle/antiparticle).

## 6.3 Vertex Operator Matrix Elements

The vertex operator V_n for step n has matrix elements:

```
(V_n)_{k,k'} = g_n δ_{k', k + d_n mod 256} + g_n^* δ_{k', k - d_n mod 256}
```

where g_n is the vertex coupling. From A1-16 (action principle), the coupling is:

```
g_n ~ exp(i κ d_n L(d_n))
```

For the free particle Lagrangian L(d) = 1/d, this gives g_n ~ exp(i κ).

## 6.4 Full Time Evolution with Vertices

The time evolution including vertices is the time-ordered exponential:

```
U(t) = T exp(-i/ℏ ∫_0^t (Ĥ + V(τ')) dτ')
```

In the discrete proper time formulation (A1-01), this becomes a product over steps:

```
U_N = U_0(Δτ_N) V_N U_0(Δτ_{N-1}) V_{N-1} ··· U_0(Δτ_1) V_1
```

where U_0(Δτ) = exp(-iĤΔτ/ℏ) is the free evolution, and V_n is the vertex at step n.

## 6.5 Magnus Expansion and Effective Hamiltonian

For small vertices (weak coupling), the Magnus expansion gives an effective Hamiltonian:

```
Ĥ_eff = Ĥ + V_avg + (1/2)[V, Ĥ] + ...
```

where V_avg is the time-averaged vertex operator. The commutator [V, Ĥ] is non-zero because V connects states with different energies.

The effective Hamiltonian is no longer diagonal — it has off-diagonal elements connecting residues differing by gaps d_n.

## 6.6 Connection to Mass Spectrum (Article 2)

The off-diagonal elements of Ĥ_eff induce mixing between the charged lepton states |2⟩, |4⟩, |6⟩. However, the mixing is suppressed because:
- The energy differences ΔE are large compared to vertex couplings
- The vertex operators are suppressed by powers of the fine structure constant α

This explains **lepton flavor universality** (A2-21): the diagonal part of Ĥ_eff is universal, and off-diagonal mixing is negligible at low energies.

## 6.7 BSM Lepton Production

At high energies (near BSM lepton thresholds), vertex operators can produce transitions to higher residue states:

```
|6⟩ → |8⟩, |10⟩, |14⟩, ...
```

via vertices with d_n = 2, 4, 8, ... The cross-section for producing BSM lepton L_k is:

```
σ_k ~ |⟨k|V|6⟩|² / (E_k - E_6)²
```

This is the 256-dimensional realization of the BSM lepton production mechanism from A2-11.

## 6.8 Missing Gap d=12 and Forbidden Transitions

The missing record gap d=12 means there is **no vertex** with d_n = 12 in the prime gap sequence. This implies:

```
(V_n)_{k,k'} = 0  for k' = k ± 12 mod 256
```

Transitions differing by 12 are forbidden at tree level. They can only occur via:
- Higher-order processes (multiple vertices)
- Instanton tunneling (A1-19)

This is the microscopic origin of:
- n-n̄ oscillation suppression (A2-17)
- Sterile neutrino mass suppression (A2-20)
- Dark matter stability (A2-15)

The missing gap d=12 is a **selection rule** in the 256-dimensional Hilbert space.