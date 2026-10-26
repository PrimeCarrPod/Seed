# AGENTS.md — 12_AegisOutfitFabricatorConsolidated

Conventions for working inside this folder. The source project lives at
`../12_AegisOutfitFabricator/` and keeps the working material (runners, logs,
remediation checklists, fragmentation).

## What this folder is

The **final product set**: 56 specification documents, the two research inputs they
derive from, the master equation compendium, and the tooling to assemble and verify
them. Nothing here is a working artifact.

## Layout rules

- `specifications/<group>/<ID>_<slug>.md` — one file per numbered document. Do not
  rename files: IDs and slugs are referenced by `MANIFEST.sha256`, the README table,
  and the compendium index.
- `specifications/edition_specifications/chapters/<DOC>/NN_<slug>.md` — one file per
  authored piece for `DOC-11..DOC-20`. These are the canonical text for those ten
  documents; the sibling `<DOC>_<slug>.md` roll-up is for reading.
- `research/RESEARCH-0N_<slug>.md` — source research inputs, never gate-scored as
  specifications.
- `compendium/` — one combined file plus `parts/` split per document. Reading
  convenience only; the per-document files win on conflict.
- `deliverables/` — generated only. Regenerate with `tools/assemble.sh`; never
  hand-edit.
- Every `.md` has a `.gz` twin. When you edit a file, regenerate its twin.

## Edit workflow

```bash
cd CSMWip/12_AegisOutfitFabricatorConsolidated

# 1. Edit the product file (and its chapter file if it is DOC-11..DOC-20)
$EDITOR specifications/threat_protection/DOC-21_ballistic_protection_specification.md

# 2. Refresh the .gz twin
gzip -9 -c specifications/threat_protection/DOC-21_ballistic_protection_specification.md \
  > specifications/threat_protection/DOC-21_ballistic_protection_specification.md.gz

# 3. Rebuild the deliverable
bash tools/assemble.sh

# 4. Regenerate the manifest and verify
bash tools/make_manifest.sh
bash tools/verify.sh
```

## Content rules

- **Do not invent specification content.** If a section is missing (for example
  DOC-24 sections 1-3 or DOC-14 piece 7), record it in `SCOPE_GAPS.md` and author it
  deliberately as new work, with its own traceability and formulas.
- **Keep the numbering.** Documents are referenced by ID across the corpus
  (`DOC-01 §9.1`, `MAT-03 §1.2`, `CSMFAB078-A Table 3.3`). Renumbering breaks
  traceability.
- **Restoration markers are intentional.** Inside DOC-13 and DOC-15 you will find HTML
  comments such as
  `<!-- DOC-13 piece 11 restored from the original assembly: ... -->`. They record
  that the piece came from the older assembly because the newer re-chunk lost it.
  Keep the marker when editing; remove it only when the surrounding text is
  re-authored.
- **Preserve pipeline footers.** Some edition documents end with runner notes
  ("End of Piece 17", "Electron pulse emitted") and each piece keeps its
  "Prime Step" / "Piece NN of MM" header block. They are artifacts of the authoring
  pipeline, kept so the bodies stay faithful to what was authored.
- **Do not re-add working material.** No runner files, TODO lists, heartbeat configs,
  session logs, intro variants, or loose `*_piece_NN` fragments. If you need them,
  they are in the source folder.

## Quality gates

The five gates come from the source project and are enforced by report, not by build:

| Gate | Threshold |
|---|---|
| Lines | ≥ 300 |
| Formulas | ≥ 15 (`$$...$$`, `$...$`, ` ```math `, `\begin{`, `\frac`) |
| Cross-references | ≥ 10 mentions of `Research`, `SYNTH`, `MAT-`, `DRAFT-`, `CSMFAB078` |
| Standards cited | ≥ 5 of CIETA, ASTM, NIJ, NFPA, MIL-STD, ISO, IEC, DoDI, SAE |
| Conflation flags | 0 period terms (medieval, victorian, edwardian, rococo, neoclassical, pre-1600) |

`tools/quality_gates_doc.js` excludes two kinds of line from the conflation count:
lines that document the gate itself, and image-prompt `Negative Prompts` blocks, which
intentionally enumerate forbidden terms. `regency` and `empire` are not in the term
list because they collide with ordinary words in this corpus (for example "agency").

Run `node tools/quality_gates.js` for the table, or `bash tools/verify.sh` for the
manifest check plus the table.

## Tooling

| Tool | Purpose |
|---|---|
| `tools/assemble.sh` | Concatenate product files into `deliverables/MASTER_SPECIFICATION.md`; chapter files are used for DOC-11..DOC-20. |
| `tools/verify.sh` | Verify `MANIFEST.sha256`, print quality gates, report the deliverable digest. |
| `tools/make_manifest.sh` | Regenerate `MANIFEST.sha256` after any edit. |
| `tools/quality_gates.js` | Gate report driver; `--markdown` emits a table. |
| `tools/quality_gates_doc.js` | Per-document measurement (runs as a child process). |
| `tools/conflation_scan.js` | Explain a document's conflation hits. |

`verify.sh` exits non-zero only on checksum mismatch; gate failures are reported for
information while the corpus is being completed.

## Delivery checklist

Before calling a batch done:

1. `bash tools/assemble.sh`
2. `bash tools/make_manifest.sh`
3. `bash tools/verify.sh` — manifest PASS, gate table reviewed
4. Update `SCOPE_GAPS.md` if a gap was closed or found
5. Update the README document table if a line count or title changed materially
