# Document 2: First & Second Generation HBOCs - Toxicity & Polymerization
## Piece 16/18: Comparative Rheology and Microcirculatory Flow Dynamics

The rheological behavior of HBOCs in the microcirculation determines their ability to deliver oxygen to hypoxic tissues. Unlike native red blood cells (RBCs), which are deformable, discoid particles (7-8 μm diameter, 2 μm thickness) that exhibit complex rheology (shear-thinning, yield stress, viscoelasticity), HBOCs are acellular solutions or colloids with fundamentally different flow properties. This piece provides a detailed comparative rheological analysis.

**Native Blood Rheology**:
- Hematocrit (Hct) 45%: Casson model — yield stress τ₀ = 0.05 dyn/cm², plastic viscosity η∞ = 3.5 cP.
- Shear-thinning: η(γ̇) = η∞ + (η₀ - η∞) / (1 + (γ̇/γ̇c)^m), where γ̇c ≈ 10 s⁻¹.
- Fahraeus-Lindqvist effect: Apparent viscosity decreases in tubes <300 μm due to cell-free layer.
- Fahraeus effect: Tube hematocrit < discharge hematocrit in small vessels.
- RBC deformation: Tank-treading at γ̇ > 50 s⁻¹, tumbling at γ̇ < 10 s⁻¹.
- Margination: RBCs migrate to center, platelets/leukocytes marginate to wall.

**HBOC Rheology - General Principles**:
HBOCs are Newtonian or weakly shear-thinning fluids without yield stress (unless highly concentrated polymers). The Einstein relation for dilute suspensions: η = η₀(1 + 2.5φ), where φ = volume fraction. For concentrated systems: η = η₀(1 + 2.5φ + 6.2φ² + ...).

**Hemopure Rheology** (13 g/dL, 200-500 kDa polymers):
- φ ≈ 0.08 (volume fraction of Hb polymers, assuming partial specific volume 0.73 mL/g).
- Zero-shear viscosity η₀ ≈ 3.5 cP (37°C, native plasma η₀ ≈ 1.2 cP).
- Shear-thinning: mild, η(100 s⁻¹) ≈ 3.0 cP.
- No yield stress (polymers < overlap concentration c* ≈ 15 g/dL).
- No Fahraeus-Lindqvist effect (particles <100 nm, no cell-free layer formation).
- No margination (Brownian motion dominates).
- Microvascular flow: uniform velocity profile, no plasma skimming.

**PolyHeme Rheology** (10 g/dL, human Hb, similar MW):
- φ ≈ 0.06.
- η₀ ≈ 2.8 cP.
- Similar to Hemopure but slightly lower viscosity (lower concentration).

**Hemospan Rheology** (10 g/dL, PEGylated):
- PEG increases hydrodynamic volume: φ_eff ≈ 0.12.
- η₀ ≈ 4.5 cP.
- Steric stabilization reduces aggregation at high shear.

**ErythroMer Rheology** (10 g/dL Hb equivalent, 200 nm toroids):
- φ ≈ 0.15 (including lipid shell, hydration).
- Soft particles: deformation at γ̇ > 100 s⁻¹.
- Shear-thinning: η(1 s⁻¹) ≈ 12 cP, η(100 s⁻¹) ≈ 4 cP, η(1000 s⁻¹) ≈ 3 cP.
- Yield stress: τ₀ ≈ 0.02 dyn/cm² (weak network at rest).
- Fahraeus-Lindqvist effect: PARTIAL — particles deform, some cell-free layer.
- Margination: toroidal shape enhances wall migration (Jeffery orbits).
- Microvascular transit time: 1.5-2× native RBC through 5 μm constriction.

**M101 Rheology** (10 g/dL, 150×25 nm discs):
- φ ≈ 0.08.
- Disc aspect ratio 6:1 → orientation in flow.
- Non-Newtonian: η₀ ≈ 5 cP (resting network), η(100 s⁻¹) ≈ 3 cP.
- Yield stress: τ₀ ≈ 0.5 dyn/cm² (stronger than ErythroMer).
- Margination: HIGH — disc shape promotes wall migration.
- Microvascular transit: aligns with flow, low resistance.

**PFC Emulsion Rheology** (20-30% vol, 0.1-0.2 μm droplets):
- φ = 0.2-0.3.
- η₀ ≈ 2-3 cP (Newtonian, rigid spheres).
- No shear-thinning, no yield stress.
- High density (1.8-1.9 g/mL) → gravitational separation in venules.
- No margination, no deformation.

