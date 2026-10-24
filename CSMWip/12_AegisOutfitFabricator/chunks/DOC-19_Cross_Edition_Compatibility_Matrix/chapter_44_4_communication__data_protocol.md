## 4. Communication & Data Protocols

### 4.1 BLE 5.0 Mesh (All Editions)

| Parameter | Specification | Commonality |
|-----------|---------------|-------------|
| **Protocol** | BLE 5.0 Mesh | 100% |
| **Frequency** | 2.4 GHz ISM | 100% |
| **Mesh Nodes** | 12 (LES zones) + 1 (display) | 100% |
| **Encryption** | AES-256 | 100% |
| **Throughput** | 1 Mbps | 100% |
| **Range** | 30m (open), 10m (body) | 100% |
| **Latency** | <10ms (local) | 100% |

### 4.2 Base Station Uplink

| Parameter | Specification | Commonality |
|-----------|---------------|-------------|
| **Protocol** | HTTPS/REST + MQTT | 100% |
| **Encryption** | TLS 1.3 | 100% |
| **Authentication** | mTLS + JWT | 100% |
| **Data Schema** | Protobuf (edition-agnostic) | 100% |
| **Upload Cadence** | Periodic (1hr) + event-driven | 100% |
| **Offline Buffer** | 30 days local storage | 100% |

---

