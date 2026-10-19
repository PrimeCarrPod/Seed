## 5. Shelf-Life Management — Monitoring, Rotation, Disposition

### 5.1 Shelf-Life Categories (Per DOC-34 §7.2, MIL-STD-2073)

```
SHELF-LIFE CLASSIFICATION MATRIX:

| Material Category          | Type | Shelf Life | Inspection Interval | Disposition Criteria |
|----------------------------|------|------------|---------------------|---------------------|
| MR Fluid (CIP in oil)      | II   | 24 months  | 6 months            | Viscosity ±10%, CIP conc. ±5% |
| Li-S Battery Modules       | II   | 18 months  | 3 months            | SOC >30%, ΔV<50mV, IR <5mΩ |
| Ceramic Tiles (ZrB₂-SiC)   | I    | Unlimited  | 12 months           | Visual: no cracks, weight ±2% |
| YInMn Blue Pigment         | I    | Unlimited  | 12 months           | Spectral: λ_peak 400±5nm |
| MXene (Ti₃C₂Tₓ)            | II   | 36 months  | 6 months            | Conductivity >8000 S/cm |
| Baleen Framework           | I    | Unlimited  | 24 months           | Flexural modulus ±5% |
| Aerogel Panels             | II   | 48 months  | 12 months           | Thermal cond. <0.02 W/m·K |
| PVDF-TrFE Sensors          | I    | Unlimited  | 12 months           | d₃₃ >30 pC/N |
| Seal Gaskets (fluoroelast) | II   | 60 months  | 12 months           | Compression set <25% |
| MHD Generator Cells        | I    | Unlimited  | 24 months           | Open-circuit V >0.30V |
```

### 5.2 Shelf-Life Monitoring System
Automated monitoring via **CBM+ PHM network** (ISO 13374, SAE AS6294):

```
MONITORING ARCHITECTURE:

SHELF_LIFE_MONITOR = {
  "asset_id": "NSN-LOT-SERIAL",
  "material_category": "MR_FLUID|BATTERY|MXENE|AEROGEL|SEAL",
  "manufacture_date": "YYYY-MM-DD",
  "expiry_date": "YYYY-MM-DD",
  "storage_location": "RLC-EUCOM-BAY-3",
  "environmental_data": {
    "temperature": [T1, T2, ...],      // 30-min samples
    "humidity": [H1, H2, ...],
    "vibration": [V1, V2, ...]
  },
  "health_index": HI_current,           // 0.0-1.0
  "remaining_life_pct": RL_pct,         // 0-100%
  "disposition_recommendation": "EXTEND|USE|TEST|DISPOSE",
  "phoenix_protocol_eligible": TRUE/FALSE
}

ALERT THRESHOLDS:
  HI < 0.90 → "PLAN ROTATION" (60-day notice)
  HI < 0.75 → "PRIORITIZE ISSUE" (30-day notice)
  HI < 0.60 → "EMERGENCY DISPOSITION" (immediate)
  Temp excursion > spec → "INVESTIGATE" (automatic ticket)
```

### 5.3 Rotation & Disposition Process
**First-Expired-First-Out (FEFO)** with Phoenix Protocol integration:

```
ROTATION & DISPOSITION WORKFLOW:

1. MONITOR (Continuous)
   → CBM+ PHM reads RFID/BMS sensors
   → Updates HI, RL_pct in real-time
   → Auto-generates rotation alerts

2. ROTATE (Monthly execution)
   → Pull oldest lots (FEFO) from O-Level → I-Level
   → Issue fresh stock to O-Level
   → Rotated stock → I-Level inspection
   → HI ≥0.90 → Return to O-Level stock
   → HI 0.75-0.90 → I-Level test/refresh
   → HI <0.75 → Phoenix Protocol or Dispose

3. PHOENIX PROTOCOL (Per CSMFAB078 §8)
   → Candidate: HI <0.75, Type I/II expired
   → Sort by material category
   → Process per recovery methods:
        ZrB₂-SiC: H₂SO₄ leach → ZrO₂ (85-92%) → re-boronize
        YInMn: [P8888][Cl] ionic liquid → In (99.4%)
        BFRP/Elium®: 350°C depolymerization → MMA (100%) + basalt (95%)
        MXene: Re-etch from MAX Phase → closed loop
        MR Fluid: CIP separation → oil distillation → reformulate
   → Recovery rate tracking: Target ≥85% mass recovery
   → Re-certified material → New NSN lot (PHOENIX-XXX)

4. DISPOSE (Last resort)
   → Non-recoverable: Hazardous waste (EPA/state)
   → Documentation: DD Form 1348-1A, Phoenix Protocol credit
   → Cost recovery: Scrap value - disposal cost
```

---
