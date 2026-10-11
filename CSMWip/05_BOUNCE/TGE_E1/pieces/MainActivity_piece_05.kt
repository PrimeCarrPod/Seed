        wv.loadUrl("file:///android_asset/tge_e1.html")
        return wv
    }

    private fun buildHeader(): LinearLayout {
        val h = LinearLayout(this)
        h.orientation = LinearLayout.VERTICAL
        h.gravity = Gravity.CENTER
        h.setPadding(dp(16), dp(44), dp(16), dp(10))
        h.setBackgroundColor(Color.argb(190, 10, 10, 15))

        val hp = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT)
        hp.gravity = Gravity.TOP or Gravity.CENTER_HORIZONTAL
        h.layoutParams = hp

        val logo = TextView(this)
        logo.text = "TGE E1"
        logo.textSize = 26f
        logo.setTextColor(Color.parseColor("#00D4AA"))
        logo.typeface = Typeface.DEFAULT_BOLD
        logo.gravity = Gravity.CENTER

        val tag = TextView(this)
        tag.text = "Prime Electron Worldline · v1.0.0-E1"
        tag.textSize = 11f
        tag.setTextColor(Color.parseColor("#E8E8F0"))
        tag.gravity = Gravity.CENTER
        tagTextView = tag

        val subtitle = TextView(this)
        subtitle.text = "Single Electron Walking Worldline → Reflections | Prime Gap Universe"
        subtitle.textSize = 9f
        subtitle.setTextColor(Color.parseColor("#8888A0"))
        subtitle.gravity = Gravity.CENTER
        subtitle.setPadding(0, dp(2), 0, 0)
