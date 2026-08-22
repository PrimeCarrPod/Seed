# A3-02 Time Evolution Operator — Piece 04: Connection to Worldline Path Integral (A1-18)

## 4.1 Worldline Path Integral Recap

Article 1 (A1-18) formulated the worldline path integral:

```
Z = ∫ D[x(τ)] exp(i S[x]/ℏ)
```

with action S = Σ_n d_n L(d_n) from A1-16. The proper time τ is discrete: τ_n = κ Σ_{i=1}^n d_i.

## 4.2 From Path Integral to 256-Dimensional Evolution

The path integral sums over worldline configurations x(τ). In the 256-dimensional Hilbert space, each step corresponds to a transition between residue states:

```
|ψ(τ_{n+1})⟩ = U(Δτ_n) |ψ(τ_n)⟩
```

where Δτ_n = κ·d_n and U(Δτ) = exp(-iĤΔτ/ℏ).

The full evolution from τ_0 to τ_N is:

```
|ψ(τ_N)⟩ = U(Δτ_N) ··· U(Δτ_1) |ψ(τ_0)⟩
         = exp(-iĤ Σ Δτ_i/ℏ) |ψ(τ_0)⟩
         = exp(-iĤ τ_N/ℏ) |ψ(τ_0)⟩
```

since all U(Δτ) commute (diagonal in same basis). The total proper time τ_N = κ Σ d_i.

## 4.3 Discrete Time Steps from Prime Gaps

The proper time step Δτ_n = κ·d_n varies at each step according to the prime gap sequence. The time evolution operator at step n is:

```
U_n = exp(-iĤ κ·d_n/ℏ) = exp(-i κ d_n Ĥ/ℏ)
```

Since Ĥ|k⟩ = (ℏ/(κ·k))|k⟩, we get:

```
U_n |k⟩ = exp(-i d_n/k) |k⟩
```

The phase acquired at step n depends on the ratio d_n/k — the current gap divided by the residue label.

## 4.4 Path Integral as Product of 256-Dimensional Unitaries

The amplitude for a worldline segment with gaps {d_1, ..., d_N} is:

```
A = ⟨k_f| U_N ··· U_1 |k_i⟩
  = exp(-i Σ_{n=1}^N d_n/k) δ_{k_f, k_i}
```

Wait — the basis states don't change under U(t) because Ĥ is diagonal! This means the residue k is **conserved** during evolution. The only dynamics is phase accumulation.

The physical interpretation: the prime gap residue class k is a conserved quantum number (like charge). The worldline evolves within a fixed residue sector.

## 4.5 Transition Between Residues: The Real Dynamics

The actual dynamics of the electron involves transitions between residue classes. These transitions occur at **interaction vertices** (A1-06), where the worldline intersects itself or creates pairs. In the 256-dimensional language, vertices are operators V that connect different |k⟩ states.

The full time evolution with vertices:

```
U_total = T exp(-i ∫ (Ĥ + V) dt)
```

where T is time ordering. The vertex operator V has matrix elements V_{kk'} connecting different residues. From A1-06, vertices occur at primes p_n with gap d_n, so:

```
V_{kk'} ~ δ_{k', k ± d_n} (with appropriate weights)
```

This gives the real dynamics — transitions between residue classes driven by the prime gap sequence itself.

## 4.6 Instanton Solutions and Tunneling (A1-19)

Article 1 (A1-19) described instanton solutions — tunneling between worldline sectors. In the 256-dimensional space, instantons correspond to transitions between different residue classes |k⟩ ↔ |k'⟩. The instanton amplitude is:

```
A_inst ~ exp(-S_inst/ℏ)
```

where S_inst is the instanton action. For the prime gap system, instantons are related to **missing gaps** (e.g., d=12). The missing gap d=12 means no direct transition between residues differing by 12 — but instantons can mediate such transitions.

## 4.7 Summary: Path Integral ↔ 256-Dim Evolution

| Path Integral (A1) | 256-Dim Evolution (A3) |
|--------------------|------------------------|
| ∫ D[x] exp(iS/ℏ) | Π_n U(Δτ_n) |
| Action S = Σ d_n L(d_n) | Ĥ = Σ (ℏ/(κk))|k⟩⟨k| |
| Proper time τ = κ Σ d_n | U(t) = exp(-iĤt/ℏ) |
| Vertices = interactions | V = off-diagonal transitions |
| Instantons = tunneling | V_inst = missing gap transitions |

The 256-dimensional time evolution operator is the **Hamiltonian formulation** of the worldline path integral, with the prime gap sequence providing the discrete time steps.