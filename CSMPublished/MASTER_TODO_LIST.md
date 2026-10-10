# MASTER TODO LIST - Zenodo Publishing Workflow
## Project: SubAtomic Prime Electron & Caldera Prime Pi Electron
## Target: https://zenodo.org/communities/arithmeticphysics/
## Date: 2026-10-10

---

## 📋 PHASE 1: FILE ORGANIZATION ✅ COMPLETED

### 1.1 Create CSMPublished Folder Structure ✅
- [x] 01_Flagship_Papers/ - Core flagship documents
- [x] 02_SubAtomic_Canonical/ - 9 subdomains (A-I series)
- [x] 03_Caldera_Prime_Pi_Electron/ - 3 subdirectories
- [x] 04_Synthesis_Compendiums/ - Ultimate compendiums + synthesis articles
- [x] 05_LaTeX_Publications/ - 5 subdirectories
- [x] 06_ReadAloud_Versions/ - Accessibility versions

### 1.2 Copy Ready-to-Publish Files ✅
- [x] Flagship papers (6 core + 9 previously published)
- [x] SubAtomic Canonical: 70+ articles across A-I series
- [x] Caldera: 5 compilations + 6 articles + Prime Counting Evaluation
- [x] Synthesis: 4 ultimate compendiums + 3 synthesis articles
- [x] LaTeX: 3 flagship + 14 caldera + 1 computational + 4 read-aloud + 1 unified
- [x] Read-aloud: 4 versions

### 1.3 Create CSMPrePublish for Items Needing Fixes ✅
- [x] Placeholder_Articles/ (4 files - 192 byte placeholders)
- [x] Corrupted_Files/ (49 files ending in `}`)

---

## 🔧 PHASE 2: FIX ISSUES IN CSMPrePublish 🔄 IN PROGRESS

### 2.1 Fix Placeholder Articles (4 files)
- [ ] `/workspace/app/A1-11_Quantum_Article.md` (192 B) - Replace with actual content from A1-11 series
- [ ] `/workspace/app/A3-01_Quantum_Article.md` (192 B) - Replace with actual content from A3-01 series
- [ ] `/workspace/app/A7-08_Quantum_Article.md` (192 B) - Replace with actual content from A7-08 series
- [ ] `/workspace/app/CSMWip/01_SubAtomic_Prime_Electron_Canonical/C_Article1_HilbertSpace/full/A3-01_Quantum_Article.md` (192 B) - Same as above

**Action**: Replace with content from corresponding full articles in canonical series.

