## 4. Repository

### 4.1 AIMES Data Repository Architecture

The repository implements **PDM/PLM Integration** per **ASME Y14.41** and **ISO 10303-242**:

```
┌─────────────────────────────────────────────────────────────────┐
│                    AIMES DATA REPOSITORY                        │
├─────────────────────────────────────────────────────────────────┤
│  PRESENTATION LAYER                                              │
│  ├── Web Portal (Role-based: Gov, Contractor, Public)          │
│  ├── API Gateway (REST/GraphQL, OAuth2/OIDC)                   │
│  └── CDRL Ingestion Portal (Automated validation)              │
├─────────────────────────────────────────────────────────────────┤
│  SERVICES LAYER                                                  │
│  ├── Configuration Management Service (DOC-42)                 │
│  ├── Requirements Management Service (DOORS Next)              │
│  ├── Model Management Service (STEP AP242, SysML)              │
│  ├── Document Management Service (PDF/A, Versioning)           │
│  ├── Software Repository Service (GitLab + Package Registry)   │
│  ├── Workflow Engine (ECR/ECO, CCB, Approvals)                 │
│  ├── Search & Discovery (Elasticsearch, Metadata)              │
│  └── Audit & Compliance Service (Immutable logs)               │
├─────────────────────────────────────────────────────────────────┤
│  DATA LAYER                                                      │
│  ├── PostgreSQL (Metadata, Relationships, Workflow State)      │
│  ├── S3-Compatible Object Store (Files, Models, Binaries)      │
│  ├── GitLab (Source Code, Documentation, CI/CD)                │
│  ├── DIME/PLM (Hardware BOM, Drawings, ECO)                    │
│  └── Time-Series DB (Sensor Data, PHM, EVM)                    │
└─────────────────────────────────────────────────────────────────┘
```

### 4.2 Access Control — RBAC + ABAC

**Role-Based Access Control (RBAC)**:

| Role | Read | Write | Admin | Delete | Export |
|------|------|-------|-------|--------|--------|
| **Government PM** | All | CDRLs | — | — | All |
| **Government SE** | All | Technical | — | — | Technical |
| **Government CM** | All | CM artifacts | CM artifacts | — | CM |
| **Contractor PM** | Own + GPR | Own | — | — | Own |
| **Contractor SE** | Own + GPR | Own technical | — | — | Own technical |
| **Contractor CM** | Own + GPR | Own CM | Own CM | — | Own CM |
| **Subcontractor** | Assigned | Assigned | — | — | Assigned |
| **Public** | Unlimited Rights only | — | — | — | Unlimited Rights |

**Attribute-Based Access Control (ABAC)** for fine-grained control:

$$
\text{Access} = \text{Permit} \iff 
\begin{cases}
\text{Subject.Role} \in \text{AllowedRoles} \\
\text{Subject.Clearance} \geq \text{Object.Classification} \\
\text{Subject.Org} = \text{Object.OwnerOrg} \lor \text{Object.Rights} \in \{\text{GPR, Unlimited}\} \\
\text{Time} \in \text{AllowedHours} \\
\text{Location} \in \text{AllowedNetworks}
\end{cases}
$$

### 4.3 Versioning & Baselines

**Versioning Scheme** (per **CMMI v2.0**, **MIL-STD-973**):

| Object Type | Version Format | Baseline Tag |
|-------------|----------------|--------------|
| **Documents** | `v{MAJOR}.{MINOR}.{PATCH}` | `baseline-{FBL,ABL,PBL,FRP}` |
| **3D Models** | `v{REV}` (per ASME Y14.35) | `pbl-{DATE}` |
| **Drawings** | `REV {A, B, C...}` | `pbl-{DATE}` |
| **Software** | SemVer + Build (DOC-42 §5.2) | `pbl-{DATE}` |
| **Requirements** | `v{REV}` (DOORS baseline) | `fbl-{DATE}`, `abl-{DATE}`, `pbl-{DATE}` |

**Baseline Immutability**: Once baselined, objects are **write-once**. Changes require new version + ECO (DOC-42).

### 4.4 Backup & Disaster Recovery

| Metric | Target | Implementation |
|--------|--------|----------------|
| **RPO (Recovery Point Objective)** | 1 hour | Continuous replication |
| **RTO (Recovery Time Objective)** | 4 hours | Automated failover |
| **Backup Retention** | 7 years (contract) + 3 years (legal hold) | Tiered storage (hot/warm/cold) |
| **Geo-Redundancy** | 2 regions (CONUS East/West) | Active-passive |
| **Integrity Verification** | Daily checksums, weekly restore test | SHA-256, automated |

---
