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
