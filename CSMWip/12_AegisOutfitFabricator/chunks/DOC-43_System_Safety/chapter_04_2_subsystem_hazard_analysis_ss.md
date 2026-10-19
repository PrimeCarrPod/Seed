## 2. Subsystem Hazard Analysis (SSHA)

### 2.1 SSHA Scope — Per DOC-21..40

Per **MIL-STD-882E** Task 202, SSHA is performed for each subsystem (DOC-21 through DOC-40) to identify hazards specific to the subsystem design, including failure modes, common cause failures, and interface hazards.

**SSHA Method**: **Failure Modes and Effects Analysis (FMEA)** + **Fault Tree Analysis (FTA)** for critical functions.

### 2.2 SSHA Summary by Subsystem

| Subsystem (DOC) | Key Hazards Identified | Top Risk (Pre-Mitigation) | Mitigation Strategy |
|-----------------|------------------------|---------------------------|---------------------|
| **Ballistic (31)** | Tile fracture, spall, behind-armor blunt trauma | Catastrophic × Occasional | Auxetic metamaterial backing, trauma pad |
| **Thermal/Fire (32)** | Aerogel dust inhalation, UHTC thermal shock | Critical × Occasional | Encapsulation, quench detection |
| **Electrical/GIC (33)** | Arc flash, Faraday cage breach, surge | Catastrophic × Remote | Segmented Faraday, surge suppression |
| **Directed Energy (34)** | Ablative depletion, QD toxicity, reflective failure | Critical × Occasional | Multi-layer, non-toxic QD, health monitoring |
| **Force Trauma (35)** | MR fluid leak, STF degradation, bladder rupture | Critical × Occasional | Redundant bladders, rheology monitoring |
| **Bio-Acoustic (36)** | PVDF-TrFE delamination, Schumann loss | Marginal × Probable | Self-healing polymer, health index |
| **Chem/Bio (37)** | Catalyst saturation, MOF breakthrough | Critical × Remote | Capacity monitoring, breakthrough alarm |
| **Environmental (38)** | Pressure compensation failure, thermal extremes | Catastrophic × Remote | Redundant APC, passive thermal |
| **Power/Thermal (28)** | MHD explosion, battery fire, heat pump leak | Catastrophic × Remote | Containment, BMS, double-wall |
| **Sensors (29)** | Fiber break, RF mesh compromise, PHM false negative | Critical × Occasional | Redundant paths, voting logic |
| **AI/Autonomy (30)** | Neuromorphic drift, adversarial input, watchdog failure | Catastrophic × Remote | Formal verification, diversity |
| **Manufacturing (31)** | Ultrasonic seam failure, tile bond degradation | Critical × Occasional | In-process NDT, coupon tracking |
| **QA (32)** | NDT false negative, sampling escape | Critical × Occasional | Multi-method NDT, statistical sampling |
| **Deployment (33)** | Donning error, BIT false pass, seal failure | Critical × Probable | Guided donning, BIT integrity checks |
| **Maintenance (34)** | Repair error, SLET failure, tool calibration | Critical × Occasional | Procedural controls, tool CM (DOC-42) |
| **Logistics (35)** | Cold chain break, counterfeit parts, DMSMS | Critical × Occasional | RFID monitoring, blockchain CoC |
| **Training (36)** | Inadequate training, skill decay, sim fidelity | Critical × Occasional | Competency-based, recertification |
| **Human Factors (37)** | Cognitive overload, biomechanical injury | Critical × Probable | Workload monitoring, exoskeleton assist |
| **Medical (38)** | Telemedicine latency, trauma misdiagnosis | Critical × Occasional | Edge AI triage, store-and-forward |
| **Cyber (39)** | Supply chain compromise, runtime exploit | Catastrophic × Occasional | SBOM, zero-trust, runtime attestation |
| **Test/Eval (40)** | LFT&E range safety, test article loss | Catastrophic × Remote | Range safety, surrogate testing |

### 2.3 Common Cause Failure Analysis (CCF)

Per **IEC 61508** and **ARP 4761**, CCF analysis identifies shared failure modes across redundant channels:

| CCF Group | Shared Elements | β-Factor | Mitigation |
|-----------|-----------------|----------|------------|
| **Power Distribution** | MHD, battery, bus bars | 0.05 | Physical separation, diverse chemistry |
| **RF Mesh** | Antennas, transceivers, routing | 0.03 | Frequency diversity, mesh routing |
| **Sensor Fusion** | OFS, IMU, PVDF-TrFE | 0.02 | Diverse sensing modalities |
| **AI Processing** | Neuromorphic cores (3×) | 0.01 | Architectural diversity, voting |
| **Environmental Seal** | 8 gasket interfaces | 0.05 | Independent seals, diverse materials |

**β-Factor Model** (per **IEC 61508-6**):

$$
Q_{system} = (1-\beta) \cdot Q_{channel}^n + \beta \cdot Q_{channel}
$$

Where $Q$ = failure rate, $n$ = number of redundant channels, $\beta$ = common cause fraction.

---
