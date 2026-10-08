# Electron Physics — V5.0 Deep Dive Series
## Part 11 of 14 — Electron in Condensed Matter: Quasiparticles, Dirac/Weyl Semimetals

---

### Abstract

Electron in materials: quasiparticles, effective mass, Dirac/Weyl semimetals, topological insulators. Effective worldline in crystal lattice. Emergent gauge fields from band structure.

---

### 1. Landau Fermi Liquid Theory

**Quasiparticle**: Electron + screening cloud
**Effective mass**: m* = m_e (1 + F₁ˢ/3)
**Lifetime**: τ ∝ 1/(T²) or 1/(ω²)
**Residue**: Z = (1 - ∂ReΣ/∂ω)⁻¹ < 1

**Worldline**: Quasiparticle = worldline dressed by lattice interactions.

---

### 2. Dirac & Weyl Semimetals

**Dirac semimetal**: Na₃Bi, Cd₃As₂ — 3D Dirac points (4-fold degenerate)
**Weyl semimetal**: TaAs, NbP — Weyl nodes (2-fold, chiral)
**Hamiltonian**: H = v_F σ·k (Dirac) or H = χ v_F σ·k (Weyl, χ=±1 chirality)

**Emergent Lorentz symmetry**: Low-energy electrons = relativistic Dirac/Weyl fermions
**Chiral anomaly**: ∂_μ j₅^μ = (e²/2π²) E·B (Weyl)

**Worldline in crystal**: Effective metric g_μν from band structure. Worldline follows geodesics in momentum space.

---

### 3. Topological Insulators

**2D TI (Quantum Spin Hall)**: HgTe/CdTe, WTe₂ — helical edge states
**3D TI**: Bi₂Se₃, Bi₂Te₃ — surface Dirac cone
**Surface state**: Single Dirac cone (spin-momentum locked)

**Worldline**: Edge/surface worldline = boundary mode of bulk topological invariant.

---

### 4. Fractional Quantum Hall Effect

**ν = 1/3, 2/5, 5/2...**: Fractional filling
**Anyons**: Quasiparticles with fractional charge e/3, statistics θ = π/3
**Non-abelian** (ν=5/2): Majorana zero modes

**Worldline**: Anyon worldlines = braided trajectories in 2D. Topological quantum computation.

---

### 5. Electron-Phonon & Electron-Electron Interactions

**Eliashberg theory**: Strong coupling superconductivity
**BCS**: Cooper pairs = worldline pairs with attractive interaction
**High-T_c**: Cuprates, FeSC — non-Fermi liquid, strange metal

**Prime-Electron**: Lattice phonons = periodic prime gap modulation.

---

### 6. Effective Worldline in Condensed Matter

**Crystal momentum**: k = canonical momentum
**Band structure**: E_n(k) = effective dispersion
**Berry curvature**: Ω(k) = ∇_k × A(k), A = i⟨u|∇_k|u⟩

**Semiclassical equations**:
$$\dot{r} = ∂_k ε(k) - \dot{k} × Ω(k)$$
$$\dot{k} = -e(E + \dot{r} × B)$$

**Worldline**: Modified by Berry curvature (anomalous velocity).

---

### 7. Experimental Probes

| Probe | Measures | Resolution |
|-------|----------|------------|
| **ARPES** | E(k), Berry curvature | ~meV, ~0.01 Å⁻¹ |
| **STM/STS** | LDOS, quasiparticle interference | ~μeV, atomic |
| **Quantum oscillations** | Fermi surface, m* | ~0.1% |
| **THz spectroscopy** | σ(ω), Drude weight | ~meV |
| **Thermal transport** | κ/T, Wiedemann-Franz | ~mK |

---

### 8. References

1. Hasan & Kane (2010) — RMP 82, 3045
2. Armitage et al. (2018) — RMP 90, 015001
3. Prime-Electron Foundation §6.2, §4.1
4. PrimeBookOne: effective gap statistics in periodic potential

---

*End of Part 11a — Next: Part 12 — Precision Tests & Future Facilities*

---

**Status**: Part 11a complete (~95 lines).