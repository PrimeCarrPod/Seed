# A2-20: Sterile Neutrinos From Missing Gaps — Piece 08

## Sterile Neutrinos and Neutrinoless Double Beta Decay

Neutrinoless double beta decay (0νββ) is a ΔL = 2 process that violates lepton number. In the Prime Electron framework, the missing gaps provide the Majorana mass insertion for 0νββ.

**0νββ Amplitude:**
The amplitude is:
A_0νββ = Σ_i (U_ei² m_i / p²)

where U_ei are PMNS matrix elements and m_i are neutrino masses.

With sterile neutrinos:
A_0νββ = Σ_{active} U_ei² m_i + Σ_{sterile} U_es² m_s

For active neutrinos (normal ordering):
m_1 ≈ 0, m_2 ≈ 8.6 meV, m_3 ≈ 50 meV
U_e2 ≈ sin(θ_12)cos(θ_13) ≈ 0.55
U_e3 ≈ sin(θ_13) ≈ 0.15
A_active ≈ (0.55)²(8.6 meV) + (0.15)²(50 meV) ≈ 2.6 + 1.1 = 3.7 meV

For sterile neutrinos:
m_s1 = 7.1 keV, U_es1 = sin(θ_s1) ≈ √(sin²(2θ)/4) ≈ 3.5 × 10⁻⁶
m_s2 = 14.2 keV, U_es2 ≈ 1.7 × 10⁻⁶
m_s3 = 17.8 keV, U_es3 ≈ 1.4 × 10⁻⁶

A_sterile = Σ U_es² m_s
= (3.5×10⁻⁶)²(7.1 keV) + (1.7×10⁻⁶)²(14.2 keV) + ...
= 8.7×10⁻¹¹ + 4.1×10⁻¹¹ + ... MeV
= 1.3×10⁻⁴ eV

Total amplitude: A_total = 3.7 meV + 0.00013 eV = 3.7 meV

The sterile contribution is negligible (10⁻⁵ relative to active).

**Effective Majorana Mass:**
m_ββ = |A_0νββ| = 3.7 meV (normal ordering)
For inverted ordering: m_ββ = 15-50 meV

**Experimental Limits:**
KamLAND-Zen (2023): m_ββ < 36-156 meV (90% CL)
nEXO (future): sensitivity ~ 10 meV
LEGEND-1000 (future): sensitivity ~ 5 meV

**Prime Electron Prediction:**
m_ββ = 3.7 meV (NO) or 15-50 meV (IO) — testable by nEXO/LEGEND.

**Sterile Neutrino Signature in 0νββ:**
The sterile neutrinos contribute a characteristic momentum dependence:
A_sterile(p) = Σ U_es² m_s / (p² + m_s²)

For p ~ 100 MeV (nuclear momentum): p² ≫ m_s²
A_sterile ~ Σ U_es² m_s³ / p⁴ — even more suppressed.

**Conclusion:** The missing gap sterile neutrinos do not significantly affect 0νββ. The signal is dominated by the active neutrino masses from gap asymmetry (A2-09). A measurement of m_ββ will test the active neutrino sector, not the sterile sector.

**Reference:** A2-09, A2-15, A5-03 (future), A5-09 (future).