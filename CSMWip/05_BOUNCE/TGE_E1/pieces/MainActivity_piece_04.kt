                .or(View.SYSTEM_UI_FLAG_LAYOUT_FULLSCREEN)
                .or(View.SYSTEM_UI_FLAG_HIDE_NAVIGATION)
                .or(View.SYSTEM_UI_FLAG_FULLSCREEN)
                .or(View.SYSTEM_UI_FLAG_IMMERSIVE_STICKY)
            window.decorView.systemUiVisibility = flags
        }
        window.addFlags(WindowManager.LayoutParams.FLAG_KEEP_SCREEN_ON)
    }

    private fun buildWebView(): WebView {
        val wv = WebView(this)
        wv.layoutParams = FrameLayout.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
        wv.setLayerType(View.LAYER_TYPE_HARDWARE, null)

        val s = wv.settings
        s.javaScriptEnabled = true
        s.domStorageEnabled = true
        s.setAllowFileAccess(true)
        s.setAllowFileAccessFromFileURLs(true)
        s.setAllowUniversalAccessFromFileURLs(true)
        s.mediaPlaybackRequiresUserGesture = false
        s.mixedContentMode = WebSettings.MIXED_CONTENT_ALWAYS_ALLOW

        wv.webChromeClient = WebChromeClient()
        wv.webViewClient = object : WebViewClient() {
            override fun onPageFinished(v: WebView, u: String) {
                v.postDelayed({
                    v.evaluateJavascript("TGEBridge.onReady({loaded:true})", null)
                    v.evaluateJavascript("TGE.setInsets(40,34)", null)
                    injectJs("PrimeEngine.init(${PrimeEngine.getPrimeTileData()})")
                    injectJs("WorldlineRenderer.init()")
                }, 500)
            }
        }
        wv.addJavascriptInterface(JsBridge(), "TGEBridge")
