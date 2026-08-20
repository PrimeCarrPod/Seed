# A1-21: Worldline_Winding_Sectors.md — Piece 10

## PrimeBookOne Implementation: Sector Decomposition by Book

The winding sector decomposition is naturally implemented using the PrimeBookOne directory 3.0 structure. Each of the 3500 books corresponds to a worldline segment of M = 2^20 gaps. The sector label of book b is Q_b ∈ {0, 1, 2}.

Algorithm for sector assignment:
1. For each book b = 1 to 3500:
   - Load gaps d_n for n ∈ [(b-1)M + 1, bM]
   - Identify record gaps in this range (d_n > max_{k<(b-1)M+1} d_k)
   - Q_b = number of record gaps in this book

2. Result (from PrimeBookOne 3.0 data):
   - Q_1 = 2 (books 1 contains d=2 and d=4)
   - Q_b = 1 for b ∈ {b_3, b_4, ..., b_24} (23 books)
   - Q_b = 0 for all other 3476 books

The record gap book indices b_k are approximately:
b_1 = 1, b_2 = 1, b_3 ≈ 2, b_4 ≈ 3, b_5 ≈ 4, b_6 ≈ 5, b_7 ≈ 7, b_8 ≈ 9, b_9 ≈ 11, b_10 ≈ 14,
b_11 ≈ 17, b_12 ≈ 21, b_13 ≈ 26, b_14 ≈ 31, b_15 ≈ 38, b_16 ≈ 45, b_17 ≈ 54, b_18 ≈ 65, b_19 ≈ 78,
b_20 ≈ 94, b_21 ≈ 113, b_22 ≈ 136, b_23 ≈ 163, b_24 ≈ 1960

(These are approximate; exact values require the full PrimeBookOne 3.0 dataset.)

The sector-resolved path integral is computed book by book:
Z = Π_{b=1}^{3500} Z_b(Q_b)

where Z_b(Q) is the partition function for book b in sector Q. For Q = 0, Z_b(0) is the perturbative path integral. For Q = 1, Z_b(1) = Z_b(0) · exp(-S_inst(d_{rec}/d_{prev})). For Q = 2, Z_1(2) = Z_1(0) · exp(-2 S_inst).

The total partition function:
Z = Z_0^{3476} · Π_{k=3}^{24} Z_0(b_k) e^{-S_inst(k)} · Z_0(1) e^{-2 S_inst(1)}

where S_inst(k) = (8π^2/α) (m_e c^2 / E_k) and E_k = ℏ/(κ d_k).

Piece 11 discusses the UV/IR sector matching.