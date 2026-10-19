## 3. Data Delivery

### 3.1 Contract Data Requirements List (CDRL) — DD Form 1423

Per **DFARS 252.227-7013** and **DoD 5010.12-M**, the CDRL defines **what**, **when**, **format**, and **delivery method** for each data item.

**CDRL Summary** (representative items):

| CDRL # | DID | Title | Frequency | Due Date | Format | Distribution |
|--------|-----|-------|-----------|----------|--------|--------------|
| **A001** | DI-MGMT-81650 | Integrated Master Schedule | Monthly | 10th business day | PMXML | PM, DCMA |
| **A002** | DI-MGMT-81466 | Contract Work Breakdown Structure | One-time + updates | SRR + changes | PMXML | PM, DCMA |
| **A003** | DI-MISC-80508 | Technical Data Package | Per gate | CDR, FRR, PRR | STEP AP242, PDF/A | TDP Repository |
| **A004** | DI-SESS-81000 | System Requirements Specification | One-time + updates | SRR + changes | ReqIF, PDF/A | SE, CM |
| **A005** | DI-SESS-81001 | System Architecture Description | One-time + updates | SFR + changes | SysML, PDF/A | SE, CM |
| **A006** | DI-IPSC-81430 | Software Requirements Specification | Per CSCI | PDR + updates | ReqIF, PDF/A | SW Lead |
| **A007** | DI-IPSC-81431 | Software Architecture Description | Per CSCI | PDR + updates | SysML, PDF/A | SW Lead |
| **A008** | DI-IPSC-81432 | Software Design Description | Per CSCI | CDR + updates | SysML, PDF/A | SW Lead |
| **A009** | DI-IPSC-81433 | Software Test Plan/Report | Per test event | FRR, OT | PDF/A | T&E |
| **A010** | DI-QCIC-81440 | First Article Inspection Report | Per FAI | PRR | PDF/A, XML | Quality |
| **A011** | DI-MGMT-81872 | Risk Management Report | Quarterly | Program reviews | PDF/A | PM, SE |
| **A012** | DI-CMAN-80858 | Configuration Status Accounting Report | Monthly | 15th business day | PDF/A, CMDB export | CM |
| **A013** | DI-SESS-81002 | Interface Control Document | Per ICD | SFR + updates | PDF/A, SysML | SE, CM |
| **A014** | DI-MISC-80508 | SBOM (CycloneDX/SPDX) | Per CSCI release | CDR + releases | JSON/XML | Cyber, CM |
| **A015** | DI-MGMT-81467 | Earned Value Management Report | Monthly | 15th business day | ANSI/X12, PDF/A | PM, DCMA |

### 3.2 DID Tailoring

Per **DoD 5010.12-M** Appendix A, DIDs are tailored to remove non-applicable requirements:

| DID | Tailoring Action | Rationale |
|-----|------------------|-----------|
| **DI-MGMT-81650** | Remove network diagram requirement | IMS in PMXML sufficient |
| **DI-IPSC-81430** | Add neuromorphic-specific requirements | DOC-30 unique attributes |
| **DI-MISC-80508** | Add STEP AP242 MBD requirements | MBD mandate (DOC-44 §5) |
| **DI-QCIC-81440** | Add historical authenticity checks | CIETA compliance (DOC-10) |
| **DI-SESS-81002** | Add ICD hazard analysis (DOC-43) | Safety integration |

### 3.3 Delivery Mechanism — AIMES Data Repository

All CDRL deliveries via **AIMES Data Repository** (DOC-44 §4):

1. Contractor uploads to repository with metadata
2. Automated validation (format, checksum, completeness)
3. Government receipt notification
4. 10-day Government inspection period
5. Acceptance/Rejection with comments
6. Version control: new revision on correction

---
