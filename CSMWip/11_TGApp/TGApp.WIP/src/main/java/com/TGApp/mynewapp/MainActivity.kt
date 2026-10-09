package com.TGApp.mynewapp

import android.annotation.SuppressLint
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.IntentFilter
import android.content.pm.ActivityInfo
import android.content.res.Configuration
import android.net.ConnectivityManager
import android.net.NetworkCapabilities
import android.os.Build
import android.os.Bundle
import android.util.Log
import android.view.View
import android.view.Window
import android.view.WindowManager
import android.webkit.CookieManager
import android.webkit.WebChromeClient
import android.webkit.WebSettings
import android.webkit.WebView
import android.webkit.WebViewClient
import android.widget.FrameLayout

@SuppressLint("SetJavaScriptEnabled")
class MainActivity : Activity() {

    private lateinit var backgroundWebView: WebView
    private lateinit var overlayWebView: WebView
    private lateinit var rootLayout: FrameLayout
    private val licenseReceiver = LicenseBroadcastReceiver()
    private var isNetworkAvailable = false

    companion object {
        private const val TAG = "TGApp_MainActivity"
        private const val ANTIKYTHERA_URL = "https://www.antikytherian.com"
        private const val OVERLAY_URL = "https://www.tghc.pro"
        private const val FALLBACK_URL = "https://www.google.com"
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        
        // Fullscreen immersive mode
        setupFullscreen()
        setContentView(R.layout.activity_main)
        
        // Initialize views
        rootLayout = findViewById(R.id.root_layout)
        backgroundWebView = findViewById(R.id.background_webview)
        overlayWebView = findViewById(R.id.overlay_webview)
        
        // Check network
        isNetworkAvailable = checkNetworkConnection()
        
        // Configure WebViews
        configureBackgroundWebView()
        configureOverlayWebView()
        
        // Load URLs
        loadBackgroundAnimation()
        loadOverlayContent()
        
        // Register license broadcast receiver
        registerLicenseReceiver()
        
        Log.d(TAG, "TGApp MainActivity created - Antikythera background + TGHC overlay")
    }

    private fun setupFullscreen() {
        requestWindowFeature(Window.FEATURE_NO_TITLE)
        window.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        )
        window.setFlags(
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS
        )
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
        
