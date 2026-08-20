# A1-21: Worldline_Winding_Sectors.md — Piece 02

## Prime Gap Sequence and Sector Labeling

The winding sector of a worldline segment (book) is determined by the prime gaps within that segment. From A1-10 (Worldline_Segment_Books), each book corresponds to a contiguous block of M = 2^20 = 1,048,576 prime gaps. Book b (b = 1, ..., 3500) contains gaps:
d_n for n ∈ [(b-1)M + 1, bM]

The topological charge of book b is:
Q_b = (1/2π) ∮_{book b} Tr(F ∧ F) = (κ^5/4π) Σ_{n ∈ book b} d_n^5 (∂_n log d_n)^2

From A1-20 Piece 05, this sum is dominated by record gaps within the book. A record gap is a gap d_n > max_{k<n} d_k. The record gaps in directory 3.0 (from OEIS A005250, first occurrences of each even gap) are:
d = 2, 4, 6, 8, 10, 14, 18, 20, 22, 26, 28, 30, 32, 34, 36, 40, 44, 46, 50, 52, 54, 58, 60, 64, ...
with the 24th record gap being d = 1476 at n ≈ 2.5×10^9.

The record gaps are not uniformly distributed. The first record gap (d=2) occurs at n=1 (p_2=3, p_1=2). The second (d=4) at n=2 (p_3=5, p_2=3). The spacing between record gaps grows approximately as log n. In directory 3.0, the 24 record gaps fall in books:
Book 1: d=2,4 (first two record gaps)
Books 2-24: one record gap each (approximately)
Books 25-3500: no record gaps

More precisely, the book index for record gap k is:
b_k = ⌈n_k / M⌉

where n_k is the prime index of the k-th record gap. Using the PrimeBookOne 3.0 data:
b_1 = 1 (n=1), b_2 = 1 (n=2), b_3 ≈ 2 (n≈10^6), b_4 ≈ 3 (n≈2×10^6), ..., b_24 ≈ 2400 (n≈2.5×10^9)

Thus Q_b = 2 for b=1, Q_b = 1 for b ∈ {b_3, ..., b_24}, and Q_b = 0 otherwise.

Piece 03 computes the sector partition function.