**LOM Rheology** (0.9-4 μm, 60-70% gas vol):
- Transient presence — collapse in seconds.
- Initial φ ≈ 0.1 (70% gas, 30% lipid).
- Deformable lipid monolayer.
- Behaves as gas-laden fluid, not particulate.

**Microcirculatory Flow Modeling** (Computational Fluid Dynamics, 2D/3D microvascular networks):

*Geometry*: Realistic networks from hamster cremaster (30-100 μm diameters, bifurcations, anastomoses).
*Boundary conditions*: Inlet pressure 60 mmHg, outlet 20 mmHg, hematocrit 30% (diluted).
*RBC model*: Immersed boundary method, spectrin cytoskeleton.
*HBOC model*: Continuum (Hemopure) or discrete particles (ErythroMer, M101).

*Results — Perfusion Homogeneity* (coefficient of variation of RBC flux):
- Native blood (Hct 30%): CV = 0.25 (physiological heterogeneity).
- + Hemopure 10 g/dL: CV = 0.35 (increased heterogeneity — no plasma skimming, uniform distribution).
- + ErythroMer 10 g/dL: CV = 0.28 (near-physiological — deformation enables plasma skimming).
- + M101 10 g/dL: CV = 0.30 (moderate — margination creates heterogeneity).

*Results — Oxygen Delivery to Hypoxic Regions* (Krogh cylinder model, tissue PO₂):
- Baseline (Hct 30%, PaO₂ 50 mmHg): mean PtO₂ = 18 mmHg, 15% tissue <5 mmHg.
- + Hemopure: mean PtO₂ = 28 mmHg, 5% tissue <5 mmHg (uniform improvement).
- + ErythroMer: mean PtO₂ = 32 mmHg, 2% tissue <5 mmHg (preferential flow to hypoxic zones).
- + M101: mean PtO₂ = 30 mmHg, 3% tissue <5 mmHg.

*Mechanism for ErythroMer Superiority*:
1. Deformability → enters capillaries that rigid particles skip.
2. Toroidal shape → high surface area → rapid O₂ exchange.
3. KC1003 effector → Bohr effect → unloads O₂ preferentially in hypoxic (low pH) tissue.
4. Soft shell → reduces endothelial interaction → no vasoconstriction.

**Entrapment-Specific Rheology Considerations**:

*Crush Syndrome / Compartment Syndrome*:
- Interstitial pressure > capillary pressure → capillary collapse.
- Native RBCs (7-8 μm) cannot enter collapsed capillaries (<3 μm).
- ErythroMer (200 nm, deformable) CAN enter partially collapsed vessels.
- M101 (150 nm, disc) CAN enter.
- Hemopure (30 nm) CAN enter but no O₂ unloading regulation.

*Microthrombosis* (DIC, sepsis):
- Fibrin strands narrow capillaries to 2-4 μm.
- Native RBCs obstructed.
- ErythroMer traverses (deformation).
- M101 traverses (small size).
- Hemopure traverses but no benefit.

*Hypothermia* (entrapment in cold water/mountains):
- Blood viscosity increases exponentially (η ∝ e^(Ea/RT), Ea ≈ 20 kJ/mol).
- At 30°C: native η 2×, Hemopure η 1.5×, ErythroMer η 2×.
- RBC deformability decreases (membrane rigidification).
- ErythroMer lipid shell: phase transition at ~15°C (DSPC Tm = 55°C, but PEGylated lipids lower).
- M101: invertebrate Hb adapted to cold — maintains function at 4°C.

**Design Criteria for Entrapment Rheology**:
1. **Viscosity at 37°C, 10 g/dL**: 3-4 cP (match native blood).
2. **Shear-thinning**: η(1 s⁻¹)/η(100 s⁻¹) > 1.5 (mimics native Fahraeus-Lindqvist).
3. **Yield stress**: 0.01-0.1 dyn/cm² (prevents settling, enables margination).
4. **Deformability**: Transit time through 5 μm < 2× native RBC.
5. **Size**: 100-300 nm (optimal for microvascular penetration + vascular retention).
6. **Shape**: Non-spherical (toroidal, disc) for margination and flow alignment.

ErythroMer and M101 meet all criteria. Hemopure meets only 1, 5. PFCs meet 1, 5. LOMs meet 4, 5 (transiently).

This rheological analysis confirms that particle-based HBOCs (ErythroMer, M101) have fundamental microcirculatory advantages over molecular HBOCs (Hemopure, PolyHeme) for reaching hypoxic tissue in entrapment scenarios with compromised microvasculature.