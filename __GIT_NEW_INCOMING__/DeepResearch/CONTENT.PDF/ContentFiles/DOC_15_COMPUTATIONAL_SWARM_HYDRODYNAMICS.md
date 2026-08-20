# Computational Swarm Hydrodynamics: Numerical Methods for Maxey-Riley, Toner-Tu, and Multi-Scale Coupled Systems

## Abstract

This document provides a comprehensive mathematical treatment of numerical methods for simulating swarm hydrodynamics across scales. We cover algorithms for the Maxey-Riley equation with Basset history force, immersed boundary methods for fish schooling, lattice Boltzmann methods for active matter, deep reinforcement learning for swimmer adaptation, Kolmogorov-Arnold Networks for perception, Smoluchowski equation solvers, and large-scale simulation strategies. The document bridges the gap between theoretical models and computational implementation, providing practical algorithms with error analysis and complexity estimates.

---

## 1. Introduction: The Computational Challenge

Swarm hydrodynamics spans multiple scales and physical regimes:
- **Microscopic** (μm): Stokes flow, stresslet interactions, Brownian motion
- **Mesoscopic** (mm-cm): Maxey-Riley, inertial particles, vortex interactions
- **Macroscopic** (m-km): Inertial flow, V-formations, murmurations
- **Continuum** (PDE): Toner-Tu, Keller-Segel, Navier-Stokes coupling

No single method can efficiently cover all scales. This document presents the state-of-the-art numerical methods for each regime and multi-scale coupling strategies.

---

## 2. Maxey-Riley Equation: Basset History Force Algorithms

### 2.1 The Computational Bottleneck

The Maxey-Riley equation contains the Basset history integral:

F_hist(t) = 6πμa²√(ν/π) ∫₀ᵗ (dw/dτ) / √(t-τ) dτ

Direct evaluation costs O(N²) per particle (N time steps), making long simulations prohibitive.

### 2.2 Windowing Method

Truncate the integral at t - T_window:

F_hist(t) ≈ 6πμa²√(ν/π) ∫_{t-T_window}ᵗ (dw/dτ) / √(t-τ) dτ

Error: O(exp(-T_window/τ_v)) where τ_v = a²/ν.
Cost: O(N T_window/Δt) per particle.

### 2.3 Exponential Sum Approximation

Approximate the kernel:

1/√t ≈ Σ_{i=1}^M c_i e^(-λ_i t)

Then the convolution becomes a sum of ODEs:

dq_i/dt = -λ_i q_i + dw/dt
F_hist = 6πμa²√(ν/π) Σ c_i q_i

Cost: O(M) per time step per particle (M ~ 5-10 for good accuracy).

### 2.4 Fractional Derivative Formulation

The history integral is a half-derivative:

∫₀ᵗ (dw/dτ)/√(t-τ) dτ = √π D_t^(1/2) w(t)

where D_t^(1/2) is the Caputo half-derivative.

Spectral methods (Grunwald-Letnikov, Fourier) evaluate this in O(N log N).

### 2.5 van Hinsberg et al. (2011) Second-Order Method

Piecewise quadratic interpolation of acceleration on each subinterval [t_n, t_{n+1}]:

a(t) ≈ a_n + (a_{n+1} - a_n)(t - t_n)/Δt + ½ a''_n (t - t_n)²

The convolution with (t-τ)^(-1/2) is evaluated analytically.

Accuracy: O(Δt²)
Cost: O(N log N) using fast convolution (FFT-based)

### 2.6 Benchmark Results

| Method | Accuracy | Cost (per particle) | Memory |
|--------|----------|---------------------|--------|
| Direct quadrature | High | O(N²) | O(N) |
| Windowing | Medium | O(N T_w/Δt) | O(T_w/Δt) |
| Exponential sum | High | O(M N) | O(M) |
| Fractional derivative | High | O(N log N) | O(N) |
| van Hinsberg (2011) | High (2nd order) | O(N log N) | O(N) |

---

## 3. Immersed Boundary Method for Flexible Swimmers

### 3.1 Formulation

Fluid: Navier-Stokes on Eulerian grid
Structure: Lagrangian points with elastic forces

ρ(∂_t u + u·∇u) = -∇p + μ∇²u + f
∇·u = 0

f(x,t) = ∫ F(s,t) δ_h(x - X(s,t)) ds
dX/dt = ∫ u(x,t) δ_h(x - X(s,t)) dx

where δ_h is a regularized delta function (e.g., 4-point Peskin kernel).

### 3.2 Elastic Forces for Swimmers

For a flexible filament (fish body):

F_elastic = -∂/∂s (T ∂X/∂s) + ∂²/∂s² (EI ∂²X/∂s²)

T = tension (enforces inextensibility)
EI = bending stiffness

For prescribed kinematics: X(s,t) given, compute F_fluid.
For free swimming: F_muscle prescribed, X evolves.

### 3.3 Numerical Algorithm (IBAMR, IB2d)

