package com.bounce.tgapp

import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import android.graphics.Color
import android.graphics.Typeface
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.WindowInsets
import android.webkit.JavascriptInterface
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Button
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView

class MainActivity : Activity() {

    private var webView: WebView? = null
    private var headerOverlay: LinearLayout? = null
    private var controlBar: FrameLayout? = null
    private var tagTextView: TextView? = null
    private var cleanBtn: Button? = null
    private var cleanMode = false
    private var theoryMode = false
    private var prefs: SharedPreferences? = null
    private var latestVersion: String? = null

    private val scanHandler = Handler(Looper.getMainLooper())
    private var scanCount = 0

    private inner class InsetFrameLayout(context: Context) : FrameLayout(context) {
        override fun onApplyWindowInsets(insets: WindowInsets): WindowInsets {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                val sbh = insets.getInsets(WindowInsets.Type.statusBars()).top
                webView?.post { injectJs("UI.setInsets($sbh,0)") }
            }
            return super.onApplyWindowInsets(insets)
        }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupFullscreen()

        val root = InsetFrameLayout(this)
        root.setBackgroundColor(Color.parseColor("#0A0A0F"))

        webView = buildWebView()
        root.addView(webView!!)

        headerOverlay = buildHeader()
        root.addView(headerOverlay!!)

        controlBar = buildControlBar()
        root.addView(controlBar!!)

        setContentView(root)

        prefs = getSharedPreferences("TGAppPrefs", MODE_PRIVATE)
    }

    private fun setupFullscreen() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false)
        } else {
            val flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
            val flags2 = flags.or(View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
            val flags3 = flags2.or(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
            val flags4 = flags3.or(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION)
            val flags5 = flags4.or(View.SYSTEM_UI_FLAG_FULLSCREEN)
            val flags6 = flags5.or(View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
            window.decorView.systemUiVisibility = flags6
        }
    }

    private fun buildWebView(): WebView {
        val wv = WebView(this)
        wv.layoutParams = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        wv.setLayerType(View.LAYER_TYPE_HARDWARE, null)

        val s = wv.settings
        s.javaScriptEnabled = true
        s.domStorageEnabled = true
        s.setAllowFileAccess(true)
        s.setAllowFileAccessFromFileURLs(true)
        s.setAllowUniversalAccessFromFileURLs(true)
        s.mediaPlaybackRequiresUserGesture = false

        wv.webChromeClient = WebChromeClient()
        wv.webViewClient = object : WebViewClient() {
            override fun onPageFinished(v: WebView, u: String) {
                v.postDelayed({
                    v.evaluateJavascript("androidBridge('onReady',{loaded:true})", null)
                    v.evaluateJavascript("UI.setInsets(40,34)", null)
                }, 500)
            }
        }
        wv.addJavascriptInterface(JsBridge(), "TGAppBridge")
        wv.loadUrl("file:///android_asset/tgapp.html")
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
        logo.text = "TGAPP"
        logo.textSize = 26f
        logo.setTextColor(Color.parseColor("#00D4AA"))
        logo.typeface = Typeface.DEFAULT_BOLD
        logo.gravity = Gravity.CENTER

        val tag = TextView(this)
        tag.text = "Skeleton · v1.0.0"
        tag.textSize = 11f
        tag.setTextColor(Color.parseColor("#E8E8F0"))
        tag.gravity = Gravity.CENTER
        tagTextView = tag

        h.addView(logo)
        h.addView(tag)
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

        // Menu buttons - empty handlers, just UI placeholders
        row.addView(mkBtn("SCAN", "#00FF88") { injectJs("TGApp.onScanPressed()") })
        row.addView(mkBtn("MENU", "#f97316") { injectJs("TGApp.toggleMenu()") })
        row.addView(mkBtn("THEORY", "#4488FF") { injectJs("TGApp.toggleTheory()") })
        row.addView(mkBtn("FLEET", "#a855f7") { injectJs("TGApp.toggleFleet()") })

        cleanBtn = mkBtn("CLEAN", "#FF6600") {
            cleanMode = !cleanMode
            cleanBtn?.text = if (cleanMode) "SHOW" else "CLEAN"
            cleanBtn?.setTextColor(Color.parseColor(if (cleanMode) "#FF4466" else "#FF6600"))
            headerOverlay?.visibility = if (cleanMode) View.GONE else View.VISIBLE
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

    private fun injectJs(s: String) {
        try {
            webView?.evaluateJavascript(s, null)
        } catch (e: Exception) {
            Log.w("TGApp", "injectJs failed: ${e.message}")
        }
    }

    private fun dp(px: Int): Int {
        return (px * resources.displayMetrics.density).toInt()
    }

    override fun onDestroy() {
        super.onDestroy()
    }

    inner class JsBridge {
        @JavascriptInterface
        fun onReady(j: String) {
            runOnUiThread {
                // Skeleton ready - no toast
            }
        }

        @JavascriptInterface
        fun updateHeaderText(text: String) {
            runOnUiThread {
                tagTextView?.text = text
            }
        }

        @JavascriptInterface
        fun setTheoryMode(enabled: Boolean) {
            theoryMode = enabled
            runOnUiThread {
                val mode = if (enabled) "THEORY" else "LIVE"
                tagTextView?.text = "Skeleton · v1.0.0 · $mode"
            }
        }

        @JavascriptInterface
        fun checkUpdate() {
            // No-op in skeleton
        }

        @JavascriptInterface
        fun startUpdate(ver: String) {
            latestVersion = ver
        }

        @JavascriptInterface
        fun onUpdateSelected(action: String) {
            // No-op
        }
    }
}