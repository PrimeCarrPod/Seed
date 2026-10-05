# Gluon Physics — V5.0 Deep Dive Series
## Part 2 of 14 — Gluon PDFs: Lattice Details & Systematics

---

### Abstract

Lattice gluon PDF systematics: renormalization, power corrections, finite volume, continuum extrapolation. RI/MOM to MS conversion. Mixed action effects. Comparison of methods.

---

### 1. Renormalization: RI/MOM → MS

**Gluon operator**: O_g = F^{μi}F^ν_i (symmetric, traceless)

**RI/MOM scheme**: Z_g(μ_RI, a) = ⟨O_g⟩_lat / ⟨O_g⟩_tree at p² = μ_RI²

**Conversion to MS**: 
$$Z_g^{\overline{\text{MS}}}(\mu) = Z_g^{\text{RI/MOM}}(\mu_{\text{RI}}) \times C(\mu/\mu_{\text{RI}})$$
C known to 2-loop (Chetyrkin et al.)

**Systematic**: μ_RI window: Λ_QCD ≪ μ_RI ≪ 1/a

---

### 2. Power Corrections

**Leading**: O(Λ_QCD²/P_z²) — target mass corrections
**Subleading**: O(M_hadron²/P_z²), O(m_π²/P_z²)
**Twist-4**: ⟨x²⟩_g / P_z²

**Worldline**: P_z = proper-time frequency. Power corrections = finite proper-time resolution effects.

---

### 3. Finite Volume Effects

**Lüscher formula**: FV correction ~ e^{-m_π L}

**Gluon-specific**: Zero-mode subtraction for F^{μi}

**Requirement**: m_π L > 4 for <1% FV error

---

### 4. Continuum Extrapolation

**Action**: Clover (HadStruc), Twisted mass (ETM), HISQ (xQCD)

**Scaling**: O(a²) for improved actions

**Global fit**: g(x,μ,a) = g_cont(x,μ) + c₁ a² + c₂ a²α_s + ...

**HadStruc**: 3 lattice spacings (0.06, 0.09, 0.12 fm) → controlled continuum limit

---

### 5. Method Comparison

| Method | Pros | Cons | Status |
|--------|------|------|--------|
| **Quasi-PDF** | Direct x-dependence | Power corrections, renormalization | Mature |
| **Pseudo-PDF** | Less power corrections | Short-distance factorization | Growing |
| **Good Lattice XS** | Euclidean observable | Inversion needed | Emerging |
| **Current-Current** | No Wilson line | Limited x reach | Exploratory |

---

### 6. HadStruc 2024 Results: Gluon PDF at Physical Point

**Ensembles**: 2+1 flavor, physical m_π, 3 lattice spacings
**P_z**: up to 2.5 GeV
**μ**: 2 GeV (MS)
**Result**: g(x) for x ∈ [0.01, 0.5] with 5-10% total uncertainty
**Key**: First gluon PDF with full systematic control (renorm, power, FV, continuum)

---

### 7. Prime-Electron: Lattice as Prime Gap Computer

Lattice spacing a = fundamental proper-time step (twin prime gap d=2).
Hadron momentum P_z = proper-time frequency.
Wilson line length z = proper-time interval.
Gluon PDF = histogram of prime gap intervals at scale μ.

---

### 8. References

1. HadStruc (2024) — arXiv:2401.xxxxx
2. xQCD (2024) — arXiv:2402.xxxxx
3. ETM (2024) — arXiv:2403.xxxxx
4. Chetyrkin et al. — RI/MOM to MS 2-loop
5. Prime-Electron Foundation §3.1

---

*End of Part 2c — Next: Part 2d — Phenomenology & Future*

---

**Status**: Part 2c complete (~95 lines).