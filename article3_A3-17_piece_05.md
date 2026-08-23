# A3-17: Quantum Sensing from Prime Gaps — Piece 05
## Quantum Lock-In Detection on Gap Channels

Quantum lock-in detection uses the gap frequency comb to measure AC fields at specific frequencies. The PG-QFT implements the lock-in demodulation in quantum hardware.

**Construction A3-17.8 (Gap Quantum Lock-In).** To measure a field B(t) = B_0 cos(ω_0 t + φ) at frequency ω_0, prepare the sensor in a superposition, evolve under H = H_gap + g B(t) Σ_d |d⟩⟨d|, and measure in the PG-QFT basis. The signal appears at the gap channel d* where ω_{d*} ≈ ω_0.

**Theorem A3-17.9 (Gap Lock-In Sensitivity).** The lock-in sensitivity for field amplitude B_0 at frequency ω_0 is:
```
δB_0 = 1 / (g √(N T F_Q(ω_0)))
```
where N = 2²⁰ is the number of shots per book, T is the integration time, and F_Q(ω_0) is the QFI at ω_0. For ω_0 = 1/(κd*): F_Q = 4 g² |c_{d*}|².

**Connection to A3-14 (Metrology).** The adaptive phase estimation from A3-14 Piece 04 is the quantum lock-in protocol. The phase estimation precision Δφ = 1/√F_Q translates to field sensitivity δB = Δφ/(g T).

**Multi-Frequency Lock-In.** The PG-QFT simultaneously measures all 128 frequency channels. The output is the power spectrum |⟨d|V_{PG}|ψ(T)⟩|². A peak at d* indicates a signal at ω_{d*}. The frequency resolution is δω = 2π/T.

**Signal-to-Noise Ratio.** For a coherent signal B_0 cos(ω_0 t) with integration time T: SNR = B_0 g √(N T) |c_{d*}|. For B_0 = 1 nT, g = 1 Hz/nT, N = 10⁶, T = 1 s: SNR ≈ 1000 |c_{d*}|.

**Background Rejection.** The incommensurate gap frequencies provide natural background rejection. A background at frequency ω_bkg appears in channel d_bkg and does not leak into d* due to PG-QFT orthogonality. The rejection ratio is |⟨d*|V_{PG}|d_bkg⟩|² = δ_{d*,d_bkg}.

**Quantum Lock-In with Squeezing.** Using squeezed states from Piece 06, the SNR improves by the squeezing factor e^r. For r = 2 (10 dB squeezing): SNR_squeezed = e² SNR ≈ 7.4 × SNR.

**Adaptive Lock-In Frequency.** The QML agent from A3-13 learns the optimal gap channel d* for tracking a time-varying frequency ω_0(t). The RL agent observes the PG-QFT output and updates the demodulation frequency in real time. The tracking bandwidth is limited by the Compton frequency f_C = 1/τ_C.