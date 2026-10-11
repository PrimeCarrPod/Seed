package com.tge.e1

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.SharedPreferences
import android.graphics.Color
import android.graphics.Typeface
import android.hardware.Sensor
import android.hardware.SensorEvent
import android.hardware.SensorEventListener
import android.hardware.SensorManager
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.util.Log
import android.view.Gravity
import android.view.View
import android.view.ViewGroup
import android.view.Window
import android.view.WindowInsets
import android.view.WindowManager
import android.webkit.JavascriptInterface
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.Button
import android.widget.FrameLayout
import android.widget.LinearLayout
import android.widget.TextView
import android.widget.Toast
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

@SuppressLint("SetJavaScriptEnabled")
class MainActivity : Activity(), SensorEventListener {

    private var webView: WebView? = null
    private var headerOverlay: LinearLayout? = null
    private var controlBar: FrameLayout? = null
    private var tagTextView: TextView? = null
    private var cleanBtn: Button? = null
    private var menuBtn: Button? = null
    private var theoryBtn: Button? = null
    private var fleetBtn: Button? = null
    private var scanBtn: Button? = null
    private var cleanMode = false
    private var theoryMode = false
    private var menuVisible = false
    private var prefs: SharedPreferences? = null

    private val sensorManager: SensorManager? = null
    private var accelerometer: Sensor? = null
    private var gyroscope: Sensor? = null

    private val scanHandler = Handler(Looper.getMainLooper())
    private var scanCount = 0

    private inner class InsetFrameLayout(context: Context) : FrameLayout(context) {
        override fun onApplyWindowInsets(insets: WindowInsets): WindowInsets {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                val sbh = insets.getInsets(WindowInsets.Type.statusBars()).top
                webView?.post { injectJs("TGE.setInsets($sbh,0)") }
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

        prefs = getSharedPreferences("TGE_E1_Prefs", MODE_PRIVATE)
        restoreState()

        initializePrimeEngine()
        startWorldlineSimulation()
    }

    private fun setupFullscreen() {
        requestWindowFeature(Window.FEATURE_NO_TITLE)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false)
            window.insetsController?.hide(WindowInsets.Type.statusBars())
            window.insetsController?.hide(WindowInsets.Type.navigationBars())
        } else {
            val flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                .or(View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
                .or(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
                .or(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION)
                .or(View.SYSTEM_UI_FLAG_FULLSCREEN)
                .or(View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
            window.decorView.systemUiVisibility = flags
        }
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
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
        s.mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW

        wv.webChromeClient = WebChromeClient()
        wv.webViewClient = object : WebViewClient() {
            override fun onPageFinished(v: WebView, u: String) {
                v.postDelayed({
                    v.evaluateJavascript("TGEBridge.onReady({loaded:true})", null)
                    v.evaluateJavascript("TGE.setInsets(40,34)", null)
                    injectJs("PrimeEngine.init(${PrimeEngine.getPrimeTileData()})")
                    injectJs("WorldlineRenderer.init()")
                }, 500)
            }
        }
        wv.addJavascriptInterface(JsBridge(), "TGEBridge")
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
            runOnUiThread {
                tagTextView?.text = "Prime Electron Worldline · v1.0.0-E1 · ${PrimeEngine.getPrimeCount()} primes loaded"
            }
        }
    }

    private fun startWorldlineSimulation() {
        scanHandler.postDelayed(object : Runnable {
            override fun run() {
                injectJs("WorldlineRenderer.step()")
                scanHandler.postDelayed(this, 16)
            }
        }, 16)
    }

    override fun onSensorChanged(event: SensorEvent) {
        val v = event.values
        if (event.sensor.type == Sensor.TYPE_ACCELEROMETER) {
            injectJs("WorldlineRenderer.updateMotion(${v[0]},${v[1]},${v[2]},WorldlineRenderer.gx,WorldlineRenderer.gy,WorldlineRenderer.gz)")
        } else if (event.sensor.type == Sensor.TYPE_GYROSCOPE) {
            injectJs("WorldlineRenderer.updateMotion(WorldlineRenderer.ax,WorldlineRenderer.ay,WorldlineRenderer.az,${v[0]},${v[1]},${v[2]})")
        }
    }

    override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {}

    override fun onResume() {
        super.onResume()
        if (accelerometer != null) sensorManager?.registerListener(this, accelerometer, SensorManager.SENSOR_DELAY_GAME)
        if (gyroscope != null) sensorManager?.registerListener(this, gyroscope, SensorManager.SENSOR_DELAY_GAME)
    }

    override fun onPause() {
        super.onPause()
        sensorManager?.unregisterListener(this)
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
            primeTiles.add(tile01)

            primeCount = parsePrimeCount(tile00) + parsePrimeCount(tile01)
            primeGaps = computePrimeGaps(tile00) + computePrimeGaps(tile01)
            initialized = true
            Log.d("PrimeEngine", "Initialized: $primeCount primes, ${primeGaps.size} gaps from 2 tiles")
        } catch (e: Exception) {
            Log.e("PrimeEngine", "Failed to initialize: ${e.message}")
            generateSyntheticPrimes()
        }
    }

    private fun parsePrimeCount(tile: ByteArray): Int {
        return tile.size / 4
    }

    private fun computePrimeGaps(tile: ByteArray): List<Int> {
        val gaps = mutableListOf<Int>()
        var lastPrime = 2
        for (i in 0 until tile.size step 4) {
            if (i + 3 < tile.size) {
                val prime = ((tile[i] and 0xFF) shl 24) or
                    ((tile[i+1] and 0xFF) shl 16) or
                    ((tile[i+2] and 0xFF) shl 8) or
                    (tile[i+3] and 0xFF)
                if (prime > lastPrime) {
                    gaps.add(prime - lastPrime)
                    lastPrime = prime
                }
            }
        }
        return gaps
    }

    private fun generateSyntheticPrimes() {
        val primes = sieveOfEratosthenes(100000)
        primeCount = primes.size
        var last = 2
        for (p in primes) {
            if (p > last) {
                primeGaps.add(p - last)
                last = p
            }
        }
        initialized = true
        Log.d("PrimeEngine", "Synthetic: $primeCount primes, ${primeGaps.size} gaps")
    }

    private fun sieveOfEratosthenes(limit: Int): List<Int> {
        val isPrime = BooleanArray(limit + 1) { true }
        isPrime[0] = false; isPrime[1] = false
        for (i in 2..Math.sqrt(limit.toDouble()).toInt()) {
            if (isPrime[i]) {
                for (j in (i * i)..limit step i) isPrime[j] = false
            }
        }
        return (2..limit).filter { isPrime[it] }
    }

    fun getPrimeCount(): Int = primeCount
    fun getPrimeGaps(): List<Int> = primeGaps
    fun getPrimeTileData(): String {
        return primeTiles.joinToString(",") { "\"${it.joinToString(",") { b -> b.toInt().toString() }}\"" }
    }
}