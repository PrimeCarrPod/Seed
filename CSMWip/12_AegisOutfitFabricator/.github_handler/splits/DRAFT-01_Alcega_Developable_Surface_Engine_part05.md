### 4.2 Units and Precision
- **Units:** Millimeters (mm)
- **Precision:** 0.01mm (10⁻² mm)
- **Coordinate System:** Cartesian, origin at lower-left of bounding box

### 4.3 Seam Allowance Specification
```
Ssa-1: 301 lockstitch, 4.7±0.5 SPI, 13mm allowance (high-density)
SSd-2: 401 chainstitch, 3.1±0.5 SPI, 40mm allowance (low-density heavy yarns)
Default: Ssa-1, configurable per edition
```

### 4.4 Notch Specification
```
V-notch: depth = 3mm, angle = 90°
Placement: At all match points (bust, waist, hip, shoulder, armhole)
Encoding: Single notch = front, Double notch = back, Triple = side
```

### 4.5 DXF Entity Structure
```dxf
0
SECTION
2
ENTITIES
0
LWPOLYLINE
8
CUT
90
