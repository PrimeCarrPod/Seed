# Document 13: Optical NVLink and Optical Circuit Switching Physics
## Piece 5: Silicon Photonics Modulator: Depletion vs. Injection vs. GeSi

---

### 13.5 Silicon Photonics Modulator: Depletion vs. Injection vs. GeSi

Silicon photonics modulators are the critical active components that encode electrical data onto optical carriers. The choice of modulation mechanism—carrier depletion, carrier injection, or GeSi electro-absorption—determines the modulator's speed, power, footprint, and integration complexity.

#### 13.5.1 Modulation Physics in Silicon

**Plasma dispersion effect** (free-carrier effect):
```
Δn = -8.8×10⁻²² × ΔN_e - 8.5×10⁻¹⁸ × ΔN_h  (cm³)
Δα = 8.5×10⁻¹⁸ × ΔN_e + 6.0×10⁻¹⁸ × ΔN_h  (cm⁻¹)
```
where ΔN_e, ΔN_h = electron/hole concentration change (cm⁻³)

**Key parameters**:
- **Δn**: Refractive index change (phase modulation)
- **Δα**: Absorption coefficient change (amplitude modulation)
- **Phase shift**: Δφ = (2π/λ) × Δn × L
- **Extinction ratio**: ER = exp(Δα × L)

**Silicon limitations**:
- **No Pockels effect**: Silicon is centrosymmetric (χ⁽²⁾ = 0)
- **Free-carrier based**: Slower than Pockels (carrier dynamics)
- **Loss**: Free-carrier absorption (FCA) accompanies index change
- **Thermal sensitivity**: dn/dT = 1.86×10⁻⁴ K⁻¹ (thermal crosstalk)

#### 13.5.2 Carrier Depletion Modulator (Reverse-Biased PN Junction)

**Operating principle**:
- **Reverse bias**: Widens depletion region
- **Carrier sweep-out**: Electrons/holes removed from waveguide core
- **Δn < 0**: Refractive index increases (depletion)
- **Low loss**: Minimal free-carrier absorption in depletion region

**PN junction modulator**:
```
Reverse bias: V_R = 0 to -3V (typically -2V)
Depletion width: W_dep = √(2ε_s(V_bi + V_R)/(qN))
Capacitance: C_j = ε_sA/W_dep ∝ 1/√(V_bi + V_R)
```

**Performance metrics**:
| Parameter | Typical Value | Best Reported |
|-----------|---------------|---------------|
| V_πL_π | 2-3 V·cm | 1.2 V·cm |
| Bandwidth | 30-50 GHz | 70 GHz |
| Insertion loss | 2-4 dB | 1.5 dB |
| V_π | 2-4 V | 1.5 V |
| Footprint | 1-2 mm | 0.5 mm |
| Energy/bit | 50-100 fJ | 20 fJ |

**Depletion modulator advantages**:
- **Speed**: RC-limited (sub-ns to few ps)
- **Low loss**: Minimal FCA in depletion region
- **CMOS compatible**: Standard PN junction process
- **Low voltage**: 2-3V drive (CMOS compatible)
- **Linearity**: Good (quadratic C-V)

**Depletion modulator challenges**:
- **V_πL_π product**: Trade-off V_π vs L
- **Doping profile**: Abrupt vs graded junction
- **Optical loss**: Sidewall roughness, doping absorption
- **Thermal sensitivity**: V_π drifts with temperature

#### 13.5.3 Carrier Injection Modulator (Forward-Biased PIN)

**Operating principle**:
- **Forward bias**: Injects electrons/holes into intrinsic region
- **Carrier accumulation**: High ΔN in intrinsic region
- **Large Δn**: Strong phase/absorption change
- **High loss**: Significant FCA from injected carriers

**PIN diode modulator**:
```
Forward bias: I_F = q × A × (D_n n_p/L_n + D_p p_n/L_p) × (exp(qV/kT) - 1)
Carrier density: ΔN = I_F × τ / (q × A × L_i)
Phase shift: Δφ = (2π/λ) × Δn × L
```

**Performance metrics**:
| Parameter | Typical Value | Best Reported |
|-----------|---------------|---------------|
| V_π | 1-2 V | 0.5 V |
| V_πL_π | 0.5-1 V·cm | 0.2 V·cm |
| Bandwidth | 1-10 GHz | 25 GHz |
| Insertion loss | 5-15 dB | 3 dB |
| Extinction ratio | 10-20 dB | 30 dB |
| Energy/bit | 1-5 pJ | 100 fJ |

**Injection modulator advantages**:
- **Low voltage**: 1-2V drive
- **Large phase shift**: High Δn per volt
- **Compact**: Short L_π (100-500 µm)
- **Simple drive**: Forward bias (no HV)

**Injection modulator challenges**:
- **Speed limited by carrier lifetime**: τ = 1-10 ns (bulk Si)
- **High loss**: FCA from injected carriers
- **Pattern dependence**: Carrier lifetime effects
- **Thermal sensitivity**: Strong T-dependence of τ

