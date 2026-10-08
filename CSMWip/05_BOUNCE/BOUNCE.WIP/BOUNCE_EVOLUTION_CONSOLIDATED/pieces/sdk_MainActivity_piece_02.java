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
