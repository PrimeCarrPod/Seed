## 6. Cyber/EA Test

### 6.1 Cooperative Vulnerability & Penetration Testing (CVPT)

Per **NIST 800-53 CA-8** and **DoD RMF**:

| Phase | Scope | Team | Duration | Rules of Engagement |
|-------|-------|------|----------|---------------------|
| **CVPT-1** | Component (DOC-30 AI, DOC-29 comms) | Red Team + Blue | 4 weeks | No DoS, no destructive |
| **CVPT-2** | Subsystem (Power+AI, Sensor+AI) | Red Team + Blue | 4 weeks | Limited DoS (scheduled) |
| **CVPT-3** | Full System (suit + network) | Red Team + Blue + IA | 6 weeks | Full RoE, ATO required |
| **CVPT-4** | Operational (OT integration) | Red Team + OT force | 4 weeks | OT RoE, live data |

### 6.2 Adversarial Assessment — MITRE ATT&CK Mapping

| Tactic | Technique | Test Case | Detection (DOC-30) |
|--------|-----------|-----------|-------------------|
| **Initial Access** | Supply Chain (T1195) | Malicious FW update | SBOM verify fail |
| **Execution** | Scripting (T1059) | Injected Python in AI | Runtime monitor |
| **Persistence** | Firmware (T1542) | Modified bootloader | Secure boot fail |
| **Privilege Escalation** | Exploitation (T1068) | Kernel vuln in RTOS | CFI trap |
| **Defense Evasion** | Indicator Removal (T1070) | Log deletion | Immutable log fail |
| **Credential Access** | Credential Dumping (T1003) | Extract keys from RAM | DMA protection |
| **Discovery** | Network Sniffing (T1040) | Mesh traffic capture | AES-GCM + FHSS |
| **Lateral Movement** | Exploit Trust (T1550) | Compromise peer suit | Mutual auth fail |
| **Collection** | Data from Sensors (T1056) | Exfiltrate DOC-29 data | DLP + rate limit |
| **Exfiltration** | Over C2 (T1041) | Encrypted exfil | TLS inspection |

### 6.3 Electronic Attack (EA) Test

| EA Type | Parameters | Test Method | Pass Criteria |
|---------|------------|-------------|---------------|
| **Barrage Noise** | 1–18 GHz, 10 kW ERP | Anechoic + jammer | Comm > 90% throughput |
| **Spot Noise** | Threat freq, 100 W | Chamber + signal gen | FHSS hops > 95% |
| **Swept Noise** | 1–18 GHz, 1 ms dwell | Chamber | Acquisition < 5 s |
| **Deceptive (DRFM)** | False targets, 10 dB J/S | Range + DRFM | Track not broken |
| **Cyber-EA (GPS Spoof)** | 10 m offset, 100 Hz | Outdoor + spoofer | INS holds < 5 m drift |

---
