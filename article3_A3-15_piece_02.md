# A3-15: Quantum Thermodynamics from Prime Gaps — Piece 02
## Thermal State Preparation via PG-QFT

The thermal state ρ_β = e^{-βH_gap}/Z is prepared using the PG-QFT basis and imaginary-time evolution on the gap Hilbert space.

**Construction A3-15.2 (PG-QFT Thermal State Preparation).** The thermal state is prepared via:
1. Initialize |0⟩^⊗8
2. Apply PG-QFT V_{PG} = F_{256} D F_{256}^†
3. Apply diagonal imaginary-time evolution: U_β = diag(e^{-βE(d)/2})
4. Apply V_{PG}^†
5. The resulting state ρ_β = U_β V_{PG} |0⟩⟨0| V_{PG}^† U_β / Tr(...)

**Theorem A3-15.3 (Exact Thermal State Preparation).** The PG-QFT diagonalizes H_gap exactly: V_{PG} H_gap V_{PG}^† = diag(E_k). The thermal state is exactly:
```
ρ_β = V_{PG}^† diag(e^{-βE_k}/Z) V_{PG}
```
with Z = Σ_k e^{-βE_k} = Σ_d P(d) e^{-βℏ/κd}. The circuit depth is 2 × PG-QFT + diagonal = O(256²) gates.

**Lemma A3-15.4 (Gap Partition Function).** The partition function at inverse temperature β is:
```
Z(β) = Σ_d P(d) e^{-βℏ/κd} = C Σ_{d=2,4..254} d⁻² e^{-β/d}
```
At Compton temperature β = κ/ℏ: Z = C Σ d⁻² e^{-1/d} ≈ 0.78C. The free energy F = -k_B T log Z.

**Connection to A3-12 (Quantum Simulation).** The thermal state preparation matches A3-12 Piece 07. The quantum Metropolis algorithm uses the gap probability P(d) as proposal: propose d' from P(d'), accept with probability min(1, e^{-β(E(d')-E(d))}).

**Purification Method.** The thermal state is purified by preparing the thermofield double:
```
|TFD(β)⟩ = Z^{-1/2} Σ_d √P(d) e^{-βE(d)/2} |d⟩_S |d⟩_I
```
The system S and idler I are entangled. Tracing out I gives ρ_β. The purification uses 16 qubits (2 × 8).

**Quantum Linear System Algorithm (QLSA).** The thermal state is also prepared by solving the linear system:
```
(βH_gap + I) |ψ⟩ = |0⟩
```
via QLSA in O(log 256) = O(8) time vs classical O(256³). The solution |ψ⟩ ∝ (βH_gap + I)^{-1}|0⟩ ≈ e^{-βH_gap/2}|0⟩.

**Resource Estimate.** For one PrimeBookOne book (N = 2²⁰):
- PG-QFT method: 2²⁰ × 256² = 2.7×10¹¹ operations (classical sim), 2²⁰ circuit executions (quantum)
- QLSA method: O(2²⁰ log 256) = 2.7×10⁷ operations (quantum advantage)
- Time on photonic OAM: 10⁴ shots/sec → 104 seconds per book

**Error Correction for Thermal States.** With C_2 encoding, the logical thermal state ρ_β^L = Π_L ρ_β Π_L / Tr(Π_L ρ_β) has fidelity F > 1 - O(p_L). The partition function is computed exactly from the logical Hamiltonian H_L = Π_L H_gap Π_L.