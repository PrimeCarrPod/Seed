## 3. Digital Twin Real-Time Update Loop — Delta by Edition

### 3.1 Sensor Configuration by Edition

| Sensor Type | RM-TS | RM-TG | RM-SS | RM-SG | RW-TS | RW-TG | RW-SS | RW-SG |
|-------------|-------|-------|-------|-------|-------|-------|-------|-------|
| **PVDF (L11)** | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones |
| **LES Pressure** | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones |
| **Hall Effect (Tiles)** | 260 | 312 | 225 | 265 | 240 | 580 | 1,225 | 735 |
| **RTD Thermal** | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones | 12 zones |
| **BLE Mesh Nodes** | 13 | 13 | 13 | 13 | 13 | 13 | 13 | 13 |

### 3.2 Data Rate & Bandwidth by Edition

| Parameter | RM-TS | RM-TG | RM-SS | RM-SG | RW-TS | RW-TG | RW-SS | RW-SG |
|-----------|-------|-------|-------|-------|-------|-------|-------|-------|
| **Sensor Data Rate** | 1.2 Mbps | 1.3 Mbps | 1.1 Mbps | 1.2 Mbps | 1.2 Mbps | 1.4 Mbps | 1.5 Mbps | 1.3 Mbps |
| **BLE Mesh Traffic** | 850 kbps | 920 kbps | 780 kbps | 850 kbps | 850 kbps | 1.0 Mbps | 1.1 Mbps | 920 kbps |
| **Cloud Upload (1hr)** | 12 MB | 13 MB | 10 MB | 12 MB | 12 MB | 15 MB | 16 MB | 13 MB |
| **Local Storage (30 days)** | 360 MB | 390 MB | 300 MB | 360 MB | 360 MB | 450 MB | 480 MB | 390 MB |

### 3.3 Digital Twin Update Loop — Common Code

```python
