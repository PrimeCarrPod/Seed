## 5. Instructor & Assessment Systems

### 5.1 Instructor Station Architecture

**Instructor Operator Station (IOS) Capabilities**:

| Capability | Specification | Standard |
|------------|---------------|----------|
| **Scenario Authoring** | Drag-drop entity placement, timeline editor | CMI5 launch |
| **Real-time Monitoring** | 50+ trainee views, 4K/60Hz each | TENA SDR |
| **Dynamic Injection** | Events, faults, weather, threats < 100ms | HLA time management |
| **AAR Playback** | 4D reconstruction, multi-perspective | DIS/HLA recording |
| **Assessment Tools** | Rubric builder, auto-scoring, analytics | xAPI, SCORM |

**Instructor Workload Model**:

$$W_{\text{instructor}} = \sum_{i=1}^{N_{\text{trainees}}} \left( w_{\text{monitor}} + w_{\text{inject}} \cdot I_{\text{inject}} + w_{\text{assess}} \cdot I_{\text{assess}} \right)$$

Where $w_{\text{monitor}} = 0.05$, $w_{\text{inject}} = 0.3$, $w_{\text{assess}} = 0.2$ (normalized 0-1), max 8 trainees per instructor.

### 5.2 Assessment System — Multi-Method Evaluation

**Assessment Modalities**:

| Method | Weight | Description | Automation |
|--------|--------|-------------|------------|
| **Knowledge Test** | 0.20 | SCORM quiz, adaptive | Full |
| **Performance Observation** | 0.35 | IOS rubric, live | Semi-auto |
| **Simulation Metrics** | 0.25 | Physics, procedure, time | Full |
| **AAR Self-Assessment** | 0.10 | Trainee reflection | Manual |
| **Peer/Instructor Review** | 0.10 | 360° feedback | Manual |

**Composite Score Formula**:

$$\text{Final Score} = \sum_{m=1}^{5} w_m \cdot \text{Score}_m \cdot \text{Reliability}_m$$

Where $\text{Reliability}_m$ = inter-rater reliability (Cronbach's α) for method $m$.

**Passing Thresholds per Certification**:

| Certification | Composite Score | Min. Knowledge | Min. Performance |
|---------------|-----------------|----------------|------------------|
| **OP** | ≥ 0.80 | ≥ 0.75 | ≥ 0.80 |
| **TECH** | ≥ 0.85 | ≥ 0.80 | ≥ 0.85 |
| **INST** | ≥ 0.90 | ≥ 0.85 | ≥ 0.90 |
| **DSV** | ≥ 0.90 | ≥ 0.85 | ≥ 0.90 |

### 5.3 Instructor Certification — DOC-36 Alignment

**Instructor Competency Requirements (DOC-36 §4.3)**:

$$\text{Instructor Ready} = \bigwedge_{c \in \mathcal{C}_{\text{inst}}} (\text{Competency}_c \geq \text{Level 3})$$

Where $\mathcal{C}_{\text{inst}} = \{\text{Pedagogy}, \text{Scenario Design}, \text{AAR Facilitation}, \text{System Admin}, \text{Safety}\}$.

---

