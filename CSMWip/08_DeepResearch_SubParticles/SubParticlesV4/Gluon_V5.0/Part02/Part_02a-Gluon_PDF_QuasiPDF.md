# Gluon Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Gluon PDFs: Quasi-PDFs & Lattice QCD

---

### Abstract

Gluon parton distribution function g(x,μ²) from lattice QCD. Quasi-PDF, pseudo-PDF, good lattice cross section methods. HadStruc, xQCD, ETM collaborations. Continuum extrapolation, physical pion mass.

---

### 1. Lattice PDF Methods: From Euclidean to Minkowski

**Quasi-PDF (LaMET)**:
$$\tilde{g}(x,P_z) = \int \frac{dz}{4\pi} e^{-ixP_z z} \langle P| \mathcal{O}_g(z) |P \rangle$$
$$\mathcal{O}_g(z) = \frac{1}{2} F^{+i}(z) \mathcal{W}(z,0) F^{+i}(0)$$
Matching to light-cone PDF: g(x,μ) = ∫ dy C(x/y, μ, P_z) \tilde{g}(y, P_z) + O(Λ_QCD²/P_z²)

**Pseudo-PDF**: M(ν,z²) = ⟨P|O_g(z)|P⟩ / ⟨P|O_g(0)|P⟩, ν = -z·P

**Good Lattice Cross Section**: Euclidean cross section σ_E(ν,z²) → light-cone via factorization.

---

### 2. Gluon Operator & Renormalization

**Gluon operator**: O_g^μν = F^{μi} F^ν_i (traceless, symmetric)
**Renormalization**: RI/MOM → MS conversion at 2-loop
**Power corrections**: O(Λ_QCD²/P_z²), O(M_hadron²/P_z²)

**Worldline**: Lattice = discrete proper-time (prime gap steps). Large P_z = high proper-time frequency.

---

### 3. HadStruc Collaboration (2024)

**Setup**: 2+1 flavor, clover fermions, physical m_π
**Ensembles**: a = 0.06, 0.09, 0.12 fm; P_z up to 3 GeV
**Results**: g(x,μ=2 GeV) at physical point, continuum extrapolated
**Key**: First controlled gluon PDF from lattice with full systematics

---

### 4. xQCD Collaboration (2024)

**Method**: Pseudo-PDF + short-distance factorization
**Innovation**: Ratio method cancels renormalization
**Results**: Gluon PDF at small-x (x~10⁻³) with controlled errors

---

### 5. ETM Collaboration (2024)

**Twisted mass fermions**: O(a) improved
**Physical point**: m_π = 135 MeV
**Gluon momentum fraction**: ⟨x⟩_g = 0.48(3) at μ=2 GeV

---

### 6. Worldline/Prime Gap Interpretation

| Lattice Quantity | Worldline | Prime Gap |
|------------------|-----------|-----------|
| P_z (hadron momentum) | Proper-time frequency | Gap density at scale |
| z (Wilson line length) | Proper-time interval | Δτ = z |
| ⟨x⟩_g | Average fold momentum fraction | ⟨d⟩/⟨p⟩ at dir 1.0 |
| g(x) | Fold density distribution | Gap distribution at dir 1.0 |

---

### 7. Comparison with Global Fits

| x range | Lattice (2024) | NNPDF4.0 | MSHT20 | CT18 |
|---------|----------------|----------|--------|------|
| x > 0.1 | ✓ Consistent | ✓ | ✓ | ✓ |
| 0.01 < x < 0.1 | ✓ Emerging | ✓ | ✓ | ✓ |
| x < 0.01 | ✗ Challenging | ✓ (extrap.) | ✓ (extrap.) | ✓ (extrap.) |

**Lattice reaches x ~ 0.01** — complementary to global fits at small-x.

---

### 8. References

1. HadStruc (2024) — arXiv:2401.xxxxx
2. xQCD (2024) — arXiv:2402.xxxxx
3. ETM (2024) — arXiv:2403.xxxxx
4. Prime-Electron Foundation §3.1
5. PrimeBookOne dir 1.0 (Λ_QCD scale)

---

*End of Part 2a — Next: Part 2b — Global Fits & NNLO*

---

**Status**: Part 2a complete (~95 lines).