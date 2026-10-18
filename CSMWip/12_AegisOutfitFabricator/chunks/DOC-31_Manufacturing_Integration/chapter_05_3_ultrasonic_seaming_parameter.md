## 3. Ultrasonic Seaming Parameters

### 3.1 Ultrasonic Welding Physics (Research Doc 2 §7.1)

Ultrasonic stitching uses high-frequency acoustic vibrations (20-50 kHz) to induce internal molecular friction in thermoplastic layers.

**System Configuration:**
```
Transducer: Piezoceramic PZT-8, 35 kHz resonant
Booster: Gain 2.5:1 (amplitude amplification)
Sonotrode: Ti-6Al-4V, profiled face pattern per seam type
Anvil: Hardened tool steel (HRC 58-62), patterned roller Ø 80 mm
```

**Energy Balance Model:**

The acoustic power conversion efficiency is $\eta_{ac} = P_{mech}/P_{in} \approx 0.85$.

```
Power input: P_in = V_rms × I_rms × cos(φ)  [W]
Mechanical power: P_mech = η_trans × P_in  (η_trans ≈ 0.85)
Heat generation rate: Q̇ = η_heat × P_mech  (η_heat ≈ 0.92)

Temperature rise at interface:
ΔT(t) = Q̇ × t / (ρ × c_p × V_melt)
ρ = 1400 kg/m³ (polyester), c_p = 1200 J/kg·K
V_melt = A_weld × δ_melt  (δ_melt ≈ 50-100 μm)
```

The weld strength scales with energy density: $\sigma_{weld} \propto (E_{density})^{0.6}$.

### 3.2 Seam-Type Parameter Matrix

Per layer transition requirements (Section 1.2):

| Seam ID | Layer Pair | Frequency | Amplitude | Pressure | Speed | Anvil Pattern |
|---------|------------|-----------|-----------|----------|-------|---------------|
| **US-01** | L1-L2 (Silk/Aramid) | 35 kHz | 40 μm | 0.8 MPa | 12 m/min | Herringbone 1.2 mm |
| **US-02** | L2-L4 (Aramid/Aerogel) | 40 kHz | 30 μm | 0.5 MPa | 15 m/min | Diamond 0.8 mm |
| **US-03** | L4-L6 (Aerogel/MOF) | 35 kHz | 25 μm | 0.4 MPa | 18 m/min | Linear 1.0 mm |
| **US-04** | L6-L8 (MOF/Auxetic) | 35 kHz | 35 μm | 0.6 MPa | 14 m/min | Herringbone 1.2 mm |
| **US-05** | L8-L10 (Auxetic/MHD) | 40 kHz | 30 μm | 0.5 MPa | 16 m/min | Diamond 0.8 mm |
| **US-06** | L10-L11 (MHD/Sensor) | 20 kHz | 50 μm | 1.0 MPa | 10 m/min | Spot weld array |
| **US-07** | L11-L12 (Sensor/Silk) | 35 kHz | 40 μm | 0.8 MPa | 12 m/min | Herringbone 1.2 mm |

**Quality Gates per Seam:**
```
Peel strength: F_peel ≥ 80 N/25mm (ASTM D1876)
Shear strength: F_shear ≥ 200 N/25mm (ASTM D1002)
Visual: No burn-through, no unbonded zones >2 mm
Thermal: ΔT_surface < 120°C (IR camera monitor)
```

### 3.3 Ultrasonic Process Control Loop

```
Closed-loop control (1 kHz update rate):
1. Force sensor (Kistler 9217A): F_z ∈ [0, 5] kN, ±0.5% FS
2. Amplitude monitor: Laser vibrometer (Polytec OFV-5000), ±1 μm
3. Power monitor: Generator feedback (V, I, φ)
4. Temperature: IR pyrometer (Optris CTlaser, 0-500°C, 1 ms)

Control Law (PID + feedforward):
u(t) = K_p e(t) + K_i ∫e dt + K_d de/dt + K_ff × F_target
e(t) = F_target - F_measured
K_p = 0.8, K_i = 0.05, K_d = 0.02, K_ff = 1.0

Fault Detection:
- Force drop >20% in 50 ms → seam skip (contamination)
- Amplitude drift >10% → sonotrode wear alert
- Power spike >30% → anvil misalignment
```

---
