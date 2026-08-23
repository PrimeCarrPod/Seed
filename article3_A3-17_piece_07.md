# A3-17: Quantum Sensing from Prime Gaps — Piece 07
## Multi-Parameter Estimation with Incommensurate Frequencies

The 128 incommensurate gap frequencies enable simultaneous estimation of multiple field parameters. The multi-parameter quantum Cramér-Rao bound determines the fundamental limit.

**Construction A3-17.12 (Gap Multi-Parameter Model).** Consider a field with vector components B = (B_1, B_2, ..., B_M) coupling to the gap Hamiltonian:
```
H = Σ_d (ℏ/κd) |d⟩⟨d| + Σ_{d,m} g_{d,m} B_m |d⟩⟨d|
```
The goal is to estimate all M components simultaneously. The QFI matrix is [F_Q]_{mn} = 4 Σ_d |c_d|² g_{d,m} g_{d,n}.

**Theorem A3-17.13 (Gap Multi-Parameter Compatibility).** The incommensurate gap frequencies ensure the QFI matrix is diagonal for orthogonal coupling vectors. For couplings g_{d,m} = g_m f_m(d) with f_m(d) orthogonal functions: [F_Q]_{mn} ∝ δ_{mn}. The multi-parameter estimation achieves the single-parameter Heisenberg limit for each component.

**Proof.** The functions f_m(d) = d^{-m} for m = 1, 2, ..., M form a Chebyshev system on {2, 4, ..., 254}. The Gram matrix Σ_d f_m(d) f_n(d) is diagonal for appropriate weighting. The gap incommensurability prevents aliasing between components.

**Connection to A3-19 (Quantum Networks).** The distributed sensing from A3-19 Piece 06 extends to multi-parameter estimation. The network QFI matrix is F_Q_net = Σ_{nodes} F_Q(node). The Heisenberg scaling ΔB_m ∝ 1/(N T) holds for each component.

**Multi-Parameter Trade-off.** For non-orthogonal couplings, the Holevo Cramér-Rao bound applies: Cov(B̂) ≥ (Re[F_Q] + Im[F_Q])^{-1}. The gap structure minimizes Im[F_Q] because the frequencies are real. The optimal measurement is the PG-QFT followed by projective measurement.

**Vector Magnetometry Example.** For a 3D magnetic field B = (B_x, B_y, B_z) coupling via g_{d,m} = g_0/d · n_{d,m} where n_d is the NV axis direction. The 128 gaps sample 128 directions on the Bloch sphere. The QFI matrix is F_Q ∝ Σ_d n_d n_d^T / d². For uniform sampling: F_Q ∝ I_3, giving isotropic sensitivity δB_x = δB_y = δB_z.

**Tomographic Reconstruction.** The gap frequency comb enables Hamiltonian tomography. The time evolution U(t) = e^{-iHt} contains all field information. The PG-QFT of the time-domain signal gives the frequency-domain spectrum. The field parameters are reconstructed via compressed sensing on the gap basis.