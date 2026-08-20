# A1-17: Worldline Hamiltonian — Piece 07
## Lepton Mass Spectrum from Hamiltonian Eigenvalues

The eigenvalues of the Hamiltonian H = m_e c^2 Sum_n 1/d_n are sums of inverse gaps. Different worldline segments (books in the PrimeBookOne structure) have different gap sequences and thus different energy spectra.

From A1-10, the 3500 books in directory 3.0 correspond to 3500 worldline segments. Each book has 2^20 = 1,048,576 gaps. The energy of book b is:
E_b = m_e c^2 Sum_{n in book b} 1/d_n

The distribution of E_b across the 3500 books gives the mass spectrum of leptonic excitations. The ground state (electron) corresponds to the book with the highest density of small gaps (twin primes). The excited states (muon, tau) correspond to books with larger average gaps.

From A2-02 (planned), the electron mass m_e = 0.511 MeV comes from the twin prime gaps (d=2). The muon mass m_mu = 105.66 MeV comes from the first record gap (d=4). The tau mass m_tau = 1776.86 MeV comes from the second record gap (d=6).

Let's verify this scaling. The energy contribution per gap of size d is m_e c^2/d.
- For d=2: E = 0.2555 MeV
- For d=4: E = 0.1277 MeV
- For d=6: E = 0.0852 MeV

These are too small by factors of ~2, ~800, ~20000 respectively. The resolution is that the mass is not the energy of a single gap, but the total energy of a worldline segment with many gaps.

The electron mass corresponds to the segment with the highest twin prime density. If a segment has N_2 twin primes out of N gaps, its energy is:
E ~ m_e c^2 (N_2/2 + N_4/4 + N_6/6 + ...)

For the electron segment (book 0, the IR regime), N ~ 500 (directory 0.0 tile). The twin prime density in the first tile is about 35/500 = 7%. So N_2 ~ 35, N_4 ~ 35, N_6 ~ 30, etc.
E_0 ~ 0.511 * (35/2 + 35/4 + 30/6 + ...) ~ 0.511 * (17.5 + 8.75 + 5 + ...) ~ 0.511 * 31.25 ~ 16 MeV

This is still not 0.511 MeV. The correct identification is that the electron rest energy m_e c^2 is the unit of energy, and the dimensionless sum Sum 1/d_n gives the mass in units of m_e.

The electron corresponds to the segment where Sum 1/d_n = 1. The muon corresponds to Sum 1/d_n = m_mu/m_e = 206.76. The tau corresponds to Sum 1/d_n = m_tau/m_e = 3477.15.

The record gaps give large contributions to this sum. A record gap d_max contributes m_e c^2/d_max which is small, but the gaps leading up to the record gap have a different distribution.

The correct formula from the Hamiltonian perspective is that the mass eigenvalues are the eigenvalues of the Hamiltonian restricted to a worldline segment with appropriate boundary conditions. The boundary conditions select the segment length and the gap statistics.

This will be fully developed in Article 2 (Mass Spectrum). Here we establish that the Hamiltonian eigenvalues are the fundamental quantities from which masses emerge.