### 2.2 Fix Corrupted Files (49 files ending in `}`)
**A_Article1_Worldline/full/** (11 files):
- [ ] A1-10_Worldline_Segment_Books.md}
- [ ] A1-14_Worldline_Metric_From_Gaps.md}
- [ ] A1-15_Worldline_Geodesic_Equation.md}
- [ ] A1-16_Worldline_Action_Principle.md}
- [ ] A1-17_Worldline_Hamiltonian.md}
- [ ] A1-18_Worldline_Path_Integral.md}
- [ ] A1-20_Worldline_Topological_Charge.md}
- [ ] A1-28_Worldline_BPS_States.md}
- [ ] A1-32_Worldline_Renyi_Entropies.md}
- [ ] A1-33_Worldline_Modular_Hamiltonian.md}
- [ ] A1-34_Worldline_Relative_Entropy.md}

**C_Article3_HilbertSpace/full/** (18 files):
- [ ] A3-02_Time_Evolution_Operator.md}
- [ ] A3-03_Prime_Difference_Basis.md}
- [ ] A3-04_Unitarity_From_Prime_Distribution.md}
- [ ] A3-05_Entanglement_From_Gap_Correlations.md}
- [ ] A3-06_Decoherence_From_Gap_Randomness.md}
- [ ] A3-07_Quantum_Information_Prime_Book.md}
- [ ] A3-08_Error_Correction_Twin_Primes.md}
- [ ] A3-09_Bell_Inequalities_Prime_Gaps.md}
- [ ] A3-10_Quantum_Computing_Prime_Algorithm.md}
- [ ] A3-11_Quantum_Error_Correction_Prime_Gaps.md}
- [ ] A3-12_Quantum_Simulation_Prime_Gaps.md}
- [ ] A3-13_Quantum_Machine_Learning_Prime_Gaps.md}
- [ ] A3-14_Quantum_Metrology_Prime_Gaps.md}
- [ ] A3-15_Quantum_Thermodynamics_Prime_Gaps.md}
- [ ] A3-16_Quantum_Control_Prime_Gaps.md}
- [ ] A3-17_Quantum_Sensing_Prime_Gaps.md}
- [ ] A3-18_Quantum_Communication_Prime_Gaps.md}
- [ ] A3-19_Quantum_Networks_Prime_Gaps.md}

**C_Article17_HilbertSpace/full/** (1 file):
- [ ] A3-17_Quantum_Sensing_Prime_Gaps.md}

**Action for each**: Rename by removing trailing `}`, verify content matches non-corrupted version, move to appropriate CSMPublished subfolder.

---

## 📝 PHASE 3: ZENODO METADATA CREATION ✅ COMPLETED

### 3.1 Master Metadata ✅
- [x] `/workspace/app/CSMPublished/METADATA_ZENODO.json`

### 3.2 Per-Category Metadata ✅
- [x] 01_Flagship_Papers/METADATA_ZENODO.json
- [x] 02_SubAtomic_Canonical/METADATA_ZENODO.json
- [x] 03_Caldera_Prime_Pi_Electron/METADATA_ZENODO.json
- [x] 04_Synthesis_Compendiums/METADATA_ZENODO.json
- [x] 05_LaTeX_Publications/METADATA_ZENODO.json
- [x] 06_ReadAloud_Versions/METADATA_ZENODO.json

### 3.3 Metadata Fields Included
- Title, description, creators, keywords
- Community: arithmeticphysics
- Access right: open
- License: CC-BY-4.0
- Publication date: 2026-10-10
- Resource type: publication/preprint
- Related identifiers (GitHub repo)
- Version: 1.0.0

---

## ☁️ PHASE 4: ZENODO UPLOAD 📋 PENDING

### 4.1 Upload Strategy Options

#### Option A: Single Large Deposit (Recommended for coherence)
- Upload entire CSMPublished/ as one record
- Use master metadata
- ~200 MB total
- Pros: Single DOI, coherent framework
- Cons: Large upload, single version control

#### Option B: Multi-Deposit by Category (6 deposits)
- 01_Flagship_Papers → separate record
- 02_SubAtomic_Canonical → separate record
- 03_Caldera_Prime_Pi_Electron → separate record
- 04_Synthesis_Compendiums → separate record
- 05_LaTeX_Publications → separate record
- 06_ReadAloud_Versions → separate record
- Pros: Granular DOIs, smaller uploads, category-specific metadata
- Cons: Multiple DOIs to manage

#### Option C: Hybrid (Recommended)
- Core framework as 1 deposit (Flagship + Canonical + Caldera + Synthesis)
- LaTeX + ReadAloud as supplemental deposits
- Total: 3 deposits

### 4.2 Upload Commands (using zenodo API or web UI)

**Using zenodo-cli (if available):**
```bash
# Install zenodo-cli
pip install zenodo-cli

# Configure
zenodo config --token YOUR_ZENODO_TOKEN

# Upload each category
zenodo deposit create --metadata 01_Flagship_Papers/METADATA_ZENODO.json
zenodo deposit upload-files 01_Flagship_Papers/*
zenodo deposit publish
```

**Using web UI (manual):**
1. Go to https://zenodo.org/communities/arithmeticphysics/
2. Click "New upload"
3. Drag & drop folders
4. Fill metadata from JSON files
5. Select community: arithmeticphysics
6. Publish

### 4.3 Post-Upload
- [ ] Verify all files accessible
- [ ] Check DOIs resolve
- [ ] Update GitHub README with DOIs
- [ ] Archive deposit records

---

## 📦 PHASE 5: DOCUMENTATION & ARCHIVAL 📋 PENDING

### 5.1 Create README.md in CSMPublished
- [ ] Overview of framework
- [ ] Folder structure explanation
- [ ] Zenodo DOIs (after upload)
- [ ] Citation instructions

### 5.2 Update GitHub Repository
- [ ] Add Zenodo badge to README
- [ ] Link deposits in repo description
- [ ] Tag release v1.0.0

### 5.3 Archive in CSMArchive
- [ ] Copy final published structure to CSMArchive/
- [ ] Document workflow for future updates

---

## 🔍 VERIFICATION CHECKLIST

### File Counts by Category
| Category | Expected Files | Actual Files | Status |
|----------|---------------|--------------|--------|
| 01_Flagship_Papers | 15 | | ⬜ |
| 02_SubAtomic_Canonical | ~70 | | ⬜ |
| 03_Caldera_Prime_Pi_Electron | 12 | | ⬜ |
| 04_Synthesis_Compendiums | 7 | | ⬜ |
| 05_LaTeX_Publications | 23 | | ⬜ |
| 06_ReadAloud_Versions | 4 | | ⬜ |
| **Total** | **~131** | | ⬜ |

### Placeholder Fix Verification
- [ ] All 4 placeholders replaced with real content
- [ ] File sizes > 1 KB each
- [ ] Content matches canonical series

### Corrupted File Fix Verification
- [ ] All 49 `}` files renamed
- [ ] Content verified against clean versions
- [ ] Moved to correct CSMPublished subfolders
- [ ] CSMPrePublish/Corrupted_Files/ empty

---

## 📅 TIMELINE

| Phase | Target Date | Status |
|-------|-------------|--------|
| Phase 1: Organization | 2026-10-10 | ✅ Done |
| Phase 2: Fixes | 2026-10-11 | 🔄 In Progress |
| Phase 3: Metadata | 2026-10-10 | ✅ Done |
| Phase 4: Upload | 2026-10-11 | ⬜ Pending |
| Phase 5: Documentation | 2026-10-12 | ⬜ Pending |

---

## 🚀 QUICK START COMMANDS

```bash
# Verify CSMPublished structure
find /workspace/app/CSMPublished -type f -name "*.md" -o -name "*.pdf" -o -name "*.tex" -o -name "*.txt" -o -name "*.json" | wc -l

# Check CSMPrePublish
find /workspace/app/CSMPrePublish -type f | wc -l

# Fix corrupted files (example)
for f in /workspace/app/CSMPrePublish/Corrupted_Files/**/*}; do
  new="${f%\}}"
  mv "$f" "$new"
  # Then copy to appropriate CSMPublished location
done

# Upload with zenodo-cli (after fixing)
zenodo deposit create --metadata /workspace/app/CSMPublished/METADATA_ZENODO.json
```

---

## 📞 CONTACT & SUPPORT

- **Repository**: https://github.com/PrimeCarrPod/Seed
- **Zenodo Community**: https://zenodo.org/communities/arithmeticphysics/
- **Primary Record**: https://zenodo.org/records/22700689 (existing)

---

*This Master Todo List tracks the complete publishing workflow from file organization through Zenodo deposit. Update status checkboxes as tasks complete.*