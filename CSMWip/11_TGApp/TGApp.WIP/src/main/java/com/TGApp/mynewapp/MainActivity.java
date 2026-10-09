package com.TGApp.mynewapp;

import android.annotation.SuppressLint;
import android.app.Activity;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.res.Configuration;
import android.net.ConnectivityManager;
import android.net.NetworkCapabilities;
import android.os.Build;
import android.os.Bundle;
import android.util.Base64;
import android.util.Log;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.webkit.CookieManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.Toast;
import org.json.JSONObject;

import java.util.HashMap;
import java.util.Map;

@SuppressLint("SetJavaScriptEnabled")
public class MainActivity extends Activity {

    private static final String TAG = "TGApp_MainActivity";
    private static final String ANTIKYTHERA_URL = "https://www.antikytherian.com";
    private static final String OVERLAY_URL = "https://www.tghc.pro";
    private static final String FALLBACK_URL = "https://www.google.com";

    private WebView backgroundWebView;
    private WebView overlayWebView;
    private FrameLayout rootLayout;
    private LicenseBroadcastReceiver licenseReceiver;
    private boolean isNetworkAvailable = false;
    private FeatureGate featureGate;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        setupFullscreen();
        setContentView(R.layout.activity_main);
        
        rootLayout = findViewById(R.id.root_layout);
        backgroundWebView = findViewById(R.id.background_webview);
        overlayWebView = findViewById(R.id.overlay_webview);
        
        isNetworkAvailable = checkNetworkConnection();
        
        configureBackgroundWebView();
        configureOverlayWebView();
        
        loadBackgroundAnimation();
        loadOverlayContent();
        
        registerLicenseReceiver();
        
        featureGate = new FeatureGate(this);
        
        checkLicenseStatus();
        
