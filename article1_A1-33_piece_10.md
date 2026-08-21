# A1-33 Worldline_Modular_Hamiltonian.md — Piece 10
## Modular Hamiltonian and Wall Crossing — Phase Transitions in Modular Flow

Wall crossing (A1-29) induces phase transitions in the modular Hamiltonian spectrum.

**Wall crossing and modular Hamiltonian jump.** At a wall, the BPS count changes by $\Delta N_{\text{BPS}}$. The modular Hamiltonian jumps by:
$$\Delta K = (\log N_{\text{BPS}}^+ - \log N_{\text{BPS}}^-) \cdot P_{\text{BPS}}$$
where $P_{\text{BPS}}$ is the projector onto the BPS sector.

**Modular energy level crossing.** The zero modular energies of the BPS sector cross with non-BPS levels at the wall. The modular spectrum develops a degeneracy at the critical point. The level crossing is protected by the index theorem.

**Critical modular Hamiltonian.** At the wall, the modular Hamiltonian is non-analytic. The modular flow develops a singularity:
$$\alpha_s^{\text{wall}} = e^{i s K^{\text{wall}}} \cdot e^{-i s K^{\text{wall}}}$$
The modular specific heat $C_{\text{mod}}(n)$ diverges at the wall (A1-32 piece 05). The modular susceptibility $\chi_{\text{mod}} = \partial \langle K \rangle / \partial \beta$ diverges.

**Physical chamber: smooth modular flow.** In the physical chamber (no wall crossing, RH true), the modular Hamiltonian is analytic in the book index $b$. The modular flow is smooth:
$$\frac{d}{db} K_A(b) = \text{finite}$$
$$\frac{d}{db} S_n(b) = \text{finite for all } n$$

**Modular order parameter.** The modular energy gap $\Delta \epsilon = \min \epsilon_{\text{non-BPS}}$ serves as an order parameter:
- $\Delta \epsilon > 0$: Physical chamber (gapped, smooth flow)
- $\Delta \epsilon = 0$: Wall (gapless, singular flow)

**Wall crossing as modular catastrophe.** The wall crossing formula for the modular Hamiltonian is:
$$K_+ = U K_- U^\dagger + \Delta K$$
where $U$ is the wall crossing operator (Kontsevich-Soibelman symplectomorphism). The modular flow undergoes a discontinuous change.

**PrimeBookOne wall scan via modular spectrum.** Scanning the 3500 books for modular energy gap $\Delta \epsilon(b)$: physical chamber shows $\Delta \epsilon(b) > 0$ constant; walls would show $\Delta \epsilon(b_c) = 0$ at critical books $b_c$.