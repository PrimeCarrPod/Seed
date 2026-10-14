package com.tgapp.electron;

import android.content.Context;
import android.util.Log;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

public class PrimeEngine {
    private static final String TAG = "PrimeEngine";
    private static boolean initialized = false;
    private static int primeCount = 0;
    private static final List<Integer> primeGaps = new ArrayList<>();
    private static final List<byte[]> primeTiles = new ArrayList<>();

    public static void initialize(Context context) {
        if (initialized) return;
        try {
            byte[] tile00 = readAsset(context, "Tile00.prime");
            byte[] tile01 = readAsset(context, "Tile01.prime");
            primeTiles.add(tile00);
            primeTiles.add(tile01);

            primeCount = parsePrimeCount(tile00) + parsePrimeCount(tile01);
            primeGaps.addAll(computePrimeGaps(tile00));
            primeGaps.addAll(computePrimeGaps(tile01));
            initialized = true;
            Log.d(TAG, "Initialized: " + primeCount + " primes, " + primeGaps.size() + " gaps from 2 tiles");
        } catch (Exception e) {
            Log.e(TAG, "Failed to initialize: " + e.getMessage());
            generateSyntheticPrimes();
        }
    }

    private static byte[] readAsset(Context context, String name) throws IOException {
        InputStream is = context.getAssets().open(name);
        byte[] data = new byte[is.available()];
        is.read(data);
        is.close();
        return data;
    }

    private static int parsePrimeCount(byte[] tile) {
        return tile.length / 4;
    }

    private static List<Integer> computePrimeGaps(byte[] tile) {
        List<Integer> gaps = new ArrayList<>();
        int lastPrime = 2;
        for (int i = 0; i + 3 < tile.length; i += 4) {
            int prime = ((tile[i] & 0xFF) << 24) | ((tile[i+1] & 0xFF) << 16) | ((tile[i+2] & 0xFF) << 8) | (tile[i+3] & 0xFF);
            if (prime > lastPrime) {
                gaps.add(prime - lastPrime);
                lastPrime = prime;
            }
        }
        return gaps;
    }

    private static void generateSyntheticPrimes() {
        List<Integer> primes = sieveOfEratosthenes(100000);
        primeCount = primes.size();
        int last = 2;
        for (int p : primes) {
            if (p > last) {
                primeGaps.add(p - last);
                last = p;
            }
        }
        initialized = true;
        Log.d(TAG, "Synthetic: " + primeCount + " primes, " + primeGaps.size() + " gaps");
    }

    private static List<Integer> sieveOfEratosthenes(int limit) {
        boolean[] isPrime = new boolean[limit + 1];
        java.util.Arrays.fill(isPrime, true);
        isPrime[0] = false; isPrime[1] = false;
        for (int i = 2; i * i <= limit; i++) {
            if (isPrime[i]) {
                for (int j = i * i; j <= limit; j += i) isPrime[j] = false;
            }
        }
        List<Integer> primes = new ArrayList<>();
        for (int i = 2; i <= limit; i++) if (isPrime[i]) primes.add(i);
        return primes;
    }

    public static int getPrimeCount() { return primeCount; }
    public static List<Integer> getPrimeGaps() { return primeGaps; }

    public static String getPrimeTileData() {
        List<String> tilesStr = new ArrayList<>();
        for (byte[] tile : primeTiles) {
            List<String> bytesStr = new ArrayList<>();
            for (byte b : tile) bytesStr.add(String.valueOf(b & 0xFF));
            tilesStr.add("[" + String.join(",", bytesStr) + "]");
        }
        return "[" + String.join(",", tilesStr) + "]";
    }
}
