package com.tgapp.electron;

import android.app.Activity;
import android.content.Context;
import android.content.SharedPreferences;
import android.graphics.Color;
import android.graphics.Typeface;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import android.util.Log;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.Window;
import android.view.WindowInsets;
import android.view.WindowManager;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

public class MainActivity extends Activity implements SensorEventListener {

    public WebView webView;
    public LinearLayout headerOverlay;
    public FrameLayout controlBar;
    public TextView tagTextView;
    public Button cleanBtn, menuBtn, theoryBtn, fleetBtn, scanBtn;
    boolean cleanMode = false;
    boolean theoryMode = false;
    boolean menuVisible = false;
    private SharedPreferences prefs;

    private SensorManager sensorManager;
    private Sensor accelerometer;
    private Sensor gyroscope;

    public final Handler scanHandler = new Handler(Looper.getMainLooper());

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        
        // Initialize crash logger FIRST
        CrashLogger.init(this);
        CrashLogger.logInfo("MainActivity", "onCreate started");

        CrashLogger.logInfo("MainActivity", "Building UI");
        InsetFrameLayout root = new InsetFrameLayout(this, this);
        root.setBackgroundColor(Color.parseColor("#0A0A0F"));

        webView = buildWebView();
        root.addView(webView);

        headerOverlay = buildHeader();
        root.addView(headerOverlay);

        controlBar = buildControlBar();
        root.addView(controlBar);

        setContentView(root);
        CrashLogger.logInfo("MainActivity", "UI built, loading WebView");

        // NOW setup fullscreen - window is guaranteed to exist after setContentView
        setupFullscreen();

        prefs = getSharedPreferences("TGE_Electron_Prefs", MODE_PRIVATE);
        restoreState();

        initializePrimeEngine();
        startWorldlineSimulation();
        
