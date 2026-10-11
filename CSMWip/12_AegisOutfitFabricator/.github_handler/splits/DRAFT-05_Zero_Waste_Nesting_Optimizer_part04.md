**Annealing Schedule:**
```
T_0 = 1000, T_f = 0.1
T_{k+1} = α × T_k, α = 0.95
Iterations per T: 100 × n
Acceptance: P = exp(-ΔE/T) if ΔE > 0
```

### 3.4 Genetic Algorithm Alternative
**Chromosome Encoding:**
```
Gene i = (x_i, y_i, θ_i, order_i)
```

**Fitness Function:**
```
Fitness = 1 / (1 + E(S))
```

**Operators:**
- Crossover: Order-based (OX) for sequence, blend for positions
- Mutation: Random position/rotation change
- Selection: Tournament (size 3)

## 4. Offcut Catalog System

### 4.1 Minimum Viable Remnant
```
Minimum size: 100mm × 100mm (100 cm²)
Below threshold: scrap (recycle/downcycle)
