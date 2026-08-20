# Document 2: First & Second Generation HBOCs - Toxicity & Polymerization
## Piece 6/18: Nitric Oxide Scavenging - Quantitative Biophysics and Mitigation Strategies

The interaction between hemoglobin and nitric oxide (NO) is the central biophysical determinant of HBOC vascular toxicity. Understanding this interaction at the quantitative level is essential for designing safer oxygen carriers.

**NO Synthesis and Physiology**: Endothelial NO synthase (eNOS, NOS3) converts L-arginine to NO and L-citrulline, using NADPH, O₂, tetrahydrobiopterin (BH₄), and calmodulin. Basal eNOS activity produces ~1-5 nM/s NO in the endothelial cytosol. NO diffuses radially: (1) Toward lumen — scavenged by RBC hemoglobin; (2) Toward smooth muscle — activates soluble guanylate cyclase (sGC) → cGMP → vasodilation. The competition between these pathways determines vascular tone.

**Reaction Kinetics**: 
- HbFe²⁺O₂ + NO → HbFe³⁺ + NO₃⁻ (k₁ = 1.4 × 10⁷ M⁻¹s⁻¹)
- HbFe²⁺ (deoxy) + NO → HbFe²⁺NO (nitrosyl-Hb, k₂ = 4 × 10⁷ M⁻¹s⁻¹)
- HbFe³⁺ (metHb) + NO → HbFe²⁺ + NO⁺ (oxidative, k₃ = 1 × 10⁵ M⁻¹s⁻¹)
- NO + O₂⁻ → ONOO⁻ (peroxynitrite, k₄ = 1.6 × 10¹⁰ M⁻¹s⁻¹)
- NO + sGC → activation (Kd ≈ 1-5 nM)

The diffusion-reaction equation for NO in a cylindrical vessel:
∂[NO]/∂t = D∇²[NO] - k₁[HbO₂][NO] - k₄[O₂⁻][NO] + S(r)
where D = 3300 μm²/s (NO diffusion coefficient), S(r) is the eNOS source term at r = R_vessel.

**Dimensionless Analysis**: The Damköhler number (Da) compares reaction rate to diffusion rate:
Da = k₁[HbO₂]R²/D
For native RBCs: [HbO₂] in RBC = 5 mM, but RBCs occupy 45% volume, and NO must diffuse through plasma gap (~0.5 μm). Effective Da ≈ 0.1 — diffusion dominates, NO reaches smooth muscle.
For cell-free Hb at 1 mM: Da ≈ 10 — reaction dominates, NO scavenged in lumen.
For Hemopure at 1 mM heme (13 g/dL): Da ≈ 10, but polymer size limits extravasation, so subendothelial [Hb] is lower.

**Quantitative Vasoconstriction Model**: 
Vascular resistance R = R₀ × (1 + α[Hb]eff)
where [Hb]eff = effective hemoglobin concentration at smooth muscle layer.
For native blood: [Hb]eff ≈ 0 (membrane barrier).
For SFH: [Hb]eff ≈ 0.5 × [Hb]plasma (extravasation).
For Hemopure: [Hb]eff ≈ 0.1 × [Hb]plasma (size-limited extravasation).
For ErythroMer: [Hb]eff ≈ 0 (lipid barrier).

Clinical correlation: MAP increase ≈ 20 × [Hb]eff (mmHg per mM heme).
SFH at 1 mM: MAP +10 mmHg (observed: 15-20).
Hemopure at 1.5 mM: MAP +15 mmHg (observed: 15-20).
ErythroMer at 1.5 mM: MAP +0-2 mmHg (observed: <5).

**Mitigation Strategies**:

1. **Size Increase (Polymerization)**: Reduces extravasation. Renal threshold 60 kDa; endothelial gap 5-10 nm (≈200-500 kDa for globular proteins). Hemopure (200-500 kDa) partially excludes from subendothelial space. Limitation: residual small oligomers; viscosity increase.

2. **Surface PEGylation**: Creates steric shield. PEG 5 kDa forms ~5 nm brush. Reduces NO access to heme by increasing diffusion path length. Hemospan: 50% NO scavenging reduction. Limitation: PEG reduces oxygen affinity (P50 6 mmHg); anti-PEG antibodies cause complement activation.

3. **Heme Pocket Modification**: Mutations to reduce NO on-rate. αV1M, βV1M (N-terminal valine to methionine) reduces NO binding 3-fold. rHb1.1 (Sangart) incorporated this. Limitation: may alter O₂ kinetics; recombinant cost.

4. **NO Delivery Co-Administration**: Inhaled NO (20-80 ppm) or NO donors (nitrosothiols, nitrates). Competes with Hb for scavenging. Clinical: Inhaled NO + Hemopure prevented MAP rise in sheep. Limitation: requires delivery system; metHb formation.

5. **S-Nitrosothiol (SNO) Loading**: Hb can carry SNO on β-Cys93, releasing NO in hypoxic tissues. Native RBCs do this. HBOCs lose this function. Recombinant Hb with enhanced SNO capacity (Cysβ93 mutants) under investigation.

6. **Carbon Monoxide (CO) Pre-binding**: CO-Hb has 200× lower NO reactivity. Pre-bind 5-10% CO, then dissociate in vivo. Transient protection. Limitation: CO toxicity; complex kinetics.

7. **Encapsulation (Third Generation)**: Physical barrier. ErythroMer lipid shell: NO diffusion coefficient in lipid ~10⁻⁸ cm²/s vs water 3×10⁻⁵ cm²/s. 1000-fold reduction in NO flux. Near-complete elimination of vasoconstriction.

**Entrapment Implications**: In confined hypoxia, basal NO production may be upregulated (shear stress, hypoxia-inducible factors). However, acidosis and oxidative stress can uncouple eNOS, producing O₂⁻ instead of NO — creating peroxynitrite. HBOCs that scavenge residual NO worsen this imbalance. The ideal entrapment HBOC must have [Hb]eff ≈ 0 at the smooth muscle layer — achievable only by encapsulation or natural extracellular Hb (M101) with intrinsically low NO reactivity.

**Mathematical Design Criterion**: For an HBOC to cause <5 mmHg MAP rise at 10 g/dL:
[Hb]eff < 0.25 mM heme
Given [Hb]plasma = 1.5 mM heme (10 g/dL),
Required extravasation fraction < 0.17
This requires either: MW > 200 kDa (partial), or physical barrier (complete), or intrinsic low NO reactivity (M101).