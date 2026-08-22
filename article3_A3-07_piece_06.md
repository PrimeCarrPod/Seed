# A3-07 Quantum_Information_Prime_Book.md — Piece 06: Quantum Thermodynamics of the Prime Book

## 6.1 Thermodynamics of the Book Ensemble

The 3500-book ensemble defines a thermal state at some effective temperature. The channel ℰ(ρ) = (1/B) Σ U_b ρ U_b† has a fixed point that is the **maximally mixed state** ρ_∞ = I/256, corresponding to infinite temperature (β = 0).

However, the **twin prime state** |2⟩⟨2| is an approximate fixed point with very slow decay, acting as a **low-temperature attractor**.

## 6.2 Effective Temperature and Free Energy

### Thermal State
The thermal state at inverse temperature β is:
```
ρ_β = e^{-βH} / Z,  Z = Tr(e^{-βH})
```
with H = Σ_d E_d |d⟩⟨d|, E_d = ℏ/(κd).

The book ensemble produces a state close to ρ_β for some β_eff determined by the gap distribution:
```
β_eff ≈ 1/(κT_eff)
```
where T_eff is determined by the variance of the gap distribution.

### Free Energy
The non-equilibrium free energy of a state ρ:
```
F(ρ) = Tr(ρH) - T S(ρ)
```
For the initial twin prime state:
- Energy: E_2 = ℏ/(2κ)
- Entropy: S = 0
- F = E_2

For the maximally mixed state:
- Energy: ⟨E⟩ = (1/256) Σ_d ℏ/(κd) ~ ℏ/(κ) log 256
- Entropy: S = 8 log 2
- F = ⟨E⟩ - T·8 log 2

The free energy difference drives the evolution.

## 6.3 Work and Heat in Book Evolution

### Work
The work done on the system by changing the Hamiltonian (from book to book) is zero because H is fixed. The "work" comes from the **change in the unitary** U_b → U_{b+1}:
```
W = Tr(ρ (U_{b+1}† H U_{b+1} - U_b† H U_b))
```
Since U_b are diagonal in H's basis, W = 0.

### Heat
The heat exchanged with the environment (book index) is:
```
Q = ΔE - W = ΔE
```
The energy change ΔE comes from the dephasing (A3-06).

### Entropy Production
The entropy production rate:
```
σ = ∂_t S(ρ(t)) + β Q̇
```
For the book channel, σ ≥ 0 (second law).

## 6.4 Fluctuation Theorems

### Jarzynski Equality
For the book ensemble as a non-equilibrium process:
```
⟨e^{-βW}⟩ = e^{-βΔF}
```
Since W = 0, this gives ΔF = 0 — the free energy is constant on average.

### Crooks Fluctuation Theorem
The ratio of forward and reverse book transition probabilities:
```
P_F(ρ → ρ') / P_R(ρ' → ρ) = e^{-β(ΔF - W)}
```
The "reverse" process is the time-reversed book sequence.

## 6.5 Maxwell's Demon and Prime Gap Information

The modular structure (mod 6, mod 30) acts as a **Maxwell's demon** — it extracts information about the gap value and uses it to protect the twin prime sector from decoherence.

### Information-Work Tradeoff
The information gained by measuring the mod 6 sector:
```
I = H(mod 6) = -Σ_s p_s log p_s ≈ 1.2 bits
```
This information can be converted to work:
```
W_max = kT I ≈ kT · 1.2
```
In the prime gap system, this work is the **protection of the twin prime DFS** — the modular measurement prevents transitions out of the sector.

## 6.6 Landauer's Principle and Gap Erasure

Erasing a gap value (resetting to twin prime) costs energy:
```
E_erase ≥ kT log 2
```
The prime gap sequence naturally "erases" information through decoherence, dissipating heat at rate:
```
Q̇ ≥ kT · (decoherence rate) · log 2
```
This matches the decoherence rate from A3-06.

## 6.7 Piece 06 Summary

- Book ensemble → thermal state at β = 0 (maximally mixed)
- Twin prime state = low-temperature attractor (DFS)
- Free energy: F = E - TS, with E = ℏ/(κd), S from gap distribution
- Work = 0 (diagonal unitaries), Heat = ΔE
- Fluctuation theorems hold (Jarzynski, Crooks)
- Modular structure = Maxwell's demon (information protection)
- Landauer erasure cost = gap decoherence rate

**References**: A3-06 (Decoherence), A3-04 (Modular Structure), A3-02 (Hamiltonian), A1-08 (Proper Time Fluctuations)