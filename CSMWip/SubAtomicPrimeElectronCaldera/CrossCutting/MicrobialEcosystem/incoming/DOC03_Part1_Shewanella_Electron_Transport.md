# DOCUMENT 3: Anaerobic Dissolution & Iron-Reducing Microbial Pathways
## Part 1 of 5: Shewanella Electron Transport to Structural Fe³⁺

**Source Expansion**: DeepResearch/Global Geological Clay Deposit Mapping.pdf (Lines 76-100)
**Target**: ~180 lines per part × 5 parts = ~900 lines total
**Document ID**: DOC03_Anaerobic_Dissolution_Iron_Reducing_Pathways.md

---

## 3.1 Shewanella oneidensis MR-1 Electron Transport to Structural Fe³⁺

### 3.1.1 The Dissimilatory Iron Reduction Pathway

In submerged environments, subterranean wetlands, and deep soil horizons where oxygen is systematically depleted, the natural trajectory of clay alteration shifts violently from oxidation to reduction. Specific dissimilatory iron-reducing bacteria (DIRB), most notably those belonging to the genus *Shewanella*, possess the evolutionary capability to utilize the structural ferric iron (Fe³⁺) bound directly within the octahedral sheets of smectite and illite clays as a terminal electron acceptor during their anaerobic respiration.

### 3.1.2 Shewanella oneidensis MR-1: Model Organism

*Shewanella oneidensis* strain MR-1 (isolated from Oneida Lake, NY) is the paradigmatic DIRB. Key features:

- **Genome:** 4.9 Mb, 4,758 predicted ORFs
- **c-type cytochromes:** 42 (unusually high)
- **Terminal reductases:** MtrC/OmcA (outer membrane), CymA (periplasmic)
- **Electron acceptors:** O₂, NO₃⁻, Mn⁴⁺, Fe³⁺ (soluble & solid), U⁶⁺, Cr⁶⁺, fumarate, TMAO, DMSO
- **Growth on clay Fe³⁺:** Doubling time ~6–12 hr (vs ~40 min on fumarate)

### 3.1.3 Electron Transport Chain to Solid-Phase Fe³⁺

The Mtr (metal-reducing) pathway:

```
Inner Membrane          Periplasm          Outer Membrane         Extracellular
─────────────          ─────────          ─────────────         ─────────────
                    
NADH → CymA → ───────→ MtrA → ─────────→ MtrC/OmcA → ─────────→ Fe³⁺ (clay)
  (menaquinone)       (decaheme cyt)     (decaheme cyt)        (structural)
```

**Detailed steps:**

1. **Cytoplasmic membrane:** NADH dehydrogenase (Complex I) → menaquinone (MQ) pool
   $$\text{NADH} + \text{H}^+ + \text{MQ} \rightarrow \text{NAD}^+ + \text{MQH}_2 \quad \Delta G^\circ = -50\ \text{kJ/mol}$$

2. **Periplasmic face:** CymA (tetraheme c-cyt) oxidizes MQH₂
   $$\text{MQH}_2 + 2\text{CymA}_{\text{Fe}^{3+}} \rightarrow \text{MQ} + 2\text{CymA}_{\text{Fe}^{2+}} + 2\text{H}^+$$

3. **Periplasmic shuttle:** MtrA (decaheme c-cyt) receives electrons from CymA
   $$2\text{CymA}_{\text{Fe}^{2+}} + \text{MtrA}_{\text{Fe}^{3+}} \rightarrow 2\text{CymA}_{\text{Fe}^{3+}} + \text{MtrA}_{\text{Fe}^{2+}}$$

4. **Outer membrane translocation:** MtrB (β-barrel porin) conducts MtrA to surface

5. **Terminal reductases:** MtrC and OmcA (decaheme c-cyts) on cell surface
   $$\text{MtrA}_{\text{Fe}^{2+}} + \text{MtrC}_{\text{Fe}^{3+}} \rightarrow \text{MtrA}_{\text{Fe}^{3+}} + \text{MtrC}_{\text{Fe}^{2+}}$$

6. **Solid-phase Fe³⁺ reduction:** Direct contact or flavin-mediated
   $$\text{MtrC}_{\text{Fe}^{2+}} + \text{Fe}^{3+}_{\text{clay}} \rightarrow \text{MtrC}_{\text{Fe}^{3+}} + \text{Fe}^{2+}_{\text{clay}}$$

### 3.1.4 Electron Transfer Kinetics to Clay Surfaces

**Direct contact mechanism:** Cell-clay adhesion via:
- Type IV pili (conductive "nanowires")
- Extracellular polymeric substances (EPS)
- Outer membrane vesicles (OMVs)

**Flavin-mediated mechanism:** Secreted riboflavin (FMN/FAD) shuttles electrons:
$$\text{MtrC}_{\text{Fe}^{2+}} + \text{FMN} \rightarrow \text{MtrC}_{\text{Fe}^{3+}} + \text{FMNH}_2$$
$$\text{FMNH}_2 + \text{Fe}^{3+}_{\text{clay}} \rightarrow \text{FMN} + \text{Fe}^{2+}_{\text{clay}} + 2\text{H}^+$$

**Rate constants (25°C, pH 7):**
| Mechanism | $k_{\text{et}}$ (s⁻¹) | Distance Dependence |
|-----------|----------------------|---------------------|
| Direct contact | 10–100 | Exponential decay, $\beta \approx 1.0\ \text{Å}^{-1}$ |
| Flavin shuttle | 1–10 | Diffusive, $D \approx 10^{-6}\ \text{cm}^2/\text{s}$ |

