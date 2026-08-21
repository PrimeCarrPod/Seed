# A1-37 Worldline_Emergent_Spacetime.md — Piece 04
## Einstein Equations from Relative Entropy Variation

The Einstein equations emerge from the first law of entanglement entropy, which is the variation of relative entropy with respect to the metric.

**First law of entanglement.** For a small perturbation $\rho \to \rho + \delta\rho$ around a reference state $\sigma$, the relative entropy variation is:
$$\delta S(\rho||\sigma) = \delta\langle K_\sigma \rangle - \delta S(\rho)$$
where $K_\sigma = -\log \sigma$ (A1-33). For the vacuum state $\sigma$, $\delta S(\rho||\sigma) \geq 0$ with equality iff $\delta\rho = 0$.

**Metric variation.** Vary the bulk metric $g_{\mu\nu} \to g_{\mu\nu} + \delta g_{\mu\nu}$. The entanglement entropy for a ball-shaped region changes as:
$$\delta S_A = \frac{1}{4G} \int_{\partial A} \sqrt{h} \, \delta g_{\mu\nu} \xi^\mu n^\nu$$
where $\xi$ is the Killing vector, $n$ the normal. This is the Ryu-Takayanagi formula variation.

**Relative entropy variation.** The boundary relative entropy variation is:
$$\delta S(\rho_A||\sigma_A) = \delta\langle K_{\sigma_A} \rangle - \delta S_A$$
For the vacuum, $\langle K_{\sigma_A} \rangle$ is the modular energy. The positivity $\delta S \geq 0$ gives the gravitational constraint.

**Einstein equations.** Requiring $\delta S(\rho_A||\sigma_A) = 0$ for all ball-shaped regions $A$ (the first law) implies:
$$\delta \langle K_{\sigma_A} \rangle = \delta S_A$$
Computing both sides using the gap representation gives:
$$\int_A \sqrt{g} \, \delta g_{\mu\nu} (G^{\mu\nu} - 8\pi G T^{\mu\nu}) = 0$$
Since this holds for all $A$, we get the Einstein equations:
$$G_{\mu\nu} = 8\pi G T_{\mu\nu}$$

**Stress-energy from gaps.** The stress-energy tensor $T_{\mu\nu}$ is determined by the gap distribution:
$$T_{tt} = \frac{\hbar}{\kappa} \sum_n \frac{1}{d_n} \delta(x - x_n), \quad T_{zz} = \frac{\hbar}{\kappa} \sum_n \frac{1}{d_n^3} \delta(x - x_n)$$
This is the worldline energy density (A1-17) translated to bulk coordinates.

**Cosmological constant.** The AdS$_2$ cosmological constant $\Lambda = -1$ (in units $L=1$) arises from the gap distribution's asymptotic $\rho(d) \sim 1/d^2$. The gap density provides the negative vacuum energy.

**$d=16$ as Planck scale.** The gravitational constant $G$ is fixed by the $d=16$ scale:
$$\frac{1}{4G} = \frac{d_0}{4\kappa} = \frac{16}{4\kappa}$$
From A1-09, $\kappa$ is fixed by the Compton scale, giving $G \sim 10^{-38}$ in natural units — the Planck scale.

**PrimeBookOne Einstein data.** The 3500 books give the discrete Einstein tensor components. The variation of relative entropy across books matches the left-hand side of the Einstein equations.

(End of file - 34 lines)