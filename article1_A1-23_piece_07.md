# A1-23: Worldline_Anomaly_Inflow.md — Piece 07

## UV Anomaly: Directory 3.0 and the 3.67 Billion Gap Spectral Flow

The PrimeBookOne directory 3.0 contains 3500 books × 2²⁰ gaps = 3,670,016,000 prime gaps, representing the UV-complete theory. The UV anomaly is the anomaly of the full worldline, which must cancel the IR anomaly from Piece 06.

The UV anomaly polynomial is:

I₂^{UV} = (κ/12π) Σ_{n∈3.0} d_n^{-1} ∂_n d_n

The sum runs over all 3.67×10⁹ gaps. For large n, the prime gaps follow the Cramér model: d_n ~ log p_n with fluctuations of order √log p_n. The ratio d_{n+1}/d_n is close to 1, so (d_{n+1}/d_n - 1) is small.

We can approximate the sum by an integral:

Σ_{n∈3.0} (d_{n+1}/d_n - 1) ≈ ∫ (d(log d)/dn) dn = log(d_N/d_1)

But this misses the fluctuations. The correct treatment uses the spectral flow. The Dirac operator on the full worldline has index:

Index(D_UV) = #{record gaps in 3.0} ≈ log(3.67×10⁹) ≈ 22

The 22 record gaps in the UV directory are the dominant contributions to the anomaly. Each record gap corresponds to an instanton (A1-19) with action S_inst = 8π²/g², where g² is the gauge coupling from A1-20.

The UV anomaly is:

A_UV = (Index(D_UV)/2π) ∫_{3.0} F^{U(1)} = (22/2π) × (κ/6) Σ_{n∈3.0} (d_{n+1}/d_n - 1)

= (11κ/6π) Σ_{n∈3.0} (d_{n+1}/d_n - 1)

The total anomaly across all directories is:

A_total = A_IR + A_1.0 + A_2.0 + A_UV

By the global index theorem, A_total = 0. This implies:

A_UV = - (A_IR + A_1.0 + A_2.0)

The intermediate directories 1.0 and 2.0 (each 189 tiles × 500 gaps = 94,500 gaps) provide the interpolation between IR and UV. Their anomalies are:

A_1.0 = (κ/12π) Σ_{n∈1.0} (d_{n+1}/d_n - 1)
A_2.0 = (κ/12π) Σ_{n∈2.0} (d_{n+1}/d_n - 1)

Numerically, the UV anomaly dominates because of the sheer number of gaps. The spectral flow of 22 record gaps across 3.67B steps produces the precise cancellation.

The anomaly inflow in the UV is the flow of the 22 instanton zero modes from the bulk Hilbert space to the worldline boundary. The bulk is the 256-dimensional fiber at each gap, and the flow is the spectral flow of the 256×3.67B Dirac operator.

Piece 08 derives the anomaly inflow current explicitly.