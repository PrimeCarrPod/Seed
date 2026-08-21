# ARTICLE 1: Prime Electron Worldline Topology — A1-03 (Piece 03)

## 3. SPINOR STRUCTURE FROM PRIME GAPS

### 3.1 Two-Component Spinor

The electron wavefunction is a two-component spinor ψ_α, α = 1, 2.

Under SU(2) rotation by angle θ around axis n̂:

ψ → exp(-i θ/2 n̂·σ) ψ

where σ = (σ_x, σ_y, σ_z) are Pauli matrices.

### 3.2 Prime Gap as Rotation Angle

Each prime gap d_n corresponds to a rotation angle:

θ_n = 2κ·d_n / ℏ = d_n · (m_e c^2/ℏ) · (ℏ/(m_e c^2)) = d_n · 2

Wait, let me recalculate.

The proper-time step Δτ_n = κ·d_n.

The phase accumulated: φ_n = (m_e c^2/ℏ) · Δτ_n = (m_e c^2/ℏ) · (ℏ/(2m_e c^2)) · d_n = d_n/2

So each gap d_n corresponds to a rotation by angle θ_n = d_n (in units of 2π?).

Actually, the factor of 2 in the recurrence means the effective rotation per step is 2·a_k.

### 3.3 Double Cover in Gap Sequence

The gap sequence with factor 2:

d_1 = 1 (initial)
d_2 = d_1 + 2·1 = 3 (but actual gap is 2)

The readme algorithm doesn't exactly generate prime gaps — it describes the spin structure.

The "multiply by two" = the spinor rotation requires 4π to return to identity.

In the 8-bit array (256 states), the spinor has 2 components × 128 phases = 256.