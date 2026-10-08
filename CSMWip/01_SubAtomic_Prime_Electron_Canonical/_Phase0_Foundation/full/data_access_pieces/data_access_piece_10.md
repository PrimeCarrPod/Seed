# DATA ACCESS: PrimeBookOne Tile Index — Piece 10

## 9. README.TXT ALGORITHM SPECIFICATION

### 9.1 Full Readme Content

From `primebookone/readme.txt`:

```
Begin with 5 and add to each previous number from the sequential array.
Remember to multiply the difference number by two before adding.
8 Bit Array Required.
```

### 9.2 Algorithm Interpretation

**Sequential array:** The array of integers [1, 2, 3, 4, 5, ...] or similar.

"Begin with 5" → Initial value = 5 (but first prime gap is 1, so this may mean start at index 5)

"Add to each previous number from the sequential array" → Recursive addition

"Multiply the difference number by two before adding" → Factor of 2 in recurrence

"8 Bit Array Required" → Output values stored as uint8 (0-255)

### 9.3 Reconstructed Recurrence

Let a_k be the k-th element of the sequential array (a_k = k).

Let d_k be the k-th prime gap.

Recurrence: d_{k+1} = d_k + 2·a_k = d_k + 2k

With initial condition d_3 = 2 (since "begin with 5" → start at prime index 3, p_3=5, p_4=7, gap=2)

Check:
- d_3 = 2 (given)
- d_4 = d_3 + 2·3 = 2 + 6 = 8 (but actual gap p_5-p_4 = 11-7 = 4) ❌

Alternative: Sequential array = prime gaps themselves?

d_{k+1} = d_k + 2·d_{k-1}? Check:
- d_3 = 2
- d_4 = 2 + 2·2 = 6 (actual 4) ❌

**Conclusion:** The readme describes the *storage format* (8-bit, ×2 factor) not the *generation algorithm*. The actual gaps are true prime differences. The "multiply by two" is the spin-1/2 factor (Section 3.3 of Foundation).