        CrashLogger.logInfo("MainActivity", "onCreate complete. Log file: " + CrashLogger.getLogFilePath());
    }

    private void setupFullscreen() {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        
        // Window is now guaranteed to exist after setContentView
        Window window = getWindow();
        if (window == null) {
            CrashLogger.logError("MainActivity", "Window is null in setupFullscreen!");
            return;
        }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false);
            
            // Add null check for insets controller
            android.view.WindowInsetsController insetsController = window.getInsetsController();
            if (insetsController != null) {
                insetsController.hide(WindowInsets.Type.statusBars());
                insetsController.hide(WindowInsets.Type.navigationBars());
            } else {
                CrashLogger.logWarning("MainActivity", "InsetsController is null, using legacy method");
                // Fallback to legacy method
                int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                        | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                        | View.SYSTEM_UI_FLAG_FULLSCREEN
                        | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
                View decorView = window.getDecorView();
                if (decorView != null) {
                    decorView.setSystemUiVisibility(flags);
                }
            }
        } else {
            int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    | View.SYSTEM_UI_FLAG_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
            View decorView = window.getDecorView();
            if (decorView != null) {
                decorView.setSystemUiVisibility(flags);
            }
        }
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    }

    private WebView buildWebView() {
        WebView wv = new WebView(this);
        wv.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        wv.setLayerType(View.LAYER_TYPE_HARDWARE, null);

        WebSettings s = wv.getSettings();
        s.setJavaScriptEnabled(true);
        s.setDomStorageEnabled(true);
        s.setAllowFileAccess(true);
        s.setAllowFileAccessFromFileURLs(true);
        s.setAllowUniversalAccessFromFileURLs(true);
        s.setMediaPlaybackRequiresUserGesture(false);
        s.setMixedContentMode(WebSettings.MIXED_CONTENT_ALWAYS_ALLOW);

        wv.setWebChromeClient(new WebChromeClient());
        wv.setWebViewClient(new WebViewClientImpl(this));
        wv.addJavascriptInterface(new JsBridge(this), "TGEBridge");
        wv.loadUrl("file:///android_asset/tge_electron.html");
        return wv;
    }

    private LinearLayout buildHeader() {
        LinearLayout h = new LinearLayout(this);
        h.setOrientation(LinearLayout.VERTICAL);
        h.setGravity(Gravity.CENTER);
        h.setPadding(dp(16), dp(44), dp(16), dp(10));
        h.setBackgroundColor(Color.argb(190, 10, 10, 15));

        FrameLayout.LayoutParams hp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        hp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        h.setLayoutParams(hp);

        TextView logo = new TextView(this);
        logo.setText("TGE Electron");
        logo.setTextSize(26f);
        logo.setTextColor(Color.parseColor("#00D4AA"));
        logo.setTypeface(Typeface.DEFAULT_BOLD);
        logo.setGravity(Gravity.CENTER);

        TextView tag = new TextView(this);
        tag.setText("Prime Electron Worldline · v1.1");
        tag.setTextSize(11f);
        tag.setTextColor(Color.parseColor("#E8E8F0"));
        tag.setGravity(Gravity.CENTER);
        tagTextView = tag;

        TextView subtitle = new TextView(this);
        subtitle.setText("Single Electron Walking Worldline → Reflections | Prime Gap Universe");
        subtitle.setTextSize(9f);
        subtitle.setTextColor(Color.parseColor("#8888A0"));
        subtitle.setGravity(Gravity.CENTER);
        subtitle.setPadding(0, dp(2), 0, 0);

        h.addView(logo);
        h.addView(tag);
        h.addView(subtitle);
        return h;
    }

    private FrameLayout buildControlBar() {
        FrameLayout bar = new FrameLayout(this);
        bar.setBackgroundColor(Color.parseColor("#E50A0A0F"));

        FrameLayout.LayoutParams bp = new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.WRAP_CONTENT);
        bp.gravity = Gravity.BOTTOM;
        bar.setLayoutParams(bp);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        row.setPadding(0, dp(8), 0, dp(8));

        scanBtn = mkBtn("SCAN", "#00D4AA", new ScanClickListener(this));
        row.addView(scanBtn);

        menuBtn = mkBtn("MENU", "#F97316", new MenuClickListener(this));
        row.addView(menuBtn);

        theoryBtn = mkBtn("THEORY", "#4488FF", new TheoryClickListener(this));
        row.addView(theoryBtn);

        fleetBtn = mkBtn("FLEET", "#A855F7", new FleetClickListener(this));
        row.addView(fleetBtn);

        cleanBtn = mkBtn("CLEAN", "#FF6600", new CleanClickListener(this));
        row.addView(cleanBtn);

        Button logBtn = mkBtn("LOGS", "#FFFFFF", new LogClickListener(this));
        row.addView(logBtn);

        bar.addView(row);
        return bar;
    }

    private Button mkBtn(String text, String color, View.OnClickListener listener) {
        Button b = new Button(this);
        b.setText(text);
        b.setTextSize(10f);
        b.setTextColor(Color.parseColor(color));
        b.setBackgroundColor(Color.parseColor("#1A1A2E"));
        b.setPadding(dp(8), dp(8), dp(8), dp(8));
        b.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        b.setOnClickListener(listener);
        return b;
    }

    public void showLogLocation() {
        String path = CrashLogger.getLogFilePath();
        CrashLogger.logInfo("MainActivity", "Log file location requested: " + path);
        Toast.makeText(this, "Log: " + path, Toast.LENGTH_LONG).show();
    }

    public void toggleMenu() {
        menuVisible = !menuVisible;
        menuBtn.setText(menuVisible ? "CLOSE" : "MENU");
        menuBtn.setTextColor(Color.parseColor(menuVisible ? "#10B981" : "#F97316"));
        injectJs("TGE.toggleMenu(" + menuVisible + ")");
    }

    public void toggleTheory() {
        theoryMode = !theoryMode;
        theoryBtn.setText(theoryMode ? "LIVE" : "THEORY");
        theoryBtn.setTextColor(Color.parseColor(theoryMode ? "#10B981" : "#4488FF"));
        injectJs("TGE.setTheoryMode(" + theoryMode + ")");
        tagTextView.setText("Prime Electron Worldline · v1.1 · " + (theoryMode ? "THEORY" : "LIVE"));
        saveState();
    }

    public void injectJs(String s) {
        try {
            if (webView != null) {
                webView.evaluateJavascript(s, null);
            }
        } catch (Exception e) {
            CrashLogger.logError("MainActivity", "injectJs failed: " + e.getMessage());
        }
    }

    private int dp(int px) {
        return (int)(px * getResources().getDisplayMetrics().density);
    }

    private void restoreState() {
        cleanMode = prefs.getBoolean("cleanMode", false);
        theoryMode = prefs.getBoolean("theoryMode", false);
        cleanBtn.setText(cleanMode ? "SHOW" : "CLEAN");
        cleanBtn.setTextColor(Color.parseColor(cleanMode ? "#FF4466" : "#FF6600"));
        headerOverlay.setVisibility(cleanMode ? View.GONE : View.VISIBLE);
        theoryBtn.setText(theoryMode ? "LIVE" : "THEORY");
        theoryBtn.setTextColor(Color.parseColor(theoryMode ? "#10B981" : "#4488FF"));
    }

    public void saveState() {
        prefs.edit()
                .putBoolean("cleanMode", cleanMode)
                .putBoolean("theoryMode", theoryMode)
                .apply();
    }

    private void initializePrimeEngine() {
        CrashLogger.logInfo("MainActivity", "Initializing PrimeEngine");
        PrimeEngine.initialize(this);
        CrashLogger.logInfo("MainActivity", "PrimeEngine initialized: " + PrimeEngine.getPrimeCount() + " primes");
    }

    private void startWorldlineSimulation() {
        CrashLogger.logInfo("MainActivity", "Starting worldline simulation");
        scanHandler.postDelayed(new WorldlineSimulationRunnable(this), 16);
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        float[] v = event.values;
        if (event.sensor.getType() == Sensor.TYPE_ACCELEROMETER) {
            injectJs("WorldlineRenderer.updateMotion(" + v[0] + "," + v[1] + "," + v[2] + ",WorldlineRenderer.gx,WorldlineRenderer.gy,WorldlineRenderer.gz)");
        } else if (event.sensor.getType() == Sensor.TYPE_GYROSCOPE) {
            injectJs("WorldlineRenderer.updateMotion(WorldlineRenderer.ax,WorldlineRenderer.ay,WorldlineRenderer.az," + v[0] + "," + v[1] + "," + v[2] + ")");
        }
    }

    @Override
    public void onAccuracyChanged(Sensor sensor, int accuracy) {}

    @Override
    protected void onResume() {
        super.onResume();
        CrashLogger.logInfo("MainActivity", "onResume");
        sensorManager = (SensorManager) getSystemService(Context.SENSOR_SERVICE);
        accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        gyroscope = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        if (accelerometer != null) sensorManager.registerListener(this, accelerometer, SensorManager.SENSOR_DELAY_GAME);
        if (gyroscope != null) sensorManager.registerListener(this, gyroscope, SensorManager.SENSOR_DELAY_GAME);
    }

    @Override
    protected void onPause() {
        super.onPause();
        CrashLogger.logInfo("MainActivity", "onPause");
        if (sensorManager != null) sensorManager.unregisterListener(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        CrashLogger.logInfo("MainActivity", "onDestroy");
        scanHandler.removeCallbacksAndMessages(null);
        if (sensorManager != null) sensorManager.unregisterListener(this);
        CrashLogger.close();
    }

    @Override
    public void onBackPressed() {
        if (menuVisible) {
            toggleMenu();
            return;
        }
        if (webView != null && webView.canGoBack()) {
            webView.goBack();
        } else {
            super.onBackPressed();
        }
    }
}
