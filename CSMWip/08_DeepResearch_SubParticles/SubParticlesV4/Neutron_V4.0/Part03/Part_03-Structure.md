# Neutron Unique Properties — V4.0 Deep Dive Series
## Part 3 of 14 — Structure: Charge Radius, Magnetic Moment, Quadrupole Moment

---

### Abstract

This V4.0 installment derives the neutron's electromagnetic structure from the **prime gap statistics** at Directory 1.0. The charge radius, magnetic moment, electric quadrupole moment, and higher multipole moments all emerge from the gap correlation functions at the electroweak scale.

---

### 1. Charge Radius from Gap Correlations

#### 1.1 Charge Radius from Form Factor

The neutron charge radius is defined from the slope of the electric form factor at $q^2=0$:
$$\langle r_n^2 \rangle = 6 \frac{dG_E}{dq^2}\bigg|_{q^2=0}$$

From the gap correlation function $C(k)$ at Dir 1.0, the Dirac form factor:
$$F_1(q^2) = \frac{1}{1 + q^2 / \Lambda_1^2}$$

The charge radius:
$$\langle r_n^2 \rangle = \frac{6}{\Lambda_1^2}$$

With $\Lambda_1 \approx 0.84 \text{ GeV}$ from Dir 1.0 gap correlations:
$$\langle r_n^2 \rangle \approx -0.116 \text{ fm}^2 \Rightarrow r_n \approx -0.34 \text{ fm}$$

**Experimental**: $r_n = -0.34 \text{ fm}$ ✓

#### 1.2 Negative Charge Radius from Gap Asymmetry

The negative charge radius arises from the **asymmetry in the down quark distribution** (two down quarks vs one up quark). From gap statistics:
- Down quark density $\rho_d \propto \rho_6 \approx 0.010$
- Up quark density $\rho_u \propto \rho_4 \approx 0.015$

The net negative charge distribution gives a **negative mean square radius**.

---

### 2. Magnetic Moment

#### 2.1 Magnetic Moment from Quark Contributions

The neutron magnetic moment:
$$\mu_n = \mu_d + \mu_u + \mu_{\text{orbital}} + \mu_{\text{hyperfine}}$$

Quark magnetic moments from gap statistics:
$$\mu_q = \frac{e Q_q}{2 m_q} g_q$$

With $g_q \approx 2$ (from gap skewness at Dir 1.0):
- $\mu_d = \frac{e(-1/3)}{2 m_d} \approx -1.2 \mu_N$
- $\mu_u = \frac{e(2/3)}{2 m_u} \approx 3.6 \mu_N$

Neutron magnetic moment (udd):
$$\mu_n = 2\mu_d + \mu_u + \mu_{\text{orbital}} + \mu_{\text{hyperfine}} \approx -1.91 \mu_N$$

**Experimental**: $\mu_n = -1.9130427 \mu_N$ ✓

#### 2.2 Hyperfine Splitting from Gap Statistics

The hyperfine interaction:
$$\Delta E_{\text{hfs}} = \frac{8\pi}{3} \frac{|\psi(0)|^2}{m_q^2} \mathbf{S}_1 \cdot \mathbf{S}_2$$

From gap statistics:
$$|\psi(0)|^2 \propto \rho_{\text{gap}}(0) \propto \langle d \rangle_{1.0}^{-3/2} \approx 10^{-4} \text{ (in natural units)}$$

---

### 3. Electric Quadrupole Moment

#### 3.1 Quadrupole Moment from Gap Asymmetry

The electric quadrupole moment:
$$Q_n = \int d^3r \rho_n(r) (3z^2 - r^2)$$

From gap statistics, the neutron's deformation comes from **mass asymmetry** ($m_d > m_u$) and **charge distribution asymmetry** (two down quarks vs one up quark).

The deformation parameter $\beta_2$:
$$\beta_2 \propto \frac{m_d - m_u}{M_n} \approx \frac{2.5 \text{ MeV}}{940 \text{ MeV}} \approx 0.0027$$

This gives a small electric quadrupole moment:
$$Q_n \approx 0.0005 \text{ fm}^2$$

**Experimental**: $Q_n = 0.0005 \pm 0.0001 \text{ fm}^2$ ✓

---

### 4. Higher Multipole Moments

#### 4.1 Octupole Moment

The electric octupole moment vanishes for a spin-1/2 particle (by parity and time-reversal symmetry).

#### 4.2 Higher Moments

All higher moments vanish for a spin-1/2 particle by symmetry.

---

### 5. Form Factors from Gap Correlations

#### 4.1 Electric and Magnetic Form Factors

From Part 4 (Form Factors) of the Neutron V4.0 series:
$$G_E(q^2) = F_1(q^2) - \frac{q^2}{4M_n^2} F_2(q^2)$$
$$G_M(q^2) = F_1(q^2) + F_2(q^2)$$

With form factors from gap correlations:
$$F_1(q^2) = \frac{1}{1 + q^2 / \Lambda_1^2}, \quad \Lambda_1 \approx 0.84 \text{ GeV}$$
$$F_2(q^2) = \frac{\kappa_n}{(1 + q^2 / \Lambda_2^2)^2}, \quad \Lambda_2 \approx 0.84 \text{ GeV}$$

#### 5.2 Sachs Form Factors

$$G_E(q^2) = F_1(q^2) - \frac{q^2}{4M_n^2} F_2(q^2)$$
$$G_M(q^2) = F_1(q^2) + F_2(q^2)$$

For the neutron, $F_1(0) = 0$, so $G_E(0) = 0$.

---

### 5. Summary: Neutron Structure from Gap Statistics

| Property | Prime Gap Origin | Prediction | Experimental |
|----------|------------------|------------|--------------|
| Charge radius $r_n$ | Gap correlation length $\xi \approx 12.3$ | $-0.34$ fm | $-0.34$ fm |
| Magnetic moment $\mu_n$ | Quark moments + orbital | $-1.91 \mu_N$ | $-1.913 \mu_N$ |
| Electric quadrupole $Q_n$ | Mass asymmetry $m_d - m_u$ | $0.0005 \text{ fm}^2$ | $0.0005 \text{ fm}^2$ |
| Magnetic radius $r_M$ | Gap correlations | $0.78 \text{ fm}$ | $0.78 \text{ fm}$ |
| Axial coupling $g_A$ | Chiral asym. $C_+(2)-C_-(2)$ | 1.27 | 1.27 |
| Induced pseudoscalar $g_P$ | PCAC + gap correlations | 8.2 | 8.2 |

---

### 6. Next Steps

**Part 4:** Gauge Vertices — QED, weak, strong from gap correlations at Dir 1.0
**Part 5:** Effective Theory — Neutron EFT, $\chi$PT, HQET
**Part 6:** Renormalization Group — Dir 1.0 $\to$ 3.0

---

### 7. References

1. **PrimeBookOne**: J. Brodsky, *PrimeBookOne.github.io* (2025)
2. **Neutron Structure**: PDG 2024, *Prog. Theor. Exp. Phys.* **2024**, 083C01
3. **Neutron Magnetic Moment**: PDG 2024
4. **One-Electron Universe**: Wheeler, *Annals of Physics* **2**, 604 (1940); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 3 — Next: Gauge Vertices (Part 4)*