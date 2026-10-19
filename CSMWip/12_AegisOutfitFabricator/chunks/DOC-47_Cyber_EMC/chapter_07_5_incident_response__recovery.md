## 5. Incident Response & Recovery

### 5.1 Cyber Incident Response Plan (CIRP)

Per **NIST SP 800-61 Rev 2**, **DoDI 8530.01**, **CJCSM 6510.01**:

**Phases**:

| Phase | Activities | AIMES Specific |
|-------|------------|----------------|
| **Preparation** | Playbooks, training, tools, baselines | Cyber range (CSMFAB-TGPU004.htm) |
| **Detection/Analysis** | Alert triage, scope, impact | PHM-cyber fusion, automated scope |
| **Containment** | Short-term: isolate, block; Long-term: patch, reconfigure | LRU quarantine, safe mode |
| **Eradication** | Remove artifacts, patch vulns | Firmware update, key rotation |
| **Recovery** | Restore, verify, monitor | Attestation, phased return |
| **Post-Incident** | Root cause, lessons learned, update | Update playbooks, TTPs |

### 5.2 Recovery Time Objectives

| Scenario | RTO | RPO | Method |
|----------|-----|-----|--------|
| **Single LRU Compromise** | 15 min | 0 | LRU swap, attestation |
| **Network Segment Compromise** | 1 hour | 0 | VLAN isolation, re-key |
| **Neuromorphic Model Poisoning** | 4 hours | 1 hr | Rollback to verified model |
| **Firmware Implant** | 24 hours | 0 | Signed firmware reload |
| **Supply Chain Compromise** | 72 hours | 0 | Alternate source activation |
| **Full System Compromise** | 7 days | 4 hrs | Clean rebuild from TDP (DOC-44) |

### 5.3 Resilience — Mission Continuity

**Degraded Mode Operations**:

| Degraded Mode | Capability Retained | Duration |
|---------------|---------------------|----------|
| **Cyber Silent** | Core protection (ballistic, thermal, seal), local BIT | 72 hrs |
| **AI Disabled** | Manual control, pre-planned responses | Mission |
| **RF Mesh Down** | Line-of-sight comms, store-and-forward | 24 hrs |
| **PHM Degraded** | Scheduled maintenance, operator monitoring | 30 days |

---
