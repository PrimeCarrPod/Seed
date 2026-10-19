## 2. Change Control

### 2.1 Engineering Change Process — ECR/ECO

Per **MIL-STD-973**, **CMMI v2.0** (CM Process Area), and **IEEE 828**, the change control process uses **Engineering Change Requests (ECRs)** and **Engineering Change Orders (ECOs)**.

**Change Classification** (per **MIL-STD-973** Table 1):

| Class | Definition | Approval Authority | Timeline |
|-------|------------|-------------------|----------|
| **Class I** | Affects form, fit, function, interface, safety, or allocated baseline | CCB (Chair: PM) | ≤ 30 days |
| **Class II** | Affects documentation only, no form/fit/function impact | CAM + Config Manager | ≤ 14 days |
| **Class III** | Administrative (typos, formatting, reference updates) | Config Manager | ≤ 5 days |
| **Urgent** | Safety-of-flight, mission-critical, production stoppage | PM (delegated) | ≤ 72 hours |

**ECR/ECO Workflow**:

```
ORIGINATOR → ECR SUBMITTED → CLASSIFICATION → IMPACT ANALYSIS → CCB REVIEW → 
  APPROVE → ECO ISSUED → IMPLEMENTATION → VERIFICATION → BASELINE UPDATE → CLOSE
                    ↓
               REJECT → DOCUMENT RATIONALE → NOTIFY ORIGINATOR
```

### 2.2 Change Control Board (CCB) Charter

**CCB Composition** (per **MIL-STD-973** §5.2):

| Role | Member | Voting |
|------|--------|--------|
| **Chair** | Program Manager | Yes (tie-breaker) |
| **Vice-Chair** | Chief Engineer | Yes |
| **Secretary** | Configuration Manager | No (non-voting) |
| **Systems Engineering** | Lead Systems Engineer | Yes |
| **Design Engineering** | RM/RW Design Leads (2) | Yes |
| **Test & Evaluation** | Test Lead | Yes |
| **Logistics** | Logistics Lead (DOC-35) | Yes |
| **Quality** | Quality Manager | Yes |
| **Software** | Software Lead (DOC-30) | Yes |
| **Cybersecurity** | Cyber Lead (DOC-39) | Yes |
| **Contracts** | Contracting Officer Rep | Advisory |

**CCB Meeting Cadence**: Bi-weekly (scheduled), ad-hoc for Urgent/Class I safety changes.

### 2.3 Impact Analysis — Technical, Cost, Schedule

Per **CMMI v2.0** (CM Process Area, SP 1.3) and **IEEE 828**, each Class I ECR requires:

| Analysis Dimension | Method | Deliverable |
|--------------------|--------|-------------|
| **Technical** | Requirements traceability, ICD impact, V&V impact | Technical Impact Report |
| **Cost** | Should-cost, EVM impact (CPI/SPI), LCC impact | Cost Impact Worksheet |
| **Schedule** | IMS critical path, float consumption, resource loading | Schedule Impact Analysis |
| **Risk** | Risk register update, new hazard identification | Risk Delta (DOC-43) |
| **Logistics** | Spares, training, maintenance, obsolescence (DOC-35) | Logistics Impact Statement |
| **Cybersecurity** | Attack surface, vulnerability re-assessment (DOC-39) | Cyber Impact Memo |

**Impact Severity Scoring**:

$$
\text{Impact Score} = \sum_{d \in Dimensions} w_d \cdot \text{Severity}_d
$$

Where $w_d$ = weight (Technical=0.30, Cost=0.25, Schedule=0.20, Risk=0.15, Logistics=0.05, Cyber=0.05), Severity $\in \{1,2,3,4,5\}$. Score ≥ 3.5 requires CCB Chair + PM dual approval.

### 2.4 Configuration Control — Implementation

**Configuration Control Tools**:

| Tool | Purpose | Integration |
|------|---------|-------------|
| **Git (GitLab)** | Source code, documentation, models | Primary CI repository |
| **DIME/PLM** | Hardware BOM, drawings, ECO workflow | Hardware CI management |
| **Jira/ServiceNow** | ECR/ECO tracking, CCB workflow | Change process management |
| **DOORS/Requirements** | Requirements traceability, baseline snapshots | Requirements CM |

**Baseline Snapshots** (immutable tags):

| Baseline | Git Tag | PLM Baseline | Requirements Snapshot |
|----------|---------|--------------|----------------------|
| **FBL** | `v1.0-fbl` | `AIMES-FBL-001` | `REQ-FBL-001` |
| **ABL** | `v1.0-abl` | `AIMES-ABL-001` | `REQ-ABL-001` |
| **PBL** | `v1.0-pbl` | `AIMES-PBL-001` | `REQ-PBL-001` |
| **FRP** | `v1.1-frp` | `AIMES-FRP-001` | `REQ-FRP-001` |

---
