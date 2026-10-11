| L11 Bio-Acoustic | 0.07 | 0.08 | 0.06 | 0.07 | ±5% |
| L12 Schumann | 0.04 | 0.04 | 0.03 | 0.04 | ±5% |
| **Subtotal** | **12.60** | **16.03** | **10.37** | **13.28** | |
| Textile Base (silk/linen) | 1.9 | 2.3 | 1.6 | 2.0 | ±5% |
| Lacing System (stays+skirt) | 1.1 | 1.3 | 0.9 | 1.1 | ±10% |
| Fasteners/Hardware | 0.4 | 0.5 | 0.35 | 0.4 | ±10% |
| **Total (est.)** | **16.00** | **20.13** | **13.22** | **16.78** | **<24 kg ✓** |

### 9.3 Mass Growth Allowance

$$\text{Mass}_{\text{final}} = \text{Mass}_{\text{nominal}} \cdot (1 + \delta_{\text{manuf}} + \delta_{\text{contingency}})$$

Where $\delta_{\text{manuf}} = 0.05$ (manufacturing variance), $\delta_{\text{contingency}} = 0.08$ (design contingency). Maximum growth factor: 1.13×.

---

## 10. System Integration Verification Plan

### 10.1 Integration Test Sequence

| Phase | Test | Layers Exercised | Pass Criteria |
|-------|------|------------------|---------------|
| **I-1** | Coating adhesion + thermal cycling | L1, L12 | No delamination @ -40°C to +150°C, 100 cycles |
| **I-2** | Ceramic tile retention + vibration | L2, L7, L10 | Zero tile loss @ 5-500 Hz, 5g RMS |
| **I-3** | EMI SE full stack | L3, L4, L6 | ≥60 dB @ 1 GHz, ≥40 dB @ 10 GHz |
| **I-4** | Thermal protection full stack | L1, L2, L5, L7, L12 | Interior <60°C @ 1100°C/300s |
| **I-5** | Ballistic + trauma full stack | L2, L7, L8, L9, L10 | NIJ IV stop + ≥65% force reduction |
| **I-6** | LES calibration + mobility | L10, L11, LES | 12-zone tension ±5%, Mobility ≥0.7 |
| **I-7** | Bio-acoustic + Schumann | L11, L12 | SNR >20 dB, Attenuation >30 dB @ 7.83 Hz |
| **I-8** | Full system donning/doffing | All | <120s donning, <90s edition transition |
