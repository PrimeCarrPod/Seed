## 2. Data Rights

### 2.1 DFARS Data Rights Clauses — Applicability

Per **DFARS 252.227-7013** (Rights in Technical Data — Noncommercial), **DFARS 252.227-7014** (Rights in Noncommercial Computer Software), and **DFARS 252.227-7015** (Technical Data — Commercial Items), the AIMES program asserts the following rights categories:

| Data/Software Category | Rights Asserted | DFARS Clause | Basis |
|------------------------|-----------------|--------------|-------|
| **Government-Funded Development** | **Government Purpose Rights (GPR)** | 252.227-7013(b)(1) | Developed with Government funding |
| **Mixed Funding** | **Government Purpose Rights (GPR)** | 252.227-7013(b)(2) | Partial Government funding |
| **Private Expense (Developed)** | **Limited Rights (LR)** | 252.227-7013(b)(3) | Developed at private expense |
| **Commercial Software** | **Commercial License** | 252.227-7015 | Commercial off-the-shelf |
| **Government-Funded Software** | **Government Purpose Rights (GPR)** | 252.227-7014(b)(1) | Developed with Government funding |
| **Private Expense Software** | **Restricted Rights (RR)** | 252.227-7014(b)(3) | Developed at private expense |
| **SBOM/Cyber Data** | **Unlimited Rights** | 252.227-7013(b)(1) | EO 14028 requirement |

### 2.2 Rights Legend Markings

Per **DFARS 252.227-7013(f)** and **252.227-7014(f)**, all delivered data/software bears appropriate markings:

**Government Purpose Rights (GPR)**:
```
GOVERNMENT PURPOSE RIGHTS
Contract No. [Contract Number]
Contractor: [Contractor Name]
Expiration: [5 years from delivery or contract completion]
```

**Limited Rights (LR)**:
```
LIMITED RIGHTS
Contract No. [Contract Number]
Contractor: [Contractor Name]
```

**Restricted Rights (RR) — Software**:
```
RESTRICTED RIGHTS
Contract No. [Contract Number]
Contractor: [Contractor Name]
```

### 2.3 Data Rights Decision Tree

```
IS DATA/SOFTWARE DEVELOPED UNDER CONTRACT?
├── YES → GOVERNMENT PURPOSE RIGHTS (GPR)
└── NO → DEVELOPED AT PRIVATE EXPENSE?
    ├── YES → IS IT COMMERCIAL?
    │   ├── YES → COMMERCIAL LICENSE (DFARS 7015)
    │   └── NO → LIMITED RIGHTS (Data) / RESTRICTED RIGHTS (Software)
    └── NO → MIXED FUNDING?
        ├── YES → GPR (with proprietary portions marked LR/RR)
        └── NO → UNLIMITED RIGHTS (Public domain, Government)
```

### 2.4 Rights Negotiation — Special Cases

| Special Case | Approach |
|--------------|----------|
| **Historical Textile Patterns** (Alcega, Garsault) | Public domain — Unlimited Rights |
| **CIETA Stitch Standards** | Licensed — Commercial License negotiated |
| **Neuromorphic Architecture** (DOC-30) | Private expense core + Gov funded adaptation → GPR on adaptation, RR on core |
| **MXene Synthesis Process** (DOC-45) | Mixed funding → GPR with process parameters LR |
| **Ceramic Sintering Profiles** (FAB-RM-06) | Gov funded → GPR |
| **Phoenix Protocol Algorithms** (DOC-50) | Gov funded → GPR |
| **Training Curriculum** (DOC-36) | Gov funded → GPR |
| **SBOM/Cyber Artifacts** | EO 14028 mandate → Unlimited Rights |

---
