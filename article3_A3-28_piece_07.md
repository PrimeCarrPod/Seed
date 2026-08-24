# Quantum_Federation_Multi_Tenant_Prime_Gaps — Piece 07/12
## Article 3: A3-28 — Quantum Federation Multi-Tenant Prime Gaps
**Piece:** 07 of 12  
**Generated:** 2026-08-24 02:51:06 UTC

---

# Gap-Indexed Economics: Tenant Billing, Resource Markets, and Cost Allocation

## 7.1 The Economics Multi-Tenancy Problem

From A3-25 (Quantum Federation Economics), all pricing is **gap-derived**. Multi-tenancy requires:
- **Per-tenant billing** based on their gap-range usage
- **Gap-indexed resource markets** where tenants bid/ask per gap-index
- **Cost allocation** that reflects true gap-resource consumption
- **Tenant budgets** enforced at gap-checkpoint granularity

## 7.2 Tenant Cost Model: Gap-Indexed Pricing

### 7.2.1 Per-Gap-Index Unit Costs

From A3-25 and A3-27 Piece 06:

```
GapUnitCost(n) = {
  // Quantum resources
  logical_qubit_hour: $0.10 × C_n × tier_mult(tier(n)),
  entanglement_ebit: $0.01 × (1/E_n) × tier_mult,
  qec_cycle: $0.001 × D_n × tier_mult,
  quantum_gate: $0.0001 × tier_mult,
  teleportation: $0.001 × tier_mult,
  distributed_gate: $0.005 × tier_mult,
  
  // Classical resources
  cpu_core_hour: $0.05 × (d_n / 100),
  gpu_hour: $2.00 × (d_n / 100),
  memory_gb_hour: $0.02 × (d_n / 100),
  storage_gb_month: $0.10 × (d_n / 100),
  network_gb: $0.01 × tier_mult,
  
  // ML resources (A3-26)
  inference_request: $0.00001 × model_complexity,
  training_gpu_hour: $5.00 × (d_n / 100),
  fl_round: $0.01 × participants,
  automl_trial: $0.10,
  
  // Security/Compliance
  attestation_op: $0.0001,
  backup_gb: $0.05,
  dr_test: $10.00,
  audit_log_gb: $0.01
}
where tier_mult = 5.0 (Tier-1) / 2.0 (Tier-2) / 1.0 (Tier-3)
```

### 7.2.2 Tenant Cost Aggregation

```
TenantCost(T, checkpoint_k):
total = 0
For each n in T.gap_ranges:
  usage = CollectUsage(T, n, checkpoint_k)
  total += Σ_{resource} usage[resource] × GapUnitCost(n)[resource]
  
  // Volume discounts
  If Σ usage[logical_qubit_hour] > 10000:
    total *= 0.9
  If Σ usage[entanglement_ebit] > 1e6:
    total *= 0.85
  
  // Commitment discounts
  If T.has_1yr_commitment:
    total *= 0.7
  If T.has_3yr_commitment:
    total *= 0.5
  
Return total
```

## 7.3 Tenant Budget Enforcement

### 7.3.1 Gap-Checkpoint Budgets

```
TenantBudget(T) = {
  per_checkpoint: $B_k,           // Budget for checkpoint k
  monthly: $B_month,              // Rolling 30-checkpoint budget
  quarterly: $B_quarter,          // For enterprise planning
  hard_limit: boolean,            // If true, block on exceed
  alert_threshold: 0.8,           // Alert at 80%
  rollover: boolean               // Unused budget rolls to next
}
```

### 7.3.2 Budget Enforcement in GAS

```
GASBudgetCheck(T, task, checkpoint_k):
1. projected = T.current_spend[k] + EstimateCost(task)
2. If projected > T.budget.per_checkpoint:
     If T.budget.hard_limit: REJECT
     Else: ALLOW with BUDGET_WARNING GAR
3. If projected > T.budget.per_checkpoint × T.budget.alert_threshold:
     Emit BUDGET_ALERT GAR to T.billing_contact
4. Reserve: Budget amount held until task completion
5. On task end: Actual cost charged, reservation released
```

## 7.4 Gap-Indexed Resource Markets

