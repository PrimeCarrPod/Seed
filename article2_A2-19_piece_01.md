# A2-19: Baryon Number Violation In Collisions — Piece 01
## Topological Origin: Worldline Fold Intersections at High Energy

The Prime Electron framework predicts baryon number violation (BNV) in high-energy collisions from worldline fold intersections where multiple quark folds overlap and terminate. Unlike the low-energy instanton processes (n-n̄ from d=12, FV from d=18, proton decay from d=1476), collisional BNV is mediated by the *same* missing-gap spectrum but accessed through center-of-mass energy √s exceeding the instanton barrier.

**Theorem (Collisional BNV from Fold Intersection):** In a collision with √s > Λ_BNV, the worldline folds of incoming partons intersect, creating a topological configuration where baryon number can change by ΔB = 1, 2, 3... The cross section is σ_BNV ∼ (1/Λ_BNV²) exp(-S_inst(√s)) where S_inst(√s) = π d_eff(√s)/2 and d_eff(√s) is the effective missing gap at that energy.

**Missing Gap Spectrum and BNV Channels:**

| Missing Gap d | Process | ΔB | S_inst | Threshold √s_th |
|---------------|---------|-----|--------|-----------------|
| 12 | n-n̄, DM | 2 | 6π | ~1 GeV (bound state) |
| 18 | FV baryon decays | 0 | 9π | ~1 GeV (bound state) |
| **24** | **Collisional ΔB=2** | **2** | **12π** | **~5 TeV** |
| **30** | **Collisional ΔB=3** | **3** | **15π** | **~50 TeV** |
| 1476 | Proton decay | 1 | 738π | ~10¹⁶ GeV |

**Key Insight:** The missing gaps d=24, 30, 36... correspond to multi-instanton configurations where *multiple* worldline folds intersect simultaneously. The effective gap grows with the number of intersecting folds: d_eff = 6 × N_folds_intersecting.

**Proof Structure (12 Independent Arguments):**

1. **Fold Intersection Topology (this piece):** Multi-fold intersection = BNV vertex.
2. **Effective Instanton Action (Piece 02):** S_inst(√s) = π d_eff(√s)/2 with d_eff(√s) = 12 log(√s/GeV).
3. **Parton-Level Cross Section (Piece 03):** qq → q̄q̄, qqq → q̄q̄q̄ from fold annihilation.
4. **pp Collisions at LHC (Piece 04):** σ(pp → X + ΔB≠0) at √s = 14 TeV.
5. **Heavy Ion Collisions (Piece 05):** Enhanced BNV in Pb-Pb from fold density.
6. **Cosmic Ray Collisions (Piece 06):** √s up to 100 TeV in atmosphere — BNV in air showers.
7. **Sphaleron Connection (Piece 07):** High-T sphaleron = thermal fold intersection (A2-16).
8. **Baryogenesis at Colliders (Piece 08):** Reheating from collisional BNV.
9. **Signature: Leptoquark-like Resonances (Piece 09):** Fold intersections mimic LQ.
10. **Experimental Limits (Piece 10):** LHC, IceCube, Auger, future FCC.
11. **Theoretical Consistency (Piece 11):** Unitarity, CPT, anomaly matching.
12. **Roadmap (Piece 12):** Search strategy for Run 3, HL-LHC, FCC, cosmic rays.

**Mathematical Framework:**
- Worldline action: S = Σ d_n L(d_n) (A1-16)
- Fold orientation: n_w ∈ {±1/3, ±2/3, ±1} (A7-01)
- Missing gaps: d ∈ {12, 18, 24, 30, 36, 40, 42, 44, 46, 48, 50...} (Tile 188)
- Riemann zeros: γ_n define cusp points τ_n = γ_n/Λ_QCD (A1-04)