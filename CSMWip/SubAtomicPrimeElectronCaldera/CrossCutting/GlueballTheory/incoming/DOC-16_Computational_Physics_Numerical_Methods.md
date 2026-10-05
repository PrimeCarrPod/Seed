# DOC-16: Computational Physics and Numerical Methods — Simulating the Universe from Quarks to Cosmos

## 16.1 The Computational Imperative

The equations governing physics across scales—from the QCD Lagrangian to the Einstein field equations—are predominantly non-linear, coupled, and analytically intractable except in highly symmetric or linearized limits. **Computational physics** is the third pillar of modern science (alongside theory and experiment), providing a "numerical laboratory" to solve these equations, explore parameter spaces, and make predictions for complex systems.

## 16.2 Lattice QCD: Non-Perturbative QCD from First Principles

### 16.2.1 Discretization
Euclidean spacetime (Wick rotation t → -iτ) on a hypercubic lattice with spacing a.
- Gauge fields: Link variables U_μ(x) ∈ SU(3), connecting x to x+â_μ.
- Quark fields: Grassmann variables ψ(x), ψ̄(x) on sites.
- Wilson action: S_G = (β/3) Σ_P Re Tr(1 - U_P), β = 6/g²
- Fermion action: S_F = Σ_x [ψ̄(x)ψ(x) - κ Σ_μ (ψ̄(x)(1-γ_μ)U_μ(x)ψ(x+â_μ) + h.c.)]

### 16.2.2 Path Integral and Monte Carlo
Z = ∫ DU Dψ Dψ̄ e^{-S} = ∫ DU det(M[U]) e^{-S_G}
- Importance sampling: Generate gauge configurations with probability ∝ det(M) e^{-S_G}.
- Algorithms: Hybrid Monte Carlo (HMC), Rational HMC (RHMC) for dynamical fermions.
- Observables: ⟨O⟩ = (1/N) Σ_i O[U_i]

### 16.2.3 Systematics and Extrapolations
- **Continuum limit**: a → 0 (multiple lattice spacings, extrapolate).
- **Physical quark masses**: m_π → 135 MeV (chiral extrapolation).
- **Infinite volume**: L → ∞ (L > 4/m_π).
- **Renormalization**: Match lattice operators to MS-bar scheme.

### 16.2.4 Key Results
- Hadron spectrum (m_π, m_K, m_p, m_Ξ, m_Ω) → agrees with experiment at <1% level.
- Decay constants (f_π, f_K), form factors.
- Running coupling α_s(m_Z) = 0.1182(12).
- QCD equation of state, T_c = 156.5(1.5) MeV.
- Hadronic contributions to muon g-2 (HLbL, HVP).
- Neutron EDM, σ-terms, strangeness content.

### 16.2.5 Computational Cost
- State-of-the-art: a ≈ 0.04 fm, L ≈ 5-10 fm, m_π ≈ 135 MeV.
- Lattice sizes: 96³ × 192 to 144³ × 288.
- Cost: O(10²-10³) Teraflop-years per ensemble.
- Exascale computing (Frontier, Aurora, Fugaku) enables physical-point, continuum-extrapolated calculations.

## 16.3 Nuclear Many-Body Methods

### 16.3.1 Ab Initio Methods
Starting from chiral EFT Hamiltonians (NN + 3N forces):
- **No-Core Shell Model (NCSM)**: Exact diagonalization in HO basis. Up to A=16.
- **Coupled Cluster (CC)**: e^T|Φ₀⟩, CCSD(T). Up to A=100 (medium mass).
- **In-Medium SRG**: Flow equations for Hamiltonian. Up to A=100.
- **Quantum Monte Carlo (GFMC, AFDMC)**: Variational + projection. Light nuclei (A ≤ 12).
- **Self-Consistent Green's Function (SCGF)**: Spectral functions. Medium mass.
- **Configuration Interaction (CI)**: Large-scale diagonalization (Jacobi-Davidson).

### 16.3.2 Density Functional Theory (DFT) for Nuclei
Energy density functional E[ρ, τ, J, ...] → Kohn-Sham equations.
Skyrme, Gogny, relativistic (RMF) functionals.
Fitted to nuclear masses, radii, deformations.
Predicts drip lines, fission barriers, superheavies.

## 16.4 Stellar Hydrodynamics and Radiative Transfer

### 16.4.1 Multi-Dimensional Hydrodynamics
- **Eulerian codes**: FLASH, CASTRO, ATHENA, RAMSES, ENZO.
  - Godunov methods, AMR, nuclear reaction networks.
- **Lagrangian codes**: SPH (GADGET, AREPO, SWIFT), moving mesh.
  - Natural for advection, free boundaries.

### 16.4.2 Key Physics Modules
- **Equation of state**: Helmholtz, Timmes, nuclear statistical equilibrium (NSE).
- **Nuclear reaction networks**: 10-1000 isotopes, stiff ODEs (CVODE, Bader-Deuflhard).
- **Neutrino transport**: Multi-group flux-limited diffusion, M1 closure, Boltzmann solvers.
- **Radiation hydrodynamics**: M1, variable Eddington factor, Monte Carlo.
- **Magnetic fields**: Constrained transport (CT), divergence cleaning.
- **Gravity**: Self-gravity (Poisson solver), external potentials.

