        root.setBackgroundColor(Color.parseColor("#0A0A0F"));

        webView = buildWebView();
        staticWebView = webView;
        root.addView(webView);

        headerOverlay = buildHeader();
        root.addView(headerOverlay);

        controlBar = buildControlBar();
        root.addView(controlBar);

        setContentView(root);

        prefs = getSharedPreferences("TGE_E2_Prefs", MODE_PRIVATE);
        restoreState();

        initializePrimeEngine();
        startWorldlineSimulation();
    }