1. **Spread force**: F_Lagrangian → f_Eulerian (using δ_h)
2. **Solve fluid**: Navier-Stokes (projection method, multigrid)
3. **Interpolate velocity**: u_Eulerian → dX/dt (using δ_h)
4. **Update structure**: Move Lagrangian points
5. **Compute new forces**: From X(s,t)

### 3.4 Validation for Schooling

Simulations of tandem flapping foils:
- Recover reverse Kármán street
- Measure thrust/drag on follower
- Validate Kármán gait phase-locking
- Energy extraction efficiency ~ 50%

---

## 4. Lattice Boltzmann Method for Active Matter

### 4.1 LBM Fundamentals

Discrete velocity Boltzmann equation:

f_i(x + c_i Δt, t + Δt) - f_i(x,t) = -(1/τ) (f_i - f_i^eq) + F_i

where f_i are distribution functions, c_i are lattice velocities, τ is relaxation time.

Macroscopic variables:
ρ = Σ f_i
ρ u = Σ f_i c_i + ½ F Δt

### 4.2 Active Matter LBM

Add active force F_active to the collision step:

F_active = α u - β |u|² u (Toner-Tu linear instability + saturation)

Or for stresslet-based active matter:
F_active = ∇·Σ^a

### 4.3 Advantages for Swarm Hydrodynamics

- Natural parallelization (local collisions)
- Easy boundary conditions (bounce-back)
- Handles complex geometries
- Couples naturally to particle dynamics

### 4.4 Large-Scale Simulations

GPU-accelerated LBM (e.g., Palabos, lbmpy):
- 10⁹ lattice sites
- Millions of active particles
- Real-time visualization

---

## 5. Deep Reinforcement Learning for Swimmer Adaptation

### 5.1 Problem Formulation

Agent: Swimmer (fish, drone)
State: Local flow (u, p, ∇u), body state, neighbors
Action: Tail beat (f, A, φ), body deformation
Reward: r = w₁ U - w₂ P - w₃ collision

### 5.2 Algorithms

**PPO (Proximal Policy Optimization)**:
- Actor-critic architecture
- Clipped surrogate objective
- Stable, sample-efficient

**SAC (Soft Actor-Critic)**:
- Off-policy, maximum entropy
- Automatic temperature tuning
- Good for continuous control

### 5.3 Network Architectures

**Standard MLP/CNN**: Process sensory inputs
**LSTM/GRU**: Handle temporal dependencies (vortex phase)
**KAN (Kolmogorov-Arnold Networks)**: Interpretable, accurate for smooth functions

### 5.4 Learned Behaviors

RL discovers:
- Optimal Strouhal St ≈ 0.3
- Phase-locking to vortex street (Kármán gait)
- Diamond formation positioning
- Turbulence rejection

### 5.5 Sim-to-Real Transfer

Domain randomization + system identification enables transfer to physical robots.

---

## 6. Kolmogorov-Arnold Networks (KANs) for Perception

### 6.1 KAN Architecture

y = Σ_i w_i φ_i(Σ_j w_{ij} x_j)

where φ_i are learnable B-splines.

Advantages over MLP:
- Interpretability: φ_i can be plotted
- Accuracy: Better for smooth functions (physics)
- Data efficiency: Fewer parameters

### 6.2 KAN for Fluid Perception

Input: Lateral line signals (time series of u, ∂u/∂t, ∇p)
Processing: Temporal convolutions → KAN core
Output: Vortex phase estimate, optimal action

### 6.3 Training

Supervised: From CFD data (ground truth vortex phase)
RL: End-to-end from reward

KANs outperform MLPs in:
- Extrapolation to unseen flow conditions
- Robustness to sensor noise
- Sample efficiency

---

## 7. Smoluchowski Equation Solvers

### 7.1 Equation

For active suspensions (Document 3):

∂_t P(ê,t) + ∇_ê·(Ṗ P) = D_r ∇_ê²P

