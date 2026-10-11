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