### 3.1.5 Thermodynamics of Clay Fe³⁺ Reduction

**Half-reaction potentials:**
$$\text{Fe}^{3+}_{\text{aq}} + e^- \rightarrow \text{Fe}^{2+}_{\text{aq}} \quad E^\circ = +0.771\ \text{V}$$
$$\text{Fe(OH)}_3 + 3\text{H}^+ + e^- \rightarrow \text{Fe}^{2+} + 3\text{H}_2\text{O} \quad E^\circ = +0.56\ \text{V}$$

**Structural Fe³⁺ in smectite:** $E^\circ \approx +0.15$ to $+0.35\ \text{V}$ (pH 7)
- Lower potential due to crystal field stabilization
- Octahedral coordination stabilizes Fe³⁺ over Fe²⁺

**Energy yield for Shewanella:**
$$\Delta G = -nF\Delta E$$

With acetate donor ($E^\circ = -0.29\ \text{V}$) and clay Fe³⁺ acceptor ($E^\circ = +0.25\ \text{V}$):
$$\Delta E = 0.54\ \text{V} \quad \rightarrow \quad \Delta G = -52\ \text{kJ/mol e}^-$$

Per mole acetate (8 e⁻): $\Delta G \approx -416\ \text{kJ/mol}$
Theoretical ATP yield: ~10–12 ATP (vs 38 for O₂ respiration)

---

## 3.2 Reduction Potential of Octahedral Fe³⁺ in Smectite/Illite: E°′ Calculations

### 3.2.1 Crystal Field Effects on Redox Potential

The reduction potential of structural Fe depends on:
1. **Coordination environment:** Octahedral (Oh) vs tetrahedral
2. **Layer charge:** Tetrahedral vs octahedral substitution
3. **Local Al/Si ratio:** Inductive effects
4. **Interlayer cation:** K⁺, Na⁺, Ca²⁺, Mg²⁺ effects
5. **Water activity:** Hydration state of interlayer

### 3.2.2 Measured Potentials for Clay Minerals

| Clay Mineral | Structural Fe³⁺/Fe²⁺ | $E^\circ$ (V vs SHE, pH 7) | Method |
|--------------|---------------------|---------------------------|--------|
| Nontronite (Fe³⁺-smectite) | 1.5 Fe³⁺/O₁₀(OH)₂ | +0.12 to +0.22 | Mediated electrochemistry |
| Ferruginous smectite | 0.5 Fe³⁺/O₁₀(OH)₂ | +0.25 to +0.35 | Protein film voltammetry |
| Illite (Fe-bearing) | 0.2 Fe³⁺/O₁₀(OH)₂ | +0.30 to +0.40 | Redox titration |
| Glauconite | 0.8 Fe³⁺/O₁₀(OH)₂ | +0.20 to +0.30 | Spectroelectrochemistry |
| Chlorite (Fe-rich) | 1.2 Fe³⁺/O₁₀(OH)₂ | +0.18 to +0.28 | Mediated electrochemistry |

### 3.2.3 Theoretical Calculation: Ligand Field Stabilization Energy (LFSE)

For high-spin Fe³⁺ (d⁵) and Fe²⁺ (d⁶) in octahedral field:

$$\text{LFSE}(\text{Fe}^{3+}) = 0 \quad (\text{all orbitals half-filled})$$
$$\text{LFSE}(\text{Fe}^{2+}) = -0.4 \Delta_o \quad (t_{2g}^4 e_g^2)$$

Stabilization of Fe³⁺ relative to Fe²⁺:
$$\Delta E_{\text{LFSE}} = \frac{0.4 \Delta_o}{F} \approx \frac{0.4 \times 10,000\ \text{cm}^{-1} \times 1.986 \times 10^{-23}\ \text{J}}{96,485\ \text{C/mol}} \approx 0.08\ \text{V}$$

Where $\Delta_o \approx 10,000\ \text{cm}^{-1}$ for Fe-O in clay.

### 3.2.4 pH Dependence: Pourbaix Diagram for Clay-Fe

The reduction involves proton coupling:
$$\equiv\text{Fe}^{3+}\text{-OH} + e^- + \text{H}^+ \rightarrow \equiv\text{Fe}^{2+}\text{-OH}_2$$

Nernst equation:
$$E = E^\circ - \frac{RT}{F}\ln\left(\frac{[\text{Fe}^{2+}]}{[\text{Fe}^{3+}]}\right) - \frac{RT}{F}\ln a_{\text{H}^+}$$

At 25°C: $E = E^\circ - 0.059\log([\text{Fe}^{2+}]/[\text{Fe}^{3+}]) - 0.059\text{pH}$

**Slope: -59 mV/pH** (1 H⁺ per e⁻)

### 3.2.5 Competitive Electron Acceptors

| Acceptor | $E^\circ$ (V, pH 7) | $\Delta G$ (kJ/mol e⁻) vs Acetate | Preference Order |
|----------|---------------------|-----------------------------------|------------------|
| O₂ | +0.82 | -108 | 1 (highest) |
| NO₃⁻ | +0.42 | -69 | 2 |
| Mn⁴⁺ (oxide) | +0.40 | -67 | 3 |
| Fe³⁺ (clay) | +0.25 | -52 | 4 |
| Fumarate | +0.03 | -31 | 5 |
| CO₂ (methanogenesis) | -0.24 | -5 | 6 (lowest) |

**Clay Fe³⁺ is a mid-tier electron acceptor** — used after O₂, NO₃⁻, Mn⁴⁺ are depleted.

---

*End of Part 1 — Continue to Part 2: Dehydroxylation, Layer Charge Neutralization, and Crystal Lattice Destabilization*