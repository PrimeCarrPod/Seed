# A2-05: Worldline Proper-Time Quantization — Tau as Quadruple-Winding State

From A1-01 and A1-11: the electron worldline has proper-time ticks Δτ_n = κ·d_n where d_n are prime gaps and κ = ℏ/(mₑc²). The electron (ground state) has winding number w=1 through d=2. The muon (A2-04) has winding number w=3 through {4, 6, 8}. The tau has winding number w=4 through {6, 8, 14, 18}.

The tau worldline trajectory in proper-time space:
γ_τ(τ) = Σ_{i=1}^4 θ(τ - τ_i) · v_i
where τ_i = κ·Σ_{j≤i} d_j are the segment endpoints, and v_i are velocity vectors in the internal gap space. The four segments correspond to the four record gaps:
- Segment 1: τ ∈ [0, 6κ), gap d=6, record #3 at p=23
- Segment 2: τ ∈ [6κ, 14κ), gap d=8, record #4 at p=89
- Segment 3: τ ∈ [14κ, 28κ), gap d=14, record #5 at p=113
- Segment 4: τ ∈ [28κ, 46κ), gap d=18, record #6 at p=523

Total proper time for one tau cycle: Δτ_τ = 46κ. The muon cycle: Δτ_μ = 18κ. The electron cycle: Δτ_e = 2κ.

The winding number w equals the number of record gaps in the cluster. This is a topological invariant: the worldline must pass through each record gap exactly once per cycle. The sequence of record gaps is ordered by increasing prime p, which orders them by increasing gap d (since record gaps are strictly increasing).

The proper-time quantization condition (A1-01):
∮ dτ = n·Δτ_0
where Δτ_0 = 2κ is the electron proper-time quantum. For the tau: 46κ = 23·(2κ) = 23·Δτ_0. The tau cycle contains 23 electron proper-time quanta. For the muon: 18κ = 9·Δτ_0.

This integer quantization (23, 9, 1) matches the record primes themselves: p_τ = 523 (6th record), p_μ = 89 (4th record), p_e = 3 (1st record). The proper-time winding is locked to the record prime indices.