## 9. Logistics Information Systems

### 9.1 GLO System Architecture (Kubernetes + Kafka + TimescaleDB)

```
SERVICES (Microservices, gRPC/REST):
  ├── inventory-service          (CRUD, reservations, allocations)
  ├── demand-forecast-service    (Prophet, ARIMA, LSTM models)
  ├── replenishment-engine       (Min-cost flow, constraints)
  ├── cold-chain-monitor         (IoT ingestion, alerting)
  ├── dmsms-tracker              (GIDEP ingest, risk scoring)
  ├── phoenix-recovery-tracker   (Batch genealogy, yield)
  ├── transport-scheduler        (AMC + commercial optimization)
  ├── traceability-ledger        (Hyperledger Fabric, immutable)
  └── api-gateway                (AuthZ, rate limit, audit)

DATA STORES:
  ├── TimescaleDB (PHM time-series, 500+ units × 1000 metrics × 1Hz)
  ├── PostgreSQL (Transactional: orders, inventory, contracts)
  ├── Redis (Cache: real-time availability, allocations)
  ├── Kafka (Event bus: PHM alerts, inventory movements, DMSMS)
  ├── MinIO (Documents: test reports, certificates, SLEP)
  └── Elasticsearch (Full-text search: specs, manuals, alerts)
```

### 9.2 Interoperability Standards

| Interface | Standard | Profile |
|-----------|----------|---------|
| PHM → GLO | ISO 13374-40:2021 | OPC-UA PubSub over TSN |
| GLO ↔ ERP | ANSI ASC X12 | EDI 850/855/856/810 |
| GLO ↔ AMC | MIL-STD-6016 | JREAP-C / Link-16 |
| GLO ↔ OEM | RosettaNet | PIP3A4 (Order), PIP3B2 (Forecast) |
| Hub ↔ Forward Base | MQTT-SN | QoS 1, TLS 1.3 |
| Blockchain Ledger | Hyperledger Fabric 2.5 | Raft ordering, PBFT validation |

---
