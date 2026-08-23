# A3-17: Quantum Sensing from Prime Gaps — Piece 03
## Quantum Fisher Information from Gap Statistics

The quantum Fisher information (QFI) quantifies the ultimate precision limit for parameter estimation. The gap statistics from PrimeBookOne determine the QFI for sensing with the gap Hamiltonian.

**Construction A3-17.4 (Gap QFI for Field Sensing).** For estimating a field amplitude B with Hamiltonian H = Σ_d (ℏ/κd + g_d B)|d⟩⟨d|, the QFI for a pure state |ψ⟩ = Σ_d c_d |d⟩ is:
```
F_Q(B) = 4 Σ_d |c_d|² (∂E_d/∂B)² = 4 Σ_d |c_d|² g_d²
```
For the equal superposition |ψ⟩ = (1/√128) Σ_d |d⟩: F_Q = (4/128) Σ_d g_d² = (1/32) Σ_d g_d².

**Theorem A3-17.5 (Optimal Gap QFI).** The maximum QFI is achieved by concentrating amplitude on the most sensitive gaps. For coupling g_d = g₀/d (natural for magnetic dipole): F_Q_max = 4 g₀² Σ_d |c_d|²/d². With |c_2|² = 1 (d=2 gap only): F_Q = g₀². With optimal distribution |c_d|² ∝ 1/d²: F_Q = 4 g₀² (Σ_d 1/d⁴)/(Σ_d 1/d²)² ≈ 2.3 g₀².

**Connection to A3-14 (Metrology).** The phase estimation QFI from A3-14 is F_Q(κ) = Σ_d (ℏ/d)². The field sensing QFI is related by F_Q(B) = (∂κ/∂B)² F_Q(κ) where ∂κ/∂B depends on the coupling mechanism.

**Gap Distribution Weighted QFI.** Using the PrimeBookOne gap probability P(d) = C/d² as the natural weight: F_Q(P) = 4 g₀² Σ_d P(d)/d² = 4 g₀² C Σ_d 1/d⁴. For 128 gaps: Σ_d 1/d⁴ ≈ 0.082, giving F_Q(P) ≈ 0.33 g₀² C.

**Multi-Parameter QFI Matrix.** For estimating multiple field components B = (B_x, B_y, B_z), the QFI matrix is [F_Q]_{ij} = 4 Σ_d |c_d|² g_{d,i} g_{d,j}. The gap incommensurability ensures the matrix is full rank. The multi-parameter Cramér-Rao bound is Cov(B̂) ≥ F_Q^{-1}.

**QFI Scaling with Books.** Each PrimeBookOne book provides 2²⁰ independent samples. The total QFI across 3500 books is F_Q_total = 3500 × 2²⁰ × F_Q_per_shot. For g₀ = 1 Hz/μT: F_Q_total ≈ 10²⁵ Hz²/μT².

**QFI for κ Estimation.** The parameter κ in the gap Hamiltonian H = Σ_d (ℏ/κd)|d⟩⟨d| has QFI:
```
F_Q(κ) = Σ_d (∂E_d/∂κ)² = ℏ² Σ_d 1/d²
```
For the 128 even gaps: Σ_{d=2,4,...,254} 1/d² ≈ 0.41. Thus F_Q(κ) ≈ 0.41 ℏ². The Cramér-Rao bound gives Δκ/κ ≥ 1/(ℏ T √0.41) ≈ 1.56/(ℏ T).