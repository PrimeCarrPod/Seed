# AGENTS.md — 12_AegisOutfitFabricatorConsolidatedComplete

Conventions for working inside this folder. The source project is
`../12_AegisOutfitFabricator/`; the prior consolidation is
`../12_AegisOutfitFabricatorConsolidated/`. This folder is the completed product set.

## What this folder is

The **final product set**: 60 specification documents, the two research inputs they
derive from, the master equation compendium, and the tooling to assemble and verify
them. Every product document passes the five source quality gates. Nothing here is a
working artifact.

## Layout rules

- `specifications/<group>/<ID>_<slug>.md` — one file per numbered document. Do not
  rename files: IDs and slugs are referenced by `MANIFEST.sha256`, the README table,
  and the compendium index.
- `specifications/edition_specifications/chapters/<DOC>/NN_<slug>.md` — one file per
  authored piece for `DOC-11..DOC-20`. These are canonical text for those ten
  documents; the sibling `<DOC>_<slug>.md` roll-up is for reading.
- `research/RESEARCH-0N_<slug>.md` — source research inputs, never gate-scored as
  specifications.
- `compendium/` — generated from the product files. Rebuild with
  `node tools/build_compendium.js .`; do not hand-edit.
- `deliverables/` — generated only. Rebuild with `tools/assemble.sh`; never hand-edit.
- Every `.md` has a `.gz` twin. When you edit a file, regenerate its twin.

## Edit workflow

```bash
cd CSMWip/12_AegisOutfitFabricatorConsolidatedComplete

# 1. Edit the product file (and its chapter file if it is DOC-11..DOC-20)
$EDITOR specifications/threat_protection/DOC-21_ballistic_protection_specification.md

# 2. Refresh the .gz twin
gzip -9 -c specifications/threat_protection/DOC-21_ballistic_protection_specification.md \
  > specifications/threat_protection/DOC-21_ballistic_protection_specification.md.gz

# 3. Rebuild the deliverable and compendium
bash tools/assemble.sh
node tools/build_compendium.js .
node tools/build_publication.js

# 4. Regenerate the manifest and verify
bash tools/make_manifest.sh
bash tools/verify.sh
```

The fastest path is `bash resume_session.sh`, which performs all of the above and fails
if the manifest or any quality gate regresses.

## Content rules

- **Do not invent specification content casually.** If a section is missing, author it
  deliberately with its own traceability and formulas, and record the change in
  `SCOPE_COMPLETION.md`.
- **Keep the numbering.** Documents are referenced by ID across the corpus
  (`DOC-01 §9.1`, `MAT-03 §1.2`, `CSMFAB078-A Table 3.3`). Renumbering breaks
  traceability.
- **Restoration markers are intentional.** Inside DOC-13 and DOC-15 you will find HTML
  comments such as
  `<!-- DOC-13 piece 11 restored from the original assembly: ... -->`. They record that
  the piece came from the older assembly. Keep the marker when editing; remove it only
  when the surrounding text is re-authored.
- **Preserve pipeline footers.** Some edition documents end with runner notes and each
  piece keeps its "Prime Step" / "Piece NN of MM" header block. They are provenance
  artifacts.
- **Do not re-add working material.** No runner files, TODO lists, heartbeat configs,
  session logs, intro variants, or loose `*_piece_NN` fragments.

## Quality gates

The five gates come from the source project and are enforced by `tools/verify.sh`:

| Gate | Threshold |
|---|---|
| Lines | ≥ 300 |
| Formulas | ≥ 15 (`$$...$$`, `$...$`, ` ```math `, `\begin{`, `\frac`) |
| Cross-references | ≥ 10 mentions of `Research`, `SYNTH`, `MAT-`, `DRAFT-`, `CSMFAB078` |
| Standards cited | ≥ 5 of CIETA, ASTM, NIJ, NFPA, MIL-STD, ISO, IEC, DoDI, SAE |
| Conflation flags | 0 period terms (medieval, victorian, edwardian, rococo, neoclassical, pre-1600) |

`tools/quality_gates_doc.js` excludes lines that document the gate itself and
image-prompt `Negative Prompts` blocks. `regency` and `empire` are not in the term list
because they collide with ordinary words in this corpus.

Expected result after any accepted edit: `60/60 documents pass all five gates`.

## Tooling

| Tool | Purpose |
|---|---|
| `resume_session.sh` | One-command gzip refresh, compendium rebuild, master assembly, single-file/HTML build, manifest, and verification. |
| `tools/assemble.sh` | Concatenate product files into `deliverables/MASTER_SPECIFICATION.md`; chapter files are used for DOC-11..DOC-20. |
| `tools/build_compendium.js` | Rebuild `compendium/EQUATIONSCOMPLETE_Master_Compendium.md` and `compendium/parts/`. |
| `tools/build_publication.js` | Rebuild the single-file Markdown and full-markup HTML editions under `deliverables/`. |
| `tools/verify.sh` | Verify `MANIFEST.sha256`, print quality gates, fail on any gate failure, report the deliverable digest. |
| `tools/make_manifest.sh` | Regenerate `MANIFEST.sha256` after any edit. |
| `tools/quality_gates.js` | Gate report driver; `--markdown` emits a table. |
| `tools/quality_gates_doc.js` | Per-document measurement (runs as a child process). |
| `tools/conflation_scan.js` | Explain a document's conflation hits. |

## Delivery checklist

Before calling a batch done:

1. `bash resume_session.sh`
2. Confirm `60/60 documents pass all five gates`.
3. Confirm the manifest passes and the master, single-file, and HTML deliverables were rebuilt.
4. Update `SCOPE_COMPLETION.md` if a gap was closed or a new caveat was found.
5. Update the README document map if a line count or title changed materially.
