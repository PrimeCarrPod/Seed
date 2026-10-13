            for (int i = 2; i <= Math.sqrt(limit); i++) {
                if (isPrime[i]) {
                    for (int j = i * i; j <= limit; j += i) isPrime[j] = false;
                }
            }
            List<Integer> result = new ArrayList<>();
            for (int i = 2; i <= limit; i++) if (isPrime[i]) result.add(i);
            return result;
        }

        public static int getPrimeCount() {
            return primeCount;
        }

        public static List<Integer> getPrimeGaps() {
            return primeGaps;
        }

        public static String getPrimeTileData() {
            StringBuilder sb = new StringBuilder();
