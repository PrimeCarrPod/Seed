### 2.2 Dynamic Scaling Algorithms

**Base Size → Target Size Transformation** (DRAFT-02 §3; SYNTH-03 §2.1):
```
For edition E with target measurements (B_t, W_t, H_t, NW_t)
vs base pattern measurements (B_b, W_b, H_b, NW_b):

Horizontal scale factor:
S_h = √((B_t/B_b) × (H_t/H_b))

Vertical scale factor:
S_v = NW_t / NW_b

Shear correction (waist ease):
γ = (W_t/W_b - S_h) / S_h

Coordinate transform per pattern point (x, y):
x' = S_h · x + γ · y
y' = S_v · y

Non-linear curvature correction:
For curved seams (armhole, neckline):
κ' = κ / S_h  (curvature scales inversely with horizontal scale)
R' = R · S_h  (radius of curvature scales directly)
```

### 2.3 Grade Rules Per Size Increment

**2cm Size Step Grading** (DRAFT-02 §3):
```
| Measurement | Grade per 2cm size | Distribution |
|-------------|-------------------|--------------|
| Bust/Chest  | +2.0 cm           | 50% front, 50% back |
| Waist       | +1.5 cm           | 40% front, 60% back |
| Hip         | +2.0 cm           | 50% front, 50% back |
| Nape-waist  | +0.5 cm           | 100% vertical |
| Back width  | +0.6 cm           | 50% each side |
| Armhole     | +0.4 cm           | 60% front, 40% back |
| Shoulder    | +0.3 cm           | 50% each side |
```

### 2.4 Edition-Specific Pattern Generation (8 Editions)

**Edition Parameters** (DRAFT-02 §4; CSMFAB078-A §3.3; SYNTH-03 §2.2):
