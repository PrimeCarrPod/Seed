## 4. Hazardous Materials Management

### 4.1 HAZMAT Inventory & Authorization

Per **DoDI 6050.05** (DoD Hazardous Materials Control) and **EPCRA** (Emergency Planning):

**Authorized Use List (AUL)** — AIMES Specific:

| Material | NSN / CAS | Use | Quantity (Annual) | Authorization |
|----------|-----------|-----|-------------------|---------------|
| **Hydrofluoric Acid (49%)** | 7664-39-3 | MXene etching (DOC-45) | 50,000 kg | Restricted — MXene cell only |
| **Titanium Tetrachloride** | 7550-45-0 | MXene precursor | 30,000 kg | Restricted — MXene cell only |
| **Zirconium Butoxide** | 1071-76-7 | Ceramic binder (FAB-RM-06) | 15,000 kg | Controlled — Ceramic cell |
| **Silicon Carbide Powder** | 409-21-2 | Ceramic tile (DOC-21) | 200,000 kg | General — Powder handling |
| **Boron Carbide Powder** | 12069-32-8 | Ceramic tile (DOC-21) | 150,000 kg | General — Powder handling |
| **Lithium Metal** | 7439-93-2 | Battery anode (DOC-28) | 5,000 kg | Restricted — Battery cell |
| **Sulfur** | 7704-34-9 | Li-S cathode (DOC-28) | 80,000 kg | General — Battery cell |
| **MR Fluid (Carrier + Fe₃O₄)** | Mixture | Actuation (DOC-28) | 100,000 L | Controlled — Fill station |
| **YInMn Blue Pigment** | 12005-21-9 | NIR coating (DOC-48) | 2,000 kg | General — Coating line |
| **Quantum Dots (CdSe/InP)** | Various | DE absorption (DOC-34) | 50 kg | Restricted — Coating line |

### 4.2 Safety Data Sheets (SDS) & GHS

All HAZMAT maintained in **EESOH-MIS** (Enterprise Environmental Safety Occupational Health Management Information System) with **GHS-compliant SDS**:

| SDS Section | AIMES Requirement |
|-------------|-------------------|
| **1. Identification** | Material name, CAS, supplier, recommended use |
| **2. Hazards** | GHS classification, pictograms, signal word |
| **3. Composition** | Ingredients, %, trade secret claims |
| **4. First Aid** | Route-specific, symptoms, medical attention |
| **5. Firefighting** | Extinguishing media, hazards, PPE |
| **6. Spill Response** | Containment, cleanup, disposal |
| **7. Handling/Storage** | Incompatibilities, conditions, ventilation |
| **8. Exposure Controls** | TLV, PPE, engineering controls |
| **9. Properties** | Physical/chemical, stability |
| **10. Stability/Reactivity** | Conditions to avoid, hazardous decomposition |
| **11. Toxicology** | Routes, effects, carcinogenicity |
| **12. Ecological** | Aquatic toxicity, persistence, bioaccumulation |
| **13. Disposal** | RCRA codes, methods |
| **14. Transport** | UN number, class, packing group |
| **15. Regulatory** | TSCA, CERCLA, SARA, state |
| **16. Other** | Revision date, disclaimer |

### 4.3 HAZMAT Tracking — RFID + Blockchain

Per **DoDI 4140.01** and **DOC-35 §3.3**, HAZMAT tracked from receipt to disposal:

```
RECEIPT → RFID TAG → AUTHORIZED STORAGE → ISSUE (SCAN) → 
  USE (LOG) → WASTE GENERATION → RFID TAG → 
  TREATMENT/RECYCLE/DISPOSAL → BLOCKCHAIN COC → MANIFEST
```

**Chain of Custody (CoC) Blockchain** (DOC-35 §3.3, DOC-44 §5):

- Immutable ledger: Hyperledger Fabric
- Smart contracts: Auto-verify authorization, quantity, location
- Audit trail: 7-year retention, government access

---
