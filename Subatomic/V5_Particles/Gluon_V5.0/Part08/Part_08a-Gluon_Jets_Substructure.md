# Gluon Physics — V5.0 Deep Dive Series
## Part 8 of 14 — Gluon in Jets & Substructure: Gluon vs Quark Jets, Grooming, ML Tagging

---

### Abstract

Gluon jets vs quark jets. Jet substructure observables. Grooming (Soft Drop, trimming). Machine learning taggers. Gluon fragmentation function. Medium modification in QGP.

---

### 1. Gluon vs Quark Jets: Fundamental Differences

**Color factor**: C_A/C_F = 9/4 = 2.25 — gluons radiate more
**Multiplicity**: ⟨n⟩_g / ⟨n⟩_q → C_A/C_F at high p_T
**Width**: Gluon jets broader (ΔR_g > ΔR_q)
**Fragmentation**: D_g^h(z) softer than D_q^h(z)

**Gluon fraction**: 
- LHC 13 TeV: ~60% gluon jets at p_T=100 GeV
- Increases at lower p_T, forward rapidity

---

### 2. Jet Substructure Observables

| Observable | Definition | Gluon Sensitivity |
|------------|------------|-------------------|
| **Mass** | m_J² = (Σ p_i)² | m_g > m_q |
| **Width** | σ = √⟨ΔR²⟩ | σ_g > σ_q |
| **τ₂₁** | N-subjettiness ratio | τ₂₁^g > τ₂₁^q |
| **z_g** | Soft Drop z_g = min(p_T1,p_T2)/(p_T1+p_T2) | z_g^g < z_g^q |
| **Multiplicity** | N_ch, N_neutral | N_g > N_q |
| **E_ECF** | Energy-Energy Correlators | Different scaling |

---

### 3. Grooming: Removing Soft Contamination

**Soft Drop**: 
- Iterative declustering
- Condition: min(p_T1,p_T2)/(p_T1+p_T2) > z_cut (ΔR/R₀)^β
- **Result**: Groomed mass, z_g, μ_g

**Trimming**: Recluster with small R_sub, keep subjets > f_cut p_T

**PUPPI**: Particle-level weighting by pileup probability

---

### 4. Machine Learning Taggers (2024)

**ParticleNet**: Graph neural network on jet constituents
**DeepAK8**: CNN on jet images
**ParT**: Transformer on particle cloud

**Performance** (quark vs gluon at p_T=500 GeV):
- AUC: 0.85-0.90 (ParticleNet)
- ε_q = 50% → ε_g = 10-20% rejection

**Gluon tagging**: Critical for H→bb (gluon fusion), di-Higgs.

---

### 5. Gluon Fragmentation Function

**D_g^h(z,μ)**: Probability gluon → hadron h with fraction z

**NNLO extraction**: From e⁺e⁻, ep, pp data
**Scaling violations**: dD/dlnμ² = P_{gg} ⊗ D_g + P_{gq} ⊗ D_q

**Lattice** (2024): First moments ⟨z⟩_g, ⟨z²⟩_g

---

### 6. Medium Modification in QGP

**Jet quenching**: Gluon energy loss ΔE/E ~ α_s q̂ L²
**Medium-induced radiation**: BDMPS-Z spectrum
**Jet substructure in medium**:
- Groomed mass shift
- z_g modification (more symmetric splitting)
- Angular broadening

**Worldline**: Medium = worldline in background gluon field. Jet = worldline branching. Quenching = worldline energy transfer to medium.

---

### 7. References

1. Jet substructure reviews — Larkoski et al. (2017)
2. ML taggers — ParticleNet (2019), ParT (2022)
3. Medium jets — Mehtar-Tani et al. (2013)
4. Prime-Electron Foundation §4, §8
5. PrimeBookOne dir 1.0-2.0

---

*End of Part 8a — Next: Part 8b — Gluon Jet Tomography & EIC*

---

**Status**: Part 8a complete (~95 lines).