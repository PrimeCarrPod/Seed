# A2-07: Prime Density π(x) and Gap Statistics

The prime counting function π(x) gives the number of primes ≤ x. The prime gap distribution is derived from π(x):
- Average gap at scale x: ⟨d⟩ = x/π(x) ~ log x
- Record gaps: d_n where d_n > max{d_i : i < n}
- Record primes: p_n where p_n is the prime at the end of gap d_n

From PrimeBookOne (0.0 directory, 3500 books × 2^20 differences):
The first 18 record gaps and their record primes:

| n | d_n | p_n | π(p_n) | log p_n | d_n/log p_n |
|---|-----|-----|--------|---------|-------------|
| 1 | 2   | 3   | 2      | 1.099   | 1.82        |
| 2 | 4   | 7   | 4      | 1.946   | 2.06        |
| 3 | 6   | 23  | 9      | 3.135   | 1.91        |
| 4 | 8   | 89  | 24     | 4.489   | 1.78        |
| 5 | 14  | 113 | 30     | 4.727   | 2.96        |
| 6 | 18  | 523 | 98     | 6.259   | 2.88        |
| 7 | 20  | 887 | 154    | 6.788   | 2.95        |
| 8 | 22  | 1129| 189    | 7.029   | 3.13        |
| 9 | 34  | 1327| 217    | 7.191   | 4.73        |
| 10| 36  | 9551| 1183   | 9.164   | 3.93        |
| 11| 40  | 15683|1832   | 9.660   | 4.14        |
| 12| 44  | 19609|2225   | 9.884   | 4.45        |
| 13| 48  | 28279|3068   | 10.25   | 4.68        |
| 14| 52  | 31543|3400   | 10.36   | 5.02        |
| 15| 72  | 155921|14423  | 11.96   | 6.02        |
| 16| 112 | 370261|31479  | 12.82   | 8.74        |
| 17| 114 | 492113|40932  | 13.11   | 8.70        |
| 18| 118 | 1349533|103509 | 14.12   | 8.36        |

The ratio d_n/log p_n fluctuates around 3-9, growing slowly. This reflects the increasing rarity of record gaps. The gap density ρ_n = 1/p_n drops by orders of magnitude.

The key insight: the RG flow "sees" the prime density through the gap distribution. The beta function β(m) = d(log m)/d(log μ) is proportional to the local gap density at scale μ.