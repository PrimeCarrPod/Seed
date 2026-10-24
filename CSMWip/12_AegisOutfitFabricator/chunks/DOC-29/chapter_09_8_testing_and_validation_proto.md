## 8. Testing and Validation Protocol

### 8.1 Unit Testing
| Test | Method | Acceptance | Standard |
|------|--------|------------|----------|
| FBG calibration | Thermal chamber + tensile stage | ±2 με, ±0.2°C | ASTM E1806 |
| OFDR resolution | Cantilever beam + heated stage | 5 με, 0.5°C | ASTM E1806 |
| BOTDA range | 2 km spooled fiber | 1°C, 20 με | IEC 61757 |
| RF link budget | Anechoic chamber | 110 dB (2.4G) | IEEE 802.15.4 |
| TSCH schedule | Network simulator (ns-3) | 0 collisions | IEC 61784 |
| Antenna efficiency | Wheeler cap / reverberation | >65% on body | IEEE 1451.5 |

### 8.2 Integration Testing
| Test | Configuration | Duration | Criteria |
|------|---------------|----------|----------|
| Full outfit sensor suite | All 12 layers, 100 nodes | 8h continuous | No data loss >1s |
| Ballistic impact + sensing | NIJ 0101.06 + live sensors | 5 shots | Sensors survive, data valid |
| Thermal shock + sensing | -40°C to +150°C, 10 cycles | 2h | No calibration drift |
| EMI immunity + sensing | MIL-STD-461G RE102 | 1h | PER <10⁻³ |
| Vibration + sensing | MIL-STD-810H 514.8 | 1h | No fiber breakage |
| Wash/wear cycles | 50 cycles (simulated) | 1 week | <5% sensor loss |

### 8.3 System Validation
```
End-to-End Validation Scenario:
  1. Don outfit (LE-TG edition)
  2. Initialize: Network formation <30 s, all sensors reporting
  3. Baseline: 10 min quiet standing (calibration)
  4. Walk: 1 km at 5 km/h (motion + physiological)
  5. Impact: Simulated blast (pressure wave) → detect in <10 ms
  6. Thermal: Directed energy pulse → detect in <100 ms
  7. Chemical: Simulant release → detect in <1 s
  8. Doff: Data integrity check (checksums match)
  9. Report: Full health report generated <60 s
```

---
