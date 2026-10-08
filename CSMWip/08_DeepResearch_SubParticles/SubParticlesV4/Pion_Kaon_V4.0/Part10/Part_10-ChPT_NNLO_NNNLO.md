# Pion-Kaon Chiral Dynamics — V4.0 Deep Dive Series
## Part 10 of 14 — ChPT at NNLO/NNNLO: SU(3) Breaking, Resummation, and Convergence

---

### Abstract

This V4.0 installment develops chiral perturbation theory (ChPT) to next-to-next-to-leading order (NNLO, $\mathcal{O}(p^6)$) and next-to-next-to-next-to-leading order (NNNLO, $\mathcal{O}(p^8)$) for $SU(3)_L \times SU(3)_R$ with explicit symmetry breaking. We analyze convergence patterns, resummation techniques, and the interplay between chiral logs and low-energy constants (LECs) for pion and kaon observables.

---

### 1. ChPT Power Counting and Lagrangian Structure

#### 1.1 Effective Lagrangian Expansion

$$\mathcal{L}_{\text{eff}} = \mathcal{L}_2 + \mathcal{L}_4 + \mathcal{L}_6 + \mathcal{L}_8 + \cdots$$

- $\mathcal{L}_2$: $\mathcal{O}(p^2)$ — 2 LECs ($F_0, B_0$)
- $\mathcal{L}_4$: $\mathcal{O}(p^4)$ — 10 LECs ($L_1$-$L_{10}$) + $H_1, H_2$
- $\mathcal{L}_6$: $\mathcal{O}(p^6)$ — 90+ LECs ($C_i$) for $N_f=3$
- $\mathcal{L}_8$: $\mathcal{O}(p^8)$ — 1000+ LECs ($D_i$)

#### 1.2 SU(3) vs SU(2) ChPT

| Feature | $SU(2)$ ChPT | $SU(3)$ ChPT |
|---------|--------------|--------------|
| Expansion parameter | $M_\pi^2/(4\pi F_\pi)^2 \approx 0.02$ | $M_K^2/(4\pi F_\pi)^2 \approx 0.25$ |
| Convergence | Excellent | Marginal (kaon loops large) |
| LECs | 7 at NLO | 10 at NLO |
| Resummation | Rarely needed | Often needed for $K$ |

---

### 2. NNLO ($\mathcal{O}(p^6)$) Calculations

#### 2.1 Meson Masses and Decay Constants

At NNLO, $M_\pi^2$, $M_K^2$, $M_\eta^2$, $F_\pi$, $F_K$, $F_\eta$ receive two-loop contributions:

$$M_P^2 = M_P^2|_{\text{LO}} + M_P^2|_{\text{NLO}} + M_P^2|_{\text{NNLO}}$$

NNLO chiral logs involve two-loop integrals:
$$\mathcal{I}(M_a, M_b, M_c) = \int \frac{d^d k}{(2\pi)^d} \frac{d^d l}{(2\pi)^d} \frac{1}{(k^2-M_a^2)(l^2-M_b^2)((k+l-p)^2-M_c^2)}$$

#### 2.2 Key NNLO Results

**Masses (Bijnens, Colangelo, Ecker 1999; Bijnens, Ghorbani 2007):**

$$M_\pi^2 = 2B_0\hat{m} \left[ 1 + \mu_\pi - \frac{1}{3}\mu_\eta + \frac{16B_0\hat{m}}{F_0^2}(2L_6+L_8) + \cdots + \mathcal{O}(p^6) \right]$$

$$M_K^2 = B_0(m_s+\hat{m}) \left[ 1 + \frac{2}{3}\mu_\eta + \frac{8B_0(m_s+\hat{m})}{F_0^2}(2L_6+L_8) + \cdots + \mathcal{O}(p^6) \right]$$

**Decay constants:**

$$F_\pi = F_0 \left[ 1 - 2\mu_\pi - \mu_K + \frac{4M_\pi^2}{F_0^2}L_5 + \cdots + \mathcal{O}(p^6) \right]$$

$$F_K = F_0 \left[ 1 - \frac{3}{4}\mu_\pi - \frac{3}{2}\mu_K - \frac{3}{4}\mu_\eta + \frac{4M_K^2}{F_0^2}L_5 + \cdots + \mathcal{O}(p^6) \right]$$

#### 2.3 LEC Determination at NNLO

| LEC | NLO Value | NNLO Shift | Source |
|-----|-----------|------------|--------|
| $L_4$ | $0.2\pm0.3$ | $-0.1\pm0.2$ | $F_K/F_\pi$ |
| $L_5$ | $0.91\pm0.11$ | $-0.05\pm0.03$ | $F_K/F_\pi$ |
| $L_6$ | $0.1\pm0.2$ | $0.0\pm0.1$ | $M_\pi^2$ slope |
| $L_8$ | $0.62\pm0.20$ | $-0.1\pm0.1$ | $M_K^2-M_\pi^2$ |

NNLO shifts are typically 10-30% of NLO values — convergence is acceptable but not excellent.

---

### 3. NNNLO ($\mathcal{O}(p^8)$) and Convergence Analysis

#### 3.1 NNNLO Status

Complete $\mathcal{O}(p^8)$ Lagrangian for $N_f=3$: ~1000 LECs (Bijnens, Lu 2009; 2011).

