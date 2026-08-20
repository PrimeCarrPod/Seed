# A1-22: Worldline_Boundary_Conditions.md — Piece 06

## Periodic Boundary Conditions: Closed Worldline Topology

For the one-electron universe (Wheeler 1940), the electron worldline is a closed loop in spacetime. The proper time is periodic: τ ~ τ + T. This means the boundary conditions at τ=0 and τ=T must be identified:

x^μ(T) = x^μ(0) + 2π R^μ
ψ(T) = -ψ(0) (anti-periodic for fermions)
A_μ(T) = A_μ(0) (periodic for gauge field)

However, the prime electron worldline is NOT naturally periodic in the PrimeBookOne data. The first gap is d_1=2 (p_2-p_1=3-2), and the last gap in directory 3.0 is some large gap d_N. There is no reason for d_N to connect back to d_1.

The periodicity is IMPOSED by the physics of the one-electron universe: the electron worldline must close. This imposes a constraint on the prime gap sequence:
Σ_{n=1}^N d_n = p_{N+1} - 2 = T/κ

For the worldline to close in spacetime, the total displacement must be zero:
∫_0^T v^μ(τ) dτ = 0

From A1-15 (Worldline_Geodesic_Equation), the 4-velocity v^μ is determined by the gap sequence. The closure condition is a constraint on the prime gaps.

In the PrimeBookOne framework, the closure is achieved by identifying the UV boundary (end of directory 3.0) with the IR boundary (start of directory 0.0) through a "book matching" procedure. Each of the 3500 books in directory 3.0 has a corresponding segment in the full worldline. The last book (book 3500) connects to the first book (book 1) through the topological charge:

Q = (1/2π) ∮ Tr(F ∧ F) = 24

The periodicity in the gauge connection is:
A_μ(T) = A_μ(0) + (2π/T) Q σ_3

This is the twisted boundary condition (Wilson line). The holonomy around the worldline is:
Hol = P exp(i ∮ A_μ dx^μ) = exp(i 2π Q σ_3/2) = exp(i 12π σ_3) = 1

For Q = 24, the holonomy is trivial! This means the gauge connection is actually periodic despite the twisted boundary condition. The integer Q = 24 ensures that the worldline closes consistently in the gauge group.

The fermion boundary condition is anti-periodic:
ψ(T) = -ψ(0)

But in the 8-bit Hilbert space (A3-01), the anti-periodicity is implemented by a 180-degree rotation in the spin space:
ψ(T) = exp(i π σ_3/2) ψ(0) = i σ_3 ψ(0)

The worldline coordinate x^μ has the physical periodicity:
x^μ(T) = x^μ(0) + 2π R^μ

where R^μ is determined by the total displacement. From A1-09 (Compton_Scale_From_Prime_Count), the Compton time is T_C = 2π/ω_C = 2π κ ≈ 8.1×10^{-21} s. The total proper time T ≈ 1.05×10^{-10} s ≈ 1.3×10^{10} T_C. So the worldline winds around the Compton circle 1.3×10^{10} times.

Piece 07 discusses the Atiyah-Patodi-Singer boundary conditions.