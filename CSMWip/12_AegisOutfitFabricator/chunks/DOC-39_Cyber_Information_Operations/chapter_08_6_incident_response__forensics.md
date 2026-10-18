## 6. Incident Response & Forensics

### 6.1 IR Phases — NIST 800-61r2 Adapted

| Phase | AIMES Implementation | Timeline |
|-------|---------------------|----------|
| **Preparation** | IR playbooks, forensic tools pre-staged (DOC-35), trained team (DOC-36) | Continuous |
| **Detection** | DOC-30 runtime monitors + DOC-29 IDS + AU alerts | < 1 min |
| **Analysis** | Automated triage (DOC-30), forensic capture (volatile + non-volatile) | < 15 min |
| **Containment** | Network quarantine (DOC-29), process kill, secure boot re-verify | < 30 min |
| **Eradication** | Firmware re-flash (signed), key rotation, malware removal | < 4 hr |
| **Recovery** | Staged restore, verification, monitoring enhancement | < 24 hr |
| **Lessons Learned** | AAR (DOC-33), SBOM update, signature update, playbook revision | < 72 hr |

### 6.2 Forensic Capture — Volatile + Non-Volatile

**Volatile** (RAM, registers, cache, network state):
- Captured via **DMA attack resistant** hardware (DOC-30 secure enclave)
- Size: ≤ 8 GB (neuromorphic state + OS)
- Hash: SHA3-256, signed by AK

**Non-Volatile** (Flash, eFUSE, PUF):
- Full image via JTAG (disabled in production, enabled via DEPOT auth)
- Immutable log (Section 5.2) extracted

**Chain of Custody**:

$$
\text{CoC} = \{ \text{Evidence}, \text{Collector}, \text{Hash}, \text{Time}, \text{Location}, \text{Seal} \}^+
$$

Seal: Tamper-evident bag + blockchain anchor (DOC-30 ledger).

### 6.3 AAR Integration — DOC-33 §9

**Cyber AAR Fields**:

$$
\text{CyberAAR} = \text{MissionAAR} \cup \{ \text{IOC}, \text{ATT&CK TTPs}, \text{Root Cause}, \text{Impact}, \text{MTTD}, \text{MTTR} \}
$$

Where:
- **IOC** = Indicators of Compromise (hashes, IPs, domains)
- **ATT&CK TTPs** = MITRE ATT&CK mapping
- **MTTD** = Mean Time To Detect
- **MTTR** = Mean Time To Recover

---
