# Graviton Physics — V5.0 Deep Dive Series
## Part 8 of 14 — Graviton Self-Interactions: Classical Non-Linearities, Memory, Tail Effects

---

### Abstract

Classical graviton self-interactions: post-Newtonian, gravitational wave memory (Christodoulou), tail effects, non-linear BH dynamics. Numerical relativity.

---

### 1. Post-Newtonian Self-Interactions

**PN metric**: 
$$g_{00} = -1 + 2U - 2U^2 + 4\Phi_1 + 4\Phi_2 + 2\Phi_3 + 6\Phi_4 + \dots$$
**Self-interaction terms**: $U^2, \Phi_i$ from non-linear Einstein equations
**3PN**: Known for point masses (Blanchet, Damour, Jaranowski)
**4PN**: Completed 2019 (Bernard et al.)

**Worldline**: PN = worldline self-interaction expansion in $v/c$.

---

### 2. Gravitational Wave Memory

**Christodoulou memory**: 
$$\Delta h_{ij}^{\text{mem}} = \frac{4}{r} \int d^2\Omega' \frac{n_i n_j - \frac{1}{2}\delta_{ij}}{1 - \mathbf{n}\cdot\mathbf{n}'} \frac{dE}{d\Omega'}$$
**Physical effect**: Permanent displacement of test masses after GW passes

**Sources**: 
- BH/BNS merger: $\Delta h \sim 10^{-22}$ (LIGO)
- Supernova: $\Delta h \sim 10^{-20}$ (future)
- Cosmic strings: Step function memory

**LISA**: Memory from MBHB mergers detectable

---

### 3. Tail Effects

**Tail**: GW scattered off background curvature (Schwarzschild)
**Tail integral**: 
$$h_{\text{tail}} \sim \int_{-\infty}^t dt' \ln(t-t') \ddot{h}(t')$$
**Hereditary**: Depends on entire past history
**PN order**: 1.5PN, 2.5PN, 3.5PN

**Self-force**: Tail part of gravitational self-force

---

### 4. Non-Linear BH Dynamics

**Ringdown overtones**: Non-linear mode coupling
**Horizon absorption**: BH absorbs GWs (tidal heating)
**Superradiance**: Rotating BH amplifies GWs
**Non-linear memory**: In numerical relativity waveforms

---

### 5. Numerical Relativity

**Methods**: BSSN, CCZ4, generalized harmonic
**Codes**: SpEC, Einstein Toolkit, NRPy+
**Waveforms**: Calibrated for LIGO (SEOBNR, IMRPhenom)
**Self-interactions**: Fully included in Einstein equations

---

### 6. Worldline Picture: Memory as Worldline Topology Change

**Memory** = worldline topology change (permanent displacement)
**Tail** = worldline self-interaction with past
**Non-linear** = worldline self-interaction at all orders

---

### 7. References

1. Christodoulou (1991) — Phys. Rev. Lett. 67, 1486
2. Blanchet — Living Rev. Rel. 17, 2 (2014)
3. NR waveforms — arXiv:2004.04766
4. Prime-Electron Foundation §4
5. PrimeBookOne dir 3.0

---

*End of Part 8b — Part 8 complete (8a-8b). Next: Part 9 — One-Electron Universe: Graviton Embedding*

---

**Status**: Part 8b complete (~90 lines). Part 8 complete.