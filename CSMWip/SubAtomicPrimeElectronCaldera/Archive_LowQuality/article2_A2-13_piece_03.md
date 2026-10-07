# A2-13: Lepton Flavor Universality Proof — Piece 03

## Hypercharge Assignments from Worldline Orientation

The hypercharge Y is determined by the worldline's orientation in the SU(2)_L × U(1)_Y gauge space. From A1-03 (Double Cover SU(2) Spin): the "multiply by two" operation that gives spin-1/2 from the double cover SU(2) → SO(3) is mirrored in the electroweak sector.

The left-handed lepton doublet L_L = (ν_L, e_L)^T has hypercharge Y = -1. The right-handed singlet e_R has Y = -2. The right-handed neutrino ν_R (if it exists) has Y = 0.

**Key Insight:** These assignments are fixed by the worldline's topological charge under the electroweak gauge group. The worldline carries a single U(1)_EM charge q = -1. Under the embedding U(1)_EM ⊂ SU(2)_L × U(1)_Y:

q = T_3 + Y/2

For the left-handed components: T_3(ν_L) = +1/2, T_3(e_L) = -1/2. With Y = -1:
- q(ν_L) = +1/2 + (-1)/2 = 0 ✓
- q(e_L) = -1/2 + (-1)/2 = -1 ✓

For the right-handed electron: T_3(e_R) = 0. With Y = -2:
- q(e_R) = 0 + (-2)/2 = -1 ✓

**Generation Independence:** These quantum numbers depend only on the representation of SU(2)_L × U(1)_Y, which is the same for all generations. The worldline's embedding is generation-blind — it does not know about the record gap index k.

From PrimeBookOne data (Tile00 through Tile188): The electroweak quantum numbers are not stored in the prime gaps; they are structural properties of the worldline's gauge embedding. The 3.67 billion prime differences encode masses and mixings, not gauge quantum numbers.

**Reference:** A1-03, A1-07, A2-10.