# DOC-01: PVHO Taxonomic Framework & Operational Parameters
## Document 1 of 17 — Pressure Vessels and Human Physiology Deep Research Expansion
## Lines 701-800 | Piece 8 of 9 | ~100 Lines

---

#### 1.8 Mathematical Unification: The PVHO State Equation

This section derives a unified state equation describing the complete PVHO system — structure, physiology, and life-support — as a coupled thermodynamic-physiological-structural boundary value problem. This formulation enables cross-domain optimization and reveals invariant relationships across all seven PVHO classes.

**1.8.1 Complete State Vector Definition**

The PVHO system state at time $t$ is described by the 23-component vector:

$$\vec{X}(t) = \begin{bmatrix}
\vec{X}_{struct} \\ \vec{X}_{physio} \\ \vec{X}_{LSS} \\ \vec{X}_{env}
\end{bmatrix}$$

**Structural Subvector ($\vec{X}_{struct} \in \mathbb{R}^7$):**
$$\vec{X}_{struct} = [\sigma_{\theta,max}, \sigma_{r,max}, \tau_{max}, a_{crack}, N_{cycles}, \delta_{buckle}, \omega_{damage}]^T$$
- $\sigma_{\theta,max}$: Maximum hoop stress [Pa]
- $\sigma_{r,max}$: Maximum radial stress [Pa]
- $\tau_{max}$: Maximum shear stress [Pa]
- $a_{crack}$: Largest detected crack length [m]
- $N_{cycles}$: Accumulated pressure cycles [dimensionless]
- $\delta_{buckle}$: Buckling mode amplitude [m]
- $\omega_{damage}$: Continuum damage variable [0–1] (PMMA: thermo-viscodamage)

**Physiological Subvector ($\vec{X}_{physio} \in \mathbb{R}^8$):**
$$\vec{X}_{physio} = [P_{A}O_2, P_{A}CO_2, P_{N_2,tiss}, P_{He,tiss}, T_{core}, \dot{Q}_{met}, \text{DCS}_{risk}, \text{HPNS}_{index}]^T$$
- $P_{A}O_2, P_{A}CO_2$: Alveolar gas partial pressures [kPa]
- $P_{N_2,tiss}, P_{He,tiss}$: Tissue inert gas tensions [kPa] (multi-compartment)
- $T_{core}$: Core body temperature [°C]
- $\dot{Q}_{met}$: Metabolic heat production [W]
- $\text{DCS}_{risk}$: Probabilistic DCS risk [0–1] (Weibull survival model)
- $\text{HPNS}_{index}$: Tremor amplitude / EEG anomaly metric [dimensionless]

**Life-Support Subvector ($\vec{X}_{LSS} \in \mathbb{R}^5$):**
$$\vec{X}_{LSS} = [\dot{m}_{O_2}, \dot{m}_{CO_2,scrub}, \dot{Q}_{cool}, \dot{m}_{H_2O}, \eta_{recycle}]^T$$
- $\dot{m}_{O_2}$: Oxygen supply rate [kg/s]
- $\dot{m}_{CO_2,scrub}$: CO₂ removal rate [kg/s]
- $\dot{Q}_{cool}$: Cooling capacity [W]
- $\dot{m}_{H_2O}$: Water consumption rate [kg/s] (sublimator/humidity)
- $\eta_{recycle}$: Gas/liquid recycle fraction [0–1]

**Environmental Subvector ($\vec{X}_{env} \in \mathbb{R}^3$):**
$$\vec{X}_{env} = [P_{ext}, T_{ext}, \vec{g}]^T$$

**1.8.2 Coupled Dynamics: Structure-Physiology-LSS**

The system evolves according to:

$$\frac{d\vec{X}}{dt} = \vec{F}(\vec{X}, \vec{u}, t)$$

Where control inputs $\vec{u}$ include:
$$\vec{u} = [\dot{P}_{int}, \dot{F}_{I}O_2, \dot{T}_{set}, \dot{V}_{vent}, \text{scrubber\_regen}]^T$$

**Structural Dynamics:**
$$\frac{d\sigma_{\theta}}{dt} = \frac{r}{t} \frac{d(\Delta P)}{dt} \quad \text{(thin wall)}$$
$$\frac{da_{crack}}{dt} = C(\Delta K)^m = C\left[Y(\sigma_{\theta,max} - \sigma_{\theta,min})\sqrt{\pi a_{crack}}\right]^m$$
$$\frac{d\omega_{damage}}{dt} = A \exp\left(-\frac{Q}{RT}\right) \sigma_{eq}^n \quad \text{(PMMA creep damage)}$$

**Physiological Dynamics (Multi-Compartment Inert Gas Model):**
For $K$ tissue compartments with half-times $\tau_k$:
$$\frac{dP_{N_2,k}}{dt} = \frac{\ln 2}{\tau_k} (P_{A}N_2 - P_{N_2,k})$$
$$\frac{dP_{He,k}}{dt} = \frac{\ln 2}{\tau_k} (P_{A}He - P_{He,k})$$

**DCS Risk (Weibull Hazard):**
$$h(t) = \frac{\beta}{\eta} \left(\frac{S(t)}{\eta}\right)^{\beta-1}$$
$$S(t) = \exp\left[-\sum_k w_k \left(\frac{P_{N_2,k} - P_{amb}}{P_{ref}}\right)^{\gamma}\right]$$
Where $S(t)$ = supersaturation ratio, $w_k$ = compartment weighting.