**Speed enhancement techniques**:
1. **Carrier lifetime engineering**: Proton implantation, He⁺ implantation
2. **Pinched PIN**: Lateral p-n-p-n structure, field-assisted sweep-out
3. **Reverse recovery**: Pre-charge, fast sweep-out
3. **Traveling-wave electrode**: Velocity-matched, 50+ GHz

#### 13.5.4 Germanium-Silicon (GeSi) Electro-Absorption Modulator

**GeSi EAM principle**:
- **Material**: Ge₁₋ₓSiₓ (x = 0.2-0.5) on Si
- **Mechanism**: Quantum-confined Stark effect (QCSE)
- **Mechanism**: Electric field shifts absorption edge (Franz-Keldysh/QCSE)

**GeSi EAM structure**:
```
Si substrate → Si buffer → GeSi MQW → Si cap
PIN/PIN diode across MQW region
```

**GeSi EAM advantages**:
- **Direct bandgap** (Ge-rich): Strong absorption at 1310/1550 nm
- **CMOS compatible**: Ge on Si (epitaxial or transfer)
- **High speed**: > 50 GHz demonstrated
- **Low voltage**: < 2V (EAM) + 1-2V (laser)
- **Compact**: 200-500 µm length

**GeSi EAM performance**:
| Parameter | Typical | Best Reported |
|-----------|---------|---------------|
| Bandwidth | 30-50 GHz | 67 GHz |
| V_π | 1-2 V | 0.8 V |
| Extinction ratio | 10-15 dB | 25 dB |
| Insertion loss | 2-4 dB | 1.5 dB |
| Wavelength range | 1500-1600 nm | 1480-1620 nm |
| Temperature range | 0-70°C | -40 to 85°C |

**GeSi EAM challenges**:
- **Strain management**: Ge on Si (4.2% lattice mismatch)
- **Defect density**: Threading dislocations (TDD ~10⁶-10⁷/cm²)
- **Thermal budget**: Low-temp growth (< 450°C) for CMOS compatibility
- **Polarization sensitivity**: TE/TM extinction ratio
- **Temperature sensitivity**: Bandgap shift with T

**GeSi integration approaches**:
1. **Epitaxial Ge on Si**: Reduced thermal budget, high TDD
2. **Micro-transfer printing**: Ge on Si (heterogeneous)
3. **GeSn**: Higher Ge content (Sn reduces bandgap)
3. **Quantum well engineering**: Strain-balanced MQWs

#### 13.5.5 Silicon-Organic Hybrid (SOH) Modulator

**SOH concept**:
- **Organic EO polymer**: High χ⁽²⁾ (Pockels effect)
- **Integration**: Polymer cladding on Si waveguide
- **Pockels effect**: Δn = ½ n³ r E (linear EO effect)

**Organic EO polymers**:
| Polymer | r₃₃ (pm/V) | Bandwidth | Stability |
|---------|------------|-----------|-----------|
| JRD1 | 100-150 | >100 GHz | Good |
| BTR | 150-200 | >100 GHz | Moderate |
| Chromophore-doped | 200-300 | >100 GHz | Challenging |

**SOH modulator performance**:
| Parameter | Value |
|-----------|-------|
| V_πL_π | 0.5-1 V·cm |
| Bandwidth | >100 GHz |
| V_π | 1-2 V |
| Loss | 2-4 dB |
| Footprint | < 1 mm |

**SOH challenges**:
- **Poling stability**: Thermal decay of χ⁽²⁾
- **Thermal stability**: Polymer Tg > 150°C needed
- **Integration complexity**: Polymer deposition, poling
- **Reliability**: 10+ years at 85°C unproven

#### 13.5.6 Thin-Film Lithium Niobate (TFLN) Modulator

**TFLN advantages**:
- **Large Pockels coefficient**: r₃₃ = 30 pm/V
- **Low loss**: < 0.1 dB/cm
- **Wide bandwidth**: DC-100+ GHz
- **Low V_π**: < 1V (with push-pull)
- **Temperature stability**: dn/dT low

**TFLN on insulator (TFLNOI)**:
- **Structure**: LN (300-600 nm) / SiO₂ (2-3 µm) / Si
- **Fabrication**: Ion slicing / direct bonding / etching
- **Waveguide**: Ridge / slot / sub-wavelength grating

**TFLN modulator performance**:
| Parameter | Value |
|-----------|-------|
| V_πL_π | 0.5-1 V·cm |
| Bandwidth | >100 GHz (110 GHz demo) |
| V_π | < 1V (push-pull) |
| Loss | 1-2 dB/cm |
| Footprint | < 1 cm |
| Optical power handling | > 100 mW |

