RW: Narrower shoulders, wider hips, shorter torso
Factor_RM = {S_x: 1.02, S_y: 1.01}
Factor_RW = {S_x: 0.98, S_y: 0.99}
```

## 4. Pattern Generation for 8 Editions

### 4.1 Edition-Specific Pattern Set
Each edition generates complete pattern set:
```
Pattern_Set = {Bodice_Front, Bodice_Back, Sleeve, Skirt_Front, Skirt_Back, 
               Watteau_Back, Collar, Cuff, Placket, Waistband}
```

### 4.2 Scaling Application per Piece
**Bodice Scaling:**
```
Front: S_x = (B_target - E_bust) / (B_base - E_bust_base)
       S_y = NW_target / NW_base
Back:  S_x = (B_target - E_bust) / (B_base - E_bust_base) × 0.5 (half back)
       S_y = NW_target / NW_base
```

**Sleeve Scaling:**
```
S_x = BC_target / BC_base (bicep)
S_y = (Sleeve_Length_target) / (Sleeve_Length_base)
S_wrist = WC_target / WC_base
```

