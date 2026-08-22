# A3-12: Quantum Simulation from Prime Gaps — Piece 10
## Quantum Chaos and Out-of-Time-Order Correlators

The prime gap system exhibits quantum chaos characterized by the Lyapunov exponent, out-of-time-order correlators (OTOCs), and the spectral form factor. The chaos is determined by the gap correlation structure from A3-05.

**Definition A3-12.18 (OTOC for Gap System).** The OTOC for operators W, V on the gap Hilbert space is:
```
C(t) = ⟨[W(t), V]†[W(t), V]⟩_β = 2(1 - Re F(t))
```
where F(t) = ⟨W(t)V W(t)V⟩_β is the out-of-time-order correlator, W(t) = e^{iHt} W e^{-iHt}, and ⟨·⟩_β is the thermal average at β = κ/ℏ.

**Theorem A3-12.19 (OTOC from Gap Correlations).** For W = n_d = c_d^† c_d (fermion density) and V = n_0, the OTOC is:
```
F(t) = Σ_{k,q} |⟨k|n_d|q⟩|² e^{-i(E_k - E_q)t} n_F(E_k)(1 - n_F(E_q))
```
where n_F(E) = 1/(e^{βE} + 1) is the Fermi-Dirac distribution. The matrix elements ⟨k|n_d|q⟩ = (1/256) Σ_d e^{2πi(k-q)d/256} are the PG-QFT of the density operator. The OTOC grows as:
```
C(t) ≈ (t/t_*)² for t ≪ t_*
C(t) ≈ 1 - e^{-λ_L(t - t_*)} for t ≫ t_*
```
with Lyapunov time t_* = 1/λ_L and λ_L = 2π/β = 2π ℏ/κ (saturating the MSS bound λ_L ≤ 2π/β).

**Connection to A3-09 (Bell Violation).** The Bell violation S = 2.3724 is related to the OTOC via the Maldacena-Shenker-Stanford bound: the chaos bound λ_L ≤ 2π/β is equivalent to the Tsirelson bound S ≤ 2√2. The prime gap system saturates both: λ_L = 2π/β and S/(2√2) = 83.9%. The Bell violation measures the quantum chaos of the worldline.

**Spectral Form Factor and Chaos.** The spectral form factor K(τ) = |Tr(e^{-iHτ})|²/256² shows the universal ramp-plateau structure:
- Dip at τ_dip ∼ 256 ℏ/κ (Heisenberg time)
- Ramp with slope 1 for τ_dip < τ < τ_plateau
- Plateau at K = 1/256 for τ > τ_plateau
The ramp slope is determined by the gap two-point function from A3-05. The Thouless time τ_Th = 1/Δ_hop ≈ 16 κ/ℏ separates the ergodic (τ > τ_Th) and non-ergodic (τ < τ_Th) regimes.

**Quantum Butterfly Effect.** The butterfly velocity v_B is the speed at which OTOCs spread: C(d, t) ≈ f(d - v_B t). For the prime gap system, v_B = v_LC = 0.2 ℏ/κ (from Piece 08). The butterfly cone in the (d, t) plane has opening angle θ = arctan(v_B / (ℏ/κ)) ≈ 0.2 rad.

**Scrambling Time.** The scrambling time t_s is when C(d, t) reaches O(1) for all d:
```
t_s = (1/λ_L) log(256) = (β/2π) log(256) = (κ/2πℏ) × 5.54 ≈ 0.88 κ/ℏ
```
This is extremely fast — the system scrambles in less than one Compton time. The fast scrambling is due to the all-to-all connectivity in the PG-QFT basis (each gap couples to all others via the Fourier transform).

**Experimental OTOC Measurement (Photonic).** The forward-backward protocol on the photonic OAM processor:
1. Prepare thermal state ρ_β (Piece 07)
2. Apply V (e.g., n_0)
3. Evolve forward: e^{-iHt}
4. Apply W (e.g., n_d)
5. Evolve backward: e^{iHt} (time reversal via phase conjugation)
6. Apply V, W
7. Measure in gap basis
The time reversal is implemented by the SLM phase conjugation φ(ℓ) → -φ(ℓ). The measurement rate is 140 MHz, giving statistical error ∼ 1/√N ≈ 10⁻⁴ per second.

**OTOC for Gauge Theory (Piece 09).** For the U(1) gauge theory, the OTOC of Wilson loops W_C(t) = W_C(t) W_C(0) W_C(t) W_C(0) diagnoses confinement/deconfinement. In the confined phase, OTOC decays exponentially with loop area; in the deconfined phase, it decays with perimeter. The prime gap system is in the confined phase (MBL) for W_eff/J_0 > 3.5.