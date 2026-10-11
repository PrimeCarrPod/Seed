        saveState()
    }

    private fun injectJs(s: String) {
        try {
            webView?.evaluateJavascript(s, null)
        } catch (e: Exception) {
            Log.w("TGE_E1", "injectJs failed: ${e.message}")
        }
    }

    private fun dp(px: Int): Int {
        return (px * resources.displayMetrics.density).toInt()
    }

    private fun restoreState() {
        cleanMode = prefs?.getBoolean("cleanMode", false) ?: false
        theoryMode = prefs?.getBoolean("theoryMode", false) ?: false
        cleanBtn?.text = if (cleanMode) "SHOW" else "CLEAN"
        cleanBtn?.setTextColor(Color.parseColor(if (cleanMode) "#FF4466" else "#FF6600"))
        headerOverlay?.visibility = if (cleanMode) View.GONE else View.VISIBLE
        theoryBtn?.text = if (theoryMode) "LIVE" else "THEORY"
        theoryBtn?.setTextColor(Color.parseColor(if (theoryMode) "#10B981" else "#4488FF"))
    }

    private fun saveState() {
        prefs?.edit()
            ?.putBoolean("cleanMode", cleanMode)
            ?.putBoolean("theoryMode", theoryMode)
            ?.apply()
    }

    private fun initializePrimeEngine() {
        CoroutineScope(Dispatchers.IO).launch {
            PrimeEngine.initialize(this@MainActivity)
