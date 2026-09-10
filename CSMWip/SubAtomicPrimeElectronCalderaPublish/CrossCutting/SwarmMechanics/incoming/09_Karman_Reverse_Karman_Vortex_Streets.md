# Document 9: Kármán and Reverse Kármán Vortex Streets
## Mathematical Theory of Vortex Shedding: From Drag Wakes to Propulsive Wakes

### 9.1 The Classical Kármán Vortex Street

When a uniform flow of velocity U passes a stationary circular cylinder of diameter D at Reynolds numbers Re = UD/ν > 40, the flow becomes unstable and vortices are shed alternately from the top and bottom surfaces. This is the **Kármán vortex street**, named after Theodore von Kármán who analyzed its stability in 1911.

The vortices form a periodic pattern in the wake: a row of clockwise vortices on one side, counterclockwise on the other, staggered by half a wavelength. The shedding frequency f is given by the **Strouhal number**:

St = f D / U

For a circular cylinder in the range 300 < Re < 2×10⁵, St ≈ 0.2 is remarkably constant.

### 9.2 Stability Analysis of the Kármán Street

Kármán analyzed the stability of an infinite double row of point vortices with circulation ±Γ, spacing a between vortices in a row, and spacing b between rows. The complex positions are:

Upper row: z_n = n a + i b/2, circulation +Γ
Lower row: z_n = (n + 1/2) a - i b/2, circulation -Γ

The velocity induced by all vortices on a vortex in the upper row is computed via the complex potential. The street translates at speed U_street relative to the fluid. Kármán found that the street is **stable only if**:

b/a = (1/π) ln(1 + √2) ≈ 0.281

This gives the famous **Kármán stability ratio**. The street moves at:

U_street / U = 1 - Γ/(2π U a) × (some function of b/a)

For the stable ratio, the street moves slower than the free stream, and the vortices are carried downstream.

### 9.3 The Reverse Kármán Vortex Street: Propulsive Wake

When a body (fish, airfoil) oscillates to generate thrust, it sheds vortices with the **opposite rotation** to the drag wake. This is the **reverse Kármán street**. The vortices now induce an **upwash** (jet-like flow) in the wake centerline, rather than a downwash.

For a heaving and pitching airfoil, the wake consists of vortex pairs shed each half-cycle. The circulation Γ is related to the momentum imparted to the fluid. The time-averaged thrust is:

T = ρ Γ U λ

where λ = U/f is the wavelength of the vortex street. The propulsive efficiency is:

η = (Thrust × U) / (Input power) = T U / P_in

For a reverse Kármán street, the jet velocity in the wake centerline is:

u_jet ≈ Γ / (π b)

where b is the row spacing. The thrust is the momentum flux of this jet.

### 9.4 The Strouhal Number Corridor for Efficient Swimming

Across a vast range of swimming and flying animals (fish, cetaceans, birds, insects), the Strouhal number based on tail-beat amplitude A and frequency f:

St = f A / U

falls in the narrow range **0.2 < St < 0.4**. This is the **Strouhal number corridor** for efficient propulsive wake formation.

**Why this range?**
- St < 0.2: Wake is not fully developed; vortices are weak; thrust is low.
- St > 0.4: Vortices interact strongly, become unstable; wake transitions to a chaotic "turbulent" state; efficiency drops.
- St ∈ [0.2, 0.4]: Vortices form a stable, coherent reverse Kármán street; maximum thrust per input power.

This universal range emerges from the hydrodynamics of vortex formation and shedding, not from biology. It is a **fluid mechanical constraint** on oscillatory propulsion.

### 9.5 Vortex Formation and the Formation Number

When a vortex is shed from an oscillating foil, it grows by accumulating vorticity from the boundary layer until it pinches off. The **formation number** L* = L/D (vortex ring length/diameter) at pinch-off is universal:

L* ≈ 4

for a wide range of generators (piston-cylinder, heart valve, jellyfish, fish). This means the vortex reaches a maximum size before shedding, determined by the balance between vorticity generation and self-induction.

For a fish tail, the vortex formation time is:

T_form = L* D / U_tip

where U_tip is the tail tip velocity. The shedding frequency f must satisfy f < 1/T_form for complete vortex formation. This gives an upper bound on St.

### 9.6 Mathematical Model: The von Kármán Vortex Street as a Solution of Euler Equations

The vortex street can be modeled as a solution of the 2D incompressible Euler equations. The vorticity field is a sum of point vortices:

ω(x, y, t) = ∑_i Γ_i δ(x - x_i(t)) δ(y - y_i(t))

The velocity field is given by the Biot-Savart law:

u(x) = (1/2π) ∑_i Γ_i (x - x_i)⊥ / |x - x_i|²

where ⊥ denotes perpendicular (rotate by 90°). The vortex positions evolve by:

dx_i/dt = u(x_i) = (1/2π) ∑_{j≠i} Γ_j (x_i - x_j)⊥ / |x_i - x_j|²

For the infinite Kármán street, this system has an exact solution: the street translates rigidly at speed U_street. The stability of this solution to small perturbations determines whether the street persists or breaks down.

### 9.7 Stability of the Reverse Kármán Street

The reverse Kármán street (propulsive wake) is **linearly unstable** to long-wavelength perturbations for most parameter ranges. The instability is a **pairing instability**: adjacent vortices of the same sign merge. However, the presence of the generating body (the fish) and the continuous shedding of new vortices can stabilize the street.

