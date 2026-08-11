package com.carrpod.bounce;

import android.Manifest;
import android.app.Activity;
import android.content.SharedPreferences;
import android.bluetooth.BluetoothAdapter;
import android.bluetooth.BluetoothDevice;
import android.bluetooth.le.BluetoothLeScanner;
import android.bluetooth.le.ScanCallback;
import android.bluetooth.le.ScanSettings;
import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.content.IntentFilter;
import android.content.pm.PackageManager;
import android.graphics.Color;
import android.graphics.Typeface;
import android.hardware.Sensor;
import android.hardware.SensorEvent;
import android.hardware.SensorEventListener;
import android.hardware.SensorManager;
import android.location.Location;
import android.location.LocationListener;
import android.location.LocationManager;
import android.net.wifi.rtt.WifiRttManager;
import android.net.wifi.rtt.RangingResult;
import android.net.wifi.rtt.RangingRequest;
import android.net.wifi.ScanResult;
import android.net.wifi.WifiManager;
import android.net.wifi.p2p.WifiP2pConfig;
import android.net.wifi.p2p.WifiP2pManager;
import android.net.wifi.p2p.nsd.WifiP2pDnsSdServiceInfo;
import android.os.Build;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.PowerManager;
import android.view.Gravity;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowInsets;
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
import java.net.HttpURLConnection;
import java.net.URL;
import com.carrpod.bounce.wifi.RssiKalmanFilter;
import com.carrpod.bounce.wifi.Trilateration;
import com.carrpod.bounce.wifi.PositionEKF;
import com.carrpod.bounce.wifi.ParticleFilter;
import com.carrpod.bounce.wifi.ZoneHMM;
import com.carrpod.bounce.wifi.WifiRttRanging;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;
import java.util.concurrent.Executors;
import android.util.Log;

public class MainActivity extends Activity {

    private static final int PERM_REQ = 1001;
    private WebView webView;
    private LinearLayout headerOverlay;
    private SharedPreferences prefs;
    private String latestVersion = null;
    private boolean cleanMode = false;
    private Button cleanBtn;
    private TextView tagTextView;
    private WifiManager wifiManager;
    private WifiP2pManager p2pManager;
    private WifiP2pManager.Channel p2pChannel;
    private LocationManager locationManager;
    private SensorManager sensorManager;
    private BluetoothAdapter bluetoothAdapter;
    private BluetoothLeScanner bleScanner;
    private boolean btScanning = false;
    private PowerManager.WakeLock wakeLock;
    private HandlerThread sensorThread;
    private Handler sensorHandler;
    private final float[] accelData = new float[3];
    private final float[] magnetData = new float[3];
    private final float[] gyroData = new float[3];
    private boolean hasAccel = false, hasMagnet = false, hasGyro = false;
    private int stepCount = 0;
    private float accelMagnitude = 0f;
    private float altitude = 0f;
    private float vertVelocity = 0f;
    private long lastMovementTime = 0;
    private boolean scanning = false, broadcasting = false;
    private final Handler scanHandler = new Handler(Looper.getMainLooper());
    private int scanCount = 0;
    private long lastScanTime = 0;
    private final Map<String, Long> ssidLog = new HashMap<>();
    private final Map<String, Float> ssidRssiHistory = new HashMap<>();

    // Bluetooth 3D Spatial Tracking
    private static final int BT_MAX_AGE_MS = 30000;
    private static final float BT_PATH_LOSS_EXPONENT = 2.5f;
    private static final float BT_RSSI_1M = -55f;
    private static final float BRIGHTNESS_BOOST = 1.5f;
    private static final float BRIGHTNESS_DECAY = 0.98f;
    // Sensor smoothing (low-pass filter alpha = 0.15 for ~85% smoothing)
    private static final float SENSOR_ALPHA = 0.15f;
    private float smoothAzimuth = 0f;
    private float smoothPitch = 0f;
    private float smoothRoll = 0f;
    private boolean firstSensorUpdate = true;
    private final Map<String, BtDevice3D> btDevices = new HashMap<>();
    private final Map<String, KalmanState> btKalmanStates = new HashMap<>();
    private final Map<String, List<BtPositionSample>> btTrajectories = new HashMap<>();
    private volatile float phoneAzimuth = 0f;
    private volatile float phonePitch = 0f;
    private volatile float phoneRoll = 0f;
    private boolean theoryMode = false;
    private Handler btCleanupHandler = new Handler(Looper.getMainLooper());
    private Runnable btCleanupRunnable;

    // Bluetooth 3D Device with spatial position, brightness, and trajectory
    private static class BtDevice3D {
        String address;
        String name;
        float rssi;
        float filteredRssi;
        float distance;
        float x, y, z;
        float brightness;
        long lastSeen;
        long firstSeen;
        boolean active;
        List<BtPositionSample> trajectory;
        BtDevice3D(String address, String name) {
            this.address = address;
            this.name = name;
            this.brightness = 0.3f;
            this.lastSeen = System.currentTimeMillis();
            this.firstSeen = this.lastSeen;
            this.active = true;
            this.trajectory = new ArrayList<>();
        }
    }

    // Position sample for trajectory tracking
    private static class BtPositionSample {
        long timestamp;
        float x, y, z;
        float rssi;
        float distance;
        float azimuth;
        float pitch;
        BtPositionSample(long timestamp, float x, float y, float z, float rssi, float distance, float azimuth, float pitch) {
            this.timestamp = timestamp;
            this.x = x; this.y = y; this.z = z;
            this.rssi = rssi; this.distance = distance;
            this.azimuth = azimuth; this.pitch = pitch;
        }
    }

    // Wi-Fi triangulation modules
    private RssiKalmanFilter rssiKalmanFilter;
    private Trilateration trilateration;
    private PositionEKF positionEKF;
    private ParticleFilter particleFilter;
    private ZoneHMM zoneHMM;
    private WifiRttRanging wifiRttRanging;
    private Executor executor;

    // AP position tracking for triangulation
    private final Map<String, Trilateration.Point2D> apPositions = new HashMap<>();
    private final Map<String, Float> apRssiAt1m = new HashMap<>();
    private final Map<String, Float> apPathLossExponent = new HashMap<>();

