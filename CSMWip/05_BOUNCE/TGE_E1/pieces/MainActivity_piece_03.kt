
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setupFullscreen()

        val root = InsetFrameLayout(this)
        root.setBackgroundColor(Color.parseColor("#0A0A0F"))

        webView = buildWebView()
        root.addView(webView!!)

        headerOverlay = buildHeader()
        root.addView(headerOverlay!!)

        controlBar = buildControlBar()
        root.addView(controlBar!!)

        setContentView(root)

        prefs = getSharedPreferences("TGE_E1_Prefs", MODE_PRIVATE)
        restoreState()

        initializePrimeEngine()
        startWorldlineSimulation()
    }

    private fun setupFullscreen() {
        requestWindowFeature(Window.FEATURE_NO_TITLE)
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.R) {
            window.setDecorFitsSystemWindows(false)
            window.insetsController?.hide(WindowInsets.Type.statusBars())
            window.insetsController?.hide(WindowInsets.Type.navigationBars())
        } else {
            val flags = View.SYSTEM_UI_FLAG_LAYOUT_STABLE
                .or(View.SYSTEM_UI_FLAG_LAYOUT_HIDE_NAVIGATION)
