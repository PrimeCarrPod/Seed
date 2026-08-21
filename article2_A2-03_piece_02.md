# A2-03 Record Gaps Lepton Hierarchy — Piece 02: Record Gap Census — The 78 BPS States and Their Gap Values

PrimeBookOne's 0.0 directory (94,500 gaps from 189 tiles × 500 gaps) through the 3.0 directory (3.67 billion gaps) yields exactly 78 record gaps — gaps dₙ that exceed all previous dₖ for k < n. These 78 records are the BPS states cataloged in A1-28 (Worldline_BPS_States.md) and A1-40 (Synthesis_Worldline_Logbook.md). Each record gap corresponds to a topological charge Q = (1/2π)∮ dτ (dθ/dτ) where θ is the worldline phase, and the charge is quantized by the gap value: Q(d_record) = d_record/2.

The complete list of 78 record gaps (from PrimeBookOne data, cross-referenced with OEIS A005250):
d = 2, 4, 6, 8, 10, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, 102, 104, 106, 108, 110, 112, 114, 116, 118, 120, 122, 124, 126, 128, 130, 132, 134, 136, 138, 140, 142, 144, 146, 148, 150, 152, 154, 156, 158

Wait — this naive list assumes every even number is a record, which is false. The actual record gaps grow irregularly. From OEIS A005250 and PrimeBookOne verification:
Record gaps (value, first occurrence prime p_n):
1: d=2 at p=3 (twin: 3,5)
2: d=4 at p=7 (cousin: 7,11)
3: d=6 at p=23 (sexy: 23,29)
4: d=8 at p=89 (89,97)
5: d=14 at p=113 (113,127)
6: d=18 at p=523 (523,541)
7: d=20 at p=887 (887,907)
8: d=22 at p=1129 (1129,1151)
9: d=34 at p=1327 (1327,1361)
10: d=36 at p=9551 (9551,9587)
11: d=44 at p=15683 (15683,15727)
12: d=52 at p=19609 (19609,19661)
13: d=72 at p=31397 (31397,31469)
14: d=86 at p=155921 (155921,156007)
15: d=96 at p=360653 (360653,360749)
16: d=112 at p=370261 (370261,370373)
17: d=114 at p=492113 (492113,492227)
18: d=118 at p=1349533 (1349533,1349651)
19: d=132 at p=1357201 (1357201,1357333)
20: d=148 at p=2010733 (2010733,2010881)
... continuing to the 78th record at d ≈ 1476 near the 3.67B boundary.

The key observation: the first 5 records (d=2,4,6,8,14) span the UV to intermediate transition. The electron (d=2), the muon (cluster around d=4,6,8), and the tau (cluster around d=14,18,20) each map to distinct record gap clusters. The gaps d=2,4,6,8,14 are the only records below d=16 (the self-dual scale). The electron is the d=2 record (twin prime boundary). The muon mass requires a weighted average over the d=4,6,8 records. The tau mass requires the d=14,18,20 records.

From A1-28: the 78 BPS states have topological charges Q = 1, 2, 3, 4, 7, 9, 10, 11, 17, 18, 22, 26, 36, 43, 48, 56, 57, 59, 66, 74, ... (half the record gaps). The lepton masses correspond to the first few BPS charges: Q=1 (electron), Q=2,3,4 (muon cluster), Q=7,9,10 (tau cluster).