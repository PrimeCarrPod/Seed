
        private static int parsePrimeCount(byte[] tile) {
            return tile.length / 4;
        }

        private static List<Integer> computePrimeGaps(byte[] tile) {
            List<Integer> gaps = new ArrayList<>();
            int lastPrime = 2;
            for (int i = 0; i < tile.length; i += 4) {
                if (i + 3 < tile.length) {
                    int prime = ((tile[i] & 0xFF) << 24) |
                            ((tile[i+1] & 0xFF) << 16) |
                            ((tile[i+2] & 0xFF) << 8) |
                            (tile[i+3] & 0xFF);
                    if (prime > lastPrime) {
                        gaps.add(prime - lastPrime);
                        lastPrime = prime;
                    }
                }
            }
