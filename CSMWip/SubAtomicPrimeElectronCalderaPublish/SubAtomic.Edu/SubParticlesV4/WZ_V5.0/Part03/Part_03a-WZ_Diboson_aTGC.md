# W/Z Boson Physics — V5.0 Deep Dive Series
## Part 3 of 14 — Diboson Production: $WW, WZ, ZZ$, aTGCs, EFT

---

### Abstract

Diboson production at LHC. $WW, WZ, ZZ$ cross sections. Anomalous triple gauge couplings (aTGCs). EFT dimension-6 operators. NNLO QCD + NLO EW. HL-LHC projections.

---

### 1. Diboson Production at LHC

| Process | $\sigma$ (13 TeV) | Key Features |
|---------|-------------------|--------------|
| $pp \to WW$ | $\sim 118$ pb | $q\bar{q} \to WW$, $gg \to WW$ (loop) |
| $pp \to WZ$ | $\sim 50$ pb | $q\bar{q} \to WZ$, $WZ \to 3\ell\nu$ |
| $pp \to ZZ$ | $\sim 17$ pb | $q\bar{q} \to ZZ$, $gg \to ZZ$ (box) |

**Channels**:
- $WW \to \ell\nu\ell\nu$ (clean, $p_T^{\text{miss}}$)
- $WZ \to 3\ell\nu$ (golden, low bkg)
- $ZZ \to 4\ell$ (golden, mass peak)
- $ZZ \to 2\ell 2\nu$ (invisible Z)

---

### 2. Anomalous Triple Gauge Couplings (aTGCs)

**Effective Lagrangian** (HISZ basis):
$$\mathcal{L}_{\text{aTGC}} = -i g_{WWZ} \left[ g_1^Z (W^+_{\mu\nu} W^{-\mu} Z^\nu) + \kappa_Z W^+_\mu W^-_\nu Z^{\mu\nu} + \frac{\lambda_Z}{m_W^2} W^+_{\rho\mu} W^{-\mu\nu} Z^\rho_\nu \right]$$
$$\mathcal{L}_{\text{aTGC}} = -i e \left[ g_1^\gamma (W^+_{\mu\nu} W^{-\mu} A^\nu) + \kappa_\gamma W^+_\mu W^-_\nu A^{\mu\nu} + \frac{\lambda_\gamma}{m_W^2} W^+_{\rho\mu} W^{-\mu\nu} A^\rho_\nu \right]$$

**SM values**: $g_1^Z = g_1^\gamma = 1$, $\kappa_Z = \kappa_\gamma = 1$, $\lambda_Z = \lambda_\gamma = 0$

**Parameters**:
- $g_1^Z$: $WWZ$ charge
- $\kappa_Z, \kappa_\gamma$: Magnetic dipole
- $\lambda_Z, \lambda_\gamma$: Electric quadrupole

---

### 3. Current Constraints (LHC Run 2)

| Parameter | ATLAS (13 TeV, 139 fb⁻¹) | CMS (13 TeV, 137 fb⁻¹) |
|-----------|--------------------------|------------------------|
| $\Delta g_1^Z$ | $0.000 \pm 0.030$ | $-0.016 \pm 0.035$ |
| $\Delta \kappa_\gamma$ | $0.00 \pm 0.04$ | $0.01 \pm 0.04$ |
| $\Delta \kappa_Z$ | $0.00 \pm 0.06$ | $0.03 \pm 0.06$ |
| $\lambda_\gamma$ | $0.00 \pm 0.02$ | $0.00 \pm 0.02$ |
| $\lambda_Z$ | $0.00 \pm 0.03$ | $0.00 \pm 0.03$ |

**SM consistent** at 95% CL.

---

### 4. EFT: Dimension-6 Operators for aTGCs

**Warsaw basis** (CP-even):
- $\mathcal{O}_{WWW} = \text{Tr}[W_{\mu\nu} W^{\nu\rho} W_\rho^\mu]$ → $\lambda_\gamma, \lambda_Z$
- $\mathcal{O}_{W} = (\Phi^\dagger \Phi) W_{\mu\nu}^a W^{a\mu\nu}$ → $\Delta \kappa_\gamma, \Delta \kappa_Z$
- $\mathcal{O}_{B} = (\Phi^\dagger \Phi) B_{\mu\nu} B^{\mu\nu}$ → $\Delta \kappa_\gamma$
- $\mathcal{O}_{WB} = (\Phi^\dagger \tau^a \Phi) W^a_{\mu\nu} B^{\mu\nu}$ → $\Delta g_1^Z$

**Matching**:
- $\lambda = \frac{c_{WWW} v^2}{\Lambda^2} \frac{m_W^2}{g^2}$
- $\Delta \kappa = \frac{c_W v^2}{\Lambda^2} \frac{m_W^2}{g^2}$

**Constraints**: $\Lambda > 1-2$ TeV for $c \sim 1$

---

### 5. NNLO QCD + NLO EW Predictions

**$WW$**: NNLO QCD (2024) + NLO EW → $\sigma = 118.7 \pm 2.5$ pb
**$WZ$**: NNLO QCD + NLO EW → $\sigma = 50.1 \pm 1.2$ pb
**$ZZ$**: NNLO QCD + NLO EW → $\sigma = 17.2 \pm 0.4$ pb

**Scale uncertainty**: $\sim 2-3\%$ (NNLO)
**PDF uncertainty**: $\sim 1-2\%$
**EW corrections**: $\sim -3\%$ to $-5\%$ at high $p_T$

---

### 5. Worldline Picture: Diboson as Vertex-Vertex Coupling

**$WW$** = Two charged EW vertices coupling
**$WZ$** = Charged + neutral EW vertex coupling
**$ZZ$** = Two neutral EW vertices coupling
**aTGCs** = EW vertex deformation parameters

---

### 6. References

1. ATLAS aTGC — EPJC 82, 1184 (2022)
2. CMS aTGC — JHEP 07, 048 (2023)
3. NNLO $WW$ — Grazzini et al. (2024)
4. Prime-Electron Foundation §3, §4
5. PrimeBookOne dir 2.0

---

*End of Part 3a — Next: Part 3b — Diboson Differential, VBF $VV$, High-$p_T$*

---

**Status**: Part 3a complete (~95 lines).