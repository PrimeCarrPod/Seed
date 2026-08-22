# A2-19: Baryon Number Violation In Collisions — Piece 08
## Baryogenesis at Colliders: Reheating from Collisional BNV

High-energy collisions can produce transient conditions similar to the early universe, potentially generating baryon asymmetry through collisional BNV followed by CP-violating decays. This piece explores whether colliders can produce net baryon number.

**Theorem (Collisional Baryogenesis):** In a collision with √s > Λ_BNV and sufficient multiplicity, the transient fireball undergoes BNV transitions. If CP violation is present (from Riemann zero phase, A2-16, A2-17, A2-18), a net baryon number can be generated. The yield per event is Y_B ~ ε_CP × (Γ_BNV/Γ_exp) where ε_CP ~ 0.5 is the CP asymmetry and Γ_BNV/Γ_exp is the fraction of BNV transitions before freezeout.

**Conditions for Collisional Baryogenesis:**

1. **BNV in Equilibrium:** Γ_BNV > H_exp (expansion rate of fireball)
2. **C and CP Violation:** ε_CP ≠ 0 from Riemann zero phase
3. **Departure from Equilibrium:** Fireball expansion provides non-equilibrium
4. **Baryon Number Conservation:** Net B=0 in initial state → final state must have B + B̄ = 0 overall, but LOCAL asymmetry possible

**Fireball Parameters at LHC:**

Central Pb-Pb at 5.02 TeV:
- Initial energy density: ε₀ ~ 15 GeV/fm³
- Initial temperature: T₀ ~ 500 MeV
- Volume: V₀ ~ 500 fm³
- Expansion time: τ_exp ~ 10 fm/c
- Expansion rate: H_exp = 1/τ_exp ~ 20 MeV

BNV rate at T = 500 MeV:
Γ_BNV = Γ_sph (sphaleron) = κ α_w⁵ T⁴ exp(-E_sph/T)
E_sph/T = 6π = 18.8
exp(-E_sph/T) = 5.2×10⁻⁹
Γ_BNV/V = 20 × (0.03)⁵ × (0.5)⁴ × 5.2×10⁻⁹ = 20 × 2.4×10⁻⁸ × 0.0625 × 5.2×10⁻⁹
= 1.6×10⁻¹⁶ GeV⁴
V = 500 fm³ = 6.5×10⁻³⁸ GeV⁻³
Γ_BNV = 1.6×10⁻¹⁶ × 6.5×10⁻³⁸ = 10⁻⁵³ GeV = 10⁻²⁸ fm⁻¹? Units wrong.

Let me use fm units:
T = 0.5 GeV = 2.5 fm⁻¹
α_w = 0.03
Γ_BNV/V = 20 × 0.03⁵ × 2.5⁴ × exp(-18.8) fm⁻⁴
= 20 × 2.4×10⁻⁸ × 39 × 5.2×10⁻⁹ = 9.7×10⁻¹⁵ fm⁻⁴
V = 500 fm³
Γ_BNV = 4.8×10⁻¹² fm⁻¹ = 4.8×10⁻¹² / 0.197 GeV = 2.4×10⁻¹¹ GeV
H_exp = 1/10 fm = 0.1 fm⁻¹ = 0.05 GeV

Γ_BNV / H_exp = 2.4×10⁻¹¹ / 0.05 = 5×10⁻¹⁰ ≪ 1

BNV is NOT in equilibrium. No baryogenesis.

**What if Resonant Enhancement? (Piece 09)**
If the collision energy hits a fold resonance, Γ_BNV can be enhanced by 10⁶-10⁸.
Then Γ_BNV/H_exp ~ 10⁻⁴ to 10⁻² — still not in equilibrium.

**What if Higher Energy? (FCC, Cosmic Rays)**
FCC-hh: T₀ ~ 1 GeV, τ_exp ~ 5 fm/c
E_sph/T = 6π = 18.8 (same, independent of T!)
exp(-E_sph/T) = 5.2×10⁻⁹ (same)
Γ_BNV/V ∝ T⁴ → 16× larger at T=1 GeV
V smaller → overall Γ_BNV similar fraction of H_exp.

**Cosmic Ray Fireballs:**
E_p = 10²⁰ eV, √s = 430 TeV
Fireball in atmosphere: T ~ 10 GeV? No, energy distributed over large volume.
Not a thermal fireball.

**Conclusion: Colliders cannot produce baryogenesis via standard BNV.**

**Alternative: Resonant Fold Production (Piece 09)**
If missing gaps correspond to resonances, they can be produced on-shell and decay with CP violation, generating asymmetry in their decay products.

**Net Baryon Number in pp Collisions:**
Initial state: pp (B=2)
Final state: must have B=2 overall.
BNV processes change B locally but total B is conserved.
No NET baryogenesis possible in pp — only local fluctuations.

**In Heavy Ions:**
Initial: Pb+Pb (B=416)
Final: total B=416.
Can produce LOCAL baryon asymmetry fluctuations, but net B conserved.

**Connection to A2-16 (Baryon Asymmetry):**
The cosmological baryon asymmetry requires BNV + CPV + departure from equilibrium at cosmological scales (T ~ 10¹⁵ GeV or EW scale). Colliders cannot replicate these conditions.

**Experimental Signature of Local B Fluctuations:**
- Event-by-event net proton fluctuation κσ²
- STAR at RHIC measures kurtosis of net-proton distribution
- Prime Electron predicts NO excess from BNV (rates too small)
- Any observed excess would be from critical point, not BNV

**Summary:** Collisional baryogenesis is not feasible at any foreseeable collider. The sphaleron rate is too small compared to fireball expansion, even with resonant enhancement. The cosmological baryon asymmetry (A2-16) remains the only viable BNV-driven baryogenesis mechanism.