## 8. Edition Changeover Procedure

### 8.1 Digital Twin Configuration

**Per-Edition Recipe (loaded from MES):**
```
Recipe structure (JSON):
{
  "edition": "RM-TG",
  "gantry_reach_mm": 3100,
  "panel_layout": "SYNTH-03/DXF/RM-TG_v4.2.dxf",
  "sewing_sequences": [
    {"layer": "L1", "stitch": "301", "density": 4.7, "thread": "core-spun_PET_cotton"},
    {"layer": "L2", "stitch": "401", "density": 3.1, "thread": "para-aramid"}
  ],
  "us_weld_params": {"US-01": {"freq": 35000, "amp": 40, "force": 800, "speed": 12}},
  "rf_weld_params": {"RF-01": {"voltage": 1800, "power": 3200, "time": 2.5}},
  "vision_fiducials": ["RM-TG_fiducials.csv"],
  "qa_thresholds": {"peel": 80, "shear": 200, "leak": 1e-9}
}
```

### 8.2 Changeover Sequence (SMED)

```
1. MES pushes new recipe to all cells (30 s)
2. Robots home to reference position (15 s)
3. ATC executes tool change sequence (56 s)
4. Vision system loads new fiducial map (10 s)
5. First article inspection (FAI) on 3 panels (120 s)
6. SPC baseline update (10 s)
7. Release to production

Total: 241 s (4 min 1 s) < 4.5 min takt buffer
```

---
