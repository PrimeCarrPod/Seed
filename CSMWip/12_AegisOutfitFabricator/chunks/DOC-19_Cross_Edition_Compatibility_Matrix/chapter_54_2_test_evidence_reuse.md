## 2. Test Evidence Reuse

### 2.1 Shared Test Data Across Editions

| Test | Standard | Shared Data | Edition-Specific |
|------|----------|-------------|------------------|
| **Material Tensile** | ASTM D3822 (silk) | 100% | — |
| **Tile Flexural** | ASTM C1161 | 100% (same material) | — |
| **MXene Conductivity** | 4-pt probe | 100% (same dispersion) | — |
| **Aerogel Thermal** | ASTM C177 | 100% (same material) | — |
| **STF Penetration** | ASTM F2371 | 100% (same φ) | — |
| **Baleen Tensile** | ISO 527-2 | 100% | — |
| **Steel Spring Rate** | ASTM A125 | 100% (same wire) | — |
| **Ballistic V₅₀** | NIJ STD-0101.06 | 0% | Edition-specific config |
| **BFS** | NIJ STD-0101.06 | 0% | Edition-specific config |
| **EMI SE** | MIL-STD-461G RS103 | 0% | Edition-specific config |
| **Thermal Convective** | ASTM F1291 | 0% | Edition-specific config |
| **Mobility ISO 15858** | ISO 15858 | 0% | Edition-specific config |

### 2.2 Test Article Reduction Strategy

| Strategy | Description | Savings |
|----------|-------------|---------|
| **Material-Level Testing** | Test materials once, apply to all editions | 85% reduction in material tests |
| **Subsystem Testing** | Test L3/L6 MXene, L5 aerogel once | 75% reduction in subsystem tests |
| **Digital Twin Validation** | Simulate edition configs, test only corners | 60% reduction in system tests |
| **Transition Testing** | Test only adjacent edition pairs | 50% reduction in transition tests |

---

