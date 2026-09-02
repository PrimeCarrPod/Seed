# METHODOLOGY: Prime Gap to Worldline Mapping — Piece 04

## 3. EVOLUTION OPERATOR IN PRIME BASIS

### 3.1 Hilbert Space Construction

The 8-bit array (0-255) defines a 256-dimensional Hilbert space ℋ = ℂ^{256}.

Basis states: |d⟩ for d ∈ {0,1,...,255} representing prime gap values.

The physical subspace is spanned by observed gaps: {2, 4, 6, 8, 10, 14, ...} ⊂ {0,...,255}.

### 3.2 Hamiltonian in Prime Gap Basis

The proper-time Hamiltonian generates translations in τ:

H = ℏ/κ · D^{-1}

where D is the diagonal matrix of prime gaps: D_{dd'} = d·δ_{dd'}.

In the basis of observed gaps {d_n}:

H = diag(ℏ/(κ·d_1), ℏ/(κ·d_2), ..., ℏ/(κ·d_{256}))

### 3.3 Time Evolution Operator

U(Δτ) = exp(-i H Δτ / ℏ) = diag(exp(-i Δτ/(κ·d_1)), ..., exp(-i Δτ/(κ·d_{256})))

For a single step Δτ = κ·d_n:

U_n = diag(exp(-i d_n/d_1), exp(-i d_n/d_2), ..., exp(-i d_n/d_{256}))

The phase accumulated per step is φ_{nm} = d_n/d_m — ratio of prime gaps.