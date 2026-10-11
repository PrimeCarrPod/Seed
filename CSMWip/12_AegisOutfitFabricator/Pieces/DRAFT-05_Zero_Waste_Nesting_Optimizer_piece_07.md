```

### 4.4 Inventory Tracking
**Database Schema:**
```
Remnant_ID, Shape_Type, Width, Height, Area, 
Grain_Direction, Fabric_Lot, Date_Created, 
Status: Available/Reserved/Used, Assigned_Order
```

**Multi-Garment Production:**
```
Batch nesting: Combine pieces from multiple orders
Shared remnants: Cross-order remnant utilization
Priority: Larger orders first, then fill gaps with smaller
```

## 5. Marker Efficiency Metrics

### 5.1 Primary Metrics
```
Marker Efficiency: η = Σ Area(P_i) / (W × L) × 100%
Target: η > 85%

Fabric Waste: Waste = W × L - Σ Area(P_i) - Σ Area(Remnants)
Waste % = Waste / (W × L) × 100%
Target: Waste < 5%

Remnant Utilization: ρ = Σ Area(Used_Remnants) / Σ Area(All_Remnants)
Target: ρ > 70%
