# ARTICLE 1: Prime Electron Worldline Topology

## A1-02: Topological Winding Numbers

**File:** A1-02_Topological_Winding_Numbers.md  
**Article:** 1 of 9 — Prime Electron Worldline Topology  
**Piece:** 01 of ~12 (30 lines each)  
**Target:** ≥350 lines total  
**Data Source:** PrimeBookOne, `primebookone/0.0/Tile00.zip`–`Tile188.zip`, gaps #1–#94,500  

---

### ABSTRACT

This document derives the topological winding numbers (instanton charges) of the single electron worldline from PrimeBookOne's prime gap sequence. Each record prime gap corresponds to a worldline turning point where the topological charge Q = (1/2π)∮ dτ ẋ^μ ∂_μ ẋ^ν F_{νρ} ẋ^ρ changes by ±1. The winding number spectrum maps directly to the record gap hierarchy.

---

### 1. WORLDLINE TOPOLOGICAL CHARGE

#### 1.1 Gielerak's Formulation

The topological charge of a worldline γ: ℝ → ℳ^4 is:

Q = (1/2π) ∫ dτ ẋ^μ ∂_μ ẋ^ν F_{νρ} ẋ^ρ

In QCD language, this is the instanton number — the winding number of the gauge field configuration along the worldline.

#### 1.2 Discrete Worldline Approximation

For the discrete worldline with vertices at primes p_n and proper-time steps Δτ_n = κ·d_n:

Q_N = (1/2π) Σ_{n=1}^N ΔQ_n

where ΔQ_n is the topological charge accumulated at step n.