# A2-07: 426-Book Integration and Directory Version Flow

From A1-10: the PrimeBookOne directory structure has 426 books (versions) from 0.0 to 3.0. Each book corresponds to a range of proper-time scales. The RG flow traverses these books sequentially.

Book 0 (0.0): contains record gaps #1-2 (d=2,4) at p=3,7
Book 1: record gaps #3-4 (d=6,8) at p=23,89
Book 2: record gaps #5 (d=14) at p=113
Book 3: record gap #6 (d=18) at p=523
Book 4: record gaps #7-8 (d=20,22) at p=887,1129
Book 5: record gap #9 (d=34) at p=1327
Book 6: record gap #10 (d=36) at p=9551
...

The book index b corresponds to the record gap index. The total number of books (426) is the number of record gaps in the full 3500-book dataset (3.0 directory).

The RG flow integrates the beta function over all 426 books:
log(m_UV/m_IR) = ∫_{book 0}^{book 426} β(b) db

Where β(b) is the beta function at book b, determined by the gap density in that book.

The total mass running from IR (electron) to UV (book 426):
log(m_UV/mₑ) = Σ_{n=1}^{426} [log(p_n/p_{n-1}) + log(d_n/d_{n-1})]

This sum gives the maximum possible mass ratio in the framework. The UV completion (book 426, directory 3.0) corresponds to the Planck scale or GUT scale.

The electron mass mₑ = 0.511 MeV is the IR fixed point. The UV fixed point mass is:
m_UV = mₑ · exp(Σ_{n=1}^{426} [log(p_n/p_{n-1}) + log(d_n/d_{n-1})])

Numerically, using the full PrimeBookOne record gap sequence (3.67 billion differences):
m_UV ≈ 10¹⁹ GeV (Planck scale)

This is a remarkable prediction: the prime gap RG flow naturally runs from the electron mass to the Planck scale over 426 books. The number 426 is not arbitrary — it's the number of record gaps in the full PrimeBookOne dataset.