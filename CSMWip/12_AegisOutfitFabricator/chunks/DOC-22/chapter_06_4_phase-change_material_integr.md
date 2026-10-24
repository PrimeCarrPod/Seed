## 4. Phase-Change Material Integration — Thermal Buffer (Layer 9)

### 4.1 PCM Selection (CSMFAB078-B §3.2)

| PCM | Melting Point | Latent Heat | Thickness | Mass/Area | Cost |
|-----|---------------|-------------|-----------|-----------|------|
| n-Octadecane | 28°C | 244 kJ/kg | 4mm | 3.1 kg/m² | Low |
| RT27 (Rubitherm) | 27°C | 180 kJ/kg | 5mm | 4.4 kg/m² | Med |
| **RT27HC (Selected)** | **27°C** | **250 kJ/kg** | **4mm** | **3.2 kg/m²** | **Med** |

**Integration:** Microencapsulated PCM (5-10μm) in PU matrix, laminated between inner ZrB₂-SiC (Layer 7) and MR fluid bladder (Layer 8)

**Capacity Calculation:**
```
Q_PCM = m'' × ΔH_fus = 3.2 kg/m² × 250 kJ/kg = 800 kJ/m²
Transient peak (300s × 150 kW/m²) = 45 MJ/m²
→ PCM handles transient spike only; steady state by aerogel
```

### 4.2 PCM Microencapsulation

```
Shell: Melamine formaldehyde (MF), 5-10 μm
Core: RT27HC paraffin
Process: In-situ polymerization coacervation
Loading: 85% PCM by weight
Thermal cycling: 10,000 cycles <5% degradation (DSC)
```

---