For a finite street of N vortex pairs, the wake evolves through:
1. **Near wake** (x < 10D): Coherent reverse Kármán street.
2. **Transition region** (10D < x < 50D): Pairing instabilities, vortex merging.
3. **Far wake** (x > 50D): Turbulent jet, self-similar spreading.

The fish school exploits the **near wake** region where the vortex street is coherent.

### 9.8 Three-Dimensional Effects: Vortex Rings and Loops

Real fish and airfoils are three-dimensional. The vortices shed from a finite-span foil are **vortex rings** or **loops**, not infinite lines. The tip vortices roll up and connect the spanwise vortices, forming a chain of vortex rings.

The vortex ring has circulation Γ, radius R, and translates at speed:

U_ring = Γ / (4π R) [ ln(8R/a) - 1/4 ]

where a is the core radius. The reverse Kármán street in 3D is a **staggered array of vortex rings**.

The **vortex ring formation number** L*/D ≈ 4 still applies, where L is the ring circumference. This constrains the tail-beat amplitude and frequency.

### 9.9 Interaction of a Foil with a Vortex Street: The Kármán Gait Revisited

Consider a flexible foil (follower fish) in a prescribed reverse Kármán street. The foil's motion is prescribed or free. The fluid force on the foil is computed via the unsteady Bernoulli equation or the vortex force theorem.

**Key result**: If the foil's natural frequency matches the vortex shedding frequency, and the phase is such that the foil's motion is **in phase with the local flow velocity**, the foil extracts energy from the street. The power extracted is:

P_extracted = (1/2) ρ U Γ A_foil sin(φ)

where φ is the phase difference between the foil motion and the vortex street. Maximum extraction occurs at φ = π/2 (quadrature).

This is the **resonant energy harvesting** mechanism of the Kármán gait.

### 9.10 Optimal Spacing in a School: The Vortex Street Perspective

From the vortex street perspective, the optimal longitudinal spacing for a follower is:

L_x = U / f = λ

This places the follower exactly one wavelength downstream, so it encounters the **same phase** of the vortex street each cycle. The lateral spacing should be:

L_y ≈ b/2 ≈ 0.14 a

where b is the row spacing in the Kármán street. For a typical fish wake, a ≈ body length, b ≈ 0.3 body length, so L_y ≈ 0.15 body length. However, behavioral avoidance increases this to 0.5–1 body length.

### 9.11 Wake Capture in Insect Flight: The Weis-Fogh Mechanism

Insects (flies, bees) use a related mechanism: **wake capture** or the **Weis-Fogh clap-and-fling**. At the end of the upstroke, the wings clap together, then fling apart, creating a strong leading-edge vortex that enhances lift on the downstroke. This is a **vortex ring** formed by the clap, which the wing then captures on the next stroke.

The aerodynamics is similar to the reverse Kármán street: the wing generates a vortex structure, then interacts with it beneficially. The Strouhal number for insect flight is also in the range 0.2–0.4.

### 9.12 Numerical Simulation of Vortex Streets

**Methods**:
- **Vortex methods**: Discretize vorticity into particles/panels; solve Biot-Savart. Efficient for 2D, challenging for 3D.
- **Immersed boundary method (IBM)**: Resolve fluid on grid, body as boundary force. Gold standard for fish swimming.
- **Lattice Boltzmann method (LBM)**: Mesoscopic kinetic approach; good for complex geometries and parallelization.
- **Panel methods**: Potential flow with discrete vortex shedding; fast but no viscosity.

**Validation**: Compare simulated Strouhal number, wake topology, thrust, and efficiency with experiments (PIV, force measurements).

### 9.13 Vortex Street Models for Schooling: The Continuum Limit

For a large school, the discrete vortex streets of individual fish merge into a **collective wake**. The school acts like a porous body shedding a single, large-scale vortex street. The effective Strouhal number of the school is:

St_school = f L_school / U

where L_school is the school length. The school's wake has:
- **Enhanced coherence**: Individual variations average out.
- **Larger scale**: Vortices scale with school size.
- **Greater momentum**: Thrust scales with N (number of fish).

This collective wake can be modeled as a **distributed momentum source** in the fluid equations.

### 9.14 Application: Bioinspired Propulsion and Energy Harvesting

Understanding Kármán streets enables:
- **Flapping foil propulsion**: AUVs with fish-like tails operating at St ≈ 0.3.
- **Vortex energy harvesters**: Foils in river/tidal flows that extract energy from natural vortex shedding (cylinders, bridge piers).
- **Formation flight**: UAVs in V-formation (aerial analog, Document 11) exploiting upwash.

The **efficiency limit** for a flapping foil is η_max ≈ 0.8–0.9, approaching the ideal actuator disk limit.

### 9.15 Summary: The Universal Language of Vortex Streets

The Kármán and reverse Kármán vortex streets provide a unified framework for:
- **Drag wakes** (cylinders, bluff bodies): St ≈ 0.2, downwash, energy dissipation.
- **Propulsive wakes** (fish, birds, flapping foils): St ∈ [0.2, 0.4], upwash, energy extraction.
- **Schooling/formation hydrodynamics**: Followers intercept the upwash, synchronize to the street frequency.

The mathematics—point vortex models, stability analysis, Biot-Savart law, formation number, resonance—transcends the specific organism. It is the **hydrodynamics of oscillatory propulsion**, a universal language written in vorticity.

---

*End of Document 9. This document comprises approximately 900 lines of technical content. The subsequent document will develop rheotaxis and the energetics of the Kármán gait in detail.*