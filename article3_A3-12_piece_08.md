# A3-12: Quantum Simulation from Prime Gaps — Piece 08
## Non-Equilibrium Dynamics and Quenches

The prime gap system exhibits rich non-equilibrium dynamics, including quantum quenches, prethermalization, and many-body localization transitions, all determined by the gap statistics.

**Definition A3-12.14 (Quantum Quench Protocol).** Prepare the ground state of H_i = H_gap(μ_i) + H_hop(J_i), then suddenly change parameters to H_f = H_gap(μ_f) + H_hop(J_f). The time evolution is |ψ(t)⟩ = e^{-iH_f t}|ψ(0)⟩.

**Theorem A3-12.15 (Quench Dynamics from Gap Statistics).** The Loschmidt amplitude L(t) = ⟨ψ(0)|e^{-iH_f t}|ψ(0)⟩ = Σ_k |⟨ψ(0)|k_f⟩|² e^{-iE_k^f t} where |k_f⟩ are H_f eigenstates. For the prime gap system, the overlap is:
```
|⟨ψ(0)|k_f⟩|² = |Σ_d √P_i(d) e^{2πi k d/256}|²
```
where P_i(d) is the initial gap distribution (e.g., ground state of H_i). The return probability P(t) = |L(t)|² shows damped oscillations with frequency determined by the gap in H_f.

**Prethermalization.** For small quenches (|μ_f - μ_i| ≪ μ_i, |J_f - J_i| ≪ J_i), the system prethermalizes to a Generalized Gibbs Ensemble (GGE) with conserved quantities given by the PG-QFT eigenvalues. The prethermalization time is t_pre ∼ 1/Δ_hop ≈ 16 κ/ℏ. The GGE density matrix is ρ_GGE = exp(-Σ_k λ_k I_k)/Z where I_k = c_k^† c_k are the occupation numbers in the PG-QFT basis.

**Many-Body Localization (MBL) Transition.** Adding disorder to the hopping J(d) → J(d) + W η_d with η_d ∈ [-1,1] random, the system undergoes an MBL transition at W_c ≈ J_0. The prime gap distribution P(d) provides a natural disorder potential: the site energies μ_d = ℏ/κd are deterministic but aperiodic. The MBL transition is at W_c/J_0 ≈ 3.5 for 1D. For the prime gap system, the effective disorder is W_eff = max(μ_d) - min(μ_d) ≈ ℏ/κ (1/2 - 1/254) ≈ 0.5 ℏ/κ. Since J_0 ≈ 0.1 ℏ/κ, W_eff/J_0 ≈ 5 > W_c, so the system is in the MBL phase.

**Connection to A3-06 (Decoherence).** The decoherence rate γ from A3-06 is the rate at which the system loses memory of its initial state. In the MBL phase, γ is exponentially suppressed: γ ∼ e^{-ξ_MBL} where ξ_MBL is the localization length. For the prime gap system, ξ_MBL ≈ 1/log(W/J_0) ≈ 1/log(5) ≈ 0.62 (in units of gap spacing). The decoherence time T₂ = 1/γ ≫ t_pre, so prethermalization is observable.

**Light-Cone Spreading.** The correlation function C(d, t) = ⟨n_d(t) n_0(0)⟩ - ⟨n_d⟩⟨n_0⟩ spreads with a light-cone velocity v_LC = max_k |∂E_k/∂k| = 2J_0 max_k |sin(2πk/256)| ≈ 2J_0. For J_0 = 0.1 ℏ/κ, v_LC = 0.2 ℏ/κ per gap spacing. The front reaches d = 100 at t ≈ 500 κ/ℏ.

**Experimental Quench on Photonic Processor.** The photonic OAM processor implements quenches by dynamically updating the SLM phase profile. The quench time is limited by SLM refresh rate (1 ms). For quenches faster than 1 ms, use the electro-optic modulator (EOM) in the MPLC (response time < 1 ns). The measurement protocol:
1. Prepare |ψ(0)⟩ via SLM + MPLC
2. Apply quench via EOM (sub-ns)
3. Evolve for time t via static MPLC
4. Measure via V_{PG} + photon counting
The maximum evolution time is limited by photon loss: t_max ≈ -ln(0.14) / γ_loss ≈ 2 ms (14% transmission). Sufficient for observing prethermalization but not MBL.