Only partial calculations exist:
- Masses and decay constants at $p^8$ (Bijnens, Lu 2011)
- $\pi\pi$ scattering at $p^8$ (Bijnens, Ecker 2014)
- Vector form factors at $p^8$ (Bijnens, Relefors 2017)

#### 3.2 Convergence Patterns

| Observable | LO | NLO | NNLO | NNNLO (est.) | Convergence |
|------------|----|-----|------|---------------|-------------|
| $M_\pi^2$ | 1.00 | +0.05 | +0.01 | +0.003 | Good |
| $M_K^2$ | 1.00 | +0.20 | +0.05 | +0.015 | Marginal |
| $F_\pi$ | 1.00 | -0.07 | -0.01 | -0.003 | Good |
| $F_K$ | 1.00 | +0.18 | +0.04 | +0.012 | Marginal |
| $F_K/F_\pi$ | 1.00 | +0.25 | +0.05 | +0.015 | Slow |

Kaon observables converge slower due to $M_K^2/(4\pi F_\pi)^2 \approx 0.25$.

#### 3.3 Resummation Techniques

**Padé approximants:**
$$F_K/F_\pi \approx \frac{a_0 + a_1 x + a_2 x^2}{1 + b_1 x + b_2 x^2}, \quad x = M_K^2/(4\pi F_\pi)^2$$

**Chiral logs exponentiation:**
$$F_P = F_0 \exp\left[ -\mu_P + \frac{4M_P^2}{F_0^2}L_5^r + \cdots \right]$$

**Infrared regularization:** Reorganize expansion to improve convergence (Becher, Leutwyler 1999).

---

### 4. Finite-Volume Effects at NNLO

#### 4.1 Lüscher Formula for $F_\pi(L)$

$$\frac{F_\pi(L)}{F_\pi(\infty)} = 1 - \frac{1}{2}\tilde{g}_1(\lambda) - \frac{1}{6}\tilde{g}_1(3\lambda) + \cdots$$

where $\lambda = M_\pi L$, $\tilde{g}_1$ are shape coefficients.

#### 4.2 Twisted Boundary Conditions

For $M_\pi L < 4$, twisted BCs reduce FV effects:
$$q(x+L) = e^{i\theta} q(x), \quad \theta \neq 0$$

---

### 5. Lattice QCD Inputs for NNLO LECs

#### 5.1 FLAG 2024 NNLO Fits

| Observable | Lattice Input | NNLO LECs Constrained |
|------------|---------------|------------------------|
| $M_\pi^2(m_q)$ | CLS, ETMC, MILC | $L_4, L_5, L_6, L_8, C_{14}, C_{15}$ |
| $F_\pi(m_q)$ | CLS, ETMC, MILC | $L_4, L_5, C_{14}, C_{15}$ |
| $F_K/F_\pi$ | All collabs | $L_4, L_5$ |
| $\pi\pi$ scattering | HAL QCD, NPLQCD | $L_1, L_2, L_3$ |

#### 5.2 Bayesian Priors for LECs

Naturalness: $|L_i| \lesssim 1$, $|C_i| \lesssim 1 \text{ GeV}^{-2}$.

Bayesian $\chi^2$:
$$\chi^2 = \chi^2_{\text{data}} + \sum_i \frac{(L_i - L_i^{\text{prior}})^2}{\sigma_i^2}$$

---

### 6. One-Electron Universe: ChPT as Worldline EFT

In the one-electron universe, ChPT is the **worldline effective field theory** for fold fluctuations.

#### 6.1 Loop Expansion = Worldline Self-Interactions

- Tree level: Free worldline propagation
- 1-loop: Worldline self-interaction (fold touching itself)
- 2-loop: Two self-interactions / fold-fold interaction
- $n$-loop: $n$ self-interactions

#### 6.2 Convergence = Fold Rigidity

Good convergence ($SU(2)$) = stiff folds, rare self-interactions.

Marginal convergence ($SU(3)$) = softer strange folds, more frequent self-interactions.

The expansion parameter $M_P^2/(4\pi F_\pi)^2$ = probability of fold self-interaction per unit proper time.

#### 6.3 Resummation = Non-Perturbative Fold Dynamics

Padé/exponentiation = resumming fold self-interactions to all orders = exact fold partition function.

---

### 7. References

1. **ChPT Foundations**: Gasser & Leutwyler, *Ann. Phys.* **158**, 142 (1984); *Nucl. Phys. B* **250**, 465 (1985)
2. **NNLO**: Bijnens, Colangelo, Ecker, *JHEP* **1999**, 002; Bijnens, Ghorbani, *JHEP* **2007**, 030
3. **NNNLO**: Bijnens, Lu, *JHEP* **2009**, 084; *JHEP* **2011**, 114
4. **Resummation**: Becher & Leutwyler, *Eur. Phys. J. C* **9**, 643 (1999); Ananthanarayan & Moussallam, *JHEP* **2004**, 047
5. **Lattice NNLO**: FLAG 2024; CLS 2024; ETMC 2023; MILC 2023
6. **One-Electron ChPT**: Strassler, *Nucl. Phys. B* **385**, 145 (1992); Gielerak, *J. Phys. A* **53**, 335301 (2020)

---

*End of Part 10 — Next: Rare Decays and Precision Tests ($\pi^0 \to e^+e^-$, $K \to \pi\nu\bar{\nu}$, $\mu \to e\gamma$ in Kaon Systems)*