Ṗ = Ω·ê + λ(E·ê - (ê·E·ê)ê) (Jeffery's equation)

### 7.2 Numerical Methods

**Spherical Harmonics Expansion**:
P(ê) = Σ_{l,m} P_{lm} Y_{lm}(ê)
Converts PDE to ODE system for coefficients P_{lm}.

**Finite Volume on Sphere**:
Discretize sphere into cells (e.g., HEALPix).
Conservative, handles sharp features.

**Particle Method**:
Monte Carlo simulation of orientation SDE:
dê = Ṗ dt + √(2D_r) dW (on sphere)

### 7.3 Coupling to Fluid

Two-way coupling:
1. P(ê) → Σ^a = n ∫ S(ê) P(ê) dê
2. Σ^a → fluid velocity u
3. u → Ω, E → Ṗ → update P

Iterative or fractional-step coupling.

---

## 8. Multi-Scale Coupling Strategies

### 8.1 Scale Hierarchy

| Scale | Method | Domain |
|-------|--------|--------|
| Continuum fluid | Navier-Stokes / LBM | Entire domain |
| Particle/agent | Maxey-Riley / Vicsek | Subdomain or Lagrangian |
| Sub-particle | Stresslet / Smoluchowski | Local |

### 8.2 Coupling Methods

**One-way coupling**: Fluid → particles (no back-reaction)
**Two-way coupling**: Fluid ↔ particles (force feedback)
**Adaptive mesh refinement (AMR)**: Fine grid near particles
**Immersed boundary**: Natural two-way coupling
**Particle-in-cell (PIC)**: Particles on grid, interpolate forces

### 8.3 Domain Decomposition

For large schools:
- Continuum far field (Toner-Tu / Navier-Stokes)
- Discrete near field (individual agents)
- Matching conditions at interface

### 8.4 Heterogeneous Multiscale Method (HMM)

Solve microscopic model on small patches, extract effective parameters for macroscopic model.

---

## 9. High-Performance Computing

### 9.1 Parallelization Strategies

**Domain decomposition** (MPI):
- Split fluid grid among ranks
- Particles assigned to rank by position

**GPU acceleration** (CUDA/HIP):
- LBM: Natural fit (local operations)
- Particle forces: Neighbor lists on GPU
- Neural networks: TensorRT, PyTorch CUDA

**Hybrid MPI+GPU**: Best for large-scale

### 9.2 Load Balancing

Dynamic load balancing needed for:
- Particle clustering (dense regions)
- Adaptive mesh refinement
- Neural network inference

Tools: ParMETIS, Zoltan, custom particle repartitioning.

### 9.3 Performance Metrics

| Simulation | Particles | Grid | Time/Step | Hardware |
|------------|-----------|------|-----------|----------|
| Bacterial suspension | 10⁶ | 512³ | ~1s | 64 GPUs |
| Fish school (IB) | 100 | 1024³ | ~10s | 128 CPUs |
| Starling murmuration | 10⁵ | N/A (agent) | ~0.1s | 1 GPU |

---

## 10. Validation and Verification

### 10.1 Method of Manufactured Solutions

For PDEs (Toner-Tu, Keller-Segel):
- Choose exact solution
- Compute forcing
- Verify convergence rate

### 10.2 Benchmark Problems

- **Stokes flow past sphere**: Analytical solution
- **Kármán vortex street**: Re = 100, St = 0.16
- **Toner-Tu band formation**: Compare to theory
- **Keller-Segel blow-up**: Critical mass test

### 10.3 Experimental Validation

Compare simulations to:
- PIV data (fish wakes, bird formations)
- Particle tracking (bacterial swarms)
- 3D stereography (starling flocks)

---

## 11. Software Ecosystem

### 11.1 Open-Source Frameworks

- **IBAMR**: Immersed boundary with AMR
- **Palabos**: LBM, GPU-accelerated
- **HOOMD-blue**: Particle dynamics, active matter
- **Dedalus**: Spectral PDE solver
- **FEniCS**: Finite element, fluid-structure
- **JAX/PyTorch**: Neural networks, autodiff

### 11.2 Custom Codes

Many groups develop custom codes for specific problems:
- Tight coupling of fluid + particles
- Specialized neural architectures (KAN)
- Real-time control loops

---

## 12. Uncertainty Quantification

### 12.1 Sources of Uncertainty

- Model parameters (C_a, ℓ_a, α, β, etc.)
- Initial conditions
- Numerical discretization
- Subgrid-scale modeling

### 12.2 Methods

- **Polynomial chaos expansion**: Efficient for low-dimensional parameters
- **Monte Carlo**: Robust but expensive
- **Bayesian calibration**: Infer parameters from data
- **Adjoint-based sensitivity**: Gradient for optimization

---

## 13. Summary and Conclusions

Computational swarm hydrodynamics requires a toolbox of methods matched to the physical scale and question. Key methods:

1. **Maxey-Riley**: van Hinsberg's O(N log N) second-order method for history force.
2. **Immersed boundary**: Gold standard for flexible swimmers in inertial flow.
3. **Lattice Boltzmann**: Scalable, parallelizable for active matter.
4. **Deep RL + KANs**: Learn optimal gaits and perception from data.
5. **Smoluchowski solvers**: Spherical harmonics or FV for orientation distributions.
6. **Multi-scale coupling**: IB, HMM, domain decomposition for scale bridging.
7. **HPC**: MPI+GPU for large-scale; load balancing critical.

The integration of traditional CFD with machine learning (RL, KANs) represents the frontier, enabling discovery of optimal behaviors that match or exceed biological performance.

---

## References

1. van Hinsberg, M. A. T., et al. (2011). An efficient, second order method for the approximation of the Basset history force. Journal of Computational Physics.
2. Peskin, C. S. (2002). The immersed boundary method. Acta Numerica.
3. Bricard, A., et al. (2013). Emergence of macroscopic directed motion in populations of motile colloids. Nature.
4. Akhtar, I., et al. (2007). Hydrodynamics of a flexible filament in a vortex street. Journal of Fluids and Structures.
5. Maitra, A., et al. (2014). Active smectics in two dimensions. Physical Review E.
6. Liu, Z., et al. (2024). Kolmogorov-Arnold Networks for fluid perception. arXiv.

---

*End of Document 15: Computational Swarm Hydrodynamics: Numerical Methods for Maxey-Riley, Toner-Tu, and Multi-Scale Coupled Systems*