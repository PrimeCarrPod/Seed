# Document 3: Thermodynamics of Joule Heating and Landauer Limit
## Piece 2: Szilard Engine and Maxwell's Demon in Computational Thermodynamics

---

### 3.2 Szilard Engine and Maxwell's Demon in Computational Thermodynamics

The Szilard engine provides a concrete physical model for the Landauer principle, demonstrating how information acquisition and erasure are thermodynamically coupled. Maxwell's demon, once a paradox, is now understood as an information-processing entity subject to the same thermodynamic laws.

#### 3.2.1 Szilard Engine: Single-Molecule Heat Engine

**Setup**:
- One molecule in a box of volume V
- Piston divides box into two halves (V/2 each)
- Thermal bath at temperature T

**Cycle**:
1. **Insertion**: Piston inserted at center (no work, molecule in one half)
2. **Measurement**: Demon measures which side molecule is in (1 bit gained)
3. **Expansion**: Piston moves isothermally to end, molecule pushes piston
   Work extracted: W = ∫ P dV = kT ln(2)
4. **Removal**: Piston removed, cycle complete

Net work per cycle: W = kT ln(2) extracted from heat bath
Apparent violation of Kelvin-Planck statement!

#### 3.2.2 Resolution: Demon's Memory Erasure

The demon's memory records the measurement outcome.
To complete cycle, memory must be reset for next measurement.
Reset (erasure) cost: Q_erase = kT ln(2) (Landauer)

Total cycle:
- Work extracted: +kT ln(2)
- Erasure cost: -kT ln(2)
- Net: 0 (Second Law satisfied)

**Key insight**: Information is physical. Measurement creates correlation; erasure breaks it, dissipating heat.

#### 3.2.3 Generalized Szilard Engine

**N molecules, M partitions**:
- Information gained: log₂(M) bits per molecule
- Work extracted: N kT ln(M)
- Erasure cost: N kT ln(M)
- Balance maintained

**Quantum Szilard Engine**:
- Molecule in superposition: (|L⟩ + |R⟩)/√2
- Measurement collapses state
- Quantum coherence provides no extra work
- Quantum discord can enhance work extraction

#### 3.2.4 Maxwell's Demon: Autonomous vs. Externally Controlled

**Autonomous demon** (no external control):
- Feedback mechanism built into Hamiltonian
- No external measurement/erasure needed
- Example: Molecular ratchet (Feynman-Smoluchowski)
- Still obeys Second Law on average

**Externally controlled demon**:
- Measurement apparatus + feedback controller
- Explicit erasure step required
- Landauer cost appears explicitly

#### 3.2.5 Information Thermodynamics: Second Laws with Feedback

**Generalized Second Law (Sagawa-Ueda)**:
⟨Σ⟩ ≥ -⟨I⟩

where Σ = ΔS - Q/T (entropy production), I = mutual information between system and demon.

For Szilard engine: ⟨I⟩ = ln(2), ⟨Σ⟩ = 0 → equality holds.

**Integral Fluctuation Theorem with Feedback**:
⟨e^{-Σ + I}⟩ = 1

**Detailed Fluctuation Theorem**:
P(Σ, I) / P(-Σ, -I) = e^{Σ - I}

#### 3.2.6 Feedback Control and Measurement Efficiency

**Imperfect measurement**:
- Error probability ε
- Mutual information: I = 1 - H(ε) < ln(2)
- Work extracted: W = kT I
- Erasure cost: kT ln(2) (must erase full bit)
- Net loss: kT (ln(2) - I) > 0

**Optimal measurement**:
For given measurement cost, optimize feedback policy
Bellman equation for optimal control with information

#### 3.2.7 Demon in Modern Computing

**Branch prediction** in CPUs:
- Predictor = demon
- Misprediction = measurement error
- Pipeline flush = erasure cost
- Energy per misprediction: ~100 pJ

**Cache prefetching**:
- Demon predicts future accesses
- Wrong prefetch wastes energy
- Information gain vs. energy cost trade-off

**Speculative execution**:
- Execute before condition resolved
- Rollback on wrong path = erasure
- Spectre/Meltdown: timing side channels = information leakage

#### 3.2.8 Autonomous Maxwell's Demon: Information Ratchets

**Flashing ratchet**:
- Potential V(x) switched on/off
- Asymmetric potential → directed motion
- Powered by non-equilibrium switching
- No explicit measurement

**Molecular motors (kinesin, myosin)**:
- Brownian ratchets
- ATP hydrolysis provides non-equilibrium
- Information encoded in conformational states
- Efficiency ~50% (near thermodynamic limit)

**Electronic ratchets**:
- Asymmetric quantum dots
- Time-dependent gate voltages
- Directed current without bias
- Applications in energy harvesting

#### 3.2.9 Quantum Maxwell's Demon

**Quantum measurement backaction**:
- Projective measurement disturbs state
- Feedback must account for backaction
- Quantum Zeno effect: frequent measurement freezes evolution

**Quantum feedback control**:
- Weak measurements + continuous feedback
- Stochastic master equation
- Optimal control: quantum filtering + HJB equation

**Entanglement-assisted demon**:
- Shared entanglement between demon and system
- Quantum discord enables work extraction beyond classical
- Quantum teleportation for remote feedback

#### 3.2.10 Computational Implications

**Reversible computing** (Bennett, 1973):
- Avoid erasure by keeping history
- Toffoli gate: universal reversible gate
- Bennett's trick: compute → copy result → uncompute
- Space-time trade-off: O(T) time → O(√T) space

**Physical reversible computers**:
- Adiabatic circuits: slow switching, recover energy
- Quantum computers: unitary evolution (reversible)
- Ballistic computing: no scattering loss

**Limit**: Error correction requires irreversibility
Shor's fault-tolerance: logical error rate → physical overhead
Landauer cost reappears in error correction

---

*End of Piece 2. Next: Piece 3 - Non-Equilibrium Green's Function (NEGF) for Heat Dissipation*