        // Hide system bars (API 19+)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            window.decorView.systemUiVisibility = (View.SYSTEM_UI_FLAG_LAYOUT_STABLE or View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION or View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN or View.SYSTEM_UI_FLAG_HIDE_NAVIGATION or View.SYSTEM_UI_FLAG_FULLSCREEN or View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
        }
    }

    private fun checkNetworkConnection(): Boolean {
        val cm = getSystemService(Context.CONNECTIVITY_SERVICE) as ConnectivityManager
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            val network = cm.activeNetwork ?: return false
            val capabilities = cm.getNetworkCapabilities(network) ?: return false
            return capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) &&
                   capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED)
        }
        return cm.activeNetworkInfo?.isConnected == true
    }

    private fun configureBackgroundWebView() {
        val settings = backgroundWebView.settings
        settings.javaScriptEnabled = true
        settings.domStorageEnabled = true
        settings.databaseEnabled = true
        settings.cacheMode = WebSettings.LOAD_DEFAULT
        settings.allowFileAccess = false
        settings.allowContentAccess = false
        settings.mediaPlaybackRequiresUserGesture = false
        settings.loadsImagesAutomatically = true
        settings.setSupportZoom(false)
        settings.builtInZoomControls = false
        settings.displayZoomControls = false
        settings.useWideViewPort = true
        settings.loadWithOverviewMode = true
        settings.layoutAlgorithm = WebSettings.LayoutAlgorithm.NORMAL
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            settings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.TEXT_AUTOSIZING)
        }
        
        backgroundWebView.webChromeClient = object : WebChromeClient() {
            override fun onProgressChanged(view: WebView?, newProgress: Int) {
                if (newProgress == 100) {
                    Log.d(TAG, "Antikythera animation loaded completely")
                }
            }
        }
        
        backgroundWebView.webViewClient = object : WebViewClient() {
            override fun onReceivedError(view: WebView?, request: android.webkit.WebResourceRequest?, error: android.webkit.WebResourceError?) {
                Log.e(TAG, "Background WebView error: ${error?.description}")
                if (view?.url?.contains("antikytherian") == true) {
                    Log.w(TAG, "Falling back to local animation or alternative")
                }
            }
            
            override fun shouldOverrideUrlLoading(view: WebView?, request: android.webkit.WebResourceRequest?): Boolean {
                return false
            }
        }
        
        backgroundWebView.setLayerType(View.LAYER_TYPE_HARDWARE, null)
    }

    private fun configureOverlayWebView() {
        val settings = overlayWebView.settings
        settings.javaScriptEnabled = true
        settings.domStorageEnabled = true
        settings.databaseEnabled = true
        settings.cacheMode = WebSettings.LOAD_DEFAULT
        settings.allowFileAccess = false
        settings.allowContentAccess = false
        settings.mediaPlaybackRequiresUserGesture = false
        settings.loadsImagesAutomatically = true
        settings.setSupportZoom(false)
        settings.builtInZoomControls = false
        settings.displayZoomControls = false
        settings.useWideViewPort = true
        settings.loadWithOverviewMode = true
        
        overlayWebView.setBackgroundColor(0x00000000)
        overlayWebView.setLayerType(View.LAYER_TYPE_HARDWARE, null)
        
        overlayWebView.webChromeClient = object : WebChromeClient() {
            override fun onProgressChanged(view: WebView?, newProgress: Int) {
                if (newProgress == 100) {
                    Log.d(TAG, "Overlay content loaded completely")
                }
            }
        }
        
        overlayWebView.webViewClient = object : WebViewClient() {
            override fun shouldOverrideUrlLoading(view: WebView?, request: android.webkit.WebResourceRequest?): Boolean {
                return false
            }
        }
        
        CookieManager.getInstance().setAcceptThirdPartyCookies(overlayWebView, true)
    }

    private fun loadBackgroundAnimation() {
        val url = if (isNetworkAvailable) ANTIKYTHERA_URL else FALLBACK_URL
        Log.d(TAG, "Loading background animation from: $url")
        backgroundWebView.loadUrl(url)
    }

    private fun loadOverlayContent() {
        val url = if (isNetworkAvailable) OVERLAY_URL else FALLBACK_URL
        Log.d(TAG, "Loading overlay from: $url")
        overlayWebView.loadUrl(url)
    }

    private fun registerLicenseReceiver() {
        val filter = IntentFilter("LICENSE_UPDATED")
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(licenseReceiver, filter, Context.RECEIVER_NOT_EXPORTED)
        } else {
            registerReceiver(licenseReceiver, filter)
        }
        Log.d(TAG, "License broadcast receiver registered")
    }

    override fun onConfigurationChanged(newConfig: Configuration) {
        super.onConfigurationChanged(newConfig)
        adjustWebViewsForOrientation(newConfig.orientation)
        Log.d(TAG, "Configuration changed: orientation=${newConfig.orientation}")
    }

    private fun adjustWebViewsForOrientation(orientation: Int) {
        rootLayout.requestLayout()
        
        val params = FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        )
        backgroundWebView.layoutParams = params
        overlayWebView.layoutParams = params
    }

    override fun onWindowFocusChanged(hasFocus: Boolean) {
        super.onWindowFocusChanged(hasFocus)
        if (hasFocus) {
            setupFullscreen()
        }
    }

    override fun onResume() {
        super.onResume()
        backgroundWebView.onResume()
        overlayWebView.onResume()
        isNetworkAvailable = checkNetworkConnection()
        if (!isNetworkAvailable) {
            Log.w(TAG, "Network unavailable on resume - content may be stale")
        }
    }

    override fun onPause() {
        super.onPause()
        backgroundWebView.onPause()
        overlayWebView.onPause()
    }

    override fun onDestroy() {
        super.onDestroy()
        try {
            unregisterReceiver(licenseReceiver)
        } catch (e: IllegalArgumentException) {
            // Receiver not registered
        }
        backgroundWebView.destroy()
        overlayWebView.destroy()
        Log.d(TAG, "TGApp MainActivity destroyed")
    }

    override fun onBackPressed() {
        if (backgroundWebView.canGoBack()) {
            backgroundWebView.goBack()
        } else if (overlayWebView.canGoBack()) {
            overlayWebView.goBack()
        } else {
            super.onBackPressed()
        }
    }

    private inner class LicenseBroadcastReceiver : android.content.BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action == "LICENSE_UPDATED") {
                Log.d(TAG, "Received LICENSE_UPDATED broadcast - Pro features may be unlocked")
            }
        }
    }
}