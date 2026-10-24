## 3. Field Assembly Sequence — 12-Layer Stack Deployment

### 3.1 Assembly Workflow Overview
**Target**: ≤30 minutes, 2 trained operators (CSM-AIMES-OP certified)

```
ASSEMBLY PHASES:
  Phase 0: Site Prep & Container Opening      (5 min)
  Phase 1: Base Layer & Framework Deployment  (7 min)
  Phase 2: Protective Layer Stack Build       (10 min)
  Phase 3: Sensor/Comm Integration            (5 min)
  Phase 4: Lacing & Morphology Calibration    (3 min)
  TARGET TOTAL: 30 min
```

### 3.2 Phase 0: Site Preparation (5 minutes)

```
SITE REQUIREMENTS:
  - Level surface: ≤2° slope (self-leveling jacks if needed)
  - Clear area: 4m × 4m minimum
  - Power: 28 VDC / 120 VAC (ECU + test equipment)
  - Lighting: ≥500 lux (portable LED array)
  - PPE: Standard (gloves, safety glasses, hearing protection)
  
CONTAINER OPENING SEQUENCE:
  1. Verify container seal intact (tamper-evident)
  2. Connect ECU to external power (if available)
  3. Open container doors (hydraulic assist)
  4. Deploy access ramp (integrated, 30s)
  5. Activate work lights (container-mounted)
  6. Verify ECU status: Temp 20±2°C, RH <40%
  7. Remove bay locking pins (color-coded by edition)
```

### 3.3 Phase 1: Base Layer & Framework Deployment (7 minutes)

```
STEP 1.1 — STF Base Layer Deployment (Layer 9/12)
  - Remove vacuum-sealed base garment from Bay 1
  - Unfold on clean assembly surface (provided mat)
  - Verify PVDF-TrFE sensor mesh continuity (multimeter <1Ω)
  - Connect sensor leads to temporary data logger
  
STEP 1.2 — BFRP Structural Chassis (Layer 10)
  - Extract chassis segments from Bay 2 (modular: torso, limbs)
  - Torso: 2-piece clamshell (front/back), hinge at shoulders
  - Limbs: Pre-assembled thigh/calf, upper arm/forearm segments
  - Join segments: Ti₃AlC₂ MAX Phase cam cleats (Dyneema SK99 lacing)
  - Torque spec: 2.5 Nm ±0.2 Nm (calibrated torque wrench)
  
STEP 1.3 — Framework Insertion
  - Baleen stays (MAT-02): Insert into vertical channels (front/back)
  - Steel boning (spring steel, 1.5mm): Horizontal channels
  - Farthingale/pannier hoops (RW editions): Deploy from collapsed state
  - Verify framework geometry: Laser tracker ±0.5mm (optional)
```

### 3.4 Phase 2: Protective Layer Stack Build (10 minutes)
**Critical Path**: 12-layer stack assembled inside-out (interior → exterior)