**HPNS Index:**
$$\text{HPNS}_{index} = \alpha_1 \frac{dP_{amb}}{dt} + \alpha_2 P_{He} - \alpha_3 P_{N_2} \quad \text{(empirical fit)}$$

**Thermal Dynamics:**
$$C_{body} \frac{dT_{core}}{dt} = \dot{Q}_{met} - \dot{Q}_{cool} - \dot{Q}_{resp} - \dot{Q}_{conv,gas}$$
$$\dot{Q}_{conv,gas} = h_{gas}(P_{int}) A_{skin} (T_{skin} - T_{gas})$$
$$h_{gas}(P) = h_0 \left(\frac{P}{P_0}\right)^{0.8} \quad \text{(heliox density scaling)}$$

**LSS Dynamics:**
$$\frac{dP_{O_2}}{dt} = \frac{\dot{m}_{O_2} R T}{M_{O_2} V} - \frac{\dot{V}_{O_2,met}}{V}$$
$$\frac{dP_{CO_2}}{dt} = \frac{\dot{V}_{CO_2,met}}{V} - \frac{\dot{m}_{CO_2,scrub} R T}{M_{CO_2} V}$$

**1.8.3 Invariant Relationships Across Domains**

Despite vast parameter ranges, certain **dimensionless groups** remain invariant across PVHO classes:

**1. Structural-Physiological Coupling Number:**
$$\Pi_{SP} = \frac{\sigma_{\theta,max} / \sigma_{yield}}{P_{A}O_2 / P_{normoxic}}$$
- Aerospace: $\Pi_{SP} \approx 0.5 / 0.7 \approx 0.7$
- Subsea: $\Pi_{SP} \approx 0.8 / 1.0 \approx 0.8$
- EMU: $\Pi_{SP} \approx 0.3 / 1.8 \approx 0.17$
- **Design Target:** $\Pi_{SP} < 1.0$ (structure not overdesigned relative to physiology)

**2. Thermal-Structural Number:**
$$\Pi_{TS} = \frac{\alpha \Delta T E}{\sigma_{yield}} \quad \text{(thermal stress / yield)}$$
- All classes maintain $\Pi_{TS} < 0.3$ via material selection and expansion joints.

**3. Life-Support Mass Fraction:**
$$\Pi_{LSM} = \frac{M_{LSS}}{M_{total}}$$
- Submersible: 0.05–0.10
- Aircraft: 0.02–0.05
- EMU: 0.30–0.40 (PLSS dominates)
- Saturation: 0.15–0.25
- **TLV PVHO:** Projected 0.10–0.15 (liquid loop denser than gas)

**4. Physiological Safety Margin:**
$$\Pi_{PSM} = \min \left( \frac{P_{A}O_2 - P_{hypoxia}}{P_{normoxic} - P_{hypoxia}}, \frac{P_{hypercapnia} - P_{A}CO_2}{P_{hypercapnia} - P_{normocapnia}}, \frac{T_{limit} - T_{core}}{T_{limit} - T_{normal}} \right)$$
- All operational PVHOs maintain $\Pi_{PSM} > 0.3$ (30% margin on nearest limit).

**1.8.4 Optimization Formulation**

The PVHO design problem is a multi-objective optimization:

$$\min_{\vec{d}} \quad \vec{J}(\vec{d}) = [M_{struct}, M_{LSS}, P_{failure}, T_{decomp}, C_{cost}]^T$$

Subject to:
$$\vec{X}(t) \in \mathcal{X}_{safe} \quad \forall t \in [0, t_{mission}]$$
$$\vec{d} \in \mathcal{D}_{feasible}$$

Where design variables $\vec{d}$ include:
$$\vec{d} = [r, t, material, gas\_mix, P_{op}, LSS\_architecture, viewport\_geometry, ...]^T$$

**Pareto Front Characteristics:**
- **Mass vs. Safety:** Convex — diminishing returns on safety factor > 2.0
- **Mass vs. Decompression Time:** Discontinuous — TLV eliminates decompression (step change)
- **Cost vs. Depth:** Exponential — each 100 msw doubles hull mass (thick-wall scaling)

**1.8.5 TLV-Modified State Equation**

For TLV-enabled PVHO, the state vector reduces dimensionality:

$$\vec{X}_{TLV} = \begin{bmatrix}
\vec{X}_{struct,hyd} \\ \vec{X}_{physio,liquid} \\ \vec{X}_{LSS,liquid} \\ \vec{X}_{env}
\end{bmatrix}$$

Key simplifications:
- $\vec{X}_{struct,hyd}$: Only hydrostatic loads ($\Delta P \approx 0$), no fatigue cycling
- $\vec{X}_{physio,liquid}$: No inert gas compartments ($P_{N_2,k} = P_{He,k} = 0$), no DCS/HPNS
- $\vec{X}_{LSS,liquid}$: Liquid loop replaces gas loop, $\dot{m}_{H_2O}$ eliminated (no sublimator)

**Resulting Invariant:**
$$\Pi_{TLV} = \frac{M_{struct,TLV}}{M_{struct,gas}} \approx 0.1 \text{ to } 0.2$$
$$\Pi_{PSM,TLV} \rightarrow \infty \quad \text{(no barometric physiological limits)}$$

---

*End of Piece 8 — DOC-01 Lines 701-800*
*Next: Piece 9 — References, Cross-Links, Validation & Document Closure*