### 16.4.3 Applications
- Core-collapse supernovae (1D, 2D, 3D).
- Neutron star mergers (BNS, NS-BH).
- Type Ia supernovae (deflagration/detonation).
- Stellar convection, pulsation, rotation.

## 16.5 Galaxy Formation and Cosmological Simulations

### 16.5.1 N-Body Simulations (Dark Matter Only)
- **Tree-PM**: Barnes-Hut tree for short range, PM for long range.
- **Fast Multipole Method (FMM)**: O(N) scaling.
- **Codes**: GADGET, PKDGRAV, CUBEP³M, ABACUS, SWIFT.
- **Volume**: (1-10 Gpc)³, particles: 10⁹-10¹².
- **Output**: Halo catalogs, merger trees, power spectra.

### 16.5.2 Hydrodynamic Cosmological Simulations
- **Moving mesh**: AREPO (quasi-Lagrangian).
- **SPH**: GADGET, SWIFT, GIZMO.
- **AMR**: RAMSES, ENZO, FLASH, NYX.
- **Subgrid physics**: Star formation, feedback (SN, AGN), metal enrichment, UV background.
- **Major suites**: Illustris/TNG (100 Mpc, 10¹⁰ particles), EAGLE, SIMBA, FIRE (zoom-ins), CAMELS.

### 16.5.3 Semi-Analytic Models (SAMs)
Post-process N-body merger trees with baryonic recipes.
- L-GALAXIES, SAGE, GALACTICUS, SANTARICA.
- Fast exploration of parameter space, calibration to observations.

## 16.6 Numerical Relativity: Solving Einstein's Equations

### 16.6.1 3+1 Decomposition (ADM/BSSNOK)
Spacetime foliated into spatial slices Σ_t:
ds² = -α²dt² + γ_ij(dx^i + β^i dt)(dx^j + β^j dt)
Evolution variables: γ_ij, K_ij.
Constraints: Hamiltonian H = 0, Momentum M_i = 0.
BSSNOK formulation: conformal factor ϕ, conformal metric γ̃_ij, trace K, trace-free Ã_ij, conformal connection Γ̃^i.

### 16.6.2 Gauge Conditions
- **1+log slicing**: ∂_t α = -2αK
- **Gamma-driver shift**: ∂_t β^i = B^i, ∂_t B^i = ¾ ∂_t Γ̃^i - η B^i

### 16.6.3 Relativistic Hydrodynamics (GRHD/GRMHD)
Conservative form: ∂_t U + ∂_i F^i = S
U = [D, S_j, τ], F^i, S from T^μν.
HRSC methods: WENO, MP5, HLLE/HLLC Riemann solvers.
MHD: Constrained transport, divergence cleaning.

### 16.6.4 Key Codes
- **Einstein Toolkit**: Open-source, modular (Cactus framework).
- **Whisky/GRHydro**: GRHD/GRMHD in ETK.
- **SpEC**: Spectral methods (SXS collaboration).
- **IllinoisGRMHD**: GRMHD in ETK.
- **BHAC**: GRMHD for accretion flows.
- **HARM**: GRMHD for black hole accretion.

### 16.6.5 Applications
- Binary black hole mergers (GW150914 and beyond).
- Binary neutron star mergers (GW170817).
- Core-collapse supernovae in GR.
- Accretion disks, jets, BH magnetospheres.
- Critical collapse, boson stars, exotic compact objects.

## 16.7 Plasma Physics Simulations

