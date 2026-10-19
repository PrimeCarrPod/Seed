## 4. Runtime Assurance & Monitoring

### 4.1 Continuous Attestation

**Measured Boot Chain**:

```
ROM (Immutable) → Bootloader (Signed) → Kernel (Signed) → 
  Init (Signed) → CSCI-01..06 (Signed) → Runtime Attestation
```

**TPM 2.0 PCRs**:

| PCR | Measurement | Purpose |
|-----|-------------|---------|
| **PCR 0** | ROM / CRTM | Hardware root of trust |
| **PCR 1** | Bootloader | Bootloader integrity |
| **PCR 2** | Kernel + Initramfs | OS integrity |
| **PCR 3** | CSCI Manifests | Application integrity |
| **PCR 4** | Configuration Data | Config integrity |
| **PCR 5** | Security Policy | Policy integrity |
| **PCR 6** | PHM Baseline | PHM model integrity |
| **PCR 7** | Neuromorphic Model Hash | AI model integrity |

**Remote Attestation Protocol**:

1. Verifier sends nonce $N$
2. AIMES signs $\{PCR\_values, N\}_{AK}$ (Attestation Key)
3. Verifier validates signature, checks PCRs against golden values
4. Verifier returns access token if $T_{device} > \theta$

### 4.2 Runtime Monitoring — Cyber-PHM Fusion

Per **DOC-29, DOC-30, DOC-39**, cyber telemetry fused with PHM:

**Telemetry Sources**:

| Source | Data | Rate | Analysis |
|--------|------|------|----------|
| **Network Flow** | NetFlow/IPFIX | 1 Hz | Anomaly detection (ML) |
| **Host Audit** | Linux Audit, ETW | Event | Rule-based + ML |
| **Memory** | Volatility, custom | 0.1 Hz | Rootkit, injection detection |
| **Firmware** | TPM PCRs, UEFI vars | On change | Integrity verification |
| **PHM Health** | HI, RUL, anomalies | 10 Hz | Cross-correlation |
| **RF Mesh** | Link quality, topology | 1 Hz | Jamming, spoofing detection |

**Fusion Engine** (DOC-30 neuromorphic):

$$
\text{Alert} = f_{fusion}(\text{Cyber Features}, \text{PHM Features}, \text{Context})
$$

Where $f_{fusion}$ = spiking neural network, trained on adversarial + fault data.

### 4.3 Automated Response — SOAR Playbooks

**Response Actions** (per **NIST SP 800-61 Rev 2**):

| Trigger | Automated Action | Human-in-Loop |
|---------|------------------|---------------|
| **PCR Mismatch** | Quarantine LRU, alert, rollback | Confirm rollback |
| **Anomalous Network Flow** | Block flow, isolate VLAN, capture PCAP | Analyze PCAP |
| **Adversarial Input (AI)** | Reject input, safe mode, log | Retrain/verify model |
| **PHM-Cyber Correlation** | Elevate trust threshold, increase monitoring | Investigate root cause |
| **Supply Chain Alert** | Block component, activate alternate | Qualify alternate |

---
