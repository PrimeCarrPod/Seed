package com.bounce.tgapp

import android.annotation.SuppressLint
import android.content.BroadcastReceiver
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ActivityInfo
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import android.webkit.CookieManager
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import androidx.appcompat.app.AppCompatActivity
import kotlinx.coroutines.CoroutineScope
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.launch

class MainActivity : AppCompatActivity() {

    private var backgroundWebView: WebView? = null
    private var overlayWebView: WebView? = null
    private val licenseReceiver = LicenseBroadcastReceiver()

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupFullscreen()
        setContentView(R.layout.activity_main)

        buildDualWebView()
        loadContent()
        registerLicenseReceiver()
    }

    private fun setupFullscreen() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false)
        } else {
            window.decorView.systemUiVisibility = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    or View.SYSTEM_UI_FLAG_FULLSCREEN
                    or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
        }
        requestedOrientation = ActivityInfo.SCREEN_ORIENTATION_PORTRAIT
    }

    @SuppressLint("SetJavaScriptEnabled", "AddJavascriptInterface")
    private fun buildDualWebView() {
        val container = findViewById<View>(R.id.webview_container)

        backgroundWebView = WebView(this).apply {
            id = View.generateViewId()
            layoutParams = android.view.ViewGroup.LayoutParams(
                android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                android.view.ViewGroup.LayoutParams.MATCH_PARENT
            )
            setupWebViewSettings(this)
            webViewClient = BackgroundWebViewClient()
            webChromeClient = WebChromeClient()
        }

        overlayWebView = WebView(this).apply {
            id = View.generateViewId()
            layoutParams = android.view.ViewGroup.LayoutParams(
                android.view.ViewGroup.LayoutParams.MATCH_PARENT,
                android.view.ViewGroup.LayoutParams.MATCH_PARENT
            )
            setBackgroundColor(0x00000000)
            setupWebViewSettings(this)
            webViewClient = OverlayWebViewClient()
            webChromeClient = WebChromeClient()
            addJavascriptInterface(OverlayBridge(this@MainActivity), "TGAppBridge")
        }

        (container as android.view.ViewGroup).addView(backgroundWebView!!)
        (container as android.view.ViewGroup).addView(overlayWebView!!)
    }

    private fun setupWebViewSettings(webView: WebView) {
        val settings = webView.settings
        settings.javaScriptEnabled = true
        settings.domStorageEnabled = true
        settings.databaseEnabled = true
        settings.setAppCacheEnabled(true)
        settings.cacheMode = WebSettings.LOAD_DEFAULT
        settings.mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW
        settings.setSupportZoom(true)
        settings.builtInZoomControls = false
        settings.displayZoomControls = false
        settings.loadWithOverviewMode = true
        settings.useWideViewPort = true

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            settings.mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW
        }

        CookieManager.getInstance().setAcceptThirdPartyCookies(webView, true)
    }

    private fun loadContent() {
        backgroundWebView?.loadUrl("https://www.antikytherian.com")
        overlayWebView?.loadUrl("file:///android_asset/tgapp.html")
    }

    private fun injectJs(script: String) {
        overlayWebView?.evaluateJavascript(script, null)
    }

    fun updateLicenseStatus(isPro: Boolean) {
        val js = "javascript:onLicenseStatus(${if (isPro) "true" else "false"})"
        injectJs(js)
    }

    private fun registerLicenseReceiver() {
        val filter = IntentFilter("LICENSE_UPDATED")
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(licenseReceiver, filter, RECEIVER_NOT_EXPORTED)
        } else {
            registerReceiver(licenseReceiver, filter)
        }
    }

    override fun onDestroy() {
        unregisterReceiver(licenseReceiver)
        backgroundWebView?.destroy()
        overlayWebView?.destroy()
        super.onDestroy()
    }

    override fun onConfigurationChanged(newConfig: android.content.res.Configuration) {
        super.onConfigurationChanged(newConfig)
        setupFullscreen()
    }

    inner class BackgroundWebViewClient : WebViewClient() {
        override fun shouldOverrideUrlLoading(view: WebView?, request: android.webkit.WebResourceRequest?): Boolean {
            return false
        }
    }

    inner class OverlayWebViewClient : WebViewClient() {
        override fun shouldOverrideUrlLoading(view: WebView?, request: android.webkit.WebResourceRequest?): Boolean {
            val url = request?.url?.toString() ?: return false
            if (url.startsWith("http")) {
                intent = Intent(Intent.ACTION_VIEW, Uri.parse(url))
                startActivity(intent)
                return true
            }
            return false
        }

        override fun onPageFinished(view: WebView?, url: String?) {
            super.onPageFinished(view, url)
            val featureGate = FeatureGate(this@MainActivity)
            updateLicenseStatus(featureGate.isProEnabled())
        }
    }

    inner class OverlayBridge(private val activity: MainActivity) {
        @android.webkit.JavascriptInterface
        fun getLicenseStatus(): String {
            val featureGate = FeatureGate(activity)
            return if (featureGate.isProEnabled()) "pro" else "free"
        }

        @android.webkit.JavascriptInterface
        fun openBilling() {
            activity.runOnUiThread {
                val intent = Intent(activity, BillingActivity::class.java)
                activity.startActivity(intent)
            }
        }
    }
}

class LicenseBroadcastReceiver : BroadcastReceiver() {
    override fun onReceive(context: Context?, intent: Intent?) {
        if (intent?.action == "LICENSE_UPDATED") {
            (context as? MainActivity)?.runOnUiThread {
                val featureGate = FeatureGate(context!!)
                (context as MainActivity).updateLicenseStatus(featureGate.isProEnabled())
            }
        }
    }
}