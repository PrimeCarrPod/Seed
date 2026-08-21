# A1-23: Worldline_Anomaly_Inflow.md — Piece 09

## Anomaly in the 8-Bit Hilbert Space: Gap Bits as Fermion Modes

The 256-dimensional Hilbert space at each gap (A3-01) arises from the 8-bit representation of prime differences. Each gap d_n ∈ [1, 510] (even numbers only) is encoded in 9 bits, but the physical space is 256 = 2⁸ dimensions from the lowest 8 bits. This is the "8-bit Hilbert space" of Article 3.

The anomaly in this discrete Hilbert space is computed using the lattice index theorem. The Dirac operator on the worldline with values in the 8-bit space is:

D = Σ_n γ^0_n ⊗ (|n+1⟩⟨n| - |n⟩⟨n+1|) + Σ_n γ^1_n ⊗ |n⟩⟨n|

where γ^0_n, γ^1_n are 256×256 gamma matrices acting on the 8-bit space at site n. The gamma matrices are constructed from the Pauli matrices on the 8 qubits:

γ^0 = σ_1 ⊗ I ⊗ ... ⊗ I
γ^1 = iσ_2 ⊗ I ⊗ ... ⊗ I

with appropriate Clifford algebra relations {γ^μ, γ^ν} = 2η^{μν}.

The index of this lattice Dirac operator is:

Index(D) = Tr(γ^5 e^{-D²/M²})|_{M→∞}

where γ^5 = γ^0 γ^1 = -σ_3 ⊗ I ⊗ ... ⊗ I.

In the prime gap basis, the operator D² is diagonal in the position basis with entries:

(D²)_{n,n} = 2 I_{256} - (|n+1⟩⟨n| + |n⟩⟨n+1|) ⊗ I_{256} + V_n

where V_n is the potential from the gauge connection A_μ(n). The trace is dominated by the zero modes.

The zero modes occur at record gaps where the potential V_n has a bound state. From A1-19, each record gap corresponds to an instanton with a fermion zero mode. In the 8-bit space, this zero mode is a specific 256-component spinor:

|ψ₀⟩ = ⊗_{i=1}^8 |ψ₀^i⟩

where |ψ₀^i⟩ is the zero mode of the i-th qubit Dirac operator. The chirality is γ^5 |ψ₀⟩ = ±|ψ₀⟩.

The anomaly is the net chirality of zero modes:

A_8bit = Σ_{record gaps} chirality(ψ₀) = Index(D) = 22

This matches the continuum result from Piece 07.

The anomaly inflow in the 8-bit space is the flow of quantum information from the bulk 8-bit registers to the boundary. The bulk registers are the 256 qubits at each gap (8 qubits per gap × 256 states). The boundary is the worldline fermion.

The Callan-Harvey condition in the 8-bit space is:

⟨ψ_L| ψ⟩ = 0  for bulk states ψ

which projects out the left-handed component. The right-handed component flows to the boundary.

The anomaly polynomial in the 8-bit space is:

I₂ = (1/2π) Σ_n Tr_{256}(F_{01}(n))

where F_{01}(n) is the field strength in the 256-dimensional representation. Using the trace identity Tr_{256}(σ_3 ⊗ I) = 0 and Tr_{256}(I) = 256:

I₂ = (256/2π) F^{U(1)}_{01} + Tr_{256}(F^{SU(2)}_{01})

The SU(2) part vanishes by tracelessness, leaving:

I₂ = (128/π) F^{U(1)}_{01}

This gives an anomaly coefficient 256 times larger than the single-component fermion. The level k is also 256 times larger:

k_8bit = 256 × Index(D) = 256 × 22 = 5632

The inflow current is:

J^τ = (k_8bit/2π) F_{12} = (5632/2π) F_{12}

This is the quantum information current: 5632 bits of anomaly flow per proper time step.

Piece 10 connects the anomaly to the Riemann zeta zeros (A1-04).