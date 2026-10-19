## 5. Software Configuration Management

### 5.1 Git Branching Model — GitFlow + Trunk-Based Hybrid

Per **CMMI v2.0** (CM Process Area) and **SLSA Level 3** supply chain security:

```
main (protected, signed commits, PBL baseline tags)
  ├── develop (integration branch, CI/CD pipeline)
  │     ├── feature/* (feature branches, short-lived)
  │     ├── bugfix/* (bug fixes)
  │     └── release/* (release candidates, RC tags)
  ├── hotfix/* (production fixes, tagged)
  └── config/* (configuration data, immutable)
```

**Branch Policies**:

| Branch | Protection | Merge Requirement | CI/CD |
|--------|------------|-------------------|-------|
| `main` | Required reviews (2), signed commits, status checks | PR + CCB approval (Class I) | Deploy to staging |
| `develop` | Required reviews (1), status checks | PR + CI pass | Auto-deploy to dev |
| `release/*` | Required reviews (2), CCB approval | PR + FCA/PCA evidence | Release candidate |
| `config/*` | Config Manager only, immutable | Direct push (audited) | N/A |

### 5.2 Semantic Versioning — SemVer 2.0 + Build Metadata

```
Version = MAJOR.MINOR.PATCH[-PRE-RELEASE][+BUILD]
Example: 2.1.0-rc.3+fbl.20261018.git.abc1234
  MAJOR = 2 (Product Baseline 2, incompatible API)
  MINOR = 1 (Backward-compatible features)
  PATCH = 0 (Bug fixes)
  PRE-RELEASE = rc.3 (Release Candidate 3)
  BUILD = fbl.20261018.git.abc1234 (Baseline, Date, Git SHA)
```

**Version Bumping Rules**:
- **MAJOR**: Breaking interface change (ICD), new Product Baseline
- **MINOR**: New capability, backward compatible, Allocated Baseline update
- **PATCH**: Bug fix, no interface change, Functional Baseline maintenance

### 5.3 Software Bill of Materials (SBOM) — DOC-35 Integration

Per **EO 14028** and **NTIA SBOM Minimum Elements**, each CSCI delivers:

| SBOM Field | Source | Tool |
|------------|--------|------|
| **Component Name** | package.json, Cargo.toml, pom.xml | Syft, CycloneDX |
| **Version** | Git tag, semantic version | Git |
| **Supplier** | Vendor, internal team | Procurement |
| **License** | SPDX identifier | FOSSology |
| **Hash (SHA-256)** | Artifact digest | Cosign/Sigstore |
| **Dependencies** | Lock files, dependency graph | Dependency-Track |
| **Vulnerabilities** | CVE scan results | Grype, Trivy |

**SBOM Delivery**: With each CSCI release, embedded in TDP (DOC-44).

### 5.4 Build Reproducibility — SLSA Level 3

Per **SLSA (Supply Chain Levels for Software Artifacts)**:

| Level | Requirement | AIMES Status |
|-------|-------------|--------------|
| **Level 1** | Build scripted, provenance generated | ✅ CI/CD pipeline |
| **Level 2** | Tamper-resistant build, provenance signed | ✅ Cosign + GitLab |
| **Level 3** | Hardened build, non-falsifiable provenance | 🔄 In progress |
| **Level 4** | Two-party review, hermetic builds | 📋 Planned FY28 |

**Reproducibility Verification**:

$$
\text{Reproducible} \iff \text{Build}(Source, Config, Tools) = \text{Artifact}_{expected}
$$

Where equality = bit-for-bit identical output. Target: 100% for CSCI-01..06 at PBL.

---
