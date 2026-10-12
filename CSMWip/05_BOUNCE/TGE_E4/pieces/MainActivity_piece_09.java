                    v.evaluateJavascript("TGEBridge.onReady({loaded:true})", null);
                    v.evaluateJavascript("TGE.setInsets(40,34)", null);
                    injectJs("PrimeEngine.init(" + PrimeEngine.getPrimeTileData() + ")");
                    injectJs("WorldlineRenderer.init()");
                }, 500);
            }
        });
        wv.addJavascriptInterface(new JsBridge(), "TGEBridge");
        wv.loadUrl("file:///android_asset/tge_e2.html");
        return wv;
    }

    private LinearLayout buildHeader() {
        LinearLayout h = new LinearLayout(this);
        h.setOrientation(LinearLayout.VERTICAL);
        h.setGravity(Gravity.CENTER);
        h.setPadding(dp(16), dp(44), dp(16), dp(10));
        h.setBackgroundColor(Color.argb(190, 10, 10, 15));

        FrameLayout.LayoutParams hp = new FrameLayout.LayoutParams(
