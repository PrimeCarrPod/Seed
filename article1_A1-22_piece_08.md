# A1-22: Worldline_Boundary_Conditions.md — Piece 08

## Anomaly Inflow at Boundaries: 4D Bulk to 1D Worldline

From A1-23 (Worldline_Anomaly_Inflow, to be written), the axial anomaly on the 1D worldline is canceled by anomaly inflow from a 4D bulk theory. The bulk is the space of all prime gaps, which has the topology of the 8-bit Hilbert space S^3 (from A3-01).

The anomaly polynomial in 4D is:
I_4 = (1/8π^2) Tr(F ∧ F) = (1/8π^2) dω_3

where ω_3 = Tr(A ∧ dA + (2/3) A ∧ A ∧ A) is the Chern-Simons form. The worldline is a 1-cycle C in the 4D bulk. The anomaly inflow is:
∫_C I_2 = ∫_C (1/2π) Tr(A ∧ F)

where I_2 is the descent of I_4. The boundary of the worldline interval [0,T] is the two points τ=0 and τ=T. The anomaly inflow from the bulk to the boundaries is:
Anomaly_inflow = ∫_{τ=0}^{τ=T} dI_2 = I_2(T) - I_2(0)

For the prime electron, the bulk is the space of prime gap sequences. The worldline is the specific path corresponding to the actual prime gaps d_n. The boundaries τ=0 and τ=T are the endpoints of this path in the bulk.

The anomaly at each boundary is:
Anomaly(τ=0) = (1/2π) Tr(A(0) ∧ F(0)) = (1/2π) A_0(0) F_{0i}(0)
Anomaly(τ=T) = (1/2π) Tr(A(T) ∧ F(T)) = (1/2π) A_0(T) F_{0i}(T)

From A1-20 Piece 08, the total anomaly is ΔQ_5 = 48/π. The inflow from the bulk distributes this between the two boundaries.

The UV boundary (τ=T) receives anomaly from the 24 instantons (record gaps) in the bulk. The IR boundary (τ=0) receives anomaly from the initial chirality. The sum is:
Anomaly(τ=T) + Anomaly(τ=0) = ΔQ_5 = 48/π

With 24 instantons each contributing 2/π, and the initial/final chirality contributing the rest.

The anomaly inflow ensures that the total theory (bulk + boundary) is anomaly-free. The boundary conditions at τ=0 and τ=T are chosen to cancel the anomaly:
- At τ=0: Add boundary fermions with opposite chirality
- At τ=T: Add boundary fermions with appropriate chirality

For the prime electron, the "boundary fermions" are the initial and final states of the worldline. The initial state (τ=0) is an electron (left-handed in the massless limit). The final state (τ=T) is a positron (right-handed). The anomaly is canceled by the fact that the electron and positron have opposite chiralities.

Piece 09 discusses the spectral asymmetry and boundary zero modes.