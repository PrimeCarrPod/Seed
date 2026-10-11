package com.tge.e3;

import android.annotation.SuppressLint;
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
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.LinearLayout;
import android.widget.TextView;
import android.widget.Toast;

import java.io.IOException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.List;

@SuppressLint("SetJavaScriptEnabled")
public class MainActivity extends Activity implements SensorEventListener {

    private WebView webView;
    private LinearLayout headerOverlay;
    private FrameLayout controlBar;
    private TextView tagTextView;
    private Button cleanBtn;
    private Button menuBtn;
    private Button theoryBtn;
    private Button fleetBtn;
    private Button scanBtn;
    private boolean cleanMode = false;
    private boolean theoryMode = false;
    private boolean menuVisible = false;
    private SharedPreferences prefs;

    private SensorManager sensorManager;
    private Sensor accelerometer;
    private Sensor gyroscope;

    private final Handler scanHandler = new Handler(Looper.getMainLooper());
    private int scanCount = 0;

    private static class InsetFrameLayout extends FrameLayout {
        public InsetFrameLayout(Context context) {
            super(context);
        }

        @Override
        public WindowInsets onApplyWindowInsets(WindowInsets insets) {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                int sbh = insets.getInsets(WindowInsets.Type.statusBars()).top;
                if (getWebView() != null) {
                    getWebView().post(() -> injectJsStatic("TGE.setInsets(" + sbh + ",0)"));
                }
            }
            return super.onApplyWindowInsets(insets);
        }
    }

    private static WebView staticWebView;
    private static MainActivity staticInstance;

    public static WebView getWebView() {
        return staticWebView;
    }

    public static void injectJsStatic(String js) {
        if (staticWebView != null) {
            staticWebView.evaluateJavascript(js, null);
        }
    }

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        staticInstance = this;
        setupFullscreen();

        InsetFrameLayout root = new InsetFrameLayout(this);
        root.setBackgroundColor(Color.parseColor("#0A0A0F"));

        webView = buildWebView();
        staticWebView = webView;
        root.addView(webView);

        headerOverlay = buildHeader();
        root.addView(headerOverlay);

        controlBar = buildControlBar();
        root.addView(controlBar);

        setContentView(root);

        prefs = getSharedPreferences("TGE_E3_Prefs", MODE_PRIVATE);
        restoreState();

        initializePrimeEngine();
        startWorldlineSimulation();
    }

    private void setupFullscreen() {
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            getWindow().setDecorFitsSystemWindows(false);
            getWindow().getInsetsController().hide(WindowInsets.Type.statusBars());
            getWindow().getInsetsController().hide(WindowInsets.Type.navigationBars());
        } else {
            int flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                    | View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION
                    | View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_HIDE_NAVIGATION
                    | View.SYSTEM_UI_FLAG_FULLSCREEN
                    | View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY;
            getWindow().getDecorView().setSystemUiVisibility(flags);
        }
        getWindow().addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON);
    }

    private WebView buildWebView() {
        WebView wv = new WebView(this);
        wv.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.MATCH_PARENT));
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
        wv.setWebViewClient(new WebViewClient() {
            @Override
            public void onPageFinished(WebView v, String u) {
                v.postDelayed(() -> {
                    v.evaluateJavascript("TGEBridge.onReady({loaded:true})", null);
                    v.evaluateJavascript("TGE.setInsets(40,34)", null);
                    injectJs("PrimeEngine.init(" + PrimeEngine.getPrimeTileData() + ")");
                    injectJs("WorldlineRenderer.init()");
                }, 500);
            }
        });
        wv.addJavascriptInterface(new JsBridge(), "TGEBridge");
        wv.loadUrl("file:///android_asset/tge_e3.html");
        return wv;
    }

    private LinearLayout buildHeader() {
        LinearLayout h = new LinearLayout(this);
        h.setOrientation(LinearLayout.VERTICAL);
        h.setGravity(Gravity.CENTER);
        h.setPadding(dp(16), dp(44), dp(16), dp(10));
        h.setBackgroundColor(Color.argb(190, 10, 10, 15));

        FrameLayout.LayoutParams hp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        hp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        h.setLayoutParams(hp);

        TextView logo = new TextView(this);
        logo.setText("TGE E3");
        logo.setTextSize(26f);
        logo.setTextColor(Color.parseColor("#00D4AA"));
        logo.setTypeface(Typeface.DEFAULT_BOLD);
        logo.setGravity(Gravity.CENTER);

        tagTextView = new TextView(this);
        tagTextView.setText("Prime Electron Worldline · v3.0.0-E3");
        tagTextView.setTextSize(11f);
        tagTextView.setTextColor(Color.parseColor("#E8E8F0"));
        tagTextView.setGravity(Gravity.CENTER);

        TextView subtitle = new TextView(this);
        subtitle.setText("Single Electron Walking Worldline → Reflections | Prime Gap Universe");
        subtitle.setTextSize(9f);
        subtitle.setTextColor(Color.parseColor("#8888A0"));
        subtitle.setGravity(Gravity.CENTER);
        subtitle.setPadding(0, dp(2), 0, 0);

        h.addView(logo);
        h.addView(tagTextView);
        h.addView(subtitle);
        return h;
    }

    private FrameLayout buildControlBar() {
        FrameLayout bar = new FrameLayout(this);
        bar.setBackgroundColor(Color.parseColor("#E50A0A0F"));

        FrameLayout.LayoutParams bp = new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        bp.gravity = Gravity.BOTTOM;
        bar.setLayoutParams(bp);

        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        row.setPadding(0, dp(8), 0, dp(8));

        scanBtn = mkBtn("SCAN", "#00D4AA", v -> injectJs("TGE.onScanPressed()"));
        row.addView(scanBtn);

        menuBtn = mkBtn("MENU", "#F97316", v -> toggleMenu());
        row.addView(menuBtn);

        theoryBtn = mkBtn("THEORY", "#4488FF", v -> toggleTheory());
        row.addView(theoryBtn);

        fleetBtn = mkBtn("FLEET", "#A855F7", v -> injectJs("TGE.toggleFleet()"));
        row.addView(fleetBtn);

        cleanBtn = mkBtn("CLEAN", "#FF6600", v -> {
            cleanMode = !cleanMode;
            cleanBtn.setText(cleanMode ? "SHOW" : "CLEAN");
            cleanBtn.setTextColor(Color.parseColor(cleanMode ? "#FF4466" : "#FF6600"));
            headerOverlay.setVisibility(cleanMode ? View.GONE : View.VISIBLE);
            saveState();
        });
        row.addView(cleanBtn);

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

    private void toggleMenu() {
        menuVisible = !menuVisible;
        menuBtn.setText(menuVisible ? "CLOSE" : "MENU");
        menuBtn.setTextColor(Color.parseColor(menuVisible ? "#10B981" : "#F97316"));
        injectJs("TGE.toggleMenu(" + menuVisible + ")");
    }

    private void toggleTheory() {
        theoryMode = !theoryMode;
        theoryBtn.setText(theoryMode ? "LIVE" : "THEORY");
        theoryBtn.setTextColor(Color.parseColor(theoryMode ? "#10B981" : "#4488FF"));
        injectJs("TGE.setTheoryMode(" + theoryMode + ")");
        tagTextView.setText("Prime Electron Worldline · v3.0.0-E3 · " + (theoryMode ? "THEORY" : "LIVE"));
        saveState();
    }

    private void injectJs(String s) {
        try {
            if (webView != null) {
                webView.evaluateJavascript(s, null);
            }
        } catch (Exception e) {
            Log.w("TGE_E3", "injectJs failed: " + e.getMessage());
        }
    }

    private int dp(int px) {
        return (int) (px * getResources().getDisplayMetrics().density);
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

    private void saveState() {
        prefs.edit()
                .putBoolean("cleanMode", cleanMode)
                .putBoolean("theoryMode", theoryMode)
                .apply();
    }

    private void initializePrimeEngine() {
        new Thread(() -> {
            PrimeEngine.initialize(this);
            runOnUiThread(() -> {
                tagTextView.setText("Prime Electron Worldline · v3.0.0-E3 · " + PrimeEngine.getPrimeCount() + " primes loaded");
            });
        }).start();
    }

    private void startWorldlineSimulation() {
        scanHandler.postDelayed(new Runnable() {
            @Override
            public void run() {
                injectJs("WorldlineRenderer.step()");
                scanHandler.postDelayed(this, 16);
            }
        }, 16);
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
        sensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
        accelerometer = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        gyroscope = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        if (accelerometer != null) sensorManager.registerListener(this, accelerometer, SensorManager.SENSOR_DELAY_GAME);
        if (gyroscope != null) sensorManager.registerListener(this, gyroscope, SensorManager.SENSOR_DELAY_GAME);
    }

    @Override
    protected void onPause() {
        super.onPause();
        if (sensorManager != null) sensorManager.unregisterListener(this);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        scanHandler.removeCallbacksAndMessages(null);
        if (sensorManager != null) sensorManager.unregisterListener(this);
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

    public class JsBridge {
        @JavascriptInterface
        public void onReady(String j) {
            runOnUiThread(() ->
                    Toast.makeText(MainActivity.this, "TGE E3 — Prime Electron Worldline Active", Toast.LENGTH_SHORT).show()
            );
        }

        @JavascriptInterface
        public void updateHeaderText(String text) {
            runOnUiThread(() -> tagTextView.setText(text));
        }

        @JavascriptInterface
        public void setTheoryMode(boolean enabled) {
            theoryMode = enabled;
            runOnUiThread(() -> {
                String mode = enabled ? "THEORY" : "LIVE";
                tagTextView.setText("Prime Electron Worldline · v3.0.0-E3 · " + mode);
            });
        }

        @JavascriptInterface
        public void onWorldlineReflection(String data) {
            runOnUiThread(() -> Log.d("TGE_E3", "Worldline reflection: " + data));
        }

        @JavascriptInterface
        public void onPrimeGapEvent(String data) {
            runOnUiThread(() -> Log.d("TGE_E3", "Prime gap event: " + data));
        }
    }

    public static class PrimeEngine {
        private static boolean initialized = false;
        private static int primeCount = 0;
        private static List<Integer> primeGaps = new ArrayList<>();
        private static List<byte[]> primeTiles = new ArrayList<>();

        public static synchronized void initialize(Context context) {
            if (initialized) return;
            try {
                String[] tileFiles = {"Tile00.prime", "Tile01.prime", "Tile02.prime", "Tile03.prime"};
                
                for (String tileFile : tileFiles) {
                    try {
                        byte[] tileData = readAllBytes(context.getAssets().open(tileFile));
                        if (tileData.length > 0) {
                            primeTiles.add(tileData);
                            primeCount += parsePrimeCount(tileData);
                            primeGaps.addAll(computePrimeGaps(tileData));
                            Log.d("PrimeEngine", "Loaded " + tileFile + ": " + parsePrimeCount(tileData) + " primes");
                        }
                    } catch (IOException e) {
                        Log.w("PrimeEngine", "Asset not found (optional): " + tileFile);
                    }
                }

                if (primeTiles.isEmpty()) {
                    Log.w("PrimeEngine", "No prime tiles found, generating synthetic primes");
                    generateSyntheticPrimes();
                } else {
                    initialized = true;
                    Log.d("PrimeEngine", "Initialized: " + primeCount + " primes, " + primeGaps.size() + " gaps from " + primeTiles.size() + " tiles");
                }
            } catch (Exception e) {
                Log.e("PrimeEngine", "Failed to initialize: " + e.getMessage());
                generateSyntheticPrimes();
            }
        }

        private static byte[] readAllBytes(InputStream is) throws IOException {
            byte[] buffer = new byte[8192];
            int bytesRead;
            java.io.ByteArrayOutputStream output = new java.io.ByteArrayOutputStream();
            while ((bytesRead = is.read(buffer)) != -1) {
                output.write(buffer, 0, bytesRead);
            }
            return output.toByteArray();
        }

        private static int parsePrimeCount(byte[] tile) {
            return tile.length / 4;
        }

        private static List<Integer> computePrimeGaps(byte[] tile) {
            List<Integer> gaps = new ArrayList<>();
            int lastPrime = 2;
            for (int i = 0; i < tile.length; i += 4) {
                if (i + 3 < tile.length) {
                    int prime = ((tile[i] & 0xFF) << 24) |
                            ((tile[i+1] & 0xFF) << 16) |
                            ((tile[i+2] & 0xFF) << 8) |
                            (tile[i+3] & 0xFF);
                    if (prime > lastPrime) {
                        gaps.add(prime - lastPrime);
                        lastPrime = prime;
                    }
                }
            }
            return gaps;
        }

        private static void generateSyntheticPrimes() {
            List<Integer> primes = sieveOfEratosthenes(1000000);
            primeCount = primes.size();
            int last = 2;
            for (int p : primes) {
                if (p > last) {
                    primeGaps.add(p - last);
                    last = p;
                }
            }
            initialized = true;
            Log.d("PrimeEngine", "Synthetic: " + primeCount + " primes, " + primeGaps.size() + " gaps");
        }

        private static List<Integer> sieveOfEratosthenes(int limit) {
            boolean[] isPrime = new boolean[limit + 1];
            for (int i = 2; i <= limit; i++) isPrime[i] = true;
            for (int i = 2; i <= Math.sqrt(limit); i++) {
                if (isPrime[i]) {
                    for (int j = i * i; j <= limit; j += i) isPrime[j] = false;
                }
            }
            List<Integer> result = new ArrayList<>();
            for (int i = 2; i <= limit; i++) if (isPrime[i]) result.add(i);
            return result;
        }

        public static int getPrimeCount() {
            return primeCount;
        }

        public static List<Integer> getPrimeGaps() {
            return primeGaps;
        }

        public static String getPrimeTileData() {
            StringBuilder sb = new StringBuilder();
            sb.append("[");
            for (int i = 0; i < primeTiles.size(); i++) {
                if (i > 0) sb.append(",");
                sb.append("\"");
                byte[] tile = primeTiles.get(i);
                for (int j = 0; j < tile.length; j++) {
                    if (j > 0) sb.append(",");
                    sb.append(tile[j] & 0xFF);
                }
                sb.append("\"");
            }
            sb.append("]");
            return sb.toString();
        }
    }
}