## 4. Curriculum Integration & Management

### 4.1 Curriculum Architecture — ADL SCORM 2004 4th Edition

The curriculum follows **ADL SCORM 2004 4th Edition** for content packaging, sequencing, and navigation, integrated with **xAPI (Experience API)** for learning analytics. Curriculum structure aligns with **DRAFT-01** Alcega developable surface engine for pattern-based learning modules. **Research Doc 1** historical dress construction informs module sequencing. **Research Doc 2** advanced textile stitching automation maps to technical training modules.

**Content Organization**:

$$\text{Course} = \bigcup_{k=1}^{K} \text{Module}_k, \quad \text{Module}_k = \bigcup_{j=1}^{J_k} \text{Lesson}_j$$

$$\text{Lesson}_j = \{\text{SCOs}, \text{Sequencing Rules}, \text{Objectives}, \text{Assessment}\}$$

**Sequencing Rules (IMS SS)**:

$$\text{Precondition}(\text{Activity}_j) = \bigwedge_{i \in \text{Prereqs}(j)} \text{Completed}(\text{Activity}_i) \land \text{Score}(\text{Activity}_i) \geq \theta_i$$

### 4.2 Training Pathway per Edition

| Edition | Pathway ID | Modules | Duration | Prerequisites |
|---------|------------|---------|----------|---------------|
| **RM-TS** | TRN-RM-TS-01 | 12 | 40 hrs | None |
| **RM-TG** | TRN-RM-TG-01 | 14 | 60 hrs | TRN-RM-TS-01 |
| **RM-SS** | TRN-RM-SS-01 | 10 | 35 hrs | None |
| **RM-SG** | TRN-RM-SG-01 | 13 | 55 hrs | TRN-RM-SS-01 |
| **RW-TS** | TRN-RW-TS-01 | 12 | 40 hrs | None |
| **RW-TG** | TRN-RW-TG-01 | 14 | 60 hrs | TRN-RW-TS-01 |
| **RW-SS** | TRN-RW-SS-01 | 10 | 35 hrs | None |
| **RW-SG** | TRN-RW-SG-01 | 13 | 55 hrs | TRN-RW-SS-01 |

### 4.3 Competency Mapping — xAPI Statements

**Competency Model (Per DoDI 1322.26)**:

$$\text{Competency}_c = \{\text{ID}, \text{Name}, \text{Description}, \text{Proficiency Levels}, \text{Evidence Rules}\}$$

**xAPI Statement Template**:

```json
{
  "actor": {"mbox": "mailto:trainee@unit.mil"},
  "verb": {"id": "http://adlnet.gov/expapi/verbs/experienced", "display": {"en-US": "completed"}},
  "object": {"id": "https://aimes.mil/curriculum/RM-TS/module-03", "definition": {"type": "http://adlnet.gov/expapi/activities/module"}},
  "result": {"score": {"scaled": 0.92}, "success": true, "completion": true},
  "context": {"extensions": {"https://aimes.mil/extensions/edition": "RM-TS", "https://aimes.mil/extensions/session": "live"}}
}
```

### 4.4 Curriculum Effectiveness Metrics

**Kirkpatrick Level 2 (Learning) — Knowledge Retention**:

$$R(t) = R_0 \cdot e^{-\lambda t} + (1 - e^{-\lambda t}) \cdot R_{\infty}$$

Where $R_0$ = immediate post-test score, $R_{\infty}$ = asymptotic retention, $\lambda = 0.15 \text{ month}^{-1}$ (forgetting rate).

**Transfer of Training (Level 3)**:

$$\text{Transfer} = \frac{\text{Performance}_{\text{job}} - \text{Baseline}_{\text{job}}}{\text{Performance}_{\text{training}} - \text{Baseline}_{\text{training}}}$$

Target: **Transfer ≥ 0.70** per **DoDI 1322.26**.

---

