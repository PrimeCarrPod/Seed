## 3. Reflective Layer

### 3.1 Material Composition and Structure
The reflective layer utilizes a dielectric mirror stack with historical metallic appearance:

```
[Exterior] Ablative layer (2mm)
          ↓
      Dielectric mirror stack (100nm)
          ↓
   Phase-change layer (1.5mm)
          ↓
[Interior] Structural backup (variable)
```

### 3.2 Dielectric Mirror Design
Alternating layers of high and low refractive index materials create high reflectivity:

```
Layer Pair: 
  - High-index: TiO₂ (n=2.4) or Ta₂O₅ (n=2.1)
  - Low-index: SiO₂ (n=1.46) or MgF₂ (n=1.38)
Number of Pairs: 8-12 (for >99% reflectivity at 1064 nm)
Total Thickness: 80-120 nm
Reflectivity: R = [ (n_H/n_L)^(2N) - 1 ] / [ (n_H/n_L)^(2N) + 1 ]  (for normal incidence)
```

### 3.3 Historical Metallic Appearance
The reflective layer achieves historical metallic appearance through:

```
Surface Texture: Nanoscale roughness (10-20nm RMS) mimics polished metal
Color Control: Slight absorption in visible spectrum (k=0.1-0.3) for gold/copper tone
Oxidation Resistance: SiO₂ capping layer (5nm) prevents corrosion
Historical Reference: Renaissance gilding techniques used metal leaf over gesso
```

### 3.4 Reflective Performance
```
Specular Reflectance: R_spec = |(n₀ - n₁)/(n₀ + n₁)|²  (for single interface)
Diffuse Reflectance: R_diff = (1 - R_spec) * (1 - e^(-αd))  (scattering in layer)
Total Reflectance: R_total = R_spec + R_diff
```
With dielectric stack, R_total > 0.99 for design wavelength.
