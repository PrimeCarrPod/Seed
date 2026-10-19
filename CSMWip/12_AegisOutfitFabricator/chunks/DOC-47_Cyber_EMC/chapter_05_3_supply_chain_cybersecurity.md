## 3. Supply Chain Cybersecurity

### 3.1 Software Bill of Materials (SBOM) — DOC-42, DOC-44

Per **EO 14028**, **NIST SSDF**, and **NTIA Minimum Elements**, every CSCI delivers:

**SBOM Format**: **CycloneDX 1.5** (JSON) + **SPDX 2.3** (Tag-Value)

**SBOM Contents per CSCI**:

| Field | Source | Tool |
|-------|--------|------|
| **Component Name** | package.json, Cargo.toml, CMake | Syft, CycloneDX-Go |
| **Version** | Git tag, SemVer | Git |
| **Supplier** | Vendor, internal team | Procurement DB |
| **License** | SPDX ID | FOSSology, ScanCode |
| **Hash (SHA-256)** | Artifact digest | Cosign, Rekor |
| **Dependencies** | Lock files, dep graph | Dependency-Track |
| **Vulnerabilities** | CVE, GHSA, OSV | Grype, Trivy, OSV-Scanner |
| **Provenance** | SLSA Provenance v1.0 | SLSA GitHub Generator |
| **VEX** | Vulnerability Exploitability | OpenVEX, CSAF |

**SBOM Delivery**: Embedded in TDP (DOC-44), updated per CSCI release.

### 3.2 Software Supply Chain — SLSA Level 3

Per **SLSA (Supply Chain Levels for Software Artifacts)**:

| SLSA Level | Requirement | AIMES Status (FY26) |
|------------|-------------|---------------------|
| **Level 1** | Build scripted, provenance generated | ✅ CI/CD (GitLab) |
| **Level 2** | Tamper-resistant build, provenance signed | ✅ Cosign + Rekor |
| **Level 3** | Hardened build, non-falsifiable provenance | 🔄 In Progress |
| **Level 4** | Two-party review, hermetic builds | 📋 Planned FY28 |

**Hardened Build Requirements (Level 3)**:
- Hermetic build environment (Nix/Bazel)
- Reproducible builds (bit-for-bit)
- Signed provenance (Cosign + Fulcio)
- Two-person review for releases
- Dependency pinning + verification

### 3.3 Hardware Supply Chain — Anti-Counterfeit

Per **DFARS 252.246-7007**, **AS5553**, **AS6174**:

| Control | Implementation |
|---------|----------------|
| **Authorized Sources** | QML/QPL, DLA SNS, OEM direct |
| **Inspection/Testing** | Visual, electrical, X-ray, decapsulation (sampling) |
| **Traceability** | Blockchain CoC (DOC-35), DNA marking (Selective) |
| **Counterfeit Reporting** | GIDEP, DCMA, PMO within 24 hrs |
| **Obsolescence Monitoring** | DMSMS (DOC-35 §5), SAE AS6294 |

---
