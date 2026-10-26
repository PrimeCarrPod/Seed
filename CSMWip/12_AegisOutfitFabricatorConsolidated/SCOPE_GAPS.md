# SCOPE_GAPS.md — what the project set out to build vs. what this folder contains

The scope baseline is the source folder's own documentation (`README.md`, `AGENTS.md`,
`TODO.md`, `REMEDIATION_TASKS.md`, `NEXT_runner_*.md`) plus what the documents
themselves reference.

**Snapshot status: 56 product documents, 36 passing all five quality gates, 4 declared
specifications never authored (DOC-41, DOC-43, DOC-45, DOC-47), 1 edition piece missing
(DOC-14 piece 7), and 1 document surviving only in part (DOC-24).**

---

## 1. Declared scope

| Scope element | Declared target | Source of the claim |
|---|---|---|
| Numbered specifications | `DOC-01..DOC-48` (48 docs) | `AGENTS.md`, `README.md`, `TODO.md` |
| Material specifications | `MAT-01..04` | `AGENTS.md` |
| Synthesis documents | `SYNTH-01..03` | `AGENTS.md` |
| Drafting kernels | `DRAFT-01..05` | `AGENTS.md` |
| Research inputs | 2 (historical dress, stitching/automation) | `AGENTS.md`, `README.md` |
| Total documents | "77 documents", "60 chunk directories verified" | `README.md`, `NEXT_runner_FINAL.md` |
| Edition matrix | 8 editions (RM/RW × TS/TG/SS/SG) | `README.md`, `DOC-01` |
| Protective stack | 12 layers, 12 LES tension zones, 1,152 parameter sets | `README.md`, `DOC-01` |
| Quality gates per document | lines ≥300, formulas ≥15, cross-refs ≥10, standards ≥5, conflation 0, traceability matrix present | `README.md`, `REMEDIATION_TASKS.md` |
| Remediation plan | Phase A formulas, Phase B conflation, Phase C DOC-48 completion, Phase D regression | `REMEDIATION_TASKS.md`, `README.md` |
| Publication package | LaTeX/PDF standards submission package, `remediation-complete` tag | `README.md` roadmap |

## 2. What is present

| Scope element | Present here | Gate status |
|---|---|---|
| Core architecture | DOC-01..DOC-10 (10/10) | 10 PASS |
| Edition specifications | DOC-11..DOC-20 (10/10) | 10 PASS (DOC-14 missing piece 7) |
| Threat protection | DOC-21..DOC-30 (10/10) | 5 PASS, 5 FAIL formulas |
| Integration/sustainment | DOC-31..DOC-46 (12 of 14) | 3 PASS, 9 FAIL (xrefs/formulas) |
| Training systems | DOC-48 | PASS |
| Materials | MAT-01..04 (4/4) | 2 PASS, 2 FAIL formulas |
| Synthesis | SYNTH-01..03 (3/3) | 1 PASS, 2 FAIL formulas |
| Drafting kernels | DRAFT-01..05 (5/5) | 4 PASS, 1 FAIL formulas |
| Research inputs | RESEARCH-01, RESEARCH-02 (2/2) | Not gate-scored (inputs, not specifications) |
| Master compendium | `compendium/EQUATIONSCOMPLETE_Master_Compendium.md` | Reading copy; see §4 |
| Verification tooling | `tools/` | Manifest, gate report, assembly |

## 3. What is missing

### 3.1 Specifications never authored (4 numbers in the declared range)

`DOC-01..DOC-48` has 48 numbers but only **44 numbered DOC specifications** exist.
These four have **no authored body anywhere** in the source folder or the compendium —
the compendium carries their section header plus outline/index text, not a
specification:

| ID | Declared title | Evidence |
|---|---|---|
| DOC-41 | Program Management — Schedule + Risk + Cost | Absent from `FinishedWork/`. Compendium section body is an outline for DOC-41..DOC-50. |
| DOC-43 | System Safety — Hazard Analysis + Risk Assessment | Compendium section is titled as a specification but has no authored body. |
| DOC-45 | Supportability — PBL + Performance-Based Contracting | Same index-stub pattern; also cited in DOC-48's traceability line, which therefore dangles. |
| DOC-47 | Cyber Survivability & Electromagnetic Compatibility | Same index-stub pattern. |

The numbering gap is real: the compendium's document index lists all 48, and
`NEXT_runner_023.md` still lists "DOC-49: Technical Data Package" and "DOC-50:
Deployment & Operations — Final Integration" as next priorities, but neither exists.
`NEXT_runner_FINAL.md` claims "48 Core Specifications (DOC-01 through DOC-48)" while
only 44 numbered `DOC-*` specifications exist.

### 3.2 Documents present but incomplete

