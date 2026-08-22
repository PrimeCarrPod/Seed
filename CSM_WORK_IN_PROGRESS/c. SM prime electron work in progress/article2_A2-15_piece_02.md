# A2-15: Dark Matter From Missing Gaps — Piece 02

## Cramér Model vs. PrimeBookOne: The Missing Gap Spectrum

**Cramér's Random Model (1936):** Treats primes as a random set with density 1/log x. The gap distribution is:

P(d) = (1/log x) exp(-d/log x) for d even

This predicts the expected number of gaps of size d up to x:

E[N(d)] = π(x) · (1/log x) exp(-d/log x)

**PrimeBookOne Data (Tiles 00-188, 3.67B differences):** The actual gap distribution deviates from Cramér at large d. The record gaps are: 2, 4, 6, 8, 10, 14, 16, 18, 20, 22, 24, 26, 28, 30, 32, 34, 36, 38, 40, 42, 44, 46, 48, 50, 52, 54, 56, 58, 60, 62, 64, 66, 68, 70, 72, 74, 76, 78, 80, 82, 84, 86, 88, 90, 92, 94, 96, 98, 100, ...

**The Missing Gaps:** Cramér predicts many gaps that don't appear as record gaps. For example, gap d=12 is predicted but never becomes a record gap (it's always surpassed by larger gaps before it can be a record). Similarly, d=22, 24, 26... many even gaps are "missing" from the record gap sequence.

**Key Insight:** The worldline's stability conditions (A1-30) forbid certain gap sizes from becoming record gaps. These forbidden gaps correspond to unstable worldline excitations that would violate the RH-bound gap constraints. But they still exist as "virtual" gaps — they appear in the gap distribution but never as records. These virtual gaps are the dark matter candidates.

**Mathematical Formulation:** A gap d is "missing" if:

P_record(d) = 0 but P_Cramér(d) > ε

where P_record(d) is the probability d appears as a record gap (from PrimeBookOne), and P_Cramér(d) is the Cramér prediction. The threshold ε ~ 10^{-6} (computable from RH bounds).

**Reference:** A1-05, A1-30, A2-12.