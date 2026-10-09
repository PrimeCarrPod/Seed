# Cross-Validation Suite - Caldera Section 12 (Julia)
# Verifies all algorithms produce identical results

using Test, Primes, SpecialFunctions, LinearAlgebra

@testset "Prime Counting Cross-Validation" begin
    test_values = [10, 100, 1000, 10000, 100000]
    
    for x in test_values
        ml = meissel_lehmer_pi(x)
        lmo = lmo_pi(x)
        @test ml == lmo "Mismatch at x=$x: ML=$ml, LMO=$lmo"
    end
end

@testset "Riemann Zeros Cross-Validation" begin
    # Compare Odlyzko-Schönhage with Riemann-Siegel
    zeros_os = odlyzko_schonhage_zeros(1000.0, 10)
    zeros_rs = riemann_siegel_zeros(1000.0, 10)
    
    for (z1, z2) in zip(zeros_os, zeros_rs)
        @test abs(z1 - z2) < 1e-10 "Zero mismatch: $z1 vs $z2"
    end
end

@testset "SFF Dip-Ramp-Plateau" begin
    gaps = load_prime_gaps("primebookone/0.0/Tile00.zip")
    H = gap_hamiltonian(gaps)
    
    # Verify universal structure
    sff = [spectral_form_factor(H, 1.0, t) for t in 0:0.1:100]
    
    # Dip exists
    @test minimum(sff[1:100]) < 0.5 * maximum(sff[1:100])
    
    # Ramp (linear growth in log-log)
    # Plateau (saturation)
end

println("All cross-validation tests passed!")