| ID | Issue |
|---|---|
| DOC-24 (Chemical/Bio) | Begins mid-document at "### 3.4 Mathematical Modeling" — no title block, no sections 1-3. Only the document tail survived in every source copy. |
| DOC-14 (RM-SG) | Piece 7 of 17 (EMI/Shielding Tuning) is absent from **both** source assemblies. All other pieces are present. |
| DOC-13 (RM-SS) | Pieces 11, 13, 14, 16, 17 exist only in the older assembly; they were restored and marked. |
| DOC-15 (RW-TS) | Pieces 1 and 2 exist only in the older assembly; they were restored and marked. |
| DOC-41/43/45/47 | Compendium-only stub text (§3.1). |

### 3.3 Quality-gate failures (20 of 56 documents)

Formula density is the largest gap: 14 documents have fewer than 15 formulas, several
with zero (`DOC-21`, `DOC-23`, `DOC-26`, `DOC-27`, `DOC-28`, `MAT-01`, `SYNTH-01`,
`DRAFT-02`). Cross-reference density fails in 8 documents. **No document fails the
lines, standards, or conflation gates.**

| Document | Lines | Formulas | Xrefs | Standards | Gate result |
|---|---|---|---|---|---|
| `threat_protection/DOC-21_ballistic_protection_specification.md` | 550 | 0 | 54 | 24 | FAIL formulas |
| `threat_protection/DOC-22_thermal_fire_protection_specification.md` | 497 | 2 | 45 | 23 | FAIL formulas |
| `threat_protection/DOC-23_electrical_gic_protection_specification.md` | 497 | 0 | 38 | 24 | FAIL formulas |
| `threat_protection/DOC-26_blast_fragmentation_protection.md` | 579 | 0 | 40 | 34 | FAIL formulas |
| `threat_protection/DOC-27_environmental_seal.md` | 558 | 0 | 33 | 25 | FAIL formulas |
| `threat_protection/DOC-28_power_thermal_management.md` | 704 | 0 | 35 | 34 | FAIL formulas |
| `integration_sustainment/DOC-34_maintenance_sustainment.md` | 677 | 4 | 15 | 32 | FAIL formulas |
| `integration_sustainment/DOC-35_logistics_supply_chain.md` | 534 | 178 | 7 | 51 | FAIL xrefs |
| `integration_sustainment/DOC-37_human_factors_ergonomics.md` | 418 | 106 | 7 | 25 | FAIL xrefs |
| `integration_sustainment/DOC-38_medical_integration.md` | 452 | 90 | 0 | 8 | FAIL xrefs |
| `integration_sustainment/DOC-39_cyber_information_operations.md` | 521 | 112 | 0 | 24 | FAIL xrefs |
| `integration_sustainment/DOC-40_test_evaluation.md` | 446 | 77 | 0 | 59 | FAIL xrefs |
| `integration_sustainment/DOC-42_configuration_management.md` | 550 | 20 | 0 | 27 | FAIL xrefs |
| `integration_sustainment/DOC-44_data_management.md` | 516 | 11 | 2 | 27 | FAIL formulas, xrefs |
| `integration_sustainment/DOC-46_environmental_safety_occupational_health_esoh.md` | 541 | 16 | 1 | 29 | FAIL xrefs |
| `materials/MAT-01_silk_fibroin_engineering_specification.md` | 318 | 0 | 28 | 14 | FAIL formulas |
| `materials/MAT-03_protective_layer_integration.md` | 399 | 3 | 45 | 15 | FAIL formulas |
| `synthesis/SYNTH-01_unified_historical_modern_textile_engineering_theory.md` | 413 | 0 | 51 | 21 | FAIL formulas |
| `synthesis/SYNTH-02_protective_layer_adaptation.md` | 442 | 1 | 35 | 14 | FAIL formulas |
| `draft_kernels/DRAFT-02_garsault_proportional_scaling_system.md` | 345 | 0 | 29 | 19 | FAIL formulas |

The source `README.md` claims Phase A (formula injection for 34 documents) is complete
and all 77 documents pass. That claim does not hold for the files in `FinishedWork/`:
the injected formulas appear in the compendium only, or were never saved back to the
per-document files.

### 3.4 How the conflicting edition assemblies were resolved

| ID | Issue found in source | Resolution here |
|---|---|---|
| DOC-11, DOC-12, DOC-16..DOC-20 | One assembly each; piece-complete and contiguous | Used as-is |
| DOC-13 | Dated re-chunk duplicates pieces 2-5 (short stub plus full text) and omits 11, 13, 14, 16, 17; the older 17-piece assembly is complete but carries 3 conflation hits | Pieces merged across both sources, longest body wins, ordered 01..17; the five restored pieces are marked |
| DOC-14 | Dated re-chunk duplicates 3-5 and omits piece 1; older assembly has 16 pieces and also omits 7 | Piece 1 restored from the older assembly; **piece 7 is unavailable from any source** |
| DOC-15 | Dated re-chunk omits pieces 1-2 and starts at 13 | Pieces 1-2 restored from the older assembly; ordered 01..17 |
| DOC-19, DOC-20 | Dated re-chunk keeps only ~17 of 27 pieces (DOC-19 loses ~1,150 lines, DOC-20 ~850) | Complete original 27-piece assembly used |

