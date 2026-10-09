# Methodology Appendix — Computational Protocols

**Project 10: Prime Electron Caldera Synthesis**  
**Source:** Caldera Section 12 (Mathematical Compendium)  
**Generated:** $(date -u +"%Y-%m-%d %H:%M:%S UTC")

---

## Contents

### Jupyter Notebooks (Python)
| Notebook | Description | Caldera Section |
|----------|-------------|-----------------|
| `01_prime_counting_algorithms.ipynb` | Meissel-Lehmer, LMO, Odlyzko-Schönhage | 12, Pieces 1-3 |
| `02_riemann_zeros.ipynb` | Riemann-Siegel, zero finding | 6, 12, Pieces 4-5 |
| `03_spectral_form_factor.ipynb` | SFF dip-ramp-plateau from gap Hamiltonian | 7, 12 |

### Julia Scripts
| Script | Description | Caldera Section |
|--------|-------------|-----------------|
| `01_prime_counting.jl` | Meissel-Lehmer, LMO, Odlyzko-Schönhage | 12, Pieces 1-3 |
| `02_gap_hamiltonian.jl` | Gap Hamiltonian, SFF computation | 7, 12 |
| `03_cross_validation.jl` | Full cross-validation test suite | 12 |

---

## Computational Verification Standards

All algorithms in Section 12 are:
- **Derived from π(x) primitive** — no free parameters
- **Cross-validated** — Meissel-Lehmer = LMO = Odlyzko-Schönhage for π(x); Riemann-Siegel = Odlyzko-Schönhage for zeros
- **Polynomial/quasi-polynomial scaling** — verified
- **Deterministic** — identical results across implementations
- **Parameter-free** — no empirical inputs

---

## Reproducibility

Run all notebooks/scripts to verify:
```bash
# Jupyter
jupyter notebook jupyter/01_prime_counting_algorithms.ipynb

# Julia
julia julia/01_prime_counting.jl
julia julia/03_cross_validation.jl  # Full test suite
```

---

## Data Dependencies

PrimeBookOne tiles required:
- `primebookone/0.0/Tile00.zip` through `Tile188.zip` (94,500 gaps)
- Additional directories for Sections 2-10

See `DATA_ACCESS_PrimeBookOne_Tile_Index.md` for access details.
