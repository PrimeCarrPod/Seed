            primeTiles.add(tile01)

            primeCount = parsePrimeCount(tile00) + parsePrimeCount(tile01)
            primeGaps = computePrimeGaps(tile00) + computePrimeGaps(tile01)
            initialized = true
            Log.d("PrimeEngine", "Initialized: $primeCount primes, ${primeGaps.size} gaps from 2 tiles")
        } catch (e: Exception) {
            Log.e("PrimeEngine", "Failed to initialize: ${e.message}")
            generateSyntheticPrimes()
        }
    }

    private fun parsePrimeCount(tile: ByteArray): Int {
        return tile.size / 4
    }

    private fun computePrimeGaps(tile: ByteArray): List<Int> {
        val gaps = mutableListOf<Int>()
        var lastPrime = 2
        for (i in 0 until tile.size step 4) {
            if (i + 3 < tile.size) {
                val prime = ((tile[i] and 0xFF) shl 24) or
                    ((tile[i+1] and 0xFF) shl 16) or
                    ((tile[i+2] and 0xFF) shl 8) or
                    (tile[i+3] and 0xFF)
                if (prime > lastPrime) {
                    gaps.add(prime - lastPrime)
                    lastPrime = prime
                }
            }
        }
        return gaps
    }

    private fun generateSyntheticPrimes() {
