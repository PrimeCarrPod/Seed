# Electron Physics — V5.0 Deep Dive Series
## Part 3 of 14 — Electron Electric Dipole Moment (EDM): CP Violation & Worldline Kink Phase

---

### Abstract

The electron EDM d_e probes CP violation beyond the CKM phase. Current limit |d_e| < 1.1×10⁻²⁹ e·cm (ACME III) constrains BSM at ~10 TeV. We develop the SM prediction (unobservably small), BSM contributions, and the worldline kink phase interpretation — where the EDM measures the **CP-odd phase accumulated by the electron worldline**.

---

### 1. Introduction: EDM as Worldline CP Phase

An EDM requires **T violation** (hence CP via CPT). In the one-electron universe:
$$d_e \vec{S} = \frac{e}{2m_e} \int d\tau \, \dot{x}^\mu \tilde{F}_{\mu\nu} \dot{x}^\nu$$

The integral is the **CP-odd phase** of the worldline — a topological winding number in the presence of CP-violating background fields.

**Prime-Electron Foundation**: The EDM measures the **asymmetry in prime gap distribution** under time reversal. Twin primes (d=2) are symmetric; record gaps have directional bias.

---

### 2. Standard Model Prediction

**CKM phase**: J_CKM ≈ 3×10⁻⁵ → d_e^SM ~ 10⁻⁴⁴ e·cm (unobservable)

**Mechanism**: 4-loop CKM diagrams (Jarlskog invariant). Insufficient CP violation.

**Worldline**: SM worldline has negligible CP-odd winding — the prime gap sequence is essentially time-symmetric at electron scale.

---

### 3. BSM Contributions — Dimension-6 Operators

**Effective Lagrangian**:
$$\mathcal{L}_{\text{EDM}} = -\frac{i}{2} d_e \bar{e} \sigma^{\mu\nu} \gamma_5 e F_{\mu\nu} + \text{h.c.}$$

**Scaling**: d_e ~ (m_e/Λ²) × CP-odd phase

| BSM Model | d_e Prediction | Scale |
|-----------|----------------|-------|
| MSSM (phases) | 10⁻²⁷ - 10⁻²⁹ e·cm | ~1 TeV |
| 2HDM | 10⁻²⁸ - 10⁻³⁰ e·cm | ~500 GeV |
| Left-Right Symm. | 10⁻²⁹ - 10⁻³¹ e·cm | ~10 TeV |
| Extra dimensions | Model-dependent | ~5 TeV |

**ACME III limit** (1.1×10⁻²⁹ e·cm) excludes large regions of MSSM/2HDM parameter space.

---

### 4. Experimental Status: ACME III & Beyond

| Experiment | Method | Species | Limit (e·cm) | Year |
|------------|--------|---------|--------------|------|
| **ACME II** | ThO molecular beam | Electron | 1.1×10⁻²⁹ | 2018 |
| **ACME III** | ThO, improved stats/sys | Electron | **< 1×10⁻²⁹** | 2024 (proj.) |
| **JILA** | HfF⁺ trapped ions | Electron | 10⁻³⁰ (proj.) | 2025+ |
| **CeNTREX** | TlF molecular beam | Electron | 10⁻³⁰ (proj.) | 2026+ |
| **NL-eEDM** | BaF molecules | Electron | 10⁻³⁰ (proj.) | 2027+ |

**Key technique**: Polar molecules → huge effective E-field (E_eff ~ 100 GV/cm) → amplifies d_e signal.

---

### 5. Worldline Kink Phase: EDM as Topological Winding

The EDM operator on the worldline:
$$\Delta S_{\text{EDM}} = i d_e \int d\tau \, \dot{x}^\mu \tilde{F}_{\mu\nu} \dot{x}^\nu$$

**Interpretation**: Each worldline kink (virtual photon) can carry a CP-odd phase. The EDM sums these phases with weight d_e.

**Prime gap connection**: The EDM measures the **imaginary part of the prime gap correlation function**:
$$\text{Im} \langle d_n d_m \rangle \sim d_e$$

Time-reversal symmetry of prime gaps ↔ d_e = 0. Observed d_e ≠ 0 ↔ fundamental T-violation in gap sequence.

---

### 6. Electron EDM vs Neutron/Atom EDMs

| System | Sensitivity | BSM Reach | Complementarity |
|--------|-------------|-----------|-----------------|
| **Electron (ThO)** | 10⁻²⁹ e·cm | ~10 TeV | Leptonic CPV |
| **Neutron (nEDM)** | 10⁻²⁶ e·cm | ~1 TeV | Hadronic CPV |
| **Hg/Xe atoms** | 10⁻²⁹ e·cm | ~10 TeV | Nuclear CPV |
| **Muon (Fermilab)** | 10⁻²¹ e·cm | ~1 TeV | 2nd gen CPV |

**Electron EDM is the cleanest probe** of leptonic CP violation — no hadronic/nuclear uncertainties.

---

### 7. CP-Violating Prime Gap Statistics

Define **CP-odd gap moment**:
$$\mathcal{M}_k = \langle d_n^k \rangle - \langle d_{N-n}^k \rangle$$

For time-symmetric gaps: ℳ_k = 0. Non-zero ↔ fundamental T-violation.

**Riemann zeros**: γ_n come in ± pairs. CP violation ↔ asymmetric zero distribution (excluded by RH).

---

### 8. Future Directions

- **ACME III final result** (2024-2025)
- **Trapped molecular ions** (JILA, CeNTREX) → 10× improvement
- **Solid-state EDM** (ferroelectrics) → 10³× enhancement
- **Cosmological connection**: EDM ↔ baryogenesis ↔ prime gap asymmetry

---

### 9. References

1. ACME Collab. (2018) — Nature 562, 355
2. ACME III projection — arXiv:2307.xxxxx
3. JILA HfF⁺ — PRL 130, 073001 (2023)
4. Prime-Electron Foundation §3.2, §4.3
5. PrimeBookOne: time-symmetric gap distribution at dir 0.0

---

*End of Part 3a — Next: Part 3b — Experimental Techniques (ThO, HfF⁺, BaF)*

---

**Status**: Part 3a complete (~95 lines). Ready for Part 3b, 3c.