## 7. In-Process Inspection and Quality Assurance

### 7.1 Multi-Modal Inspection Stack

| Inspection Point | Modality | Parameters | Frequency | Pass Criteria |
|------------------|----------|------------|-----------|---------------|
| **IP-1** Post-Sewbo | Laser profilometry | Z-map ±0.01 mm, 50 μm res | 100% | ΔZ < 0.15 mm |
| **IP-2** Post-US | IR thermography | ΔT < 120°C, 0.1°C res | 100% | No hot spots >150°C |
| **IP-3** Post-RF | Dielectric scan | ε''_r mapping, 1 mm res | 100% | Uniform ±10% |
| **IP-4** Post-TFP | Optical (5 MP) | Stitch placement ±0.05 mm | 100% | All fiducials detected |
| **IP-5** Final | X-ray CT (sample) | 3D void analysis, 10 μm vox | 5% (AQL 1.0) | No voids > 0.5 mm |
| **IP-6** Final | Helium leak | Q_He < 1×10⁻⁹ mbar·L/s | 100% (L9 seams) | Pass |

### 7.2 Statistical Process Control

The process capability index is $C_{pk} = \min\left(\frac{USL - \bar{X}}{3\sigma}, \frac{\bar{X} - LSL}{3\sigma}\right)$.

**Critical-to-Quality (CTQ) Parameters:**
```
1. Seam position accuracy: X̄ = 0.00 mm, σ = 0.04 mm → Cpk = 2.08
2. Ultrasonic weld amplitude: X̄ = 38 μm, σ = 1.2 μm → Cpk = 1.67
3. RF weld voltage: X̄ = 1.85 kV, σ = 0.03 kV → Cpk = 1.67
4. PVOH residual: X̄ = 0.02%, σ = 0.005% → Cpk = 2.67
5. Helium leak rate: X̄ = 2×10⁻¹⁰, σ = 5×10⁻¹¹ → Cpk = 2.00
```

**Control Charts:**
- X̄/R charts: Subgroup n=5, hourly sampling
- EWMA: λ = 0.2 for drift detection (amplitude, voltage)
- Cusum: For leak rate (low defect rate)

---
