            return gaps;
        }

        private static void generateSyntheticPrimes() {
            List<Integer> primes = sieveOfEratosthenes(1000000);
            primeCount = primes.size();
            int last = 2;
            for (int p : primes) {
                if (p > last) {
                    primeGaps.add(p - last);
                    last = p;
                }
            }
            initialized = true;
            Log.d("PrimeEngine", "Synthetic: " + primeCount + " primes, " + primeGaps.size() + " gaps");
        }

        private static List<Integer> sieveOfEratosthenes(int limit) {
            boolean[] isPrime = new boolean[limit + 1];
            for (int i = 2; i <= limit; i++) isPrime[i] = true;