### 16.7.1 Particle-in-Cell (PIC)
- Particles: Lagrangian (push by Lorentz force).
- Fields: Eulerian grid (Maxwell's equations).
- Algorithms: Boris push, Yee lattice (FDTD), current deposition (Villasenor-Buneman).
- Codes: OSIRIS, EPOCH, Smilei, WarpX, VPIC.
- Applications: Laser-plasma, wakefield acceleration, magnetic reconnection, shocks.

### 16.7.2 Vlasov Codes (Continuum)
- Direct discretization of f(x,v,t) in phase space.
- Semi-Lagrangian, discontinuous Galerkin.
- Codes: Gkeyll, GYSELA, Selalib.
- No statistical noise, but high dimensionality (6D).

### 16.7.3 Gyrokinetics
- Average over gyromotion, reduce 6D → 5D.
- Codes: GENE, GYRO, GS2, CGYRO, XGC.
- Tokamak turbulence, transport.

### 16.7.4 MHD Codes
- Single-fluid, extended MHD (Hall, two-fluid).
- Codes: ATHENA, RAMSES, PLUTO, MPI-AMRVAC.
- Solar corona, accretion disks, ISM, ICM.

## 16.8 Condensed Matter and Materials Simulations

### 16.8.1 Density Functional Theory (DFT)
- Kohn-Sham equations: [-½∇² + V_eff(r)] ψ_i = ε_i ψ_i
- V_eff = V_ext + V_H + V_xc
- XC functionals: LDA, GGA (PBE), meta-GGA, hybrid (HSE), DFT+U, vdW.
- Codes: VASP, Quantum ESPRESSO, ABINIT, CP2K, GPAW, FHI-aims.
- Plane waves, localized orbitals, real-space grids.

### 16.8.2 Beyond DFT
- **GW approximation**: Quasiparticle energies, band gaps.
- **DMFT**: Strongly correlated electrons (Hubbard model).
- **Quantum Monte Carlo**: VMC, DMC, AFQMC (exact for model Hamiltonians).
- **Tensor Networks**: MPS, PEPS, MERA (1D/2D quantum systems).
- **Machine Learning Potentials**: Neural network PES (DeePMD, ANI, GAP).

### 16.8.3 Molecular Dynamics (MD)
- Classical: Verlet, velocity Verlet, Langevin, Nosé-Hoover.
- Force fields: Lennard-Jones, Buckingham, EAM, ReaxFF, polarizable.
- Codes: LAMMPS, GROMACS, NAMD, HOOMD-blue, OpenMM.
- Enhanced sampling: Metadynamics, umbrella sampling, REMD.
- Ab initio MD: Born-Oppenheimer MD, Car-Parrinello MD.

## 16.9 Machine Learning in Computational Physics

### 16.9.1 Emulators / Surrogate Models
- Gaussian Processes, Neural Networks, Polynomial Chaos.
- Emulate expensive simulators (cosmology, nuclear, climate).
- Active learning, Bayesian optimization.

### 16.9.2 ML for Inverse Problems
- Parameter inference (likelihood-free inference, SBI).
- Field-level inference (Bayesian reconstruction).
- Codes: sbi, PyMC, NumPyro, JAX.

### 16.9.3 ML-Accelerated Simulations
- Learned time-steppers (PDE-Net, FNO, DeepONet).
- Learned subgrid models (SGS for LES, closure for RANS).
- Learned potential energy surfaces (NequIP, Allegro, MACE).
- Hybrid ML/traditional: ML corrects DFT, DFT corrects ML.

### 16.9.4 Generative Models for Physics
- Normalizing flows, diffusion models, VAEs.
- Generate configurations (lattice QCD, Ising, cosmology).
- Accelerate Monte Carlo sampling.

## 16.10 High-Performance Computing (HPC) Landscape

### 16.10.1 Hardware Trends
- **Exascale**: Frontier (AMD CPU+GPU), Aurora (Intel CPU+GPU), Fugaku (ARM A64FX).
- **GPU acceleration**: CUDA, HIP, SYCL, Kokkos, RAJA.
- **Heterogeneous**: CPU + GPU + FPGA.
- **Quantum computing**: NISQ devices, variational algorithms (VQE, QAOA).

### 16.10.2 Software Ecosystem
- **Parallel programming**: MPI, OpenMP, OpenACC, CUDA, HIP, oneAPI.
- **Libraries**: PETSc, Trilinos, Hypre, MAGMA, cuBLAS, cuFFT, NCCL.
- **Frameworks**: AMReX, Charm++, Legion, HPX, UPC++.
- **Containers**: Apptainer/Singularity, Docker.
- **Workflows**: Snakemake, Nextflow, FireWorks, Parsl.

### 16.10.3 Data and I/O
- **Formats**: HDF5, ADIOS2, NetCDF, Zarr.
- **Compression**: ZFP, SZ, Blosc (lossy/lossless for scientific data).
- **Analysis**: yt, ParaView, VisIt, PyVista, Datoviz.

## 16.11 Verification, Validation, and Uncertainty Quantification (VVUQ)

### 16.11.1 Verification
- **Code verification**: Method of manufactured solutions (MMS), order-of-accuracy tests.
- **Solution verification**: Grid convergence (Richardson extrapolation), GCI.

### 16.11.2 Validation
- Comparison with analytical solutions, experiments, observations.
- Hierarchical validation: unit physics → integrated experiments → full system.

### 16.11.3 Uncertainty Quantification (UQ)
- **Aleatoric** (inherent randomness) vs. **Epistemic** (model/form/parametric uncertainty).
- Methods: Monte Carlo, Polynomial Chaos, Stochastic Collocation, Bayesian calibration.
- Sensitivity analysis: Sobol indices, Morris screening.

## 16.12 Summary

Computational physics spans the entire micro-to-macro chain. Lattice QCD solves QCD non-perturbatively; nuclear many-body methods build nuclei from chiral EFT; stellar codes simulate explosions and mergers; cosmological simulations build the cosmic web; numerical relativity solves Einstein's equations for strong gravity; PIC and gyrokinetics capture kinetic plasma physics; DFT and MD simulate materials. Machine learning is transforming the field, accelerating simulations, enabling inverse problems, and creating new paradigms. Exascale computing and AI-driven methods will push the frontiers of what is computable, bringing the micro-to-macro chain into ever-sharper focus.

---

*This document completes the computational physics section (DOC-16). The final document (DOC-17) provides the Grand Synthesis: a unified mathematical narrative connecting all 16 documents, the philosophical implications, and the open frontiers of the micro-to-macro program.*