**TFLN challenges**:
- **Fabrication yield**: Uniform thin film, low loss
- **Photorefractive effect**: High optical power
- **Integration**: Hybrid (bonding) vs monolithic
- **Cost**: LN wafer cost, processing complexity

#### 13.5.7 Barium Titanate (BTO) on Silicon

**BTO properties**:
- **r₄₂**: 800-1200 pm/V (vs 30 for LN)
- **Curie temperature**: ~120°C (ferroelectric)
- **Bandgap**: 3.2 eV (transparent at 1550 nm)
- **Refractive index**: n ≈ 2.4 (1550 nm)

**BTO on Si integration**:
- **Epitaxy**: MBE/MOCVD on Si (buffer layers: SrTiO₃, MgO)
- **Polarization**: Self-poling / electric field poling
- **Thickness**: 100-500 nm (thin film)

**BTO modulator potential**:
- **V_πL_π**: < 0.5 V·cm (theoretical)
- **Bandwidth**: > 100 GHz
- **Footprint**: < 500 µm
- **Power**: < 10 mW (static)

**Challenges**: Ferroelectric domain control, fatigue, integration yield

#### 13.5.8 Modulator Comparison and Selection Guide

**Performance comparison** (1550 nm, 56 Gbaud PAM-4):

| Metric | Depletion PN | Injection PIN | GeSi EAM | SOH | TFLN |
|--------|--------------|---------------|----------|-----|------|
| Bandwidth | 50 GHz | 10 GHz | 50 GHz | 100 GHz | 100 GHz |
| V_π | 3 V | 1.5 V | 1.5 V | 1.5 V | 1 V |
| V_πL_π | 2.5 V·cm | 0.5 V·cm | 1 V·cm | 0.5 V·cm | 0.5 V·cm |
| Insertion loss | 2 dB | 8 dB | 2 dB | 3 dB | 1 dB |
| Extinction ratio | 15 dB | 20 dB | 15 dB | 20 dB | 20 dB |
| Energy/bit | 50 fJ | 500 fJ | 50 fJ | 20 fJ | 10 fJ |
| Footprint | 1.5 mm | 0.3 mm | 0.3 mm | 0.5 mm | 0.5 cm |
| CMOS compatible | Yes | Yes | Yes | Hybrid | Hybrid |
| TRL | 9 (production) | 7 (qualified) | 7 (qualified) | 5 (R&D) | 6 (prototyping) |
| Temperature sensitivity | Medium | High | Medium | High | Low |
| Optical power handling | High | Low | Medium | Medium | High |

#### 13.5.9 Modulator Selection by Application

**Datacenter interconnect (100-800G)**:
- **Choice**: Depletion PN / GeSi EAM
- **Reason**: CMOS compatible, 56-112 Gbaud, volume manufacturing

**Coherent transceiver (400ZR/800ZR)**:
- **Choice**: TFLN / TFLN-IQ modulator
- **Reason**: Low V_π, low loss, high linearity, high power handling

**AI cluster interconnect (NVLink optical)**:
- **Choice**: Depletion PN / GeSi EAM (integrated)
- **Reason**: CMOS compatible, 100-200 Gbaud, integration density

**HPC / Supercomputing**:
- **Choice**: TFLN / GeSi EAM (co-packaged)
- **Reason**: Low latency, high bandwidth, low power

**LiDAR / Sensing**:
- **Choice**: TFLN / SOH (high speed, low chirp)
- **Reason**: Fast tuning, low chirp, wide bandwidth

**Quantum/Photonic computing**:
- **Choice**: TFLN / SOH (low loss, high extinction)
- **Reason**: Quantum state fidelity, low loss

#### 13.5.10 Future: Unified Modulator Platform

**Heterogeneous integration vision**:
```
Si Photonic Wafer
├── Depletion PN modulators (high-volume, datacom)
├── GeSi EAM (high-speed, coherent)
├── TFLN modulators (high-performance, coherent)
├── SOH modulators (ultra-fast, quantum)
├── GeSi photodetectors (integrated Rx)
├── SiGeSn lasers (integrated Tx)
└── TFLN/GeSi TIA (integrated Rx)
```

**Monolithic integration roadmap**:
| Year | Integration Level | Key Enablers |
|------|-------------------|--------------|
| 2024 | Hybrid (III-V on Si) | Bonding, III-V on Si |
| 2026 | Heterogeneous (Si + III-V + LN) | Micro-transfer printing |
| 2028 | Quasi-monolithic | Selective area growth, aspect ratio trapping |
| 2030 | Monolithic (SiGeSn, GeSn) | Direct epitaxy on Si |

**Unified modulator platform vision**:
- **Single process flow**: All modulator types on one wafer
- **Design kit**: PDK with all modulator types
- **Compiler**: Auto-select modulator type per application
- **Yield**: > 90% (mature Si photonics process)

---

*End of Piece 5. Next: Piece 6 - Photodetector: Ge-on-Si vs. InGaAs APD Sensitivity*