
### 6.2 Output to Manufacturing (CSMFAB078-D)
```
Cutting Plan: Marker layout (DXF/SVG)
Piece List: Piece ID, Position, Rotation, Grain
Remnant Catalog: Available remnants for next batch
Cutting Instructions: Sequence, tool paths
```

### 6.3 Data Exchange Format
**Marker File (JSON):**
```json
{
  "marker_id": "MKR_20261011_001",
  "edition": "RM-TG",
  "width_mm": 560,
  "length_mm": 4500,
  "efficiency": 0.873,
  "pieces": [
    {"id": "BF_01", "x": 12, "y": 45, "rotation": 0, "grain": "warp"},
    {"id": "BB_01", "x": 200, "y": 45, "rotation": 0, "grain": "warp"}
  ],
  "remnants": [
    {"id": "REM_001", "type": "rectangular", "w": 150, "h": 200, "area": 30000}
  ]
}
```

## 7. Traceability Matrix — DRAFT-05

