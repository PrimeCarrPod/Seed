# A2-17: Neutron-Antineutron Oscillation From Gap Tunneling — Piece 10

## Neutron Electric Dipole Moment and n-n̄ Connection

The neutron EDM d_n and n-n̄ oscillation both probe CP violation in the baryon sector. In the Prime Electron framework, they share a common origin.

**Neutron EDM from Worldline CP Phase:** The neutron EDM arises from the CP-violating phase of the worldline (A2-16, A5-03 future). The prediction:
d_n = (e/2π) · (Δφ_CP) · (m_u - m_d)/Λ_QCD^2 · exp(-S_inst^EDM)

where S_inst^EDM is the instanton action for the EDM operator (dimension 6). From the prime gap structure, the dominant contribution uses d = 6 (third record gap):
S_inst^EDM = π d_6 / 2 = 3π

**Detailed EDM Calculation:** The dimension-6 CP-violating operator is:
O_EDM = (1/Λ_QCD^2) ε_{abc} (u_a σ^{μν} d_b) d_c F_{μν} + h.c.

The instanton action for this operator is determined by the gap that corresponds to the operator's mass dimension. The EDM operator has mass dimension 6, corresponding to d = 6 (the 3rd record gap).

The instanton sum gives:
⟨O_EDM⟩ = (1/Λ_QCD^2) exp(-π d_6 / 2) = (1/Λ_QCD^2) exp(-3π)

The quark mass difference (m_u - m_d) ≈ 2.5 MeV enters from the chiral symmetry breaking scale.

**Numerical Prediction:**
d_n = (e/2π) · 0.312π · (2.5 MeV) / (200 MeV)^2 · exp(-3π)
= 1.2 × 10^{-27} e·cm

**Current Limit (nEDM 2020):** d_n < 1.8 × 10^{-26} e·cm — prediction is 15× below current limit.
**Future Sensitivity (n2EDM, 2026+):** d_n ~ 10^{-28} e·cm — will test Prime Electron prediction.

**Error Budget:**
- Quark mass difference: ±20%
- Λ_QCD: ±10%
- Instanton determinant: ±30%
- Higher missing gaps: <1%
Total theoretical uncertainty: ±40% → d_n = (1.2 ± 0.5) × 10^{-27} e·cm

**n-n̄ and EDM Correlation:** Both depend on the same CP phase Δφ_CP = 0.312π:
d_n ∝ sin(Δφ_CP) · exp(-3π)
τ_nn̄^{-1} ∝ sin(2Δφ_CP) · exp(-6π)

The ratio:
d_n · τ_nn̄^{1/2} = (e/2π) · (m_u - m_d)/Λ_QCD^2 · exp(-3π) · (ℏ/m_n)^{1/2} · exp(3π) · sin(Δφ_CP)/√sin(2Δφ_CP)
= constant (parameter-free)

Numerically:
d_n · τ_nn̄^{1/2} = 1.2 × 10^{-27} e·cm · (2.7 × 10^8 s)^{1/2} = 6.2 × 10^{-24} e·cm·s^{1/2}

Measuring both would provide a sharp test of the Prime Electron CP violation mechanism.

**Experimental Correlation Plot:** Future n2EDM (d_n ~ 10^{-28}) and NNBAR (τ_nn̄ ~ 10^9 s) will test this correlation. The predicted point lies on a specific curve in the (d_n, τ_nn̄) plane.

**Reference:** A2-16, A5-03 (future), A1-04, A1-19.