## 1. Simulation Model Commonality

### 1.1 FEM Structural Models (Abaqus)

| Model Component | RM Editions | RW Editions | Commonality |
|-----------------|-------------|-------------|-------------|
| **Tile JH-2 Model** | Identical | Identical | 100% |
| **STF Viscoelastic** | Identical | Identical | 100% |
| **UHMWPE Orthotropic** | Identical | Identical | 100% |
| **Baleen Orthotropic** | Identical | Identical | 100% |
| **Silk Hyperelastic** | Identical | Identical | 100% |
| **Contact Definition** | Identical | Identical | 100% |
| **Geometry** | Edition-specific | Edition-specific | 0% |
| **Mesh Density** | 2.5-3.2M elements | 2.5-3.2M elements | 85% |
| **Validation Error** | ±0.2% V₅₀ | ±0.2% V₅₀ | 100% |

### 1.2 Thermal FEM Models (Abaqus)

| Model Component | RM Editions | RW Editions | Commonality |
|-----------------|-------------|-------------|-------------|
| **Layer Stack** | Identical 12 layers | Identical 12 layers | 100% |
| **Material Props** | Temp-dependent k,ρ,Cp | Same | 100% |
| **Boundary Cond** | 1100°C, h=50, 300s | Same | 100% |
| **Geometry** | Edition-specific | Edition-specific | 0% |
| **Mesh** | 400-520K elements | 400-520K elements | 85% |
| **Validation Error** | ±1.5°C | ±1.5°C | 100% |

### 1.3 EMI Models (CST Studio Suite)

| Model Component | RM Editions | RW Editions | Commonality |
|-----------------|-------------|-------------|-------------|
| **MXene Dispersive** | σ=5000 S/cm, ε=12-j3 | Same | 100% |
| **Tile Geometry** | Edition-specific | Edition-specific | 0% |
| **Seam Modeling** | Double gasket + MXene tape | Same | 100% |
| **Farthingale** | N/A | Edition-specific | 50% |
| **Mesh** | 2.0-2.5M hex | 2.0-2.5M hex | 90% |
| **Validation Error** | ±1.5 dB | ±1.5 dB | 100% |

### 1.4 Drape & Mobility (ANSYS + MSC Adams)

| Model Component | RM Editions | RW Editions | Commonality |
|-----------------|-------------|-------------|-------------|
| **Fabric Model** | Orthotropic shell | Same | 100% |
| **Bending Rigidity** | 0.75-1.25 mN·m | 0.75-1.25 mN·m | 100% |
| **Shear Rigidity** | 1.1-1.5 kN/m | 1.1-1.5 kN/m | 100% |
| **Geometry** | Doublet/Hose | Bodice/Skirt | 50% |
| **Validation Error** | ±2% drape, ±0.02 MI | ±2% drape, ±0.02 MI | 100% |

---
