## 5. Data Management & Digital Thread

### 5.1 Test Record Schema (JSON-LD)

```json
{
  "@context": "https://aegis-fab.org/qa-context.jsonld",
  "test_id": "QA-2026-10-18-RM-TG-0042",
  "timestamp": "2026-10-18T14:32:17Z",
  "edition": "RM-TG",
  "lot_id": "LOT-2026-10-15-RM-TG-L3",
  "material_lots": {
    "L3_ceramic": "MAT-B4C-2026-10-01-042",
    "L3_adhesive": "MAT-EPX-2026-09-28-017"
  },
  "test_type": "XRAY_CT",
  "parameters": {
    "voltage_kV": 180,
    "current_mA": 1.2,
    "voxel_um": 10,
    "scan_time_s": 1800
  },
  "results": {
    "void_count": 3,
    "max_void_mm3": 0.027,
    "delam_count": 0,
    "pass_fail": "PASS",
    "images": ["s3://aegis-qa/CT-0042/"]
  },
  "operator": "AUTO-CT-03",
  "reviewer": "QA-ENG-007",
  "digital_twin_ref": "DT-RM-TG-0042"
}
```

### 5.2 Data Lake Architecture

```
Ingestion: Kafka (qa.raw) → Schema Registry (Avro)
Processing: Spark Structured Streaming → Delta Lake
Storage: 
  - Hot: Delta tables (last 90 days, sub-second query)
  - Warm: Parquet/S3 (1 year, partitioned by edition/date)
  - Cold: Glacier (7 years, compliance)
Governance: Unity Catalog, lineage, PII masking
API: GraphQL (query), gRPC (ingest), WebSocket (real-time)
```

---
