```

### 5.2 Secondary Metrics
```
Number of Remnants: N_rem (minimize)
Largest Remnant: A_max (maximize for reuse)
Grain Compliance: % pieces with correct grain orientation
Pattern Match Score: Alignment quality for repeats
```

### 5.3 Edition-Specific Targets
| Edition | Pieces | η Target | Waste Target | ρ Target |
|---------|--------|----------|--------------|----------|
| RM-TS | 45 | 88% | <4% | 75% |
| RM-TG | 55 | 87% | <4% | 72% |
| RM-SS | 40 | 89% | <3% | 78% |
| RM-SG | 60 | 86% | <5% | 70% |
| RW-TS | 45 | 88% | <4% | 75% |
| RW-TG | 55 | 87% | <4% | 72% |
| RW-SS | 40 | 89% | <3% | 78% |
| RW-SG | 60 | 86% | <5% | 70% |

## 6. Integration with Drafting Pipeline

### 6.1 Input from DRAFT-01/02/03
```
From DRAFT-01: DXF/SVG pattern pieces with grainline vectors
From DRAFT-02: Edition-specific scaled pieces
From DRAFT-03: Pleated pieces with fold annotations
```
