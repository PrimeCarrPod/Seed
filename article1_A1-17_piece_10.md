# A1-17: Worldline Hamiltonian — Piece 10
## Numerical Evaluation from PrimeBookOne Data

The Hamiltonian eigenvalues E_n = m_e c^2/d_n can be computed directly from the PrimeBookOne gap data. For each directory level:

Algorithm:
1. Load tile T_{k} from directory D
2. Extract gaps d_i
3. Compute eigenvalues E_i = m_e c^2/d_i
4. Build histogram of E values
5. Compute moments: <E^k> = (1/N) Sum_i E_i^k

For directory 0.0 (189 tiles * 500 gaps = 94,500 gaps):
- Mean gap: <d> ~ log(10^6) ~ 13.8
- Mean energy: <E> = m_e c^2 <1/d> ~ 0.511 * (1/13.8) ~ 0.037 MeV
- Variance: Var(E) = (m_e c^2)^2 Var(1/d)

The histogram shows peaks at:
- 0.2555 MeV (d=2, twin primes)
- 0.1277 MeV (d=4, cousin primes)
- 0.0852 MeV (d=6, sexy primes)
- 0.0639 MeV (d=8)
- etc.

The peak heights are proportional to the prime k-tuple frequencies.

For directory 3.0 (3.67e9 gaps):
- Mean gap: <d> ~ log(10^18) ~ 41.4
- Mean energy: <E> ~ 0.511/41.4 ~ 0.0123 MeV
- The distribution shifts to lower energies (larger average gaps)

The running of the mean energy with directory level D is:
<E>_D ~ m_e c^2 / log(p_D)
where p_D is the typical prime scale at directory D.

This running matches the running of the electron wavefunction renormalization Z_2 in QED. The electron mass is protected by chiral symmetry, but the proper energy scale runs with the gap statistics.

The numerical data from PrimeBookOne can be used to:
1. Verify the gap distribution matches Hardy-Littlewood predictions
2. Compute the spectral density rho(E) = Sum_n delta(E - E_n)
3. Evaluate the partition function Z(beta) = Sum_n exp(-beta E_n)
4. Test the convergence of thermodynamic quantities as D -> 3.0
5. Extract the Riemann zero resonances from the spectral fluctuations (A1-04)

Pseudo-code for Hamiltonian spectral analysis:
```
function compute_hamiltonian_spectrum(directory_level):
    eigenvalues = []
    for tile in load_tiles(directory_level):
        gaps = extract_gaps(tile)
        for d in gaps:
            E = 0.511 / d  # MeV
            eigenvalues.append(E)
    return eigenvalues

function analyze_spectrum(eigenvalues):
    hist = histogram(eigenvalues, bins=1000, range=(0, 0.2555))
    moments = [mean(eigenvalues**k) for k in 1..4]
    Z = lambda beta: sum(exp(-beta * E) for E in eigenvalues)
    return hist, moments, Z
```

The spectral analysis provides the empirical foundation for the theoretical framework.