```
LAYER STACK ASSEMBLY (Inside to Outside):

LAYER 12 — CoAl₂O₄ Spinel Interior Coating (150μm)
  - Pre-applied to liner fabric (Bay 1)
  - Verify Schumann resonance absorption: >78 dB @ 7.83 Hz (portable analyzer)
  
LAYER 11 — PVDF-TrFE Sensor Mesh (50μm)
  - Integrated into base layer (already deployed)
  - Node verification: 240 channels reporting
  
LAYER 10 — BFRP/Elium® Structural Chassis (variable)
  - Deployed in Phase 1
  
LAYER 9 — STF-Impregnated UHMWPE Base Layer (2mm)
  - Deployed in Phase 1
  - Flex test: 90° bend, return to flat <2s
  
LAYER 8 — MR Fluid Bladder Network (3mm, 12 zones)
  - Pre-filled bladders in Bay 5 (80 kPa yield pressure)
  - Connect quick-disconnect fluid lines (M12×1.5, check valve)
  - Fill verification: Pressure gauge each zone 0.5±0.05 bar
  - Electrical: Protonic HFET controllers (Bay 5)
  
LAYER 7 — ZrB₂-SiC Inner Lamina (4mm, 8-ply LOM)
  - Panels from Bay 1 (magnetic edge alignment)
  - Tile count per edition: TS=36, TG=48, SS=36, SG=42
  - Magnetic alignment: NdFeB N52, audible click confirmation
  - Joint seal: ePTFE inner + ZrO₂-silicone outer gasket
  
LAYER 6 — MXene Ti₃C₂Tₓ Film (45μm, secondary EMI)
  - Pre-laminated on Layer 7 panels (factory)
  - Continuity test: Warp/weft <1Ω (multimeter)
  
LAYER 5 — Polyimide-Silica Hybrid Aerogel Core (25mm)
  - Quilted panels from Bay 2 (diamond/trapunto pattern)
  - Compression test: Springback >90% (portable indenter)
  - Stitch verification: 18-22 SPI, no broken stitches
  
LAYER 4 — Fractal FSS Substrate (0.5mm, Sierpiński G3)
  - Pre-embroidered on Layer 3 fabric
  - Bandstop verification: 1.8MHz/150MHz/2.4GHz (VNA spot check)
  
LAYER 3 — MXene Ti₃C₂Tₓ Film (45μm, primary EMI warp)
  - Brocade fabric (weft direction)
  - EMI SE test: ≥92 dB @ 1GHz (portable)
  
LAYER 2 — ZrB₂-SiC Outer Lamina (6mm, 12-ply LOM)
  - Ceramic-gilded tile panels from Bay 3
  - Magnetic alignment (NdFeB N52, 8×3mm)
  - Tile articulation test: Shoulder roll ±45°, elbow flex ±135°
  - Tile inventory: Automated RFID count (100% verification)
  
LAYER 1 — YInMn Blue + CsPbBr₃ QD Coating (230μm)
  - Factory-applied on outer brocade (Layer 2 substrate)
  - NIR reflectance spot check: >85% @ 1000nm (spectrometer)
  - Fluorescence diagnostic: 520nm ±5nm (UV lamp)
```

### 3.5 Phase 3: Sensor & Communication Integration (5 minutes)

```
INTEGRATION CHECKLIST:
  1. PVDF-TrFE mesh → Protonic HFET controllers (12 zones)
     - 240 nodes auto-addressed (I²C, 400 kHz)
     - Self-test: All channels green <30s
  
  2. MR Fluid pressure transducers (12 zones)
     - 0-10 bar range, 0.1% FS accuracy
     - CAN bus (1 Mbps) to HFET
  
  3. Distributed Fiber Optic Sensing (DOC-29)
     - OFS interrogator (Bay 6)
     - 4× SMF fibers: Strain, temperature, acoustic
     - Wavelength: 1550nm, 1kHz sampling
  
  4. RF Mesh Network (DOC-29)
     - 24× mesh nodes (Zigbee 3.0 + LoRa backup)
     - Antenna integration: Fractal FSS (Layer 4)
     - Mesh formation: <10s (self-healing)
  
  5. Power bus connection (DOC-28)
     - MHD generator leads (Layer 8)
     - Battery modules (Bay 6, Li-S 1.55 kWh)
     - 28 VDC bus verification: ±2% regulation
  
  6. Communication stack (CSMFAB078-E §4.1)
     - FEATHER LoRa mesh (915 MHz)
     - Protonic HFET optical (2.4 GHz)
     - BLE 5.2 (local sensors)
     - UHF/VHF analog (legacy interop)
     - Iridium Certus (optional DIM)
```

### 3.6 Phase 4: Lacing & Morphology Calibration (3 minutes)

```
LES 12-ZONE LACING SYSTEM:
  Zone 1 (Shoulders):    15-25 N  → Target per edition table
  Zone 2 (Chest):        20-40 N
  Zone 3 (Waist):        30-60 N
  Zone 4 (Hips):         20-40 N
  Zone 5 (Thighs):       15-25 N
  Zone 6 (Calves):       10-20 N
  Zones 7-12 (Arms/Ext): 10-30 N  (edition-specific)

CALIBRATION ALGORITHM:
  F_target_i = k_i × (L_current_i - L_target_i) / L_target_i
  k_i = zone stiffness (N/m) from edition calibration table
  
  MORPHOLOGY TRANSITION TIME:
  t_transition = Σ |ΔF_i| / (dF/dt_max)
  dF/dt_max = 50 N/s (cleat actuator limit)
  Target: <90 seconds for any edition-to-edition transition
  
VERIFICATION:
  - Force sensor per cleat (strain gauge, 0-100N)
  - Real-time display on wrist HUD
  - Auto-confirm: All zones ±5% target within 60s
```

---