### 7.4.1 Tenant Market Participation

Tenants participate in **gap-indexed continuous double auctions** (A3-27 Piece 06):

```
TenantMarketAgent(T):
- Runs on tenant's control plane
- Submits bids/asks for gap-indices in T.gap_ranges
- Strategy: Minimize cost while meeting SLA
- Budget-aware: Never bids > remaining budget
```

### 7.4.2 Market Types per Resource

| Market | Resource | Participants | Clearing |
|--------|----------|--------------|----------|
| **Quantum Lease** | Logical qubits, ebits | Tenants ↔ GIR owners | Per checkpoint |
| **Entanglement Spot** | Bell pairs | Tenants ↔ GER | Real-time |
| **Classical Spot** | CPU, GPU, memory | Tenants ↔ GIR owners | Per checkpoint |
| **ML Inference** | Model serving slots | Tenants ↔ GNMR | Per request |
| **FL Participation** | FL rounds | Tenants ↔ FL coordinator | Per round |
| **Backup/DR** | Backup slots | Tenants ↔ GDR | Monthly |

### 7.4.3 Market Clearing with Tenant Isolation

```
TenantMarketClear(market, checkpoint):
1. Collect: Bids from tenants, Asks from GIR owners
2. Filter: Only bids/asks for gap-indices in tenant's range
3. Match: Price-time priority per gap-index
4. Clear: Per gap-index independent clearing price
5. Settle: Transfer credits, reserve resources
6. Emit: MARKET_CLEARED GTR per tenant per gap-index
```

**No cross-tenant market interference** — each gap-index clears independently.

## 7.5 Cost Allocation: Gap-Aware Chargeback

### 7.5.1 Shared Resource Allocation

Some resources are **shared across tenants** on same GIR:
- Physical qubit hardware (256 qubits per GIR)
- Classical CPU (host OS, hypervisor)
- Network interface
- Cooling, power

### 7.5.2 Allocation Methodology

```
AllocateSharedCosts(GIR_n, checkpoint):
1. Total shared cost = hardware_depreciation + power + cooling + host_OS
2. Allocation basis:
   a. Quantum: Proportional to logical_qubits_T(n)
   b. Classical CPU: Proportional to cpu_ms_T(n)
   c. Network: Proportional to gb_transferred_T(n)
   d. Minimum: 1% per active tenant (overhead)
3. Charge: allocated_cost_T(n) added to tenant bill
4. Verify: Σ allocated = total shared cost
```

### 7.5.3 Showback/Chargeback Reports

```
TenantCostReport(T, period):
- Per gap-index breakdown: quantum, classical, ML, shared
- Per resource type: usage × unit cost
- Budget vs actual: variance analysis
- Optimization recommendations:
     "Move workload from Tier-1 to Tier-2: save 60%"
     "Commit to 1yr: save 30%"
     "Reduce QEC distance from 5→3: save 40%"
- Anomalies: Unexpected cost spikes with gap-correlation
```

## 7.6 Tenant Economics API

### 7.6.1 Billing API

```
TenantBillingAPI(T):
GET /billing/current_checkpoint
  → {spend, budget_remaining, projected_monthly}
GET /billing/history?checkpoint_start=X&checkpoint_end=Y
  → [{checkpoint, spend, breakdown}]
GET /billing/breakdown?gap_index=n
  → {resource: {usage, unit_cost, total}}
GET /billing/optimization
  → [{recommendation, estimated_savings, effort}]
POST /billing/budget
  → Update per-checkpoint/monthly budget
GET /billing/market/prices?gap_index=n
  → {resource: {bid, ask, last_cleared}}
```

### 7.6.2 Real-Time Cost Streaming

```
CostStream(T):
- WebSocket: wss://billing.federation/tenant/T/costs
- Events: RESOURCE_USAGE, MARKET_CLEARED, BUDGET_ALERT, CHECKPOINT_CLOSED
- Per gap-index: Real-time cost accumulation
- Latency: <100ms from usage to cost event
```

---

*End of Piece 07. Next: Piece 08 — Gap-Indexed Observability: Tenant Telemetry, Dashboards, and SLOs*