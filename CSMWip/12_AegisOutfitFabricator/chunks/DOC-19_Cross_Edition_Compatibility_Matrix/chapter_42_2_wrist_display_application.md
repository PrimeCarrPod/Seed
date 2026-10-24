## 2. Wrist Display Application

### 2.1 App Version Matrix

| Edition | App Version | UI Framework | Edition Skin | Alert Logic | Data Logging |
|---------|-------------|--------------|--------------|-------------|--------------|
| **RM-TS** | v1.7 | Shared 95% | RM-TS | Identical | Identical |
| **RM-TG** | v1.7 | Shared 95% | RM-TG | Identical | Identical |
| **RM-SS** | v1.5 | Shared 95% | RM-SS | Identical | Identical |
| **RM-SG** | v1.6 | Shared 95% | RM-SG | Identical | Identical |
| **RW-TS** | v1.7 | Shared 95% | RW-TS | Identical | Identical |
| **RW-TG** | v1.7 | Shared 95% | RW-TG | Identical | Identical |
| **RW-SS** | v1.5 | Shared 95% | RW-SS | Identical | Identical |
| **RW-SG** | v1.6 | Shared 95% | RW-SG | Identical | Identical |

### 2.2 Shared App Components

| Component | Lines of Code | Shared % | Edition-Specific |
|-----------|---------------|----------|------------------|
| **UI Framework** | 18,600 | 100% | — |
| **BLE Manager** | 6,400 | 100% | — |
| **Sensor Display** | 8,200 | 100% | Units/labels |
| **Alert Engine** | 4,800 | 100% | Thresholds |
| **Data Logger** | 5,400 | 100% | Schema |
| **Settings Manager** | 3,600 | 100% | Edition params |
| **Firmware Updater** | 2,800 | 100% | Version check |
| **TOTAL** | **49,800** | **95%** | **5%** |

### 2.3 App Update Compatibility

| Update Type | Compatibility | Notes |
|-------------|---------------|-------|
| **Minor (v1.x.x)** | All editions | Auto-install |
| **Major (v1.x → v2.0)** | All editions | User consent required |
| **Edition Skin Pack** | Per edition | Downloaded on edition detect |
| **Cross-Edition Install** | Not supported | Factory install only |

---

