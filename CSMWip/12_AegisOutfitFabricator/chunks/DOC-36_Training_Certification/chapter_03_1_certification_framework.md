## 1. Certification Framework

### 1.1 Four-Level Certification Structure

Per **DoDI 4151.22** Enclosure 4 and **CSMFAB078-E §5**, the AIMES program establishes a four-level certification hierarchy:

| Level | Designation | Scope | Prerequisites | Validity |
|-------|-------------|-------|---------------|----------|
| **OP** | Operator | Donning, BIT, emergency procedures, mission profiles | BCT + Medical Class 2 | 12 months |
| **TECH** | Technician (O/I-Level) | LRU swap, NDT, CBM+ tools, PHM interpretation | OP + MOS 91X/15Y equiv. | 24 months |
| **INST** | Instructor | Pedagogy, simulation, evaluation, curriculum development | TECH + 24 months experience | 36 months |
| **DSV** | Deep Submergence Vehicle Specialist | Underwater ops, pressure compensation, comms | OP + TECH + Dive Qual | 12 months |

### 1.2 Certification Authority & Governance

**Certification Authority**: Commander, AIMES Training Command (COMATC)  
**Accreditation**: DoD COE (Center of Excellence) per DoDI 1322.26  
**Quality Assurance**: ISO 10015 (Training Quality Management) compliant

**Governance Formula — Certification Validity Decay**:

$$
V(t) = \exp\left( -\lambda_{skill} \cdot t - \lambda_{tech} \cdot \Delta T_{tech} \right)
$$

Where:
- $\lambda_{skill}$ = Skill decay rate (0.08/month for OP, 0.05/month for TECH)
- $\lambda_{tech}$ = Technology obsolescence rate (0.02/month)
- $\Delta T_{tech}$ = Months since last tech refresh training

Recertification triggered when $V(t) < 0.85$.

### 1.3 Competency Model — KSA Framework

Each certification level defines **Knowledge, Skills, Abilities (KSA)** per MIL-HDBK-29612:

$$
\text{Competency}_{level} = \bigcup_{k \in KSA} \left\{ (k, \text{Proficiency}_k, \text{Criticality}_k) \right\}
$$

**Proficiency Scale** (per DoDI 4151.22):
- Level 1: Awareness (describe)
- Level 2: Supervised Performance (perform with guidance)
- Level 3: Independent Performance (perform solo)
- Level 4: Instructional Capability (teach others)

**Criticality Weighting**:
$$
W_{total} = \sum_{k} \text{Criticality}_k \cdot \mathbb{I}(\text{Proficiency}_k \geq \text{Required}_k)
$$
Pass threshold: $W_{total} / W_{max} \geq 0.90$

---