Remaining work: author DOC-14 piece 7 (EMI/Shielding Tuning for RM-SG).

## 4. Known source defects carried through

These are content defects in the source documents, not consolidation errors. They were
not "fixed" because doing so would mean inventing specification content.

1. **DOC-48 reports the wrong project.** Its header says "Project: Aegis Outfit
   Fabricator — AIMES (Adaptive Integrated Modular Exosuit)" and its traceability line
   cites DOC-45, which does not exist. DOC-36 carries the same "AIMES" label.
2. **DOC-20's standards count is inflated** (~512 hits) because the document repeats
   standards tables; treat that figure as noise rather than breadth of citation.
3. **Compendium sections are not uniformly complete.** The compendium header claims
   "all documents pass", but its DOC-13/14/15/19/20 sections are the truncated or
   reordered re-chunks. Use the per-document files under `specifications/` as the
   authoritative text and the compendium as a reading convenience.
4. **Pipeline footer text inside documents.** Several edition documents end with runner
   notes ("End of Piece 17", "Electron pulse emitted. Worldline continues.") and each
   piece retains its "Prime Step" / "Piece NN of MM" header block. These are
   authoring-pipeline artifacts, kept so the bodies remain faithful to what was
   authored.
5. **DOC-24 survives only from section 3.4 onward** (§3.2).
6. **Compendium duplicate blocks.** Inside the compendium's DOC-13/14/15 sections,
   duplicated conformance paragraphs remain. The per-document roll-ups and chapter
   files in `specifications/` do not contain those duplicates.

## 5. Not carried into this folder (kept in the source project)

Working material rather than final product, left in `CSMWip/12_AegisOutfitFabricator/`:

- 23 `NEXT_runner_*.md` handoffs, `RESUME_SESSION_AEGIS.md`,
  `SESSION_RESUME_AEGIS.txt`, `START_RUNNER_014.sh`
- `TODO.md`, `REMEDIATION_TASKS.md`, `HEARTBEAT_AEGIS.md`, `example_README.md`,
  and the stale 15-chapter `MANIFEST.json`
- `Logs/` (heartbeat log plus 47 session logs), `memory/`, `.github_handler/`
- `scripts/` (heartbeat monitor, migration, batch processor, intro generator,
  session resume)
- `Framework/` (authoring templates and runner scaffolds; the two specification
  frameworks `DOC-11_RM-TS_Specification_Framework.md` and
  `DOC-12_RM-TG_Specification_Framework.md` are superseded by the authored DOC-11/12)
- `FinishedWork/intros/` (per-document TTS intro variants),
  `ALL_INTROS_READALOUD*.txt`, `make_clean_readaloud.sh`
- `PRIME_WORLDLINE_FRAMEWORK.md` (internal methodology essay, not a product spec)
- 293 loose `*_piece_NN.md.gz` fragments, `*_verify.md.gz` files, and the dated
  duplicate assemblies (their content is preserved through the chapters and roll-ups)
- `FinishedWork/NEXT_RUNNER_002..013.md.gz` (pipeline runner snapshots)

## 6. Remaining work, in priority order

1. **Author the four missing program documents**: DOC-41 Program Management,
   DOC-43 System Safety, DOC-45 Supportability/PBL, DOC-47 Cyber Survivability & EMC.
   The compendium outline already names their scope.
2. **Restore DOC-24 sections 1-3** (scope, chemical/bio threat taxonomy, material
   system) so it matches the other threat documents.
3. **Close the formula gate** on 14 documents; the source remediation plan already
   contains per-document formula targets for DOC-21..29, DOC-31, DOC-34, DOC-42,
   DOC-44, DOC-46, MAT-01/03, SYNTH-01/02, DRAFT-02.
4. **Restore traceability** in DOC-38..46 by adding cross-references to Research,
   SYNTH, MAT, DRAFT and the CSMFAB078 leaves.
5. **Author DOC-14 piece 7** (EMI/Shielding Tuning, RM-SG).
6. **Fix the project label** in DOC-36 and DOC-48 ("AIMES" → "Aegis Outfit
   Fabricator") and drop the DOC-45 traceability reference.
7. **Publish**: once 1-6 are done, assemble `deliverables/MASTER_SPECIFICATION.md`
   and generate the LaTeX/PDF standards-submission package from it.
8. **Re-verify**: run `bash tools/verify.sh`; the gate table should reach 56/56 and
   `tools/make_manifest.sh` must be re-run after any edit.
