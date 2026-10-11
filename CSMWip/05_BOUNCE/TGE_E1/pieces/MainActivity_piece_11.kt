            }
        }

        @JavascriptInterface
        fun onWorldlineReflection(data: String) {
            runOnUiThread {
                Log.d("TGE_E1", "Worldline reflection: $data")
            }
        }

        @JavascriptInterface
        fun onPrimeGapEvent(data: String) {
            runOnUiThread {
                Log.d("TGE_E1", "Prime gap event: $data")
            }
        }
    }

    companion object {
        const val TAG = "TGE_E1"
    }
}

object PrimeEngine {
    private var initialized = false
    private var primeCount = 0
    private var primeGaps = mutableListOf<Int>()
    private var primeTiles = mutableListOf<ByteArray>()

    fun initialize(context: Context) {
        if (initialized) return
        try {
            val tile00 = context.assets.open("Tile00.prime").readBytes()
            val tile01 = context.assets.open("Tile01.prime").readBytes()
            primeTiles.add(tile00)