    // Kalman filter states per BSSID
    private final Map<String, RssiKalmanFilter> kalmanFilters = new HashMap<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        prefs = getSharedPreferences("BounceUpdate", MODE_PRIVATE);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            getWindow().setDecorFitsSystemWindows(false);
        } else {
            getWindow().getDecorView().setSystemUiVisibility(
                View.SYSTEM_UI_FLAG_LAYOUT_STABLE |
                View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION |
                View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN);
        }

        FrameLayout root = new FrameLayout(this) {
            @Override public WindowInsets onApplyWindowInsets(WindowInsets insets) {
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
                    int sbh = insets.getInsets(WindowInsets.Type.statusBars()).top;
                    webView.post(() -> injectJs("UI.setInsets(" + sbh + ",0)"));
                }
                return super.onApplyWindowInsets(insets);
            }
        };

        root.setBackgroundColor(Color.parseColor("#0A0A0F"));

        webView = buildWebView();
        root.addView(webView);

        headerOverlay = buildHeader();
        root.addView(headerOverlay);

        root.addView(buildControlBar());
        setContentView(root);

        int ignoreCount = prefs.getInt("ignoreCount", 0);
        if (ignoreCount > 0) {
            prefs.edit().putInt("ignoreCount", ignoreCount - 1).apply();
        }

        checkForUpdates();

        PowerManager pm = (PowerManager) getSystemService(POWER_SERVICE);
        wakeLock = pm.newWakeLock(PowerManager.PARTIAL_WAKE_LOCK, "Bounce:TrailRecorder");
        wakeLock.acquire();

        wifiManager = (WifiManager) getApplicationContext().getSystemService(WIFI_SERVICE);
        p2pManager = (WifiP2pManager) getSystemService(WIFI_P2P_SERVICE);
        if (p2pManager != null) {
            p2pChannel = p2pManager.initialize(this, Looper.getMainLooper(), null);
        }
        locationManager = (LocationManager) getSystemService(LOCATION_SERVICE);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            boolean needLoc = checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED;
            boolean needWifi = Build.VERSION.SDK_INT >= 33 &&
                checkSelfPermission(Manifest.permission.NEARBY_WIFI_DEVICES) != PackageManager.PERMISSION_GRANTED;
            boolean needBt = Build.VERSION.SDK_INT >= 31 && (checkSelfPermission(Manifest.permission.BLUETOOTH_SCAN) != PackageManager.PERMISSION_GRANTED
                || checkSelfPermission(Manifest.permission.BLUETOOTH_CONNECT) != PackageManager.PERMISSION_GRANTED);
            boolean needActivity = Build.VERSION.SDK_INT >= 29 &&
                checkSelfPermission(Manifest.permission.ACTIVITY_RECOGNITION) != PackageManager.PERMISSION_GRANTED;

            if (needLoc || needWifi || needBt || needActivity) {
                java.util.ArrayList<String> perms = new java.util.ArrayList<>();
                if (needLoc) { perms.add(Manifest.permission.ACCESS_FINE_LOCATION); perms.add(Manifest.permission.ACCESS_COARSE_LOCATION); }
                if (needWifi) perms.add(Manifest.permission.NEARBY_WIFI_DEVICES);
                if (needBt) { perms.add(Manifest.permission.BLUETOOTH_SCAN); perms.add(Manifest.permission.BLUETOOTH_CONNECT); }
                if (needActivity) perms.add(Manifest.permission.ACTIVITY_RECOGNITION);

                new Handler(Looper.getMainLooper()).postDelayed(() -> {
                    requestPermissions(perms.toArray(new String[0]), PERM_REQ);
                    Toast.makeText(MainActivity.this, "Grant permissions for scanning, GPS, and Bluetooth", Toast.LENGTH_LONG).show();
                }, 500);
                return;
            }
        }

        startServices();
    }

    @Override
    public void onRequestPermissionsResult(int code, String[] perms, int[] results) {
        super.onRequestPermissionsResult(code, perms, results);
        if (code == PERM_REQ) {
            boolean granted = results.length > 0 && results[0] == PackageManager.PERMISSION_GRANTED;
            Toast.makeText(this, granted ? "Permissions granted" : "Denied — scanner disabled", Toast.LENGTH_LONG).show();
            if (granted) startServices();
        }
    }

    private void startServices() {
        // Initialize Wi-Fi triangulation modules
        initializeTriangulationModules();

        startWifiScanning();
        startGpsTracking();
        startSensors();
        startBtScanning();
        startBtCleanupTask();
    }

    private void checkForUpdates() {
        int ignoreCount = prefs.getInt("ignoreCount", 0);
        if (ignoreCount > 0) {
            prefs.edit().putInt("ignoreCount", ignoreCount - 1).apply();
            return;
        }

        new Thread(() -> {
            String latest = fetchLatestVersion();
            runOnUiThread(() -> {
                if (latest != null && isNewerVersion(latest, "1.0.90")) {
                    latestVersion = latest;
                    injectJs("UI.showUpdateMenu('" + latestVersion + "')");
                }
            });
        }).start();
    }

    private String fetchLatestVersion() {
        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://raw.githubusercontent.com/ZirconiaAegisC/CarrPod/main/CSMApps/Releases/Bounce-latest.txt");
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(5000);
            conn.setReadTimeout(5000);
            conn.setRequestMethod("GET");
            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
                String line = in.readLine();
                in.close();
                if (line != null && line.trim().startsWith("Bounce-v")) {
                    return line.trim().replace("Bounce-v", "").replace(".apk", "").trim();
                }
            }
        } catch (Exception e) {
            android.util.Log.w("BounceUpdate", "No remote version found: " + e.getMessage());
        } finally {
            if (conn != null) conn.disconnect();
        }
        return null;
    }

    private boolean isNewerVersion(String remote, String current) {
        try {
            String[] r = remote.split("\\.");
            String[] c = current.split("\\.");
            for (int i = 0; i < Math.max(r.length, c.length); i++) {
                int rv = i < r.length ? Integer.parseInt(r[i]) : 0;
                int cv = i < c.length ? Integer.parseInt(c[i]) : 0;
                if (rv > cv) return true;
                if (rv < cv) return false;
            }
            return false;
        } catch (Exception e) {
            return false;
        }
    }

    private void startBtCleanupTask() {
        btCleanupRunnable = new Runnable() {
            public void run() {
                long now = System.currentTimeMillis();
                List<String> toRemove = new ArrayList<>();
                
                for (Map.Entry<String, BtDevice3D> entry : btDevices.entrySet()) {
                    BtDevice3D device = entry.getValue();
                    long age = now - device.lastSeen;
                    
                    // Decay brightness for inactive devices
                    if (!device.active) {
                        device.brightness *= BRIGHTNESS_DECAY;
                        device.brightness = Math.max(0.1f, device.brightness); // Minimum visibility
                    }
                    
                    // Mark as inactive if not seen recently
                    if (age > 2000) { // 2 seconds
                        device.active = false;
                    }
                    
                    // Remove very old devices (but keep for theory view)
                    if (age > BT_MAX_AGE_MS) {
                        toRemove.add(entry.getKey());
                    }
                    
                    // Send periodic update for theory view (even for inactive devices)
                    if (webView != null && (device.active || age < BT_MAX_AGE_MS)) {
                        final BtDevice3D d = device;
                        final String addr = entry.getKey();
                        final long a = age;
                        webView.post(() -> {
                            String json = "{\"addr\":\"" + addr
                                + "\",\"name\":\"" + escapeJson(d.name) + "\""
                                + "\",\"rssi\":" + (int)d.rssi
                                + "\",\"dist\":" + String.format("%.1f", d.distance)
                                + "\",\"x\":" + String.format("%.2f", d.x)
                                + "\",\"y\":" + String.format("%.2f", d.y)
                                + "\",\"z\":" + String.format("%.2f", d.z)
                                + "\",\"brightness\":" + String.format("%.2f", d.brightness)
                                + "\",\"active\":" + d.active
                                + "\",\"persist\":" + ((now - d.firstSeen) / 1000)
                                + "\",\"age\":" + (a / 1000) + "}";
                            injectJs("Bounce.onBtResult3D(" + json + ")");
                        });
                    }
                }
                
                // Remove expired devices from active map (trajectory kept in btTrajectories)
                for (String addr : toRemove) {
                    btDevices.remove(addr);
                }
                
                // Schedule next cleanup
                btCleanupHandler.postDelayed(this, 500); // Run every 500ms
            }
        };
        btCleanupHandler.post(btCleanupRunnable);
    }

    private void initializeTriangulationModules() {
        // Initialize executor for background tasks
        executor = Executors.newSingleThreadExecutor();

        // Initialize Kalman filter for RSSI smoothing
        rssiKalmanFilter = new RssiKalmanFilter();

        // Initialize per-BSSID Kalman filters
        kalmanFilters.clear();

        // Initialize trilateration
        trilateration = new Trilateration();

        // Initialize Extended Kalman Filter for 2D position tracking
        positionEKF = new PositionEKF();

        // Initialize Particle Filter for non-Gaussian RSSI
        particleFilter = new ParticleFilter(200);  // 200 particles

        // Initialize Zone HMM for zone classification
        zoneHMM = new ZoneHMM();

        // Initialize Wi-Fi RTT ranging
        wifiRttRanging = new WifiRttRanging(this, new WifiRttRanging.RttCallback() {
            @Override
            public void onRttResults(Map<String, WifiRttRanging.RttMeasurement> results) {
                handleRttResults(results);
            }

            @Override
            public void onRttFailure(int errorCode) {
                Log.w("Bounce", "RTT ranging failed: " + errorCode);
            }
        });

        // Initialize executor for background tasks
        executor = Executors.newSingleThreadExecutor();
    }

    private void handleRttResults(Map<String, WifiRttRanging.RttMeasurement> results) {
        // Send RTT results to JS
        if (webView != null) {
            StringBuilder json = new StringBuilder("{");
            boolean first = true;
            for (Map.Entry<String, WifiRttRanging.RttMeasurement> entry : results.entrySet()) {
                if (!first) json.append(",");
                first = false;
                WifiRttRanging.RttMeasurement m = entry.getValue();
                json.append("\"").append(entry.getKey()).append("\":")
                    .append("{\"dist\":").append(m.distanceMeters)
                    .append(",\"stdDev\":").append(m.distanceStdDevMeters)
                    .append(",\"rssi\":").append(m.rssi).append("}");
            }
            json.append("}");
            injectJs("Bounce.onRttResults(" + json.toString() + ")");
        }
    }

    private void startBtScanning() {
        if (Build.VERSION.SDK_INT >= 31) {
            if (checkSelfPermission(Manifest.permission.BLUETOOTH_SCAN) != PackageManager.PERMISSION_GRANTED) {
                injectJs("Bounce.onBtStatus({status:'no_permission'})");
                return;
            }
        }
        bluetoothAdapter = BluetoothAdapter.getDefaultAdapter();
        if (bluetoothAdapter == null || !bluetoothAdapter.isEnabled()) {
            injectJs("Bounce.onBtStatus({status:'bt_disabled'})");
            return;
        }
        bleScanner = bluetoothAdapter.getBluetoothLeScanner();
        if (bleScanner == null) {
            injectJs("Bounce.onBtStatus({status:'no_le_scanner'})");
            return;
        }
        btScanning = true;
        ScanSettings settings = new ScanSettings.Builder()
            .setScanMode(ScanSettings.SCAN_MODE_LOW_LATENCY)
            .build();
        bleScanner.startScan(null, settings, btCallback);
        injectJs("Bounce.onBtStatus({status:'scanning'})");
        android.util.Log.d("BounceBT", "BT scan started successfully");
        
        // Restart scan periodically like Wi-Fi to ensure continuous scanning
        scanHandler.postDelayed(new Runnable() {
            public void run() {
                if (btScanning && bleScanner != null && bluetoothAdapter != null && bluetoothAdapter.isEnabled()) {
                    try {
                        bleScanner.stopScan(btCallback);
                    } catch (Exception ignored) {}
                    bleScanner.startScan(null, settings, btCallback);
                    android.util.Log.d("BounceBT", "BT scan restarted");
                }
                if (btScanning) {
                    scanHandler.postDelayed(this, 50000); // Restart every 5 seconds
                }
            }
        }, 5000);
    }

    private final ScanCallback btCallback = new ScanCallback() {
        public void onScanResult(int callbackType, android.bluetooth.le.ScanResult result) {
            if (result == null || webView == null) return;
            android.util.Log.d("BounceBT", "onScanResult: " + result.getDevice().getAddress() + " rssi=" + result.getRssi());
            BluetoothDevice dev = result.getDevice();
            int rawRssi = result.getRssi();
            String addr = dev.getAddress();
            String name = dev.getName() != null ? dev.getName() : "Unknown";
            long now = System.currentTimeMillis();

            // Kalman filter for RSSI smoothing
            KalmanState ks = btKalmanStates.get(addr);
            if (ks == null) { ks = new KalmanState(); ks.x = rawRssi; btKalmanStates.put(addr, ks); }
            ks.p += 0.01f;
            float k = ks.p / (ks.p + 20f);
            ks.x += k * (rawRssi - ks.x);
            ks.p *= (1f - k);
            float filteredRssi = ks.x;

            // Distance estimation using filtered RSSI
            float distance = (float) Math.pow(10, (BT_RSSI_1M - filteredRssi) / (10f * BT_PATH_LOSS_EXPONENT));

            // Get or create 3D device
            BtDevice3D device = btDevices.get(addr);
            if (device == null) {
                device = new BtDevice3D(addr, name);
                btDevices.put(addr, device);
                android.util.Log.d("BounceBT", "NEW DEVICE: " + addr + " name=" + name + " dist=" + distance + " az=" + phoneAzimuth + " pitch=" + phonePitch);
            }
            
            // Update device state
            device.rssi = rawRssi;
            device.filteredRssi = filteredRssi;
            device.distance = distance;
            device.lastSeen = now;
            device.active = true;
            
            // RE-ENERGIZE BRIGHTNESS on signal catch
            device.brightness = Math.min(1.0f, device.brightness * BRIGHTNESS_BOOST);
            
            // Calculate 3D position relative to phone using phone orientation
            float relAzimuth = phoneAzimuth;
            float relPitch = phonePitch;
            
            // Convert to 3D coordinates (phone at origin, facing azimuth, tilted pitch)
            float horizontalDist = distance * (float) Math.cos(Math.toRadians(relPitch));
            device.x = horizontalDist * (float) Math.sin(Math.toRadians(relAzimuth));
            device.y = horizontalDist * (float) Math.cos(Math.toRadians(relAzimuth));
            device.z = distance * (float) Math.sin(Math.toRadians(relPitch)); // Positive = above, negative = below
            
            // Add to trajectory
            device.trajectory.add(new BtPositionSample(now, device.x, device.y, device.z, filteredRssi, distance, phoneAzimuth, phonePitch));
            if (device.trajectory.size() > 50) device.trajectory.remove(0);
            
            // Also store in global trajectory map for theory view
            List<BtPositionSample> traj = btTrajectories.get(addr);
            if (traj == null) { traj = new ArrayList<>(); btTrajectories.put(addr, traj); }
            traj.add(new BtPositionSample(now, device.x, device.y, device.z, filteredRssi, distance, phoneAzimuth, phonePitch));
            if (traj.size() > 100) traj.remove(0);

            // Capture values for lambda (must be final or effectively final)
            final float fx = device.x;
            final float fy = device.y;
            final float fz = device.z;
            final float fbrightness = device.brightness;
            final long fpersist = (now - device.firstSeen) / 1000;
            final float fazimuth = phoneAzimuth;
            final float fpitch = phonePitch;

            webView.post(() -> {
                // Call both handlers for compatibility: onBtResult for UI list, onBtResult3D for 3D
                String json3D = "{\"name\":\"" + escapeJson(name) + "\",\"addr\":\"" + addr
                    + "\",\"rssi\":" + rawRssi + ",\"filtRssi\":" + String.format("%.1f", filteredRssi)
                    + "\",\"dist\":" + String.format("%.1f", distance)
                    + "\",\"x\":" + String.format("%.2f", fx)
                    + "\",\"y\":" + String.format("%.2f", fy)
                    + "\",\"z\":" + String.format("%.2f", fz)
                    + "\",\"brightness\":" + String.format("%.2f", fbrightness)
                    + "\",\"active\":true"
                    + "\",\"persist\":" + fpersist
                    + "\",\"azimuth\":" + String.format("%.1f", fazimuth)
                    + "\",\"pitch\":" + String.format("%.1f", fpitch) + "}";
                injectJs("Bounce.onBtResult3D(" + json3D + ")");
                
                String jsonUI = "{\"name\":\"" + escapeJson(name) + "\",\"addr\":\"" + addr
                    + "\",\"rssi\":" + rawRssi + ",\"dist\":" + String.format("%.1f", distance) + "}";
                injectJs("Bounce.onBtResult(" + jsonUI + ")");
            });
        }
        public void onScanFailed(int errorCode) {
            injectJs("Bounce.onBtStatus({status:'failed',code:" + errorCode + "})");
        }
    };

    private void startSensors() {
        sensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
        if (sensorManager == null) return;

        sensorThread = new HandlerThread("BounceSpatialThread");
        sensorThread.start();
        sensorHandler = new Handler(sensorThread.getLooper());

        Sensor accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        Sensor magnet = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        Sensor gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        Sensor step = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_DETECTOR);

        if (accel != null) sensorManager.registerListener(sensorListener, accel, SensorManager.SENSOR_DELAY_GAME, sensorHandler);
        if (magnet != null) sensorManager.registerListener(sensorListener, magnet, SensorManager.SENSOR_DELAY_GAME, sensorHandler);
        if (gyro != null) { sensorManager.registerListener(sensorListener, gyro, SensorManager.SENSOR_DELAY_GAME, sensorHandler); hasGyro = true; }
        if (step != null) sensorManager.registerListener(sensorListener, step, SensorManager.SENSOR_DELAY_FASTEST, sensorHandler);

        lastMovementTime = System.currentTimeMillis();
        Toast.makeText(this, "Spatial: accel+mag" + (hasGyro ? "+gyro" : "") + "+step", Toast.LENGTH_SHORT).show();
    }

    private final SensorEventListener sensorListener = new SensorEventListener() {
        public void onSensorChanged(SensorEvent event) {
            int type = event.sensor.getType();
            if (type == Sensor.TYPE_ACCELEROMETER) {
                System.arraycopy(event.values, 0, accelData, 0, 3);
                hasAccel = true;
                accelMagnitude = (float) Math.sqrt(event.values[0]*event.values[0] + event.values[1]*event.values[1] + event.values[2]*event.values[2]);
            } else if (type == Sensor.TYPE_MAGNETIC_FIELD) {
                System.arraycopy(event.values, 0, magnetData, 0, 3);
                hasMagnet = true;
            } else if (type == Sensor.TYPE_GYROSCOPE) {
                System.arraycopy(event.values, 0, gyroData, 0, 3);
                hasGyro = true;
            } else if (type == Sensor.TYPE_STEP_DETECTOR) {
                stepCount++;
            }

            long now = System.currentTimeMillis();
            if (hasAccel) {
                float[] R = new float[9], I = new float[9];
                if (hasMagnet && SensorManager.getRotationMatrix(R, I, accelData, magnetData)) {
                    float[] orientation = new float[3];
                    SensorManager.getOrientation(R, orientation);
                    float azimuth = (float) Math.toDegrees(orientation[0]);
                    if (azimuth < 0) azimuth += 360;
                    float pitch = (float) Math.toDegrees(orientation[1]);
                    float roll = (float) Math.toDegrees(orientation[2]);
                    String orn = Math.abs(pitch) < 20 ? "flat" : Math.abs(pitch) > 60 ? "upright" : "tilted";

                    // Store phone orientation for Bluetooth 3D positioning with low-pass filter
                    if (firstSensorUpdate) {
                        smoothAzimuth = azimuth;
                        smoothPitch = pitch;
                        smoothRoll = roll;
                        firstSensorUpdate = false;
                    } else {
                        // Handle azimuth wrap-around (0/360 boundary)
                        float azDiff = azimuth - smoothAzimuth;
                        if (azDiff > 180) azDiff -= 360;
                        else if (azDiff < -180) azDiff += 360;
                        smoothAzimuth += SENSOR_ALPHA * azDiff;
                        if (smoothAzimuth >= 360) smoothAzimuth -= 360;
                        else if (smoothAzimuth < 0) smoothAzimuth += 360;
                        
                        smoothPitch += SENSOR_ALPHA * (pitch - smoothPitch);
                        smoothRoll += SENSOR_ALPHA * (roll - smoothRoll);
                    }
                    phoneAzimuth = smoothAzimuth;
                    phonePitch = smoothPitch;
                    phoneRoll = smoothRoll;

                    final float az = azimuth;
                    final float pt = pitch;
                    final float rl = roll;
                    final String or = orn;
                    if (webView != null) {
                        webView.post(() -> injectJs("Bounce.onCompass(" + az + "," + pt + "," + rl + ",'" + or + "')"));
                    }
                }

                // Send spatial movement packet every ~200ms
                if (now - lastMovementTime > 200 && webView != null) {
                    lastMovementTime = now;
                    final float mag = accelMagnitude;
                    final float gyX = gyroData[0], gyY = gyroData[1], gyZ = gyroData[2];
                    final int steps = stepCount;
                    final float alt = altitude;
                    final float pitchDeg = (float) Math.toDegrees(Math.asin(Math.max(-1f, Math.min(1f, accelData[1] / 9.81f))));

                    webView.post(() -> {
                        injectJs("Bounce.onMovement({mag:" + String.format("%.2f", mag)
                            + ",gx:" + String.format("%.3f", gyX) + ",gy:" + String.format("%.3f", gyY) + ",gz:" + String.format("%.3f", gyZ)
                            + ",steps:" + steps + ",alt:" + String.format("%.1f", alt)
                            + ",pitch:" + String.format("%.1f", pitchDeg) + ",gyro:" + hasGyro + "})");
                    });
                }
            }
        }
        public void onAccuracyChanged(Sensor sensor, int accuracy) {}
    };

    private long broadcastStartTime = 0;
    private boolean transitionInProgress = false;
    private Handler timeoutHandler = new Handler(Looper.getMainLooper());
    private Runnable transitionTimeout = null;

    private boolean preflightCheck() {
        if (p2pManager == null || p2pChannel == null) return false;
        if (wifiManager == null || !wifiManager.isWifiEnabled()) return false;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED)
                return false;
        }
        return true;
    }

    private void armTransitionTimeout() {
        if (transitionTimeout != null) timeoutHandler.removeCallbacks(transitionTimeout);
        transitionTimeout = new Runnable() { public void run() {
            if (transitionInProgress) {
                transitionInProgress = false;
                injectJs("Bounce.onBroadcastStatus({status:'timeout'})");
            }
        }};
        timeoutHandler.postDelayed(transitionTimeout, 10000);
    }

    private void disarmTransitionTimeout() {
        if (transitionTimeout != null) {
            timeoutHandler.removeCallbacks(transitionTimeout);
            transitionTimeout = null;
        }
    }

    public void startP2pBroadcast(String ssidCode) {
        if (transitionInProgress) {
            injectJs("Bounce.onBroadcastStatus({status:'busy'})");
            return;
        }
        if (!preflightCheck()) {
            injectJs("Bounce.onBroadcastStatus({status:'not_ready',reason:'check_wifi_perms'})");
            return;
        }
        if (ssidCode == null || ssidCode.isEmpty()) {
            injectJs("Bounce.onBroadcastStatus({status:'invalid_code'})");
            return;
        }

        transitionInProgress = true;
        broadcastStartTime = System.currentTimeMillis();
        armTransitionTimeout();

        String code = ssidCode.length() > 25 ? ssidCode.substring(0, 25) : ssidCode;
        doCreateGroup(code);
    }

    private void doCreateGroup(String code) {
        if (!preflightCheck()) { onGroupFailed(); return; }
        if (code == null) { onGroupFailed(); return; }

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.Q) {
            try {
                WifiP2pConfig config = new WifiP2pConfig.Builder()
                    .setNetworkName(code)
                    .setPassphrase("Bounce-2026")
                    .setGroupOperatingBand(WifiP2pConfig.GROUP_OWNER_BAND_5GHZ)
                    .build();
                if (p2pManager != null && p2pChannel != null) {
                    p2pManager.createGroup(p2pChannel, config, new WifiP2pManager.ActionListener() {
                        public void onSuccess() { onGroupCreated(code, "bare"); }
                        public void onFailure(int r) { tryWithDirect(code); }
                    });
                } else { onGroupFailed(); }
            } catch (IllegalArgumentException e) {
                tryWithDirect(code);
            } catch (Exception e) {
                tryWithDirect(code);
            }
        } else {
            doLegacyCreateGroup(code);
        }
    }

    private void tryWithDirect(String code) {
        if (!preflightCheck()) { onGroupFailed(); return; }
        try {
            WifiP2pConfig config = new WifiP2pConfig.Builder()
                .setNetworkName("DIRECT-" + code)
                .setPassphrase("Bounce-2026")
                .setGroupOperatingBand(WifiP2pConfig.GROUP_OWNER_BAND_5GHZ)
                .build();
            if (p2pManager != null && p2pChannel != null) {
                p2pManager.createGroup(p2pChannel, config, new WifiP2pManager.ActionListener() {
                    public void onSuccess() { onGroupCreated("DIRECT-" + code, "direct-prefix"); }
                    public void onFailure(int r) { doLegacyCreateGroup(code); }
                });
            } else { onGroupFailed(); }
        } catch (Exception e) { doLegacyCreateGroup(code); }
    }

    private void onGroupCreated(String ssid, String method) {
        disarmTransitionTimeout();
        broadcasting = true;
        transitionInProgress = false;
        long elapsed = System.currentTimeMillis() - broadcastStartTime;
        if (webView != null) {
            injectJs("Bounce.onTransitionTiming(" + elapsed + ",'" + ssid + "','" + method + "')");
            injectJs("Bounce.onBroadcastStatus({status:'visible',ssid:'" + ssid + "',method:'" + method + "'})");
        }
        try { Toast.makeText(MainActivity.this, ssid + " (" + elapsed + "ms)", Toast.LENGTH_SHORT).show(); } catch (Exception ignored) {}
    }

    private void doLegacyCreateGroup(String code) {
        if (!preflightCheck()) { onGroupFailed(); return; }
        try {
            java.lang.reflect.Method setDev = WifiP2pManager.class.getMethod("setDeviceName",
                WifiP2pManager.Channel.class, String.class, WifiP2pManager.ActionListener.class);
            setDev.invoke(p2pManager, p2pChannel, code, new WifiP2pManager.ActionListener() {
                public void onSuccess() {
                    if (p2pManager != null && p2pChannel != null) {
                        p2pManager.createGroup(p2pChannel, new WifiP2pManager.ActionListener() {
                            public void onSuccess() { onGroupCreated(code, "legacy"); }
                            public void onFailure(int r) { onGroupFailed(); }
                        });
                    } else { onGroupFailed(); }
                }
                public void onFailure(int r) {
                    if (p2pManager != null && p2pChannel != null) {
                        p2pManager.createGroup(p2pChannel, new WifiP2pManager.ActionListener() {
                            public void onSuccess() { onGroupCreated(code, "legacy-fallback"); }
                            public void onFailure(int r2) { onGroupFailed(); }
                        });
                    } else { onGroupFailed(); }
                }
            });
        } catch (Exception e) { onGroupFailed(); }
    }

    private void onGroupFailed() {
        disarmTransitionTimeout();
        broadcasting = false;
        transitionInProgress = false;
        injectJs("Bounce.onBroadcastStatus({status:'failed'})");
    }

    public void refreshBroadcastSSID(String newCode) {
        if (transitionInProgress) return;
        if (!broadcasting) return;
        if (!preflightCheck()) return;
        if (newCode == null || newCode.isEmpty()) return;

        transitionInProgress = true;
        broadcastStartTime = System.currentTimeMillis();
        armTransitionTimeout();

        String code = newCode.length() > 25 ? newCode.substring(0, 25) : newCode;

        if (p2pManager != null && p2pChannel != null) {
            p2pManager.removeGroup(p2pChannel, new WifiP2pManager.ActionListener() {
                public void onSuccess() {
                    new Handler(Looper.getMainLooper()).postDelayed(() -> {
                        if (transitionInProgress && preflightCheck()) {
                            doCreateGroup(code);
                        } else {
                            onGroupFailed();
                        }
                    }, 600);
                }
                public void onFailure(int r) {
                    if (preflightCheck()) {
                        doCreateGroup(code);
                    } else {
                        onGroupFailed();
                    }
                }
            });
        } else {
            onGroupFailed();
        }
    }

    private void startBonjourBroadcast(String ssidCode) {
        p2pManager.clearLocalServices(p2pChannel, new WifiP2pManager.ActionListener() {
            public void onSuccess() {} public void onFailure(int r) {}
        });

        Map<String, String> record = new HashMap<>();
        record.put("taf", ssidCode);
        record.put("v", "1.0.13");

        WifiP2pDnsSdServiceInfo info = WifiP2pDnsSdServiceInfo.newInstance("_bounce._tcp", ssidCode, record);
        p2pManager.addLocalService(p2pChannel, info, new WifiP2pManager.ActionListener() {
            public void onSuccess() {
                broadcasting = true;
                p2pManager.discoverPeers(p2pChannel, new WifiP2pManager.ActionListener() {
                    public void onSuccess() {
                        injectJs("Bounce.onBroadcastStatus({status:'visible',ssid:'" + ssidCode + "',method:'Bonjour+Discoverable'})");
                    }
                    public void onFailure(int r) {
                        injectJs("Bounce.onBroadcastStatus({status:'broadcasting',ssid:'" + ssidCode + "',method:'Bonjour-only'})");
                    }
                });
            }
            public void onFailure(int r) {
                injectJs("Bounce.onBroadcastStatus({status:'failed',reason:'bonjour_failed'})");
            }
        });
    }

    public void stopP2pBroadcast() {
        if (p2pManager == null || p2pChannel == null) return;
        transitionInProgress = false;
        p2pManager.removeGroup(p2pChannel, new WifiP2pManager.ActionListener() {
            public void onSuccess() {}
            public void onFailure(int r) {
                // Try clearing services if group removal fails
                p2pManager.clearLocalServices(p2pChannel, new WifiP2pManager.ActionListener() {
                    public void onSuccess() {} public void onFailure(int r2) {}
                });
            }
        });
        broadcasting = false;
        injectJs("Bounce.onBroadcastStatus({status:'stopped'})");
    }

    private void startGpsTracking() {
        if (locationManager == null) return;
        try {
            if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
                if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED) return;
            }
            locationManager.requestLocationUpdates(LocationManager.GPS_PROVIDER, 1000, .5f, gpsListener, Looper.getMainLooper());
        } catch (Exception e) {
            injectJs("androidBridge('gpsStatus',{status:'error',msg:'" + e.getMessage() + "'})");
        }
    }

    private final LocationListener gpsListener = new LocationListener() {
        public void onLocationChanged(Location loc) {
            if (loc == null || webView == null) return;
            altitude = (float) (loc.getAltitude() * 3.281f);
            webView.post(() -> {
                String json = "{lat:" + loc.getLatitude() + ",lng:" + loc.getLongitude()
                    + ",alt:" + loc.getAltitude() + ",speed:" + loc.getSpeed()
                    + ",bearing:" + loc.getBearing() + ",acc:" + loc.getAccuracy() + "}";
                injectJs("Bounce.onGps(" + json + ")");
            });
        }
        public void onStatusChanged(String p, int s, Bundle b) {}
        public void onProviderEnabled(String p) {}
        public void onProviderDisabled(String p) {
            injectJs("androidBridge('gpsStatus',{status:'disabled'})");
        }
    };

    private void startWifiScanning() {
        if (wifiManager == null || !wifiManager.isWifiEnabled()) {
            Toast.makeText(this, "Enable Wi-Fi for Bounce scanning", Toast.LENGTH_LONG).show();
            return;
        }

        IntentFilter filter = new IntentFilter(WifiManager.SCAN_RESULTS_AVAILABLE_ACTION);
        registerReceiver(wifiScanReceiver, filter);

        scanning = true;
        lastScanTime = System.currentTimeMillis();
        wifiManager.startScan();
        pushScanResults();

        scanHandler.postDelayed(new Runnable() {
            public void run() {
                if (scanning) {
                    lastScanTime = System.currentTimeMillis();
                    wifiManager.startScan();
        pushScanResults();
                    scanHandler.postDelayed(this, 1000);
                }
            }
        }, 1000);
    }

    private final BroadcastReceiver wifiScanReceiver = new BroadcastReceiver() {
        @Override
        public void onReceive(Context context, Intent intent) {
            boolean success = intent.getBooleanExtra(WifiManager.EXTRA_RESULTS_UPDATED, false);
            if (!success) return;
            List<android.net.wifi.ScanResult> results = wifiManager.getScanResults();
            if (results == null || results.isEmpty()) return;
            long elapsed = System.currentTimeMillis() - lastScanTime;
            lastScanTime = System.currentTimeMillis();
            sendScanResultsToJs(results, elapsed);
        }
    };

    private void pushScanResults() {
        if (wifiManager == null || webView == null) return;
        try {
            List<android.net.wifi.ScanResult> results = wifiManager.getScanResults();
            if (results == null || results.isEmpty()) {
                // No results yet — tell JS we're still scanning
                injectJs("Bounce.onScanStatus({status:'empty',msg:'no networks found'})");
                return;
            }
            sendScanResultsToJs(results, 0);
        } catch (SecurityException se) {
            injectJs("Bounce.onScanStatus({status:'denied',msg:'location permission needed'})");
        } catch (Exception e) {
            injectJs("Bounce.onScanStatus({status:'error',msg:'"+e.getMessage()+"'})");
        }
    }

    private void sendScanResultsToJs(List<android.net.wifi.ScanResult> results, long elapsed) {
        scanCount++;
        long now = System.currentTimeMillis();

        // Prepare AP data for triangulation
        List<Trilateration.AccessPoint> apsForTrilateration = new ArrayList<>();
        List<Trilateration.AccessPoint> apsForEKF = new ArrayList<>();
        Map<String, Double> measurementsForEKF = new HashMap<>();
        Map<String, Double> measurementsForParticleFilter = new HashMap<>();

        StringBuilder json = new StringBuilder("[");
        boolean first = true;

        for (android.net.wifi.ScanResult r : results) {
            if (!first) json.append(","); first = false;
            String ssid = escapeJson(r.SSID);
            String bssid = r.BSSID;
            long firstSeen = ssidLog.containsKey(bssid) ? ssidLog.get(bssid) : now;
            if (!ssidLog.containsKey(bssid)) ssidLog.put(bssid, now);
            long persistence = (now - firstSeen) / 1000;
            Float prevRssi = ssidRssiHistory.get(bssid);
            boolean reliable = prevRssi != null && Math.abs(r.level - prevRssi) < 15;

            // Apply Kalman filter to RSSI
            float filteredRssi = rssiKalmanFilter.update(r.level);
            
            // Update per-BSSID Kalman filter
            RssiKalmanFilter bssidFilter = kalmanFilters.get(bssid);
            if (bssidFilter == null) {
                bssidFilter = new RssiKalmanFilter();
                kalmanFilters.put(bssid, bssidFilter);
            }
            float bssidFilteredRssi = bssidFilter.update(r.level);

            // Calculate distance using filtered RSSI
            float kDist = (float) Math.pow(10, (RSSI_1M - bssidFilteredRssi) / (10f * PATH_LOSS_EXPONENT));
            
            // Use HMM for zone classification
            ZoneHMM.Zone zone = zoneHMM.step(kDist);
            String zoneStr = zone.name().toLowerCase();

            // Update AP position estimates if we have GPS
            updateApPosition(bssid, r.level);

            // Prepare data for trilateration
            Trilateration.Point2D apPos = apPositions.get(bssid);
            if (apPos != null) {
                double weight = reliable ? 1.0 : 0.5;
                Trilateration.AccessPoint ap = new Trilateration.AccessPoint(
                    bssid, ssid, apPos, kDist, weight);
                apsForTrilateration.add(ap);
                apsForEKF.add(ap);
                measurementsForEKF.put(bssid, (double) kDist);
                measurementsForParticleFilter.put(bssid, (double) kDist);
            }

            ssidRssiHistory.put(bssid, (float) r.level);

            json.append("{\"ssid\":\"").append(ssid).append("\",\"bssid\":\"").append(bssid)
                .append("\",\"rssi\":").append(r.level).append(",\"freq\":").append(r.frequency)
                .append(",\"dist\":").append(String.format("%.1f", kDist))
                .append(",\"zone\":\"").append(zoneStr).append("\"")
                .append(",\"persist\":").append(persistence).append(",\"reliable\":").append(reliable).append(",\"caps\":\"\"}");
        }
        json.append("]");

        // Perform trilateration if we have 3+ APs with known positions
        Trilateration.Result trilaterationResult = null;
        if (apsForTrilateration.size() >= 3) {
            trilaterationResult = trilateration.trilaterate(apsForTrilateration);
        }

        // Update EKF with measurements
        if (!measurementsForEKF.isEmpty()) {
            positionEKF.processScanResults(apsForEKF, System.currentTimeMillis());
        }

        // Update Particle Filter
        if (!measurementsForParticleFilter.isEmpty()) {
            particleFilter.updateWeights(measurementsForParticleFilter);
            if (particleFilter.effectiveSampleSize() < 50) {  // Resample threshold
                particleFilter.resample();
            }
        }

        // Perform RTT ranging if available
        if (wifiRttRanging != null && wifiRttRanging.isRttSupported()) {
            // Convert scan results to RTT-capable APs
            List<android.net.wifi.ScanResult> scanResults = new ArrayList<>(results);
            executor.execute(() -> wifiRttRanging.startRanging(scanResults));
        }

        String meta = "{\"scanNum\":" + scanCount + ",\"elapsed\":" + elapsed + ",\"total\":" + ssidLog.size() + "}";
        
        // Enhanced meta with triangulation data
        StringBuilder metaJson = new StringBuilder(meta);
        if (metaJson.length() > 1) {
            metaJson.setLength(metaJson.length() - 1); // Remove closing }
            if (trilaterationResult != null && trilaterationResult.isValid()) {
                metaJson.append(",\"position\":{\"x\":").append(trilaterationResult.position.x)
                    .append(",\"y\":").append(trilaterationResult.position.y)
                    .append(",\"error\":").append(trilaterationResult.error)
                    .append(",\"gdop\":").append(trilaterationResult.gdop).append("}");
            } else {
                metaJson.append("}");
            }
        }
        String metaStr = metaJson.toString();

        // Enhanced JSON output with triangulation data
        StringBuilder enhancedJson = new StringBuilder();
        enhancedJson.append("{\"aps\":").append(json).append(",\"meta\":").append(metaStr).append("}");
        
        injectJs("Bounce.onScanResults(" + enhancedJson.toString() + ")");
    }

    private void updateApPosition(String bssid, int rssi) {
        // Simple position estimation based on RSSI and known AP locations
        // In a full implementation, this would use trilateration results to refine AP positions
        Trilateration.Point2D existing = apPositions.get(bssid);
        if (existing == null) {
            // Estimate position based on RSSI (rough initial estimate)
            double distance = Math.pow(10, (RSSI_1M - rssi) / (10.0 * PATH_LOSS_EXPONENT));
            // Place AP at estimated distance in a random direction (would be refined by trilateration)
            double angle = Math.random() * 2 * Math.PI;
            double x = distance * Math.cos(angle);
            double y = distance * Math.sin(angle);
            apPositions.put(bssid, new Trilateration.Point2D(x, y));
        }
    }

    private float estimateDistance(int rssi, int frequency) {
        float exp = (27.55f - (20f * (float) Math.log10(frequency > 0 ? frequency : 2400)) + Math.abs(rssi)) / 20f;
        return (float) Math.pow(10f, exp);
    }

    // Kalman-filtered RSSI state per BSSID for stable distance estimation
    private final Map<String, KalmanState> kalmanStates = new HashMap<>();
    private static final float KALMAN_Q = 0.005f;
    private static final float KALMAN_R = 25f;
    private static final float PATH_LOSS_EXPONENT = 2.8f;
    private static final float RSSI_1M = -40f;
    private static final float ZONE_IMMEDIATE = 2f;
    private static final float ZONE_NEAR = 10f;

    private static class KalmanState {
        float x; float p = 1f;
    }

    private String computeZone(float distance) {
        if (distance < ZONE_IMMEDIATE) return "immediate";
        if (distance < ZONE_NEAR) return "near";
        return "far";
    }

    private float kalmanDistance(String bssid, int rawRssi) {
        KalmanState ks = kalmanStates.get(bssid);
        if (ks == null) { ks = new KalmanState(); ks.x = rawRssi; kalmanStates.put(bssid, ks); }

        ks.p += KALMAN_Q;
        float k = ks.p / (ks.p + KALMAN_R);
        ks.x += k * (rawRssi - ks.x);
        ks.p *= (1f - k);

        float filteredRssi = ks.x;
        return (float) Math.pow(10, (RSSI_1M - filteredRssi) / (10f * PATH_LOSS_EXPONENT));
    }

    private String escapeJson(String s) {
        if (s == null || s.isEmpty()) return "---";
        return s.replace("\\", "\\\\").replace("\"", "\\\"").replace("\n", "\\n").replace("\r", "");
    }

    private WebView buildWebView() {
        WebView wv = new WebView(this);
        wv.setLayoutParams(new FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));
        // Enable hardware acceleration for WebGL/Three.js rendering
        wv.setLayerType(View.LAYER_TYPE_HARDWARE, null);
        WebSettings s = wv.getSettings();
        s.setJavaScriptEnabled(true);
        s.setDomStorageEnabled(true);
        s.setAllowFileAccess(true);
        s.setAllowFileAccessFromFileURLs(true);
        s.setAllowUniversalAccessFromFileURLs(true);
        s.setMediaPlaybackRequiresUserGesture(false);
        wv.setWebChromeClient(new WebChromeClient());
        wv.setWebViewClient(new WebViewClient() {
            public void onPageFinished(WebView v, String u) {
                v.postDelayed(() -> {
                    v.evaluateJavascript("androidBridge('onReady',{loaded:true})", null);
                    v.evaluateJavascript("UI.setInsets(40,34)", null);
                }, 2000);
            }
        });
        wv.addJavascriptInterface(new JsBridge(), "BounceBridge");
        wv.loadUrl("file:///android_asset/bounce.html");
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
        logo.setText("BOUNCE");
        logo.setTextSize(26f);
        logo.setTextColor(Color.parseColor("#FF6600"));
        logo.setTypeface(Typeface.DEFAULT_BOLD);
        logo.setGravity(Gravity.CENTER);

        TextView tag = new TextView(this);
        tag.setText("RSSI Kalman · v1.0.79");
        tag.setTextSize(11f);
        tag.setTextColor(Color.parseColor("#E8E8F0"));
        tag.setGravity(Gravity.CENTER);
        tagTextView = tag;

        h.addView(logo);
        h.addView(tag);
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

        row.addView(mkBtn("SCAN", "#00FF88", v -> {
            if (wifiManager != null) {
                boolean started = wifiManager.startScan();
                // Also push cached results immediately
                pushScanResults();
                if (!started) Toast.makeText(MainActivity.this, "Scan throttled — cached results shown", Toast.LENGTH_SHORT).show();
            }
        }));
        row.addView(mkBtn("+VEH", "#f97316", v -> injectJs("Bounce.showPlateInput()")));
        row.addView(mkBtn("BROADCAST", "#4488FF", v -> injectJs("Bounce.toggleBroadcast()")));
        row.addView(mkBtn("FLEET", "#a855f7", v -> injectJs("Bounce.toggleFleet()")));

        cleanBtn = mkBtn("CLEAN", "#FF6600", v -> {
            cleanMode = !cleanMode;
            cleanBtn.setText(cleanMode ? "SHOW" : "CLEAN");
            cleanBtn.setTextColor(Color.parseColor(cleanMode ? "#FF4466" : "#FF6600"));
            headerOverlay.setVisibility(cleanMode ? View.GONE : View.VISIBLE);
        });
        row.addView(cleanBtn);

        bar.addView(row);
        return bar;
    }

    private Button mkBtn(String t, String color, View.OnClickListener l) {
        Button b = new Button(this);
        b.setText(t); b.setTextSize(10f); b.setTextColor(Color.parseColor(color));
        b.setBackgroundColor(Color.parseColor("#1A1A2E"));
        b.setPadding(dp(8), dp(8), dp(8), dp(8));
        b.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        b.setOnClickListener(l); return b;
    }

    private void injectJs(String s) { try { if (webView != null) webView.evaluateJavascript(s, null); } catch (Exception ignored) {} }
    private int dp(int px) { return (int)(px * getResources().getDisplayMetrics().density); }

    @Override public void onBackPressed() { super.onBackPressed(); }
    @Override protected void onDestroy() {
        super.onDestroy();
        if (wakeLock != null && wakeLock.isHeld()) wakeLock.release();
        scanning = false;
        scanHandler.removeCallbacksAndMessages(null);
        try { unregisterReceiver(wifiScanReceiver); } catch (Exception ignored) {}
        if (broadcasting) stopP2pBroadcast();
        if (btScanning && bleScanner != null) {
            try { bleScanner.stopScan(btCallback); } catch (Exception ignored) {}
        }
        if (sensorManager != null && sensorHandler != null) {
            sensorManager.unregisterListener(sensorListener);
        }
        if (sensorThread != null) {
            sensorThread.quitSafely();
            sensorThread = null;
        }
        // Stop Bluetooth cleanup task
        if (btCleanupHandler != null && btCleanupRunnable != null) {
            btCleanupHandler.removeCallbacks(btCleanupRunnable);
        }
    }

    public class JsBridge {
        @JavascriptInterface
        public void onReady(String j) {
            runOnUiThread(() -> Toast.makeText(MainActivity.this, "Bounce v1.0.87 · Bluetooth 3D Spatial", Toast.LENGTH_SHORT).show());
        }

        @JavascriptInterface
        public void startBroadcast(String ssidCode) {
            runOnUiThread(() -> startP2pBroadcast(ssidCode));
        }

        @JavascriptInterface
        public void stopBroadcast() {
            runOnUiThread(() -> stopP2pBroadcast());
        }
        @JavascriptInterface
        public void refreshBroadcastSSID(String newSsid) {
            runOnUiThread(() -> refreshBroadcastSSID(newSsid));
        }
        @JavascriptInterface
        public void updateHeaderText(String text) {
            runOnUiThread(() -> {
                if (tagTextView != null) tagTextView.setText(text);
            });
        }
        
        @JavascriptInterface
        public void setTheoryMode(boolean enabled) {
            theoryMode = enabled;
            runOnUiThread(() -> {
                String mode = enabled ? "THEORY" : "LIVE";
                if (tagTextView != null) tagTextView.setText("Bluetooth 3D Spatial · v1.0.87 · " + mode);
                Toast.makeText(MainActivity.this, "Theory Mode: " + (enabled ? "ON" : "OFF"), Toast.LENGTH_SHORT).show();
            });
        }
        
        @JavascriptInterface
        public String getTrajectory(String addr) {
            List<BtPositionSample> traj = btTrajectories.get(addr);
            if (traj == null || traj.isEmpty()) return "[]";
            StringBuilder json = new StringBuilder("[");
            for (int i = 0; i < traj.size(); i++) {
                BtPositionSample s = traj.get(i);
                if (i > 0) json.append(",");
                json.append("{\"t\":").append(s.timestamp)
                    .append(",\"x\":" + String.format("%.2f", s.x))
                    .append(",\"y\":" + String.format("%.2f", s.y))
                    .append(",\"z\":" + String.format("%.2f", s.z))
                    .append(",\"rssi\":" + (int)s.rssi)
                    .append(",\"dist\":" + String.format("%.1f", s.distance))
                    .append(",\"azimuth\":" + String.format("%.1f", s.azimuth))
                    .append(",\"pitch\":" + String.format("%.1f", s.pitch) + "}");
            }
            json.append("]");
            return json.toString();
        }
        
        @JavascriptInterface
        public String getAllDevices() {
            StringBuilder json = new StringBuilder("[");
            boolean first = true;
            for (Map.Entry<String, BtDevice3D> entry : btDevices.entrySet()) {
                BtDevice3D d = entry.getValue();
                if (!first) json.append(",");
                first = false;
                json.append("{\"addr\":\"" + entry.getKey() + "\"")
                    .append(",\"name\":\"" + escapeJson(d.name) + "\"")
                    .append(",\"rssi\":" + (int)d.rssi)
                    .append(",\"dist\":" + String.format("%.1f", d.distance))
                    .append(",\"x\":" + String.format("%.2f", d.x))
                    .append(",\"y\":" + String.format("%.2f", d.y))
                    .append(",\"z\":" + String.format("%.2f", d.z))
                    .append(",\"brightness\":" + String.format("%.2f", d.brightness))
                    .append(",\"active\":" + d.active)
                    .append(",\"persist\":" + ((System.currentTimeMillis() - d.firstSeen) / 1000) + "}");
            }
            json.append("]");
            return json.toString();
        }

        @JavascriptInterface
        public void onUpdateSelected(String action) {
            runOnUiThread(() -> {
                if ("update".equals(action)) {
                    Toast.makeText(MainActivity.this, "Updating to v" + latestVersion + "...", Toast.LENGTH_SHORT).show();
                    prefs.edit().putInt("ignoreCount", 0).apply();
                } else if ("download".equals(action)) {
                    Toast.makeText(MainActivity.this, "Downloading Bounce v" + latestVersion + ".apk...", Toast.LENGTH_SHORT).show();
                    prefs.edit().putInt("ignoreCount", 0).apply();
                } else if ("ignore".equals(action)) {
                    prefs.edit().putInt("ignoreCount", 10).apply();
                    Toast.makeText(MainActivity.this, "Ignoring updates for 10 checks", Toast.LENGTH_SHORT).show();
                }
            });
        }
    }
}
