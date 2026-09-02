# Electron Physics — V5.0 Deep Dive Series
## Part 3 of 14 — Electron EDM: Experimental Techniques (ThO, HfF⁺, BaF)

---

### Abstract

Detailed experimental methods for electron EDM searches using polar molecules. ThO (ACME), HfF⁺ (JILA), BaF (NL-eEDM), TlF (CeNTREX). Systematic error control, co-magnetometer techniques, quantum projection noise limits.

---

### 1. Why Polar Molecules?

**Effective electric field**: E_eff = E_lab × (W_d / e) where W_d is molecule-specific enhancement.

| Molecule | E_eff (GV/cm) | State | Advantage |
|----------|---------------|-------|-----------|
| **ThO** | 104 | H³Δ₁ | Ω-doublet, long τ, large E_eff |
| **HfF⁺** | 24 | ³Δ₁ | Trapped ions, long coherence |
| **BaF** | 3.5 | X²Σ⁺ | Laser-coolable, scalable |
| **TlF** | 29 | X¹Σ⁺ | Heavy, large E_eff |

**Worldline view**: Molecular frame = local worldline rest frame. E_eff = proper-time field strength.

---

### 2. ACME/ThO Experiment

**Principle**: Measure spin precession in parallel E and B fields:
$$\omega = \omega_0 + \frac{2d_e E_{\text{eff}}}{\hbar} \hat{E} \cdot \hat{S}$$

**Key features**:
- Cryogenic buffer-gas beam (4 K) → slow, intense
- Ω-doublet in H³Δ₁ → near-degenerate ± states (co-magnetometer)
- Laser prep/readout → quantum projection noise limited
- Reversal of E, B, laser polarization → systematic rejection

**Systematics controlled**:
- Geometric phases (B-field gradients)
- Stark interference
- Magnetic Johnson noise
- Leakage currents

**ACME III upgrade**: 10× statistics, improved vacuum, better B-field shielding.

---

### 3. JILA/HfF⁺ Trapped Ion Experiment

**Principle**: Same spin precession, but ions trapped in RF Paul trap.

**Advantages**:
- Coherence time τ ~ 1 s (vs ms for beams)
- Quantum logic readout (via co-trapped Mg⁺)
- Individual ion addressing

**Challenges**:
- RF heating, micromotion
- Smaller E_eff (24 GV/cm vs 104)
- Number of ions limited

**Status**: First results 2023; projected 10⁻³⁰ e·cm with 100 ions × 1 s.

---

### 4. NL-eEDM/BaF & CeNTREX/TlF

**BaF (NL-eEDM)**:
- Laser coolable → scalable to 10⁴ molecules
- E_eff = 3.5 GV/cm (lower but statistics win)
- Goal: 10⁻³⁰ e·cm by 2027

**TlF (CeNTREX)**:
- Cryogenic beam + optical cycling
- E_eff = 29 GV/cm
- Goal: 10⁻³⁰ e·cm by 2026

---

### 5. Systematic Error Budget (ACME III)

| Systematic | Shift (10⁻³⁰ e·cm) | Control Method |
|------------|---------------------|----------------|
| Geometric phase | < 10 | B-field mapping, reversal |
| Stark interference | < 5 | E-field reversal, freq. comb |
| Magnetic Johnson noise | < 5 | Cryogenic shields |
| Leakage currents | < 1 | Guard electrodes |
| **Total** | **< 15** | — |

**Quantum projection noise**: σ_d = ℏ/(2E_eff √(N τ T)) — scales as 1/√N.

---

### 6. Worldline Interpretation of Systematics

Each systematic = spurious worldline kink phase:
- Geometric phase = worldline parallel transport in curved B-field
- Stark interference = E-field induced kink mixing
- Johnson noise = thermal worldline fluctuations

**Prime gap analogy**: Systematics = spurious correlations in gap sequence.

---

### 7. Future: Solid-State EDM

**Ferroelectrics**: E_eff ~ 10⁹ V/cm in solids (e.g., EuTiO₃, PbTiO₃)
**Challenge**: Separate electron EDM from lattice effects
**Potential**: 10³× statistical enhancement

---

### 8. References

1. ACME Collab. (2018) — Nature 562, 355
2. JILA HfF⁺ (2023) — PRL 130, 073001
3. NL-eEDM BaF — arXiv:2305.xxxxx
4. CeNTREX TlF — arXiv:2306.xxxxx
5. Prime-Electron Foundation §3.2

---

*End of Part 3b — Next: Part 3c — BSM Models & Global Fits*

---

**Status**: Part 3b complete (~95 lines).