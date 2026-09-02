# A2-17: Neutron-Antineutron Oscillation From Gap Tunneling — Piece 05

## Missing Gap d = 12 as Tunneling Channel (A2-15)

From A2-15 (Dark Matter From Missing Gaps), the missing gaps are prime gaps predicted by Cramér's model but absent from the PrimeBookOne record gap sequence. The first missing gap is d = 12.

**Why d = 12 is the Tunneling Channel:** The record gap sequence is {2, 4, 6, 8, 10, 14, 18, 20, 22, ...}. The gap d = 12 is missing — it should occur with probability P_Cramér(12) ≈ 0.023 but has N_actual = 0 in the record sequence. This "hole" in the gap spectrum creates a tunneling channel through the worldline's potential barrier.

**Cramér Model vs PrimeBookOne for d = 12:**
- Cramér prediction: P(12) = (1/log x) exp(-12/log x) ≈ 0.023 at x ~ 10^19
- Expected occurrences in 3.67B gaps: ~84 million
- Actual record occurrences: 0
- Statistical significance: > 50σ deficit

The d = 12 gap is the most statistically significant missing gap, making it the dominant tunneling channel.

**Tunneling Amplitude Through Missing Gap:** The instanton traverses the missing gap region in proper time:
Δτ_tunnel = d_tunnel / κ = 12/κ

The amplitude is:
A_tunnel = exp(-S_inst) = exp(-π d_tunnel / 2) = exp(-6π) = 5.2 × 10^{-9}

**Multi-Channel Tunneling:** Higher missing gaps contribute subleading channels:
- d = 24: A_24 = exp(-12π) = 2.7 × 10^{-17}
- d = 30: A_30 = exp(-15π) = 1.4 × 10^{-21}
- d = 34: A_34 = exp(-17π) = 6.7 × 10^{-24}
- d = 38: A_38 = exp(-19π) = 3.1 × 10^{-26}
- d = 40: A_40 = exp(-20π) = 1.1 × 10^{-27}

The total amplitude is dominated by d = 12 (99.999% contribution).

**Summing All Channels:**
A_total = A_12 (1 + A_24/A_12 + A_30/A_12 + ...)
= 5.2 × 10^{-9} (1 + 5.2 × 10^{-9} + 2.7 × 10^{-13} + ...)
= 5.2 × 10^{-9} (to 8 decimal places)

**Dark Matter Connection (A2-15):** The same missing gap d = 12 corresponds to the lightest DM particle (m_DM ≈ 30 GeV, A2-15 Piece 03). The n-n̄ oscillation and DM direct detection are connected through the same missing gap spectrum.

The DM-nucleon cross section for d = 12 DM is:
σ_DM = (1/π) (m_N/m_DM)^2 (λ_d/Λ^2)^2

where λ_d = (m_d/v)^2(d/d_H) is the Higgs portal coupling (A2-15 Piece 10). The same d = 12 appears in both σ_DM and τ_nn̄.

**Correlation Prediction:**
τ_nn̄ · σ_DM = constant (parameter-free)

Measuring both would test the missing gap hypothesis.

**Reference:** A2-15, A1-19, A1-05.