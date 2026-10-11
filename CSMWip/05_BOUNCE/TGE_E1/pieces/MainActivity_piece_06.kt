
        h.addView(logo)
        h.addView(tag)
        h.addView(subtitle)
        return h
    }

    private fun buildControlBar(): FrameLayout {
        val bar = FrameLayout(this)
        bar.setBackgroundColor(Color.parseColor("#E50A0A0F"))

        val bp = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        bp.gravity = Gravity.BOTTOM
        bar.layoutParams = bp

        val row = LinearLayout(this)
        row.orientation = LinearLayout.HORIZONTAL
        row.gravity = Gravity.CENTER
        row.setPadding(0, dp(8), 0, dp(8))

        scanBtn = mkBtn("SCAN", "#00D4AA") { injectJs("TGE.onScanPressed()") }
        row.addView(scanBtn!!)

        menuBtn = mkBtn("MENU", "#F97316") { toggleMenu() }
        row.addView(menuBtn!!)

        theoryBtn = mkBtn("THEORY", "#4488FF") { toggleTheory() }
        row.addView(theoryBtn!!)

        fleetBtn = mkBtn("FLEET", "#A855F7") { injectJs("TGE.toggleFleet()") }
        row.addView(fleetBtn!!)

        cleanBtn = mkBtn("CLEAN", "#FF6600") {
            cleanMode = !cleanMode
            cleanBtn?.text = if (cleanMode) "SHOW" else "CLEAN"
