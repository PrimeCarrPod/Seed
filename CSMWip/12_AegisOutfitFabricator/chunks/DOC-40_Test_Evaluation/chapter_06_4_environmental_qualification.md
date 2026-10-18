## 4. Environmental Qualification

### 4.1 MIL-STD-810H Test Matrix

| Method | Test | Parameters | Doc Reference |
|--------|------|------------|---------------|
| **501.6** | High Temperature | +70°C (op), +85°C (stor) | DOC-28, DOC-37 |
| **502.6** | Low Temperature | -40°C (op), -55°C (stor) | DOC-28, DOC-27 |
| **503.6** | Temperature Shock | -40°C ↔ +70°C, 10 cycles, 15 min dwell | DOC-27, DOC-05 |
| **507.6** | Humidity | 95% RH, +30°C↔+60°C, 10 cycles | DOC-24, DOC-07 |
| **509.6** | Salt Fog | 5% NaCl, +35°C, 96 hr | DOC-02, DOC-06 |
| **510.6** | Sand & Dust | 150 μm, 6 g/m³, +25°C, 6 hr | DOC-27, DOC-29 |
| **511.6** | Explosive Atmosphere | Methane/air, 8.5% vol | DOC-28 (intrinsically safe) |
| **512.6** | Immersion | 1 m, 30 min (op), 10 m, 1 hr (stor) | DOC-27, DOC-36 DSV |
| **514.8** | Vibration (Cat 4/20/24) | 5–2000 Hz, 7.7 g RMS (op), 11.3 g (stor) | DOC-05, DOC-29 |
| **516.8** | Shock (Cat 1/2/3) | 40 g, 11 ms half-sine; 75 g, 6 ms sawtooth | DOC-05, DOC-21 |
| **517.6** | Pyroshock | 5000 g, 0.5 ms | DOC-33 (sep bolts) |
| **519.6** | Gunfire Vibration | 20–2000 Hz, 15 g RMS | DOC-21, DOC-05 |
| **520.6** | HEMP/EMI | Per MIL-STD-461G + 188-125 | DOC-23, DOC-39 |
| **521.6** | Icing/Freezing Rain | -10°C, 25 mm/hr, 4 hr | DOC-27, DOC-28 |
| **522.6** | Ballistic Shock | Per DOC-21 V50 testing | DOC-21 |
| **523.6** | Vibro-Acoustic | 140 dB, 25–2000 Hz | DOC-33 (launch) |
| **524.6** | Freeze-Thaw | -40°C ↔ +20°C, 5 cycles | DOC-27, DOC-07 |
| **525.6** | Laser/DE | Per DOC-25 | DOC-25 |
| **526.6** | Fungus | 28 days, mixed spores | DOC-07, DOC-24 |
| **527.6** | Solar Radiation | 1120 W/m², 20 cycles | DOC-22, DOC-06 |

### 4.2 Test Tailoring — AIMES-Specific

**Combined Environments** (per MIL-STD-810H Part 2):

| Combined Test | Sequence | Rationale |
|---------------|----------|-----------|
| **Temp-Altitude-Vibe** | 501→500→514 | Flight profile |
| **Humidity-Salt-Fungus** | 507→509→526 | Tropical storage |
| **Thermal-Shock-Vibe** | 503→516→514 | Deployment sequence |
| **Immersion-Pressure** | 512→500 | DSV ops (DOC-36) |

---
