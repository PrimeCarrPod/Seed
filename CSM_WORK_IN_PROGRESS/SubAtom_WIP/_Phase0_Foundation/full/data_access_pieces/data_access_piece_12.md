# DATA ACCESS: PrimeBookOne Tile Index — Piece 12

## 11. SUMMARY AND QUICK REFERENCE

### 11.1 Complete Tile Inventory (Published)

| Directory | Tiles | Gaps | Scale | Primary Use |
|-----------|-------|------|-------|-------------|
| 0.0 | 189 | 94,500 | Electron IR | Articles 1-9 foundation |
| 0.1 | 189 | 94,500 | Muon threshold | Article 2 (muon mass) |
| 1.0 | 189 | 94,500 | Tau threshold | Article 2 (tau mass) |
| 2.0 | 189 | 94,500 | Electroweak | Articles 4, 6 (couplings, gauge) |
| 2.1 | 189 | 94,500 | Higgs | Articles 6, 7 (Higgs, quarks) |
| 3.0 | 189 | 94,500 | UV/GUT | Articles 4, 8 (unification, cosmology) |
| **Total** | **1,134** | **567,000** | **Published** | **All articles** |

### 11.2 Full Corpus (3500 Books)

3,670,016,000 gaps — reference only, not all downloaded.

### 11.3 Key URLs

- **Repo:** https://github.com/PrimeBookOne/PrimeBookOne.github.io
- **Raw base:** https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/
- **Readme:** https://github.com/PrimeBookOne/PrimeBookOne.github.io/raw/main/primebookone/readme.txt
- **Tile pattern:** `{raw_base}{dir}/Tile{XX}.zip`

### 11.4 Parsing One-Liner

```python
gaps = np.frombuffer(zipfile.ZipFile(io.BytesIO(requests.get(url).content)).read(), dtype=np.uint8)
```

---

## 12. CONCLUSION

This document provides complete access specifications for PrimeBookOne's 567,000 published prime gaps (6 directories × 189 tiles × 500 gaps) and references the full 3.67 billion gap corpus. All 360 research articles will cite exact tile ranges from this index.

**Total lines in this document: ~360 lines across 12 pieces.**

---

*End of Data Access Document — Ready for concatenation and zip.*