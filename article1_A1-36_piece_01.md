# A1-36 Worldline_Decoupling_Limits.md — Piece 01
## Introduction — Wilsonian RG from Prime Gap Scales

The Wilsonian renormalization group finds a rigorous realization in the prime electron worldline through the natural scale hierarchy of prime gaps. The gap $d_n = p_{n+1} - p_n$ acts as the RG scale parameter.

**Gap as RG scale.** Each prime gap $d_n$ defines an energy scale $E_n = \hbar/(\kappa d_n)$ via the worldline Hamiltonian (A1-17). Small gaps ($d < 16$) are UV scales; large gaps ($d > 16$) are IR scales. The gap $d=16$ is the self-dual point (A1-35, Piece 10) where UV and IR meet.

**Decoupling at $d=16$.** From A1-34 (Piece 07) and A1-35 (Piece 09), the relative entropy splits:
$$S(\rho||\sigma) = S(\rho_{\text{light}}||\sigma_{\text{light}}) + S(\rho_{\text{heavy}}||\sigma_{\text{heavy}})$$
where $\rho_{\text{light}}$ contains gaps $d < 16$, $\rho_{\text{heavy}}$ contains gaps $d > 16$. This is exact decoupling — no light-heavy cross terms.

**Light sector (UV).** Gaps $\{2, 4, 6, 8, 10, 12, 14\}$. High multiplicity $m_d \sim x/\log^2 x$ for small $d$. Dominates short-distance worldline physics. Hamiltonian:
$$H_{\text{light}} = \frac{\hbar}{\kappa} \sum_{d<16} \frac{1}{d} \sum_{n: d_n=d} |n\rangle\langle n|$$

**Heavy sector (IR).** Gaps $\{18, 20, 22, \dots\}$ including record gaps. Low multiplicity, includes the 78 BPS states (A1-28). Dominates long-distance physics and topology. Hamiltonian:
$$H_{\text{heavy}} = \frac{\hbar}{\kappa} \sum_{d>16} \frac{1}{d} \sum_{n: d_n=d} |n\rangle\langle n|$$

**BPS zero preservation.** The BPS relative entropy $S(\rho_{\text{BPS}}||\sigma_{\text{BPS}}) = 0$ (A1-34) is RG invariant. The BPS sector (record gaps $> 16$) sits entirely in the heavy theory and remains decoupled under RG flow.

**PrimeBookOne RG data.** The 3500 books provide the complete gap sequence to run the RG. Book index $b \in \{1,\dots,3500\}$ labels the RG scale $\mu_b \sim p_b$.

**No free parameters.** All couplings ($\kappa$, $\hbar$, gap multiplicities) are fixed by prime gap statistics. The RG flow is uniquely determined.

(End of file - 35 lines)