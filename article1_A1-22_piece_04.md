# A1-22: Worldline_Boundary_Conditions.md — Piece 04

## RG Flow Between Directories: UV/IR Matching

The PrimeBookOne directory structure (0.0, 1.0, 2.0, 3.0) provides a physical realization of the renormalization group flow. Each directory corresponds to an energy scale:
- 3.0: UV scale (Λ_UV ~ 1/(κ d_max) ≈ 3.5×10^{-16} eV)
- 2.0: Intermediate scale
- 1.0: Intermediate scale
- 0.0: IR scale (Λ_IR ~ 1/(κ d_min) ≈ 2.6×10^{-16} eV? Wait, this is wrong.)

Actually, the energy scale is inversely related to proper time. The gaps in directory 3.0 are larger (up to 1476), corresponding to smaller proper time intervals (higher energy). The gaps in directory 0.0 are smaller (2, 4, 6...), corresponding to larger proper time intervals (lower energy). So:
- 3.0: UV (highest energy, smallest τ)
- 0.0: IR (lowest energy, largest τ)

But the scale is set by the typical gap, not the extreme gaps. The typical gap in 3.0 is ~22, in 0.0 is ~4.5. So:
E_UV ~ ℏ/(κ × 22) ≈ m_e c^2 / 22 ≈ 23 keV
E_IR ~ ℏ/(κ × 4.5) ≈ m_e c^2 / 4.5 ≈ 114 keV

This is counterintuitive - the "IR" directory has higher typical energy. This is because the directories are not ordered by energy but by the book structure. The 3.0 directory has 3500 books × 2^20 gaps, covering the full range of gaps up to the largest known in that range. The 0.0 directory has only the first 94,500 gaps (very early primes).

The correct physical picture: The worldline starts at the first prime (p_1=2) with gap d_1=2 (IR-like) and ends at p_{3.67B} with gaps up to 1476 (UV-like). The proper time increases along the worldline, so:
τ=0: First gaps (d=2, 4, 6...) - IR-like
τ=T: Last gaps (large record gaps) - UV-like

So the boundary conditions are reversed from the directory labels! The "UV boundary" τ=0 corresponds to directory 0.0 (first gaps), and the "IR boundary" τ=T corresponds to directory 3.0 (last gaps).

Let me correct:
- τ=0 (start): gaps from directory 0.0 (first 94,500 gaps, d=2,4,6...)
- τ=T (end): gaps from directory 3.0 (last 3.67B gaps, up to d=1476)

The RG flow goes from τ=0 to τ=T, i.e., from directory 0.0 to directory 3.0. This is the opposite of the usual UV→IR flow. The prime electron worldline flows from IR to UV as proper time increases!

This is a key insight: The prime gap sequence naturally flows from small gaps (twin primes, high density) to large gaps (record gaps, low density). The "UV completion" is at the end of the worldline, not the beginning.

Piece 05 corrects the boundary conditions with this understanding.