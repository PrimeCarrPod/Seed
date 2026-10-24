## 3. Transition Decision Matrix

### 3.1 Go/No-Go Criteria by Transition

| Transition | Mission Profile | Recommended | Rationale |
|------------|-----------------|-------------|-----------|
| **RM-TS → RM-TG** | High threat, static | ✅ Go | Max protection |
| **RM-TS → RM-SS** | Mobile, long duration | ✅ Go | Best mobility |
| **RM-TS → RM-SG** | Balanced threat/mobility | ✅ Go | Balanced |
| **RM-TG → RM-SS** | Emergency egress | ⚠️ Conditional | High time/cost |
| **RW-TS → RW-TG** | High threat, ceremonial | ✅ Go | Max protection + farthingale |
| **RW-TS → RW-SS** | Mobile, hot climate | ✅ Go | Best mobility |
| **RW-TS → RW-SG** | Balanced, short duration | ✅ Go | Fast transition |
| **RW-TG → RW-SS** | Emergency egress | ⚠️ Conditional | High time/cost |

### 3.2 Transition Sequencing for Multi-Step Conversions

| From | To (Target) | Recommended Path | Total Time | Intermediate |
|------|-------------|------------------|------------|--------------|
| **RM-TG → RM-SS** | RM-TG → RM-TS → RM-SS | 63s + 85s = 148s | RM-TS |
| **RM-TG → RW-TG** | Factory only | 4-6 hrs | N/A |
| **RW-TG → RM-SS** | RW-TG → RW-TS → RM-TS → RM-SS | 72s + 63s + 85s = 220s | RW-TS, RM-TS |
| **RM-SS → RW-TG** | RM-SS → RM-TS → RW-TS → RW-TG | 95s + 63s + 81s = 239s | RM-TS, RW-TS |

---

