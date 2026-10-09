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
import android.widget.Toast
import com.android.billingclient.api.BillingClient
import com.android.billingclient.api.BillingClientStateListener
import com.android.billingclient.api.BillingFlowParams
import com.android.billingclient.api.BillingResult
import com.android.billingclient.api.Purchase
import com.android.billingclient.api.PurchasesUpdatedListener
import com.android.billingclient.api.QueryProductDetailsParams
import com.google.firebase.functions.FirebaseFunctions
import com.google.firebase.functions.HttpsCallableResult

@SuppressLint("SetJavaScriptEnabled")
class MainActivity : Activity(), PurchasesUpdatedListener {

    private lateinit var backgroundWebView: WebView
    private lateinit var overlayWebView: WebView
    private lateinit var rootLayout: FrameLayout
    private val licenseReceiver = LicenseBroadcastReceiver()
    private var isNetworkAvailable = false
    
    // Billing
    private lateinit var billingClient: BillingClient
    private var billingReady = false
    private val featureGate = FeatureGate(this)

    companion object {
        private const val TAG = "TGApp_MainActivity"
        private const val ANTIKYTHERA_URL = "https://www.antikytherian.com"
        private const val OVERLAY_URL = "https://www.tghc.pro"
        private const val FALLBACK_URL = "https://www.google.com"
        
        // Product IDs (configure in Play Console)
        private const val PRODUCT_PRO_YEARLY = "pro_yearly_499"
        private const val PRODUCT_PRO_MONTHLY = "pro_monthly_499"
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
        
        // Initialize Billing
        initializeBilling()
        
        // Check license on startup
        checkLicenseStatus()
        
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

    // ========== BILLING ==========
    
    private fun initializeBilling() {
        billingClient = BillingClient.newBuilder(this)
            .setListener(this)
            .enablePendingPurchases()
            .build()
        
        billingClient.startConnection(object : BillingClientStateListener {
            override fun onBillingSetupFinished(billingResult: BillingResult) {
                if (billingResult.responseCode == BillingClient.BillingResponseCode.OK) {
                    billingReady = true
                    Log.d(TAG, "Billing client ready")
                    queryProductDetails()
                } else {
                    Log.e(TAG, "Billing setup failed: ${billingResult.debugMessage}")
                }
            }
            
            override fun onBillingServiceDisconnected() {
                billingReady = false
                Log.w(TAG, "Billing service disconnected - retrying")
                initializeBilling()
            }
        })
    }

    private fun queryProductDetails() {
        val params = QueryProductDetailsParams.newBuilder()
            .setProductList(
                QueryProductDetailsParams.ProductList.newBuilder()
                    .setProductType(BillingClient.ProductType.SUBS)
                    .setProductIds(listOf(PRODUCT_PRO_YEARLY, PRODUCT_PRO_MONTHLY))
                    .build()
            )
            .build()
        
        billingClient.queryProductDetailsAsync(params) { billingResult, productDetailsList ->
            if (billingResult.responseCode == BillingClient.BillingResponseCode.OK) {
                productDetailsList?.forEach { product ->
                    Log.d(TAG, "Product: ${product.productId} - ${product.name} - ${product.oneTimePurchaseOfferDetails?.priceAmountMicros}")
                }
            } else {
                Log.e(TAG, "Query products failed: ${billingResult.debugMessage}")
            }
        }
    }

    fun launchProPurchase(yearly: Boolean = true) {
        if (!billingReady) {
            Toast.makeText(this, "Billing not ready", Toast.LENGTH_SHORT).show()
            return
        }
        
        val productId = if (yearly) PRODUCT_PRO_YEARLY else PRODUCT_PRO_MONTHLY
        
        val params = BillingFlowParams.newBuilder()
            .setProductDetailsParamsList(
                listOf(
                    BillingFlowParams.ProductDetailsParams.newBuilder()
                        .setProductDetails(
                            // Need to find the product details from query
                            BillingClient.ProductDetails.newBuilder()
                                .setProductId(productId)
                                .setProductType(BillingClient.ProductType.SUBS)
                                .build()
                        )
                        .build()
                )
            )
            .build()
        
        billingClient.launchBillingFlow(this, params)
    }

    override fun onPurchasesUpdated(billingResult: BillingResult, purchases: MutableList<Purchase>?) {
        if (billingResult.responseCode == BillingClient.BillingResponseCode.OK && purchases != null) {
            for (purchase in purchases) {
                handlePurchase(purchase)
            }
        } else if (billingResult.responseCode == BillingClient.BillingResponseCode.USER_CANCELED) {
            Log.d(TAG, "Purchase cancelled by user")
        } else {
            Log.e(TAG, "Purchase failed: ${billingResult.debugMessage}")
        }
    }

    private fun handlePurchase(purchase: Purchase) {
        // Verify purchase with Firebase Functions (server-side validation)
        val functions = FirebaseFunctions.getInstance("us-central1")
        val task = functions.getHttpsCallable("validateReceipt").call(
            com.google.firebase.ktx.hashMapOf(
                "packageName" to packageName,
                "productId" to purchase.products[0],
                "purchaseToken" to purchase.purchaseToken,
                "orderId" to purchase.orderId
            )
        )
        
        task.addOnSuccessListener { result: HttpsCallableResult ->
            val data = result.data as? Map<String, Any> ?: return@addOnSuccessListener
            val valid = data["valid"] as? Boolean ?: false
            val jwt = data["licenseJwt"] as? String ?: ""
            
            if (valid && jwt.isNotEmpty()) {
                featureGate.onLicenseUpdated(jwt)
                Toast.makeText(this, "Pro features unlocked!", Toast.LENGTH_LONG).show()
                Log.d(TAG, "Purchase validated, license updated")
                
                // Notify WebView of feature unlock
                injectJs("TGApp.onProUnlocked()")
            } else {
                Toast.makeText(this, "Purchase validation failed", Toast.LENGTH_LONG).show()
            }
        }.addOnFailureListener { e ->
            Log.e(TAG, "Validation failed: ${e.message}")
            Toast.makeText(this, "Validation error: ${e.message}", Toast.LENGTH_LONG).show()
        }
    }

    // ========== LICENSE CHECK ==========
    
    private fun checkLicenseStatus() {
        val isPro = featureGate.isProEnabled()
        val expiry = featureGate.getLicenseExpiry()
        
        Log.d(TAG, "License status: isPro=$isPro, expiry=$expiry")
        
        // Notify WebView
        injectJs("TGApp.onLicenseStatus({isPro:$isPro, expiry:$expiry})")
        
        if (featureGate.isExpiringSoon(7)) {
            Toast.makeText(this, "Pro license expiring soon!", Toast.LENGTH_LONG).show()
        }
    }

    // ========== JAVASCRIPT BRIDGE ==========
    
    private fun injectJs(js: String) {
        backgroundWebView.post { backgroundWebView.evaluateJavascript(js, null) }
        overlayWebView.post { overlayWebView.evaluateJavascript(js, null) }
    }

    // Called from JavaScript via addJavascriptInterface
    @android.webkit.JavascriptInterface
    fun requestProPurchase(yearly: Boolean) {
        runOnUiThread { launchProPurchase(yearly) }
    }

    @android.webkit.JavascriptInterface
    fun getLicenseStatus(): String {
        val isPro = featureGate.isProEnabled()
        val expiry = featureGate.getLicenseExpiry()
        return "{\"isPro\":$isPro,\"expiry\":$expiry}"
    }

    // ========== LIFECYCLE ==========
    
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
        checkLicenseStatus()
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
        billingClient.endConnection()
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

    // ========== BROADCAST RECEIVER ==========
    
    private inner class LicenseBroadcastReceiver : android.content.BroadcastReceiver() {
        override fun onReceive(context: Context?, intent: Intent?) {
            if (intent?.action == "LICENSE_UPDATED") {
                Log.d(TAG, "Received LICENSE_UPDATED broadcast - Pro features may be unlocked")
                checkLicenseStatus()
            }
        }
    }
}