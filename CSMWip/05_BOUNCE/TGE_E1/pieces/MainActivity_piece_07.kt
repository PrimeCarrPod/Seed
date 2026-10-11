            cleanBtn?.setTextColor(Color.parseColor(if (cleanMode) "#FF4466" else "#FF6600"))
            headerOverlay?.visibility = if (cleanMode) View.GONE else View.VISIBLE
            saveState()
        }
        row.addView(cleanBtn!!)

        bar.addView(row)
        return bar
    }

    private fun mkBtn(text: String, color: String, listener: View.OnClickListener): Button {
        val b = Button(this)
        b.text = text
        b.textSize = 10f
        b.setTextColor(Color.parseColor(color))
        b.setBackgroundColor(Color.parseColor("#1A1A2E"))
        b.setPadding(dp(8), dp(8), dp(8), dp(8))
        b.layoutParams = LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f)
        b.setOnClickListener(listener)
        return b
    }

    private fun toggleMenu() {
        menuVisible = !menuVisible
        menuBtn?.text = if (menuVisible) "CLOSE" else "MENU"
        menuBtn?.setTextColor(Color.parseColor(if (menuVisible) "#10B981" else "#F97316"))
        injectJs("TGE.toggleMenu($menuVisible)")
    }

    private fun toggleTheory() {
        theoryMode = !theoryMode
        theoryBtn?.text = if (theoryMode) "LIVE" else "THEORY"
        theoryBtn?.setTextColor(Color.parseColor(if (theoryMode) "#10B981" else "#4488FF"))
        injectJs("TGE.setTheoryMode($theoryMode)")
        tagTextView?.text = "Prime Electron Worldline · v1.0.0-E1 · ${if (theoryMode) "THEORY" else "LIVE"}"
