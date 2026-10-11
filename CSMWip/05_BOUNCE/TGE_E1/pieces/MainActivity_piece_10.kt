    }

    override fun onDestroy() {
        super.onDestroy()
        scanHandler.removeCallbacksAndMessages(null)
        sensorManager?.unregisterListener(this)
    }

    override fun onBackPressed() {
        if (menuVisible) {
            toggleMenu()
            return
        }
        if (webView?.canGoBack() == true) webView?.goBack() else super.onBackPressed()
    }

    inner class JsBridge {
        @JavascriptInterface
        fun onReady(j: String) {
            runOnUiThread {
                Toast.makeText(this@MainActivity, "TGE E1 — Prime Electron Worldline Active", Toast.LENGTH_SHORT).show()
            }
        }

        @JavascriptInterface
        fun updateHeaderText(text: String) {
            runOnUiThread { tagTextView?.text = text }
        }

        @JavascriptInterface
        fun setTheoryMode(enabled: Boolean) {
            theoryMode = enabled
            runOnUiThread {
                val mode = if (enabled) "THEORY" else "LIVE"
                tagTextView?.text = "Prime Electron Worldline · v1.0.0-E1 · $mode"
