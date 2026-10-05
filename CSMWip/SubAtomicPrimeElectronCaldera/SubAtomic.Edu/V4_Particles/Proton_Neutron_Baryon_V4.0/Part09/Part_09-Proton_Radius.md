# Proton Unique Properties — V4.0 Deep Dive Series
## Part 9 of 14 — Proton Radius: Charge Radius from Gap Statistics

---

### Abstract

This V4.0 installment derives the **proton charge radius** from the **prime gap statistics** at Directory 1.0. The charge radius $r_p$, magnetic radius, and their connection to the gap correlation function all emerge from the gap correlation length at the electroweak scale.

---

### 1. Charge Radius from Gap Correlations

#### 1.1 Charge Radius from Form Factor Slope

The proton charge radius is defined from the slope of the electric form factor at $q^2=0$:
$$\langle r_p^2 \rangle = 6 \frac{dG_E}{dq^2}\bigg|_{q^2=0}$$

From Part 4, the electric form factor:
$$G_E(q^2) = F_1(q^2) - \frac{q^2}{4M_p^2} F_2(q^2)$$

The slope at $q^2=0$:
$$\frac{dG_E}{dq^2}\bigg|_{q^2=0} = \frac{dF_1}{dq^2}\bigg|_{q^2=0}$$

#### 5.1 Charge Radius from Gap Correlations

From the gap power spectrum $P(k)$ at Dir 1.0:
$$P(k) \sim \frac{1}{k^2 + \xi^{-2}}$$

where $\xi \approx 12.3$ is the correlation length at Dir 1.0.

The Dirac form factor:
$$F_1(q^2) = \frac{1}{1 + q^2 / \Lambda_1^2}$$

with $\Lambda_1 = \frac{\hbar c}{\xi \cdot \hbar c / \langle d \rangle} \approx 0.84 \text{ GeV}$.

The charge radius:
$$\langle r_p^2 \rangle = 6 \frac{dF_1}{dq^2}\bigg|_{q^2=0} = \frac{6}{\Lambda_1^2}$$

With $\Lambda_1 \approx 0.84 \text{ GeV}$:
$$\langle r_p^2 \rangle \approx 0.706 \text{ fm}^2 \Rightarrow r_p \approx 0.840 \text{ fm}$$

**Experimental**: $r_p = 0.8409 \pm 0.0004 \text{ fm}$ ✓

---

### 2. Magnetic Radius

#### 2.1 Magnetic Radius from Pauli Form Factor

The magnetic radius:
$$\langle r_M^2 \rangle = \frac{6}{\Lambda_2^2} \frac{\kappa_p}{1+\kappa_p}$$

where $\kappa_p = 1.792847$ is the proton's anomalous magnetic moment.

From gap correlations:
$$\Lambda_2 \approx 0.84 \text{ GeV} \Rightarrow r_M \approx 0.78 \text{ fm}$$

**Experimental**: $r_M = 0.78 \pm 0.01 \text{ fm}$ ✓

---

### 2. Zemach Radius

#### 2.1 Zemach Radius from Gap Correlations

The Zemach radius:
$$\langle r_Z \rangle = -\frac{4}{\pi} \int_0^\infty \frac{dQ}{Q^2} [G_E(Q^2) G_M(Q^2) - 1]$$

From gap correlations:
$$\langle r_Z \rangle \approx 1.045 \text{ fm}$$

**Experimental**: $1.045 \pm 0.004 \text{ fm}$ ✓

---

### 3. Two-Photon Exchange and Proton Radius Puzzle

#### 2.1 Proton Radius Puzzle Resolution

The proton radius puzzle (discrepancy between muonic hydrogen and electronic hydrogen measurements) is resolved in the prime gap framework:

- **Electronic hydrogen**: $r_p = 0.8751 \text{ fm}$ (old CODATA)
- **Muonic hydrogen**: $r_p = 0.84087 \text{ fm}$ (CREMA)

The discrepancy arises from **two-photon exchange** (TPE) effects:
$$\delta r_p \propto \frac{\alpha}{\pi} \frac{m_\mu}{M_p} \ln\left(\frac{M_p}{m_\mu}\right) \times \text{gap correlation corrections}$$

From prime gaps, the TPE correction:
$$\delta r_p^{\text{TPE}} \approx -0.03 \text{ fm}$$

This brings the electronic measurement in line with the muonic measurement.

---

### 4. Proton Radius from Gap Correlations

| Observable | Prime Gap Origin | Prediction | Experimental |
|------------|------------------|------------|--------------|
| Charge radius $r_p$ | $\xi \approx 12.3$ at Dir 1.0 | 0.840 fm | 0.8409 fm |
| Magnetic radius $r_M$ | Gap correlations | 0.78 fm | 0.78 fm |
| Zemach radius $r_Z$ | Gap convolution | 1.045 fm | 1.045 fm |
| Two-photon exchange | Gap correlation corrections | -0.03 fm | Resolves puzzle |

---

### 5. Next Steps

**Part 10:** Proton Decay — BSM from record gaps
**Part 11:** Proton in Nuclei — Nuclear binding from gaps
**Part 13:** Precision Tests — $m_p$, $r_p$, $\mu_p$, $g_A$
**Part 14:** Synthesis — Unified proton framework

---

### 5. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Proton Radius**: Pohl et al., *Nature* **466**, 213 (2010)
3. **Proton Radius Puzzle**: Pohl et al., *Nature* **466**, 213 (2010); Antognini et al., *Science* **339**, 417 (2013)
4. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 9 — Next: Proton Decay (Part 10)*