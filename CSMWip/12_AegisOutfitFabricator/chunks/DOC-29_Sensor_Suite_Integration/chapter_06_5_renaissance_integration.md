## 5. Renaissance Integration

### 5.1 Sensor Concealment in Historical Textiles

#### 5.1.1 Fiber Routing in Brocade Patterns
Based on SYNTH-01 §4 (CIETA Textile Typologies) and SYNTH-03 §1 (Alcega):

```
Fiber Path in Brocade (Lampas/Brocatelle):
  - Warp-faced relief areas → fiber in binding warp channels
  - Pattern weft floats → fiber follows weft under floats
  - Ground weave (tabby/twill/satin) → fiber in ground warp
  - Visibility: <0.5% surface coverage (sub-visual)
  
Goldwork Integration (Research Doc 1 §2.2):
  - Metallic thread (Au-Hg on Ag) → dual-purpose: EMI + antenna
  - Fiber in helical winding groove (protected by AuHg)
  - Bend radius maintained by core silk diameter (15-20 μm)
```

#### 5.1.2 Pleating and Farthingale Integration
Based on SYNTH-03 §3 (Pleating Kernel) and §4 (Farthingale):

```
Cartridge Pleating (Research Doc 1 §4.2):
  - Fiber follows pleat fold lines (generatrix rulings)
  - Slack allowance: 15% extra length per pleat depth
  - Pleat depth: 25-50 mm (scaled by Garsault proportions)
  - Fiber tension: <0.1 N (avoid microbending loss)
  
Farthingale Hoop Channels (SYNTH-03 §4):
  - Hoop radius: R = (waist_circ + ease) / 2π
  - Fiber in hoop casing (spiral, 2 turns per hoop)
  - Radial spokes: 8 per hoop (octagonal symmetry)
  - Strain sensing: hoop deformation → impact location
```

### 5.2 Edition-Specific Sensor Configurations

| Edition | Zones (CSMFAB078-A) | FBG Nodes | RF Nodes | Priority Sensors |
|---------|---------------------|-----------|----------|------------------|
| LE-TS (Tournament) | 12 | 200 | 15 | Ballistic impact, blast |
| LE-TG (Tournament Grand) | 12 | 250 | 18 | Ballistic, blast, thermal |
| LE-SS (Siege) | 8 | 180 | 12 | Chem/bio, thermal, seal |
| LE-SG (Siege Grand) | 10 | 220 | 15 | All threats, extended range |

---
