# Electron Physics — V5.0 Deep Dive Series
## Part 6 of 14 — Electron Self-Energy & Radiative Corrections: Mass Renormalization, UV/IR

---

### Abstract

Electron self-energy Σ(p) = mass renormalization + form factors. UV divergences, IR divergences, on-shell renormalization. Prime gap distribution ↔ self-energy spectral function.

---

### 1. Electron Self-Energy Σ(p)

**Definition**: Full propagator S(p) = i/(p̸ - m₀ - Σ(p) + iε)

**Decomposition**: Σ(p) = A(p²) p̸ - B(p²) m₀

**On-shell renormalization**:
- m_phys = m₀ + B(m²)
- Z₂ = 1 - A(m²) (wavefunction renormalization)

**UV divergence**: Σ(p) ~ (α/4π) p̸ (1/ε_UV) + finite

---

### 2. Mass Renormalization & Prime Gaps

**Bare mass m₀** → **Physical mass m_phys** via self-energy

**Prime-Electron Foundation**: m_e ∝ 1/⟨d⟩ where ⟨d⟩ = average prime gap at electron scale (directory 0.0). The "multiply by two" rule → m_e = ℏ/(2τ₀) with τ₀ from twin prime density.

**Mass counterterm**: δm = m_phys - m₀ = -Σ(m_phys)

**Worldline**: Self-energy = sum over all worldline kinks (self-interactions). Each kink contributes to mass shift.

---

### 3. Vertex Function & Form Factors

**Γ^μ(p', p) = F₁(q²) γ^μ + (iσ^μν q_ν/2m) F₂(q²)**

- F₁(0) = 1 (charge renormalization, Ward identity)
- F₂(0) = a_e = (g-2)/2 (anomalous magnetic moment)

**Form factors**: F₁(q²), F₂(q²) — measured in e⁻e⁻ scattering.

---

### 4. IR Divergences & Bloch-Nordsieck

**Soft photon emission**: IR divergence in Σ(p) and vertex
**Cancellation**: Real emission + virtual correction = IR finite
**Exponentiation**: Soft photons exponentiate → Sudakov form factor

**Worldline**: IR photons = long-wavelength worldline fluctuations (large Δτ).

---

### 5. Spectral Function & Prime Gap Density

**Källén-Lehmann**: S(p) = ∫ dμ² ρ(μ²) i/(p̸ - μ + iε)

**Spectral density ρ(μ²)** ↔ **Prime gap distribution** at scale μ

**Dir 0.0 gaps** → ρ(μ²) at μ ~ m_e
**Dir 0.1 gaps** → ρ(μ²) at μ ~ m_μ
**Dir 1.0 gaps** → ρ(μ²) at μ ~ 1 GeV

---

### 6. Radiative Corrections to Scattering

**e⁻μ⁻ → e⁻μ⁻** (Møller): δ_RC = α/π (log terms) + ...
**e⁻e⁺ → e⁻e⁺** (Bhabha): LEP luminosity monitor

**Worldline**: Scattering = worldline interaction vertex with momentum transfer.

---

### 7. Lattice QED: Non-perturbative Self-Energy

**Method**: QED on lattice, compute electron propagator
**Results**: m_phys/m_bare, Z₂, Σ(p) non-perturbatively

**Prime-Electron**: Lattice = discrete proper-time (prime gap steps).

---

### 8. References

1. Peskin & Schroeder Ch. 6, 7
2. Itzykson & Zuber Ch. 6
3. Prime-Electron Foundation §3.1, §3.2, §4.1
4. PrimeBookOne directories 0.0-3.0

---

*End of Part 6a — Next: Part 7 — Electron Scattering & Form Factors*

---

**Status**: Part 6a complete (~90 lines).