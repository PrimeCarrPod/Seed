# Piece 03: Adjoint Supercharge $Q^\dagger$ and Fermion Number

The adjoint supercharge is

$$
Q^\dagger = \sum_{n=1}^{N-1} \psi_n^\dagger \sqrt{d_n d_{n+1}}
$$

with $\psi_n^\dagger = |1\rangle\langle 0|_n$ raising the fermion number at site $n$. The fermion number operator is

$$
F = \sum_{n=1}^{N-1} \psi_n^\dagger \psi_n = \sum_{n=1}^{N-1} |1\rangle\langle 1|_n
$$

which counts the number of gaps exceeding their local mean $\langle d \rangle_n$. From A1-24 Piece 05, for PrimeBookOne directory 0.0, $\langle d \rangle_n \approx \log p_n$, and the sign function $\text{sign}(d_n - \langle d \rangle_n)$ determines the local index density.

The grading operator $(-1)^F = e^{i\pi F} = \prod_n (1 - 2\psi_n^\dagger \psi_n)$ satisfies the SUSY algebra relations:

$$
(-1)^F Q (-1)^F = -Q, \quad (-1)^F Q^\dagger (-1)^F = -Q^\dagger
$$

$$
\{Q, (-1)^F\} = 0, \quad \{Q^\dagger, (-1)^F\} = 0
$$

The Hilbert space splits into even/odd fermion number sectors: $\mathcal{H} = \mathcal{H}_+ \oplus \mathcal{H}_-$ with $\dim \mathcal{H}_\pm = 128$. This is the 128|128 chiral split of A1-25 Piece 05. The supercharges map between sectors: $Q: \mathcal{H}_\pm \to \mathcal{H}_\mp$, $Q^\dagger: \mathcal{H}_\pm \to \mathcal{H}_\mp$.

The number operator $F$ commutes with the Hamiltonian: $[H, F] = 0$, since $H = \frac{1}{2}\sum d_n d_{n+1}$ is diagonal in the gap basis. The central charge $Z = 78$ from A1-24 is also diagonal and commutes with $F$. Thus $F, H, Z$ form a complete set of commuting observables on $\mathcal{H}$.

The Witten index $\Delta = \text{Tr}((-1)^F) = \dim \mathcal{H}_+ - \dim \mathcal{H}_- = 0$ for the full 256-dim space, but the topological sector (record gaps) gives $\Delta_{\text{top}} = 78$ (A1-25 Piece 04). The adjoint supercharge's action on ground states: $Q^\dagger |0\rangle = \sum_n \sqrt{d_n d_{n+1}} |1_n\rangle$ creates a fermion at each site weighted by the gap product. The 78 BPS ground states (A1-25 Piece 07) are annihilated by $Q$ and $Q^\dagger$: $Q |\text{BPS}\rangle = Q^\dagger |\text{BPS}\rangle = 0$.

**Detailed fermion number structure:**

The fermion number $F$ has eigenvalues $f = 0, 1, \dots, 255$. The vacuum $|0\rangle = |0_1 0_2 \dots 0_{255}\rangle$ has $F=0$ (all gaps below mean). The fully occupied state $|1\rangle = |1_1 1_2 \dots 1_{255}\rangle$ has $F=255$ (all gaps above mean). The grading operator gives $(-1)^F|f\rangle = (-1)^f |f\rangle$.

The chiral sectors are $\mathcal{H}_+ = \text{span}\{|f\rangle : f \text{ even}\}$ and $\mathcal{H}_- = \text{span}\{|f\rangle : f \text{ odd}\}$, each of dimension 128. The supercharges satisfy $Q \mathcal{H}_+ \subseteq \mathcal{H}_-$, $Q \mathcal{H}_- \subseteq \mathcal{H}_+$, and similarly for $Q^\dagger$. This is the hallmark of N=1 supersymmetry.

**PrimeBookOne statistics:**

For directory 0.0, the average fermion number density is $\langle F \rangle / 255 \approx 0.5$ since gaps are roughly equally distributed above/below the local mean $\log p_n$. The variance is $\text{Var}(F) \approx 255/4 = 63.75$. The record gaps (where $d_n > \langle d \rangle_n$) contribute $f_n = 1$ to $F$, giving exactly 14 sites with definite $f=1$ in the record gap basis. The 78 BPS states live in the sector with fermion number concentrated on the 78 record gap positions across all directories.

**Connection to A1-12 Proper Time Operator:**

From A1-12, the proper time operator $\hat{\tau} = \sum_n \kappa d_n |n\rangle\langle n|$ has spectral asymmetry $\text{Tr}(\text{sign}(\hat{\tau})) = 78$. The fermion number $F$ is conjugate to the spectral flow parameter: $e^{i\theta F}$ generates spectral flow, and $\text{Index}(D_\tau) = \frac{1}{2\pi} \int_0^{2\pi} d\theta \, \text{Tr}(F e^{i\theta F}) = 78$. The supercharge $Q$ is the generator of this spectral flow.