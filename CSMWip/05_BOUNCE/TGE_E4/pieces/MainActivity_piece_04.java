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

