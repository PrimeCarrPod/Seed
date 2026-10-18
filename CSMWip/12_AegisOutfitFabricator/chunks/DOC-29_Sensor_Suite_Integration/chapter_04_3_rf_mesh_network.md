## 3. RF Mesh Network

### 3.1 IEEE 802.15.4e TSCH Network Architecture

#### 3.1.1 Time Slotted Channel Hopping (TSCH)
Deterministic low-latency mesh for sensor data aggregation:

```
TSCH Schedule Parameters:
  - Slotframe length: 101 slots (prime number for hopping)
  - Slot duration: 10 ms
  - Channel hopping: 16 channels (IEEE 802.15.4 Ch 11-26)
  - Hopping sequence: Pseudo-random (ASN-based)
  - Timeslot structure:
    | CCA (128 μs) | TX/RX (4 ms) | ACK (1 ms) | Guard (4.872 ms) |
  
  Network latency (worst case):
  L_max = (Hops × Slotframe × SlotDuration) / DutyCycle
  L_max = (10 × 101 × 10ms) / 0.5 = 20.2 s (sparse)
  L_scheduled = Hops × SlotDuration = 10 × 10ms = 100 ms (dense)
```

#### 3.1.2 Network Topology
```
Node Distribution (100+ nodes):
  - Layer controllers: 12 (one per protective layer)
  - Sensor aggregators: 24 (2 per layer, FBG + OFDR)
  - RF relay nodes: 40 (distributed in cape/train/skirts)
  - Gateway: 1 (torso, connects to AI core DOC-30)
  - Redundant gateway: 1 (backup, hip)
  
  Topology: Partial mesh (avg degree 4-6)
  Self-healing: RPL (IPv6 Routing Protocol for LLNs)
  Root: Gateway (DODAG root)
```

### 3.2 Physical Layer — Dual Band Operation

#### 3.2.1 2.4 GHz Band (Primary)
```
2.4 GHz PHY (IEEE 802.15.4 O-QPSK):
  - Channels: 11-26 (5 MHz spacing, 2 MHz bandwidth)
  - Data rate: 250 kbps
  - Transmit power: +10 dBm (max, ETSI/EC)
  - Receiver sensitivity: -100 dBm (250 kbps)
  - Link budget: 110 dB → ~200 m LOS, ~30 m in-body
  - Antenna: Meander-line on flexible substrate (ε_r = 3.2)
```

#### 3.2.2 5.8 GHz Band (High Throughput / Backup)
```
5.8 GHz PHY (IEEE 802.15.4g MR-FSK):
  - Channels: 165-180 (1 MHz spacing)
  - Data rate: 50-800 kbps (adaptive)
  - Transmit power: +14 dBm (FCC), +10 dBm (ETSI)
  - Receiver sensitivity: -105 dBm (50 kbps)
  - Link budget: 115 dB → ~300 m LOS
  - Antenna: Patch on textile (ε_r = 2.2, h = 1.6 mm)
```

#### 3.2.3 Antenna Integration in Renaissance Textiles
Based on SYNTH-01 §5 (Metallic Thread Integration) and Research Doc 2 §5:

```
Textile Antenna Design:
  - Conductor: MXene-coated silver-gilt thread (MAT-03 §2)
  - Conductivity: σ = 1×10⁶ S/m (MXene, 2μm coating)
  - Substrate: Silk brocade (ε_r = 2.8, tanδ = 0.02)
  - Ground plane: Metallic thread brocade (Layer 4, Faraday mesh)
  
  Meander-line antenna (2.4 GHz):
  - Total length: λ/2 = 62.5 mm (meandered to 30×10 mm)
  - Trace width: 1 mm, spacing: 0.5 mm
  - Turns: 12
  - Bandwidth: 100 MHz (S₁₁ < -10 dB)
  - Efficiency: 65% (on body), 85% (free space)
  - Gain: -2 dBi (on body), +2 dBi (free space)
  
  Patch antenna (5.8 GHz):
  - Dimensions: 12.5 × 16 mm (on ε_r = 2.2)
  - Feed: Inset microstrip (50 Ω)
  - Bandwidth: 200 MHz
  - Efficiency: 70% (on body)
```

### 3.3 Network Protocol Stack

#### 3.3.1 Protocol Stack Layers
```
Layer 7: Application (Sensor Data, Commands, Health)
Layer 6: Presentation (CBOR encoding, IEEE 1451 TEDS)
Layer 5: Session (CoAP/Observe, DTLS 1.3)
Layer 4: Transport (UDP, 6LoWPAN fragmentation)
Layer 3: Network (RPL, IPv6, 6LoWPAN HC)
Layer 2: MAC (TSCH, IEEE 802.15.4e)
Layer 1: PHY (2.4/5.8 GHz, O-QPSK/MR-FSK)
```

#### 3.3.2 IEEE 1451 Smart Transducer Interface
Standardized sensor description and data format:

```
TEDS (Transducer Electronic Data Sheet) Template:
  IEEE 1451.4 TEDS for FBG Sensor:
    - Manufacturer ID: 0x00A1 (AegisFabricator)
    - Model: FBG-Array-50ch
    - Serial: [Unique per fiber]
    - Calibration date: YYYY-MM-DD
    - Calibration coefficients:
      K_ε = 1.200 pm/με ±0.5%
      K_T = 10.00 pm/°C ±0.5%
      λ_B0 = 1550.00 nm ±0.01 nm
    - Measurement range: ±10000 με, -40 to +150°C
    - Uncertainty: ±2 με, ±0.2°C (k=2)
```

---
