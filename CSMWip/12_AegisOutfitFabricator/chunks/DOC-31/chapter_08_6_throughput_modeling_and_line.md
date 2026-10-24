## 6. Throughput Modeling and Line Balancing

### 6.1 Takt Time Analysis

**Target Production Rate:**

The line efficiency is $\eta_{line} = \frac{T_{takt}}{T_{cycle} \times N_{cells}}$ where $N_{cells}=9$.

```
Takt time: T_takt = 480 min / 12 suits = 40 min/suit
Cell cycle time: T_cell ≤ 4.5 min (9 cells in pipeline)
OEE target: ≥ 0.85 (Availability × Performance × Quality)
```

The bottleneck cycle time determines throughput: $T_{bottleneck} = \max(T_{cell_i})$.

**Cell Cycle Breakdown (per station):**

| Cell | Operation | Setup | Process | Unload/Load | Total | Margin |
|------|-----------|-------|---------|-------------|-------|--------|
| 1 | PVOH saturate + dry | 0.5 | 3.0 | 0.3 | 3.8 | 15% |
| 2 | Sewbo sewing (L1,L2,L5,L7,L8,L10,L12) | 0.8 | 12.0 | 0.5 | 13.3* | - |
| 3 | Ultrasonic weld (US-01..07) | 0.5 | 6.0 | 0.3 | 6.8 | - |
| 4 | RF weld (RF-01..04) | 0.5 | 4.0 | 0.3 | 4.8 | - |
| 5 | TFP embroidery (L11) | 0.3 | 5.0 | 0.2 | 5.5 | - |
| 6 | Vision inspection | 0.2 | 3.0 | 0.2 | 3.4 | - |
| 7 | Leak test (L9) | 0.3 | 2.5 | 0.2 | 3.0 | - |
| 8 | PVOH wash + dry | 0.5 | 8.0 | 0.3 | 8.8 | - |
| 9 | Final inspection + pack | 0.3 | 4.0 | 0.3 | 4.6 | - |

*Cell 2 parallelizes: 2 sewing heads (RS-512 + RS-530) on dual gantry → effective 6.7 min

**Line Balancing Result:**
```
Bottleneck: Cell 8 (PVOH wash) at 8.8 min
Solution: 2 parallel wash stations → effective 4.4 min
All cells ≤ 4.5 min → line balanced at 4.5 min takt
Theoretical throughput: 480 / 4.5 = 106 suits/shift (with 2 parallel lines)
```

### 6.2 MTBF and Availability Model

The system availability for series components is $A_{sys} = \prod_{i=1}^{n} A_i$ where $A_i = \text{MTBF}_i / (\text{MTBF}_i + \text{MTTR}_i)$.

| Subsystem | MTBF (hours) | MTTR (hours) | Availability |
|-----------|--------------|--------------|--------------|
| KUKA Robot | 40,000 | 2.0 | 0.99995 |
| Sewing Head (Pfaff) | 8,000 | 1.5 | 0.99981 |
| Ultrasonic Gen. | 15,000 | 1.0 | 0.99993 |
| RF Generator | 12,000 | 2.0 | 0.99983 |
| Vision System | 25,000 | 1.0 | 0.99996 |
| PVOH System | 5,000 | 3.0 | 0.99940 |
| **System (series)** | **2,100** | **2.5** | **0.9988** |

**SMED Changeover (Edition Switch):**
```
Internal (machine stopped): Tool change (7 tools) = 56 s
External (pre-staged): Program load, fiducial teach = 180 s
Total changeover: 236 s (< 4 min) → fits in buffer time
```

---
