package com.carrpod.vertebrae.service;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.graphics.PixelFormat;
import android.os.Build;
import android.os.IBinder;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.webkit.JavascriptInterface;
import android.webkit.WebChromeClient;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import com.carrpod.vertebrae.R;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.storage.SessionStorageManager;

import java.util.HashMap;
import java.util.Map;

public class FloatingWindowService extends Service {

    private static final String TAG = "FloatingWindowService";

    private SessionStorageManager storage;
    private WindowManager windowManager;
    private final Map<String, FloatingWindow> windows = new HashMap<>();

    @Override
    public void onCreate() {
        super.onCreate();
        storage = SessionStorageManager.getInstance();
        windowManager = (WindowManager) getSystemService(Context.WINDOW_SERVICE);

        createNotificationChannel();
        startForegroundService();
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    "vertebrae_floating",
                    getString(R.string.floating_channel_name),
                    NotificationManager.IMPORTANCE_LOW
            );
            channel.setDescription(getString(R.string.floating_channel_desc));
            channel.setShowBadge(false);
            getSystemService(NotificationManager.class).createNotificationChannel(channel);
        }
    }

    private void startForegroundService() {
        Notification notification = new Notification.Builder(this, "vertebrae_floating")
                .setContentTitle(getString(R.string.app_name))
                .setContentText(getString(R.string.floating_windows_active))
                .setSmallIcon(R.drawable.ic_vertebrae_foreground)
                .setOngoing(true)
                .setPriority(Notification.PRIORITY_LOW)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build();

        startForeground(1003, notification);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent == null || intent.getAction() == null) {
            return START_STICKY;
        }

        String action = intent.getAction();
        String sessionId = intent.getStringExtra("session_id");

        if (sessionId == null) return START_STICKY;

        switch (action) {
            case "CREATE_WINDOW":
                createWindow(sessionId);
                break;
            case "CLOSE_WINDOW":
                closeWindow(sessionId);
                break;
            case "UPDATE_WINDOW":
                int width = intent.getIntExtra("width", -1);
                int height = intent.getIntExtra("height", -1);
                if (width > 0 && height > 0) {
                    FloatingWindow window = windows.get(sessionId);
                    if (window != null) {
                        window.updateSize(width, height);
                    }
                }
                break;
        }
        return START_STICKY;
    }

    private void createWindow(String sessionId) {
        if (windows.containsKey(sessionId)) {
            return;
        }

        final KilosSession session = storage.loadSession(sessionId);
        if (session == null) return;

        LinearLayout rootView = new LinearLayout(this);
        rootView.setOrientation(LinearLayout.VERTICAL);
        rootView.setBackgroundColor(getColor(R.color.surface));
        rootView.setLayoutParams(new FrameLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

        // Header
        LinearLayout header = new LinearLayout(this);
        header.setId(R.id.window_header);
        header.setOrientation(LinearLayout.HORIZONTAL);
        header.setGravity(Gravity.CENTER_VERTICAL);
        header.setBackgroundColor(getColor(R.color.surface_elevated));
        header.setPadding(12, 0, 12, 0);
        LinearLayout.LayoutParams headerParams = new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 40);
        header.setLayoutParams(headerParams);

        TextView title = new TextView(this);
        title.setId(R.id.window_title);
        title.setText(session.getDisplayName());
        title.setTextColor(getColor(R.color.on_surface));
        title.setTextSize(14);
        title.setTypeface(null, android.graphics.Typeface.BOLD);
        title.setEllipsize(android.text.TextUtils.TruncateAt.END);
        title.setMaxLines(1);
        LinearLayout.LayoutParams titleParams = new LinearLayout.LayoutParams(
                0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f);
        title.setLayoutParams(titleParams);
        header.addView(title);

        addWindowButton(header, "−", "Minimize", v -> minimizeWindow(sessionId));
        addWindowButton(header, "□", "Maximize", v -> maximizeWindow(sessionId));
        addWindowButton(header, "×", "Close", v -> closeWindow(sessionId));

        rootView.addView(header);

        // WebView container
        FrameLayout webViewContainer = new FrameLayout(this);
        webViewContainer.setId(R.id.webview_container);
        webViewContainer.setLayoutParams(new LinearLayout.LayoutParams(
                ViewGroup.LayoutParams.MATCH_PARENT, 0, 1f));
        rootView.addView(webViewContainer);

        // Resize handle
        ImageView resizeHandle = new ImageView(this);
        resizeHandle.setId(R.id.resize_handle);
        resizeHandle.setImageResource(R.drawable.ic_resize_handle);
        resizeHandle.setAlpha(0.3f);
        resizeHandle.setPadding(4, 4, 4, 4);
        LinearLayout.LayoutParams handleParams = new LinearLayout.LayoutParams(24, 24);
        handleParams.gravity = Gravity.BOTTOM | Gravity.END;
        handleParams.setMargins(0, 0, 4, 4);
        resizeHandle.setLayoutParams(handleParams);
        rootView.addView(resizeHandle);

        // Create WebView
        WebView webView = new WebView(this);
        webView.setLayoutParams(new FrameLayout.LayoutParams(
                FrameLayout.LayoutParams.MATCH_PARENT,
                FrameLayout.LayoutParams.MATCH_PARENT));
        WebSettings settings = webView.getSettings();
        settings.setJavaScriptEnabled(true);
        settings.setDomStorageEnabled(true);
        settings.setAllowFileAccess(true);
        settings.setAllowFileAccessFromFileURLs(true);
        settings.setAllowUniversalAccessFromFileURLs(true);
        settings.setUserAgentString("Mozilla/5.0 (Linux; Android 13) Vertebrae/0.3 KiloAI-Client");

        // Add JavaScript interface for native communication
        webView.addJavascriptInterface(new VertebraeBridge(session.getId()), "VertebraeBridge");

        webView.setWebViewClient(new WebViewClient() {
            @Override
            public boolean shouldOverrideUrlLoading(WebView view, String url) {
                return false;
            }
        });
        webView.setWebChromeClient(new WebChromeClient());
        webView.loadUrl("file:///android_asset/html/terminal.html?sessionId=" + session.getSessionId());

        // Window parameters
        WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                session.getWindowWidth() > 0 ? session.getWindowWidth() : 800,
                session.getWindowHeight() > 0 ? session.getWindowHeight() : 600,
                Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                        ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                        : WindowManager.LayoutParams.TYPE_PHONE,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                        | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                        | WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
                PixelFormat.TRANSLUCENT);
        params.gravity = Gravity.TOP | Gravity.START;
        params.x = (int) session.getWindowX();
        params.y = (int) session.getWindowY();

        windowManager.addView(rootView, params);

        FloatingWindow window = new FloatingWindow(session, rootView, params, webViewContainer);
        windows.put(session.getId(), window);

        // Setup drag and resize
        window.setupTouchListeners();
        window.setupResizeListener();
    }

    private void addWindowButton(LinearLayout parent, String text, String desc, View.OnClickListener listener) {
        android.widget.Button btn = new android.widget.Button(this);
        btn.setText(text);
        btn.setTextSize(14);
        btn.setTextColor(getColor(R.color.on_surface));
        btn.setBackgroundColor(getColor(R.color.transparent));
        btn.setContentDescription(desc);
        btn.setLayoutParams(new LinearLayout.LayoutParams(32, 32));
        btn.setOnClickListener(listener);
        parent.addView(btn);
    }

    private void closeWindow(String sessionId) {
        FloatingWindow window = windows.remove(sessionId);
        if (window != null) window.close();
    }

    private void minimizeWindow(String sessionId) {
        FloatingWindow window = windows.get(sessionId);
        if (window != null) window.minimize();
    }

    private void maximizeWindow(String sessionId) {
        FloatingWindow window = windows.get(sessionId);
        if (window != null) window.maximize();
    }

    @Override
    public void onDestroy() {
        for (FloatingWindow window : windows.values()) {
            window.close();
        }
        windows.clear();
        super.onDestroy();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }

    // FloatingWindow inner class
