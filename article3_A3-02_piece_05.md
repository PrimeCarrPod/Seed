# A3-02 Time Evolution Operator — Piece 05: Energy Scale Dependence and RG Flow

## 5.1 Effective Hamiltonian at Scale E

The full 256-dimensional Hamiltonian is:

```
Ĥ = Σ_{k=1}^{255} E(k) |k⟩⟨k| + E(0)|0⟩⟨0|
```

At energy scale E, only states with E(k) ≥ E are dynamically relevant (lower energy states are "frozen" in the ground state). The **effective Hamiltonian** at scale E is:

```
Ĥ_eff(E) = Σ_{k: E(k)≥E} E(k) |k⟩⟨k| + Σ_{k: E(k)<E} E_min |k⟩⟨k|
```

where E_min is the lowest accessible energy. This is a projection onto the active subspace.

## 5.2 Active Dimension D(E) Revisited

From A3-01 (Piece 05), the effective dimension D(E) is the number of residue classes with E(k) ≥ E. Since E(k) = ℏ/(κ·k):

```
E(k) ≥ E  ⇔  k ≤ ℏ/(κ·E) =: k_max(E)
```

Thus D(E) = k_max(E) for k_max ≤ 255, and D(E) = 255 for k_max > 255.

At electron scale (E = 0.511 MeV): k_max = 2 → D = 1 (only |2⟩ active, |0⟩,|1⟩ frozen)
At muon scale (E = 105.7 MeV): k_max = 4 → D = 2 (|2⟩,|4⟩ active)
At tau scale (E = 1777 MeV): k_max = 6 → D = 3 (|2⟩,|4⟩,|6⟩ active)
At GUT scale (E ~ 10¹⁶ GeV): k_max > 255 → D = 255 (all active)

## 5.3 RG Flow of the Hamiltonian

The PrimeBookOne directory structure (0.0 → 1.0 → 2.0 → 3.0) corresponds to increasing energy scale / decreasing proper time resolution. The RG flow of Ĥ is:

```
dĤ/d log μ = β(Ĥ)
```

where μ is the energy scale. Since Ĥ is diagonal, the beta function acts on each eigenvalue:

```
dE(k)/d log μ = -E(k)  (for k ≤ k_max(μ))
dE(k)/d log μ = 0       (for k > k_max(μ))
```

This is the **dimensional transmutation** of the prime gap spectrum — as we flow to higher energies, more states become active.

## 5.4 Connection to Article 4: Running Couplings

Article 4 (A4-04) will show that the running of gauge couplings α(μ) is governed by the same D(μ) function. The beta function for α is:

```
dα/d log μ = -b(μ) α²/(2π)
```

where b(μ) = D(μ) is the number of active degrees of freedom at scale μ. The prime gap framework **derives** the beta function coefficients from the gap distribution — no free parameters.

## 5.5 UV Fixed Point at D = 255

At the UV scale (PrimeBookOne directory 3.0, gaps up to 1476), all 255 physical residues are active. The UV fixed point has:

```
Ĥ_UV = Σ_{k=1}^{255} E(k) |k⟩⟨k|
```

with all 255 states dynamical. The UV completion is a 255-dimensional (effectively 256 with |0⟩ frozen) quantum system. This matches the bosonic string critical dimension connection from A3-01.

## 5.6 IR Fixed Point at D = 1

At the IR scale (electron mass), only |2⟩ is active. The IR fixed point is:

```
Ĥ_IR = E(2) |2⟩⟨2|
```

This is a trivial 1-dimensional system — the electron ground state. All other degrees of freedom are frozen out. The IR fixed point explains why we see only one electron in the low-energy world.

## 5.7 Time Evolution at Different Scales

The time evolution operator at scale E is:

```
U_E(t) = exp(-i Ĥ_eff(E) t/ℏ)
```

For E corresponding to electron scale: U_e(t) = e^{-i E_e t/ℏ} |2⟩⟨2| + (frozen states)
For muon scale: U_μ(t) = e^{-i E_e t/ℏ}|2⟩⟨2| + e^{-i E_μ t/ℏ}|4⟩⟨4| + (frozen)
For tau scale: U_τ(t) includes |6⟩ phase factor
For GUT scale: U_GUT(t) = Σ_{k=1}^{255} e^{-i E(k)t/ℏ} |k⟩⟨k|

The complexity of time evolution **grows with energy** — more frequencies, more quasi-periodic structure.