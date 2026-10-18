## 3. Supply Chain Cybersecurity

### 3.1 Software Bill of Materials (SBOM) — DOC-35 Integration

Per **DOC-35 §5** and **Executive Order 14028**, **SLSA Level 3** provenance:

$$
\text{SBOM} = \{ \text{Component}, \text{Version}, \text{Hash}, \text{License}, \text{Provenance}, \text{Vulnerabilities} \}
$$

**Provenance Attestation** (in-toto layout):

```
LAYOUT:
  steps:
    - name: build
      expected_materials: [SOURCE, DEPS]
      expected_products: [ARTIFACT]
      pubkeys: [BUILD_KEY]
    - name: test
      expected_materials: [ARTIFACT]
      expected_products: [TEST_RESULTS]
      pubkeys: [TEST_KEY]
    - name: sign
      expected_materials: [ARTIFACT]
      expected_products: [SIGNED_ARTIFACT]
      pubkeys: [RELEASE_KEY]
```

### 3.2 Zero-Trust Firmware Update

Per **NIST 800-207** and **DOC-30 secure boot**:

$$
\text{Update Valid} = \text{Verify}(\text{Signature}, \text{PubKey}_{OEM}) \land \text{Version} > \text{Current} \land \text{Hash} \in \text{Allowlist}
$$

**Rollback Protection**: Monotonic version counter in eFUSE (DOC-30 hardware root of trust).

**Staged Rollout**:

$$
\text{Rollout}(t) = \begin{cases}
1\% & t \in [0, 24\text{h}) \\
10\% & t \in [24\text{h}, 72\text{h}) \\
50\% & t \in [72\text{h}, 168\text{h}) \\
100\% & t \geq 168\text{h}
\end{cases}
$$

### 3.3 DMSMS Cyber Risk — DOC-35 §5 Extension

Per **SAE AS6294 §5** and **NIST 800-161**:

| Component | Cyber Risk | Mitigation |
|-----------|------------|------------|
| **Neuromorphic ASIC** | Single-source fab, mask theft | Split manufacturing, logic locking |
| **MXene Precursor** | Supplier IT compromise | Dual-source, incoming inspection |
| **FPGA Bitstream** | Bitstream extraction | AES-GCM encryption, PUF binding |
| **Open Source Libs** | Supply chain injection | SBOM + SCA (Syft/Grype), pin hashes |

---
