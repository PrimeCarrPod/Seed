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

