# W/Z Boson Physics — V5.0 Deep Dive Series
## Part 4 of 14 — W/Z Couplings: Fermionic, Gauge, $\kappa$ Framework, SMEFT

---

### Abstract

W/Z couplings to fermions and gauge bosons. $\kappa$ framework for coupling modifiers. SMEFT dimension-6 operators. Universal vs non-universal shifts. Global fits.

---

### 1. W/Z Fermionic Couplings

**Z couplings**: $g_V^f = T_3^f - 2Q_f \sin^2\theta_W$, $g_A^f = T_3^f$
**W couplings**: $g_L = g/\sqrt{2}$, $g_R = 0$ (SM)

**Coupling modifiers**: $\kappa_f = g_f/g_f^{\text{SM}}$
- $\kappa_\ell = 1.000 \pm 0.003$ (leptonic)
- $\kappa_u = 1.00 \pm 0.02$ (up-type)
- $\kappa_d = 1.00 \pm 0.02$ (down-type)

**Measurements**: 
- $Z \to \ell\ell$ → $\kappa_\ell$
- $Z \to b\bar{b}$ → $\kappa_b$
- $W \to \ell\nu$ → $\kappa_\ell$
- $W \to cs$ → $\kappa_c$

---

### 2. Gauge Couplings: $WWZ, WW\gamma, ZZZ, ZZ\gamma$

**Triple gauge**: $g_{WWZ}, g_{WW\gamma}, \kappa_\gamma, \kappa_Z, \lambda_\gamma, \lambda_Z$
**Quartic gauge**: $WWZZ, WWZ\gamma, WW\gamma\gamma, ZZZZ, ZZ\gamma\gamma$

**$\kappa$ framework**:
- $\kappa_{WWZ} = g_{WWZ}/g_{WWZ}^{\text{SM}}$
- $\kappa_{WW\gamma} = 1$ (EM gauge invariance)
- $\kappa_Z = 1.00 \pm 0.05$
- $\lambda_Z = 0.00 \pm 0.03$

---

### 3. $\kappa$ Framework Global Fit

**Parameters**: $\kappa_\ell, \kappa_u, \kappa_d, \kappa_\nu, \kappa_W, \kappa_Z, \kappa_\gamma, \kappa_g$
**Assumptions**: 
- Universal $\kappa_V$ for $W/Z$ gauge
- No BSM decays ($\Gamma_{\text{BSM}} = 0$)

**Current constraints** (ATLAS+CMS):
- $\kappa_V = 1.03 \pm 0.05$
- $\kappa_f = 1.00 \pm 0.07$
- $\kappa_\gamma = 1.10 \pm 0.07$

---

### 4. SMEFT: Dimension-6 Operators for Couplings

**Fermionic**:
- $\mathcal{O}_{Hq}^{(3)} = (\Phi^\dagger i \overleftrightarrow{D}_\mu^a \Phi)(\bar{q} \gamma^\mu \tau^a q)$ → $\delta g_L^q$
- $\mathcal{O}_{Hq} = (\Phi^\dagger i \overleftrightarrow{D}_\mu \Phi)(\bar{q} \gamma^\mu q)$ → $\delta g_R^q$
- $\mathcal{O}_{Hl}^{(3)} = (\Phi^\dagger i \overleftrightarrow{D}_\mu^a \Phi)(\bar{l} \gamma^\mu \tau^a l)$ → $\delta g_L^\ell$
- $\mathcal{O}_{Hl} = (\Phi^\dagger i \overleftrightarrow{D}_\mu \Phi)(\bar{l} \gamma^\mu l)$ → $\delta g_R^\ell$

**Gauge**:
- $\mathcal{O}_{HWB} = (\Phi^\dagger \tau^a \Phi) W^a_{\mu\nu} B^{\mu\nu}$ → $\delta g_{WWZ}, \delta \sin^2\theta_W$
- $\mathcal{O}_{WWW} = \text{Tr}[W_{\mu\nu} W^{\nu\rho} W_\rho^\mu]$ → $\lambda$
- $\mathcal{O}_{W} = (\Phi^\dagger \Phi) W^2$ → $\Delta \kappa$

---

### 5. Global SMEFT Fit for Couplings

**Data**: LEP/SLC EWPO + LHC diboson + Higgs + top
**Basis**: Warsaw (59 ops) or Higgs basis
**Results** (2024):
- $\Lambda > 1.5$ TeV for generic $c_i \sim 1$
- $Zb\bar{b}$: $\mathcal{O}_{Hq}^{(3)}$ constrained to $\Lambda > 2$ TeV
- $WWZ$: $\mathcal{O}_{HWB}$ constrained to $\Lambda > 3$ TeV

---

### 6. Worldline Picture: Couplings as EW Vertex Strengths

**$\kappa_f$** = EW vertex coupling to fermion folds
**$\kappa_V$** = EW vertex self-coupling
**SMEFT** = EW vertex effective action
**Flavor universality** = Identical fold-vertex strengths

---

### 7. References

1. SMEFT couplings — Brivio & Trott (2019)
2. $\kappa$ framework — ATLAS/CMS (2023)
3. Global fits — Ellis et al. (2024)
4. Prime-Electron Foundation §3, §4
5. PrimeBookOne dir 2.0

---

*End of Part 4a — Next: Part 4b — High Energy: VBF, $VV, Vh$*

---

**Status**: Part 4a complete (~95 lines).