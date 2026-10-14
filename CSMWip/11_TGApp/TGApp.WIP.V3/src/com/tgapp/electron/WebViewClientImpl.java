package com.tgapp.electron;

import android.webkit.WebView;
import android.webkit.WebViewClient;

public class WebViewClientImpl extends WebViewClient {
    private MainActivity activity;
    public WebViewClientImpl(MainActivity activity) {
        this.activity = activity;
    }
    @Override
    public void onPageFinished(WebView view, String url) {
        view.postDelayed(new PageFinishedRunnable(activity), 500);
    }
}
