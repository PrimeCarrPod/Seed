## 1. Executive Overview

### 1.1 Scope and Purpose

This specification defines the complete manufacturing integration architecture for the Aegis Adaptive Exosuit (AIMES) 12-layer protective textile stack. The document integrates **Sewbo robotic sewing cells** (Research Doc 2 §6.1) with **ultrasonic/RF seam welding** (Research Doc 2 §7.1-7.2) to achieve fully automated, zero-human-touch assembly of all 8 edition variants across 12 LES zones.

**Manufacturing Objectives:**
- **Throughput**: ≥12 complete suits per 8-hour shift per cell line
- **Seam Efficiency**: $\eta_{seam} \ge 0.95$ per ASTM D1683 across all layer transitions
- **Geometric Tolerance**: ±0.25 mm positional accuracy for all seam paths
- **Process Integration**: Seamless handoff between Sewbo rigidization, robotic sewing, ultrasonic welding, and RF welding stations

### 1.2 AIMES 12-Layer Stack — Manufacturing Sequence

The 12-layer AIMES stack (CSMFAB078 Main §4) requires heterogeneous joining methods per layer transition:

| Layer | Material System | Primary Join Method | Secondary Join | LES Zones |
|-------|-----------------|---------------------|----------------|-----------|
| L1 | Silk Fibroin Base (MAT-01) | Class 301 Lockstitch | Ultrasonic 20 kHz | 1, 2, 7, 8 |
| L2 | Aramid Shear Web (MAT-02) | Class 401 Chainstitch | Ultrasonic 35 kHz | 1-12 |
| L3 | Ceramic Tile Array (DOC-21) | RF Weld 27.12 MHz | Mechanical clips | 1, 3, 5 |
| L4 | Aerogel Insulation (DOC-22) | Ultrasonic 40 kHz | Adhesive film | 1-12 |
| L5 | Faraday Mesh (DOC-23) | Conductive thread 301 | RF weld edge seal | 1, 2, 9, 10 |
| L6 | MOF Coating (DOC-24) | No stitch (coating) | Ultrasonic seal | 1-12 |
| L7 | Ablative Layer (DOC-25) | Class 504 Coverstitch | Laser seam | 1, 3, 4 |
| L8 | Auxetic Foam (DOC-26) | Class 401 Chainstitch | Ultrasonic 35 kHz | 1, 4, 5 |
| L9 | Hermetic Barrier (DOC-27) | RF Weld 27.12 MHz | Laser transmission | 1-12 |
| L10 | MHD Generator (DOC-28) | Conductive thread 401 | Ultrasonic embed | 2, 9, 10 |
| L11 | Sensor Fiber Optic (DOC-29) | TFP embroidery 304 | Ultrasonic tack | 1-12 |
| L12 | Outer Silk Cover (MAT-01) | Class 301 Lockstitch | Decorative topstitch | 1-12 |

### 1.3 Edition-Specific Manufacturing Parameters

Per CSMFAB078-A §3.1 (8 editions, 12 zones, morphology parameters):

| Edition | Morphology | Cell Cycle Time | Gantry Reach | Sewing Head Config |
|---------|------------|-----------------|--------------|-------------------|
| RM-TS | Tall-Skinny | 38 min | 2.8 m | Single needle 301/401 |
| RM-TG | Tall-Gordo | 42 min | 3.1 m | Twin needle 301/401 |
| RM-SS | Short-Skinny | 35 min | 2.5 m | Single needle 301/401 |
| RM-SG | Short-Gordo | 40 min | 2.9 m | Twin needle 301/401 |
| RW-TS | WoMan Tall-Skinny | 36 min | 2.7 m | Single needle 301/401 |
| RW-TG | WoMan Tall-Gordo | 41 min | 3.0 m | Twin needle 301/401 |
| RW-SS | WoMan Short-Skinny | 34 min | 2.4 m | Single needle 301/401 |
| RW-SG | WoMan Short-Gordo | 39 min | 2.8 m | Twin needle 301/401 |

---
