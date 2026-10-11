        val primes = sieveOfEratosthenes(100000)
        primeCount = primes.size
        var last = 2
        for (p in primes) {
            if (p > last) {
                primeGaps.add(p - last)
                last = p
            }
        }
        initialized = true
        Log.d("PrimeEngine", "Synthetic: $primeCount primes, ${primeGaps.size} gaps")
    }

    private fun sieveOfEratosthenes(limit: Int): List<Int> {
        val isPrime = BooleanArray(limit + 1) { true }
        isPrime[0] = false; isPrime[1] = false
        for (i in 2..Math.sqrt(limit.toDouble()).toInt()) {
            if (isPrime[i]) {
                for (j in (i * i)..limit step i) isPrime[j] = false
            }
        }
        return (2..limit).filter { isPrime[it] }
    }

    fun getPrimeCount(): Int = primeCount
    fun getPrimeGaps(): List<Int> = primeGaps
    fun getPrimeTileData(): String {
        return primeTiles.joinToString(",") { "\"${it.joinToString(",") { b -> b.toInt().toString() }}\"" }
    }
}