private class FloatingWindow {
        final KilosSession session;
        final View rootView;
        final WindowManager.LayoutParams params;
        final View webViewContainer;
        int initialX, initialY;
        float initialTouchX, initialTouchY;
        int initialWidth, initialHeight;

        FloatingWindow(KilosSession session, View rootView, WindowManager.LayoutParams params, View webViewContainer) {
            this.session = session;
            this.rootView = rootView;
            this.params = params;
            this.webViewContainer = webViewContainer;

            setupTouchListeners();
            setupResizeListener();
        }

        private void setupTouchListeners() {
            View header = rootView.findViewById(R.id.window_header);
            header.setOnTouchListener((v, event) -> {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        initialX = params.x;
                        initialY = params.y;
                        initialTouchX = event.getRawX();
                        initialTouchY = event.getRawY();
                        bringToFront();
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        params.x = initialX + (int) (event.getRawX() - initialTouchX);
                        params.y = initialY + (int) (event.getRawY() - initialTouchY);
                        windowManager.updateViewLayout(rootView, params);
                        return true;
                    case MotionEvent.ACTION_UP:
                        savePosition();
                        return true;
                }
                return false;
            });
        }

        private void bringToFront() {
            params.flags |= WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;
            windowManager.updateViewLayout(rootView, params);
            params.flags &= ~WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE;
            windowManager.updateViewLayout(rootView, params);
        }

        private void savePosition() {
            session.setWindowX(params.x);
            session.setWindowY(params.y);
            session.setWindowWidth(params.width);
            session.setWindowHeight(params.height);
            storage.saveSession(session);
        }

        void updateSize(int width, int height) {
            params.width = width;
            params.height = height;
            windowManager.updateViewLayout(rootView, params);
            savePosition();
        }

        void minimize() {
            View webViewContainer = rootView.findViewById(R.id.webview_container);
            webViewContainer.setVisibility(View.GONE);
        }

        void maximize() {
            DisplayMetrics metrics = new DisplayMetrics();
            windowManager.getDefaultDisplay().getMetrics(metrics);
            params.x = 0;
            params.y = 0;
            params.width = metrics.widthPixels;
            params.height = metrics.heightPixels;
            windowManager.updateViewLayout(rootView, params);
            savePosition();
        }

        void close() {
            try {
                windowManager.removeView(rootView);
            } catch (Exception e) {
                Log.e(TAG, "Close error", e);
            }
        }

        private void setupResizeListener() {
            View resizeHandle = rootView.findViewById(R.id.resize_handle);
            if (resizeHandle != null) {
                resizeHandle.setOnTouchListener((v, event) -> {
                    switch (event.getAction()) {
                        case MotionEvent.ACTION_DOWN:
                            initialWidth = params.width;
                            initialHeight = params.height;
                            initialTouchX = event.getRawX();
                            initialTouchY = event.getRawY();
                            return true;
                        case MotionEvent.ACTION_MOVE:
                            params.width = Math.max(300, initialWidth + (int) (event.getRawX() - initialTouchX));
                            params.height = Math.max(200, initialHeight + (int) (event.getRawY() - initialTouchY));
                            windowManager.updateViewLayout(rootView, params);
                            return true;
                        case MotionEvent.ACTION_UP:
                            savePosition();
                            return true;
                    }
                    return false;
                });
            }
        }
    }

    // JavaScript interface for WebView <-> Native communication
    private class VertebraeBridge {
        private final String sessionId;

        VertebraeBridge(String sessionId) {
            this.sessionId = sessionId;
        }

        @JavascriptInterface
        public void postMessage(String message) {
            Log.d(TAG, "JS Message: " + message);
        }

        @JavascriptInterface
        public void onTerminalReady(String sessionId) {
            Log.d(TAG, "Terminal ready for session: " + sessionId);
        }

        @JavascriptInterface
        public void sendInput(String data) {
            Log.d(TAG, "Input for session " + sessionId + ": " + data);
        }

        @JavascriptInterface
        public void sendControlChar(char c) {
            Log.d(TAG, "Control char for session " + sessionId + ": " + c);
        }
    }

    // Static helpers
    public static void createWindow(Context context, String sessionId) {
        Intent intent = new Intent(context, FloatingWindowService.class);
        intent.setAction("CREATE_WINDOW");
        intent.putExtra("session_id", sessionId);
        context.startForegroundService(intent);
    }

    public static void closeWindow(Context context, String sessionId) {
        Intent intent = new Intent(context, FloatingWindowService.class);
        intent.setAction("CLOSE_WINDOW");
        intent.putExtra("session_id", sessionId);
        context.startForegroundService(intent);
    }

    public static void updateWindow(Context context, String sessionId, int width, int height) {
        Intent intent = new Intent(context, FloatingWindowService.class);
        intent.setAction("UPDATE_WINDOW");
        intent.putExtra("session_id", sessionId);
        intent.putExtra("width", width);
        intent.putExtra("height", height);
        context.startForegroundService(intent);
    }
}