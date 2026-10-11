                if (tile02.length > 0) primeGaps.addAll(computePrimeGaps(tile02));
                if (tile03.length > 0) primeGaps.addAll(computePrimeGaps(tile03));

                initialized = true;
                Log.d("PrimeEngine", "Initialized: " + primeCount + " primes, " + primeGaps.size() + " gaps from " + primeTiles.size() + " tiles");
            } catch (Exception e) {
                Log.e("PrimeEngine", "Failed to initialize: " + e.getMessage());
                generateSyntheticPrimes();
            }
        }

        private static byte[] readAllBytes(InputStream is) throws IOException {
            byte[] buffer = new byte[8192];
            int bytesRead;
            java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
            while ((bytesRead = is.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
            return output.toByteArray();
        }
