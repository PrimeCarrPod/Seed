# DATA ACCESS: PrimeBookOne Tile Index

**Document:** DATA_ACCESS_PrimeBookOne_Tile_Index.md  
**Version:** 1.0  
**Date:** 2026-08-20  
**Branch:** session/prime-electron-research-360  
**Piece:** 01 of ~12 (30 lines each)  
**Target:** ≥350 lines total  

---

## ABSTRACT

This document provides the complete reference index for accessing PrimeBookOne's 3.67 billion prime gap differences organized as 3500 books × 2^20 differences. We catalog the Tile*.zip structure, remote access URLs, parsing specifications, and mapping to physics scales for the 360-file research program.

---

## 1. PRIMEBOOKONE REPOSITORY STRUCTURE

### 1.1 Repository Location

**Primary:** https://github.com/PrimeBookOne/PrimeBookOne.github.io  
**Data Path:** `primebookone/`  
**Readme:** `primebookone/readme.txt` (contains algorithm specification)

### 1.2 Directory Hierarchy

```
primebookone/
├── readme.txt
├── 0.0/          # 189 Tile*.zip files (500 diffs each) — Electron IR
├── 0.1/          # Next scale — Muon threshold
├── 1.0/          # Next scale — Tau threshold
├── 2.0/          # Next scale — Electroweak
├── 2.1/          # Next scale — Higgs
└── 3.0/          # UV scale — Planck/GUT
```

Each directory contains ~189 Tile*.zip files (GitHub 1000-file limit per directory).