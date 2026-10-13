        @JavascriptInterface
        public void onWorldlineReflection(String data) {
            runOnUiThread(() -> Log.d("TGE_E2", "Worldline reflection: " + data));
        }

        @JavascriptInterface
        public void onPrimeGapEvent(String data) {
            runOnUiThread(() -> Log.d("TGE_E2", "Prime gap event: " + data));
        }
    }

    public static class PrimeEngine {
        private static boolean initialized = false;
        private static int primeCount = 0;
        private static List<Integer> primeGaps = new ArrayList<>();
        private static List<byte[]> primeTiles = new ArrayList<>();

        public static synchronized void initialize(Context context) {
            if (initialized) return;
            try {
