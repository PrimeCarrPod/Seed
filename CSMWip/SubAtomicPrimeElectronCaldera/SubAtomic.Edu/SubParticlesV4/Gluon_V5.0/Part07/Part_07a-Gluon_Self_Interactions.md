# Gluon Physics — V5.0 Deep Dive Series
## Part 7 of 14 — Gluon Self-Interactions: 3g/4g Vertices, Ghost Loops, BRST

---

### Abstract

Non-Abelian gluon self-interactions. 3-gluon and 4-gluon vertices. Ghost loops for unitarity. BRST symmetry. Slavnov-Taylor identities. Lattice gluon vertices.

---

### 1. Gluon Vertices in QCD Lagrangian

**3-gluon vertex**: 
$$V^{abc}_{μνρ}(p,q,r) = g_s f^{abc} [g_{μν}(p-q)_ρ + g_{νρ}(q-r)_μ + g_{ρμ}(r-p)_ν]$$

**4-gluon vertex**:
$$V^{abcd}_{μνρσ} = -i g_s² [f^{abe}f^{cde}(g_{μρ}g_{νσ}-g_{μσ}g_{νρ}) + \text{perms}]$$

**Color factors**: f^{abc} (structure constants), d^{abc} (symmetric)

---

### 2. Ghost Loops & Unitarity

**Faddeev-Popov ghosts**: Scalar fields c^a, c̄^a with wrong statistics

**Ghost-gluon vertex**: -g_s f^{abc} p_μ c^b A^{cμ} c̄^a

**Unitarity**: Ghost loops cancel unphysical gluon polarizations (longitudinal, timelike)

**BRST symmetry**: 
- s A^a_μ = D_μ c^a
- s c^a = -½ g_s f^{abc} c^b c^c
- s c̄^a = B^a (Nakanishi-Lautrup)
- s² = 0

---

### 3. Slavnov-Taylor Identities

**Gluon propagator**: D_{μν}(p) = -i [P_{μν} D(p²) + ξ p_μ p_ν/p⁴]

**Vertex identities**: 
- p^μ Γ_{μνρ}^{abc} = g_s f^{abc} [D^{-1}(q) - D^{-1}(r)]_{νρ} + ghost terms
- Ensure gauge invariance of S-matrix

**Background field gauge**: Preserves gauge invariance of effective action

---

### 4. Gluon Vertex Form Factors (Lattice 2024)

**3-gluon vertex**: 
$$\Gamma^{abc}_{μνρ}(p,q,r) = g_s f^{abc} [A(p²,q²,r²) V^{(1)}_{μνρ} + B(p²,q²,r²) V^{(2)}_{μνρ} + ...]$$

**Lattice results**: 
- A(p²) measured for symmetric (p=q=r) and asymmetric kinematics
- Zero crossing of A(p²) → dynamical mass generation
- B(p²) suppressed in Landau gauge

**4-gluon vertex**: First lattice extraction (2024)

---

### 5. Dynamical Gluon Mass

**Landau gauge**: Gluon propagator D(p²) finite at p²=0
**Mass scale**: m_g ~ 500-700 MeV
**Origin**: Non-perturbative 3-gluon vertex, ghost dressing

**Worldline**: Gluon mass = worldline self-interaction gap (kink intersection energy).

---

### 6. Pinch Technique & Background Field Method

**Pinch technique**: Rearranges Feynman diagrams → gauge-invariant vertices
**Background field gauge**: Γ_{μνρ}^{BFG} = gauge invariant at each loop

**Effective charge**: α_s(Q²) from gluon vertex — universal

---

### 7. Worldline Picture: 3g/4g Vertices as Kink Intersections

**3-gluon vertex**: 3 worldline folds meet → color exchange
**4-gluon vertex**: 4 worldline folds intersect → double color exchange
**Ghost loop**: Virtual worldline pair (quark-antiquark) screening color

**Color holonomy**: Wilson loop around vertex = SU(3) parallel transport

---

### 8. References

1. BRST — Weinberg Ch. 15
2. Slavnov-Taylor — Slavnov (1972), Taylor (1971)
3. Lattice vertices — Aguilar et al. (2024)
4. Pinch technique — Cornwall (1982), Binosi & Papavassiliou (2009)
5. Prime-Electron Foundation §4

---

*End of Part 7a — Next: Part 7b — Gluon Loop Corrections & β-Function*

---

**Status**: Part 7a complete (~95 lines).