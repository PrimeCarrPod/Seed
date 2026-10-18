## 5. Fault Detection, Isolation, and Recovery (FDIR)

### 5.1 Fault Taxonomy
```
Fault Classes (per MIL-STD-882E):
  Class I (Catastrophic): Loss of life, outfit destruction
    - Uncontrolled MR fluid activation during movement
    - Seal failure in vacuum
    - Processor lockup during threat
    
  Class II (Critical): Major injury, mission failure
    - False threat classification (missed ballistic)
    - Sensor fusion divergence (>3σ)
    - Communication loss >30 s
    
  Class III (Marginal): Minor injury, degraded performance
    - Single FBG failure
    - RF node loss (<10%)
    - Thermal control degradation
    
  Class IV (Minor): Nuisance, no safety impact
    - Telemetry gap
    - Non-critical log loss
```

### 5.2 Detection Mechanisms
```
Detection Coverage:
  - Processor: Lockstep compare (100%), watchdog (100%), ECC (100%)
  - Memory: EDAC scrubbing (99.9%), march test (startup, 99%)
  - Sensors: Range check (100%), rate check (95%), cross-check (90%)
  - Network: Heartbeat (100%), CRC (100%), sequence (99%)
  - Actuators: Feedback compare (100%), current monitor (95%)
  
Detection Latency:
  - Single-point: ≤1 ms (hardware compare)
  - Latent: ≤10 ms (software check)
  - Periodic: ≤100 ms (background scrub)
```

**Detection Probability Equations:**
- Lockstep detection: $P_{detect}^{LS} = 1 - (1 - p_{comp})^N \approx 1$ (per cycle, $N=2$)
- Watchdog coverage: $C_{WD} = \frac{T_{window} - T_{margin}}{T_{window}} = \frac{10 - 1}{10} = 90\%$
- ECC detection: $P_{detect}^{ECC} = 1 - \frac{\binom{n}{t+1}}{\binom{n}{0} + \dots + \binom{n}{t}}$ (SEC-DED, t=1)
- EDAC scrubbing rate: $\lambda_{scrub} = \frac{1}{T_{scrub}} = 1 \text{ Hz}$ (full memory/hr)
- Sensor cross-check: $P_{detect}^{cross} = \Phi(3) - \Phi(-3) = 99.73\%$ ($3\sigma$)
- CRC-32 detection: $P_{undetect} = 2^{-32} \approx 2.3 \times 10^{-10}$

### 5.3 Recovery Strategies
```
Recovery Actions:
  1. Partition restart (P0-P7): <100 ms (ARINC 653 service)
  2. Processor failover (lockstep → spare): <1 s (state sync)
  3. Sensor exclusion: <10 ms (KF measurement masking)
  4. Network reconfiguration: <1 s (RPL repair)
  5. Graceful degradation: Mode transition (ASIL-D → ASIL-B)
  
State Preservation:
  - Critical state in MRAM (non-volatile, 256 MB)
  - Checkpoint every 100 ms (major frame × 100)
  - Checkpoint size: 2 MB (compressed)
  - Recovery: Restore from last checkpoint + replay events
```

---
