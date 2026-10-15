## 6. Electrical Test Protocol — CSMFAB-EMI-001/002 (Adapted)

### 6.1 Shielding Effectiveness Test (CSMFAB-EMI-001)

```
FACILITY: Mode-stirred reverberation chamber (IEEE STD 299)
FREQUENCY: 10 MHz - 18 GHz (3 octave bands)
FIELD: 200 V/m (CW), 50 kV/m (pulsed E1 sim)
MANIKIN: Instrumented with 50 internal E-field probes
EDITIONS: All 8 editions, 3 orientations each

ACCEPTANCE CRITERIA:
  SE ≥ 80 dB @ 10 MHz-10 GHz (all editions)
  SE ≥ 60 dB @ 10-18 GHz
  No resonance > -6 dB in passband
  Post-EMP functional: All sensors operational
```

### 6.2 Surge Immunity Test (CSMFAB-EMI-002 / IEC 61000-4-5)

```
WAVEFORM: 1.2/50 μs voltage, 8/20 μs current
LEVEL: 4 kV (line-earth), 2 kV (line-line)
COUPLING: Capacitive (100 pF) to metallic thread layers
CRITERIA: No damage, no latch-up, SE maintained
```

### 6.3 GIC Simulation Test (CSMFAB-GIC-001)

```
WAVEFORM: dB/dt ramp 0 → 5000 nT/s → 0 over 60s
INDUCED E: 7.5 μV/m (Carrington scale)
MEASUREMENT: Internal current density (Hall probes, 40 zones)
CRITERIA: J_induced ≤ 1 A/m² (all zones, all editions)
```

---
