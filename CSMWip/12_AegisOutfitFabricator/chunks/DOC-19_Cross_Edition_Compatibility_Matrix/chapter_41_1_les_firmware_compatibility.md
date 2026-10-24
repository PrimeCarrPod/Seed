## 1. LES Firmware Compatibility

### 1.1 Firmware Version Matrix

| Edition | Firmware Version | Code Base | Zone Params | SMA Control | BLE Stack | OTA |
|---------|-----------------|-----------|-------------|-------------|-----------|-----|
| **RM-TS** | v2.3 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RM-TG** | v2.3 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RM-SS** | v2.1 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RM-SG** | v2.2 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RW-TS** | v2.3 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RW-TG** | v2.3 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RW-SS** | v2.1 | Shared 95% | Edition-specific | Identical | Identical | Yes |
| **RW-SG** | v2.2 | Shared 95% | Edition-specific | Identical | Identical | Yes |

### 1.2 Shared Code Components

| Component | Lines of Code | Shared % | Edition-Specific |
|-----------|---------------|----------|------------------|
| **RTOS Kernel** | 12,400 | 100% | — |
| **BLE Stack** | 8,200 | 100% | — |
| **SMA Control Loop** | 3,600 | 100% | — |
| **Zone Pressure PID** | 4,800 | 100% | Zone params |
| **Sensor Fusion** | 5,400 | 100% | Calibration coeffs |
| **Power Management** | 2,800 | 100% | Sleep params |
| **Diagnostics** | 3,200 | 100% | Thresholds |
| **OTA Manager** | 2,400 | 100% | Version check |
| **TOTAL** | **42,800** | **95%** | **5%** |

### 1.3 Firmware Update Compatibility

| From Version | To Version | Compatible | Migration Required |
|--------------|------------|------------|-------------------|
| v2.0 → v2.1 | All editions | Yes | Config migration |
| v2.1 → v2.2 | SS/SG editions | Yes | Zone param update |
| v2.2 → v2.3 | TS/TG editions | Yes | Zone param update |
| Cross-edition | RM ↔ RW | No | Factory reflash |

---

