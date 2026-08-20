# Gluon Physics — V5.0 Deep Dive Series
## Part 6 of 14 — Gluon at Finite T/μ: QGP, Gluon Plasma, Lattice T>0

---

### Abstract

Gluons in quark-gluon plasma (QGP). Hard thermal loops (HTL), Debye screening, plasma instabilities. Lattice QCD at T>0. Heavy-ion collisions. Worldline at finite temperature.

---

### 1. Thermal QCD: HTL Effective Theory

**Matsubara frequencies**: ω_n = 2nπT (bosons)

**HTL self-energies** (resummed):
- Gluon Debye mass: m_D² = (N_c + N_f/2) g²T²/3
- Magnetic mass: m_mag ~ g²T (non-perturbative)
- Plasmon dispersion: ω² = k² + m_D² + ...

**HTL vertices**: 3-gluon, 4-gluon, ghost — gauge invariant resummation

---

### 2. QGP Thermodynamics (Lattice 2024)

**Pressure**: p/T⁴ = (N_c²-1)π²/45 + O(g²) — Stefan-Boltzmann limit

**Trace anomaly**: (ε-3p)/T⁴ — peak at T_c ~ 155 MeV

**Gluon condensate**: ⟨G²⟩_T = ⟨G²⟩_0 (1 - T⁴/T_c⁴) — melts at T_c

**Lattice (HotQCD, Wuppertal-Budapest)**: 
- Physical quark masses
- Continuum extrapolated
- T up to 500 MeV

---

### 3. Gluon Transport in QGP

**Shear viscosity**: η/s = 1/4π (AdS/CFT) ~ 0.1-0.2 (lattice)
**Bulk viscosity**: ζ/s peak at T_c
**Jet quenching**: q̂ = 1-2 GeV²/fm (RHIC), 2-4 GeV²/fm (LHC)
**Diffusion**: D = 1/(2πT) (strong coupling)

**Gluon dominance**: Gluons carry ~80% of energy density in QGP.

---

### 4. Plasma Instabilities

**Weibel instability**: Anisotropic momentum distribution → exponential growth of chromomagnetic fields

**Chromo-Weibel**: Soft gluon fields grow → isotropization

**Bottom-up thermalization**: 
1. Hard gluons (Q_s) → free stream
2. Soft gluons (gQ_s) → instabilities
3. Thermalization at τ ~ 1 fm/c

---

### 5. Heavy-Ion Collisions: Gluon Observables

| Observable | Gluon Sensitivity | Facility |
|------------|-------------------|----------|
| **R_AA (jet)** | q̂, energy loss | RHIC, LHC |
| **v₂(p_T)** | η/s, initial gluons | RHIC, LHC |
| **Direct photons** | T(t), gluon Compton | RHIC, LHC |
| **J/ψ suppression** | Debye screening, recombination | LHC, RHIC |
| **Jet substructure** | Splitting function in medium | LHC |

---

### 6. Worldline at Finite T: Periodic Proper-Time

**Imaginary time**: τ ∈ [0, β], β = 1/T
**Periodic boundary**: x(τ+β) = x(τ)
**Matsubara**: ω_n = 2nπT = 2πn/β

**Worldline**: Thermal worldline = closed loop in Euclidean time with circumference β.

**Prime-Electron**: Temperature = inverse proper-time periodicity. β = 1/T = worldline circumference.

---

### 7. References

1. HTL reviews — Blaizot & Iancu (2002)
2. Lattice QCD T>0 — HotQCD (2024), WB (2024)
3. Jet quenching — Majumder & Qin (2010)
4. Prime-Electron Foundation §6, §8
5. PrimeBookOne dir 1.0 (T ~ Λ_QCD)

---

*End of Part 6a — Next: Part 6b — Gluon Condensates & Phase Diagram*

---

**Status**: Part 6a complete (~95 lines).