        Log.d(TAG, "TGApp MainActivity created - Antikythera background + TGHC overlay");
    }

    private void setupFullscreen() {
        Window window = getWindow();
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        window.setFlags(
            WindowManager.LayoutParams.FLAG_FULLSCREEN,
            WindowManager.LayoutParams.FLAG_FULLSCREEN
        );
        window.setFlags(
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS,
            WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS
        );
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            window.getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE | 
                View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION | 
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN | 
                View.SYSTEM_UI_FLAG_HIDE_NAVIGATION | 
                View.SYSTEM_UI_FLAG_FULLSCREEN | 
                View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY
            );
        }
    }

    private boolean checkNetworkConnection() {
        ConnectivityManager cm = (ConnectivityManager) getSystemService(Context.CONNECTIVITY_SERVICE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            android.net.Network network = cm.getActiveNetwork();
            if (network == null) return false;
            NetworkCapabilities capabilities = cm.getNetworkCapabilities(network);
            if (capabilities == null) return false;
            return capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_INTERNET) &&
                   capabilities.hasCapability(NetworkCapabilities.NET_CAPABILITY_VALIDATED);
        }
        return cm.getActiveNetworkInfo() != null && cm.getActiveNetworkInfo().isConnected();
    }

    private void configureBackgroundWebView() {
        WebSettings settings = backgroundWebView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setCacheMode(WebSettings.LOAD_DEFAULT);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMediaPlaybackRequiresUserGesture(false);
        settings.setLoadsImagesAutomatically(true);
        settings.setSupportZoom(false);
        settings.setBuiltInZoomControls(false);
        settings.setDisplayZoomControls(false);
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);
        settings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.NORMAL);
        
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.KITKAT) {
            settings.setLayoutAlgorithm(WebSettings.LayoutAlgorithm.TEXT_AUTOSIZING);
        }
        
        backgroundWebView.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                if (newProgress == 100) {
                    Log.d(TAG, "Antikythera animation loaded completely");
                }
            }
        });
        
        backgroundWebView.setWebViewClient(new WebViewClient() {
            @Override
            public void onReceivedError(WebView view, android.webkit.WebResourceRequest request, android.webkit.WebResourceError error) {
                Log.e(TAG, "Background WebView error: " + (error != null ? error.getDescription() : "unknown"));
                if (view.getUrl() != null && view.getUrl().contains("antikytherian")) {
                    Log.w(TAG, "Falling back to local animation or alternative");
                }
            }
            
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, android.webkit.WebResourceRequest request) {
                return false;
            }
        });
        
        backgroundWebView.setLayerType(View.LAYER_TYPE_HARDWARE, null);
    }

    private void configureOverlayWebView() {
        WebSettings settings = overlayWebView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setDatabaseEnabled(true);
        settings.setCacheMode(WebSettings.LOAD_DEFAULT);
        settings.setAllowFileAccess(false);
        settings.setAllowContentAccess(false);
        settings.setMediaPlaybackRequiresUserGesture(false);
        settings.setLoadsImagesAutomatically(true);
        settings.setSupportZoom(false);
        settings.setBuiltInZoomControls(false);
        settings.setDisplayZoomControls(false);
        settings.setUseWideViewPort(true);
        settings.setLoadWithOverviewMode(true);
        
        overlayWebView.setBackgroundColor(0x00000000);
        overlayWebView.setLayerType(View.LAYER_TYPE_HARDWARE, null);
        
        overlayWebView.setWebChromeClient(new WebChromeClient() {
            @Override
            public void onProgressChanged(WebView view, int newProgress) {
                if (newProgress == 100) {
                    Log.d(TAG, "Overlay content loaded completely");
                }
            }
        });
        
        overlayWebView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, android.webkit.WebResourceRequest request) {
                return false;
            }
        });
        
        CookieManager.getInstance().setAcceptThirdPartyCookies(overlayWebView, true);
    }

    private void loadBackgroundAnimation() {
        String url = isNetworkAvailable ? ANTIKYTHERA_URL : FALLBACK_URL;
        Log.d(TAG, "Loading background animation from: " + url);
        backgroundWebView.loadUrl(url);
    }

    private void loadOverlayContent() {
        String url = isNetworkAvailable ? OVERLAY_URL : FALLBACK_URL;
        Log.d(TAG, "Loading overlay from: " + url);
        overlayWebView.loadUrl(url);
    }

    private void registerLicenseReceiver() {
        licenseReceiver = new LicenseBroadcastReceiver();
        IntentFilter filter = new IntentFilter("LICENSE_UPDATED");
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            registerReceiver(licenseReceiver, filter, Context.RECEIVER_NOT_EXPORTED);
        } else {
            registerReceiver(licenseReceiver, filter);
        }
        Log.d(TAG, "License broadcast receiver registered");
    }

    private void checkLicenseStatus() {
        boolean isPro = featureGate.isProEnabled();
        long expiry = featureGate.getLicenseExpiry();
        
        Log.d(TAG, "License status: isPro=" + isPro + ", expiry=" + expiry);
        
        try {
            JSONObject json = new JSONObject();
            json.put("isPro", isPro);
            json.put("expiry", expiry);
            injectJs("TGApp.onLicenseStatus(" + json.toString() + ")");
        } catch (Exception e) {
            Log.e(TAG, "Failed to create license status JSON", e);
        }
        
        if (featureGate.isExpiringSoon(7)) {
            Toast.makeText(this, "Pro license expiring soon!", Toast.LENGTH_LONG).show();
        }
    }

    private void injectJs(String js) {
        backgroundWebView.post(() -> backgroundWebView.evaluateJavascript(js, null));
        overlayWebView.post(() -> overlayWebView.evaluateJavascript(js, null));
    }

    @android.webkit.JavascriptInterface
    public void requestProPurchase(boolean yearly) {
        runOnUiThread(() -> {
            Toast.makeText(this, "Billing not available in this build. Use Play Store version.", Toast.LENGTH_LONG).show();
        });
    }

    @android.webkit.JavascriptInterface
    public String getLicenseStatus() {
        boolean isPro = featureGate.isProEnabled();
        long expiry = featureGate.getLicenseExpiry();
        try {
            JSONObject json = new JSONObject();
            json.put("isPro", isPro);
            json.put("expiry", expiry);
            return json.toString();
        } catch (Exception e) {
            return "{\"isPro\":false,\"expiry\":0}";
        }
    }

    @Override
    public void onConfigurationChanged(Configuration newConfig) {
        super.onConfigurationChanged(newConfig);
        adjustWebViewsForOrientation(newConfig.orientation);
        Log.d(TAG, "Configuration changed: orientation=" + newConfig.orientation);
    }

    private void adjustWebViewsForOrientation(int orientation) {
        rootLayout.requestLayout();
        
        FrameLayout.LayoutParams params = new FrameLayout.LayoutParams(
            FrameLayout.LayoutParams.MATCH_PARENT,
            FrameLayout.LayoutParams.MATCH_PARENT
        );
        backgroundWebView.setLayoutParams(params);
        overlayWebView.setLayoutParams(params);
    }

    @Override
    public void onWindowFocusChanged(boolean hasFocus) {
        super.onWindowFocusChanged(hasFocus);
        if (hasFocus) {
            setupFullscreen();
        }
    }

    @Override
    protected void onResume() {
        super.onResume();
        backgroundWebView.onResume();
        overlayWebView.onResume();
        isNetworkAvailable = checkNetworkConnection();
        if (!isNetworkAvailable) {
            Log.w(TAG, "Network unavailable on resume - content may be stale");
        }
        checkLicenseStatus();
    }

    @Override
    protected void onPause() {
        super.onPause();
        backgroundWebView.onPause();
        overlayWebView.onPause();
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        try {
            unregisterReceiver(licenseReceiver);
        } catch (IllegalArgumentException e) {
        }
        backgroundWebView.destroy();
        overlayWebView.destroy();
        Log.d(TAG, "TGApp MainActivity destroyed");
    }

    @Override
    public void onBackPressed() {
        if (backgroundWebView.canGoBack()) {
            backgroundWebView.goBack();
        } else if (overlayWebView.canGoBack()) {
            overlayWebView.goBack();
        } else {
            super.onBackPressed();
        }
    }

    public class LicenseBroadcastReceiver extends android.content.BroadcastReceiver {
        @Override
        public void onReceive(Context context, Intent intent) {
            if ("LICENSE_UPDATED".equals(intent.getAction())) {
                Log.d(TAG, "Received LICENSE_UPDATED broadcast - Pro features may be unlocked");
                checkLicenseStatus();
            }
        }
    }
}
