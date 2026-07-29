package com.carrpod.vertebrae.service;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.graphics.PixelFormat;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.DisplayMetrics;
import android.util.Log;
import android.view.Gravity;
import android.view.MotionEvent;
import android.view.View;
import android.view.ViewGroup;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.FrameLayout;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.core.app.NotificationCompat;

import com.carrpod.vertebrae.R;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.storage.SessionStorageManager;

public class FloatingWindowService extends Service {

    private static final String TAG = "FloatingWindowService";
    private SessionStorageManager storage;
    private WindowManager windowManager;
    private final Map<String, FloatingWindow> windows = new ConcurrentHashMap<>();

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
        Notification notification = new NotificationCompat.Builder(this, "vertebrae_floating")
                .setContentTitle(getString(R.string.app_name))
                .setContentText(getString(R.string.floating_windows_active))
                .setSmallIcon(R.drawable.ic_vertebrae_foreground)
                .setOngoing(true)
                .setPriority(NotificationCompat.PRIORITY_LOW)
                .setCategory(NotificationCompat.CATEGORY_SERVICE)
                .build();
        startForeground(1003, notification);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        if (intent == null) return START_STICKY;

        String action = intent.getAction();
        String sessionId = intent.getStringExtra("session_id");

        if (sessionId == null) return START_STICKY;

        if ("CREATE_WINDOW".equals(action)) {
            createWindow(sessionId);
        } else if ("CLOSE_WINDOW".equals(action)) {
            closeWindow(sessionId);
        } else if ("UPDATE_WINDOW".equals(action)) {
            int width = intent.getIntExtra("width", -1);
            int height = intent.getIntExtra("height", -1);
            if (width > 0 && height > 0) {
                FloatingWindow window = windows.get(sessionId);
                if (window != null) {
                    window.updateSize(width, height);
                }
            }
        }
        return START_STICKY;
    }

    private void createWindow(String sessionId) {
        if (windows.containsKey(sessionId)) return;

        storage.loadSession(sessionId).await(session -> {
            if (session == null) return;

            LinearLayout rootView = new LinearLayout(this);
            rootView.setOrientation(LinearLayout.VERTICAL);
            rootView.setBackgroundColor(getColor(R.color.surface));
            rootView.setLayoutParams(new FrameLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT));

            // Header
            LinearLayout header = new LinearLayout(this);
            header.setId(View.generateViewId());
            header.setBackgroundColor(getColor(R.color.surface_elevated));
            header.setPadding(12, 0, 12, 0);
            header.setGravity(Gravity.CENTER_VERTICAL);
            header.setLayoutParams(new LinearLayout.LayoutParams(
                    ViewGroup.LayoutParams.MATCH_PARENT, 40));

            TextView title = new TextView(this);
            title.setText(session.getDisplayName());
            title.setTextColor(getColor(R.color.on_surface));
            title.setTextSize(14);
            title.setTypeface(null, android.graphics.Typeface.BOLD);
            title.setEllipsize(TextUtils.TruncateAt.END);
            title.setMaxLines(1);
            title.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
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
            resizeHandle.setLayoutParams(new LinearLayout.LayoutParams(
                    24, 24, Gravity.END | Gravity.BOTTOM));
            resizeHandle.setPadding(4, 4, 4, 4);
            rootView.addView(resizeHandle);

            WindowManager.LayoutParams params = new WindowManager.LayoutParams(
                    session.getWindowWidth(),
                    session.getWindowHeight(),
                    Build.VERSION.SDK_INT >= Build.VERSION_CODES.O
                            ? WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                            : WindowManager.LayoutParams.TYPE_PHONE,
                    WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                            | WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                            | WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
                    PixelFormat.TRANSLUCENT
            );
            params.gravity = Gravity.TOP | Gravity.START;
            params.x = (int) session.getWindowX();
            params.y = (int) session.getWindowY();

            windowManager.addView(rootView, params);

            FloatingWindow window = new FloatingWindow(session, rootView, params, header, webViewContainer);
            windows.put(sessionId, window);
        });
    }

    private void addWindowButton(LinearLayout parent, String text, String desc, View.OnClickListener listener) {
        Button btn = new Button(this);
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
        private final KilosSession session;
        private final View rootView;
        private final WindowManager.LayoutParams params;
        private final View header;
        private final View webViewContainer;
        private int initialX, initialY;
        private float initialTouchX, initialTouchY;

        FloatingWindow(KilosSession session, View rootView, WindowManager.LayoutParams params,
                       View header, View webViewContainer) {
            this.session = session;
            this.rootView = rootView;
            this.params = params;
            this.header = header;
            this.webViewContainer = webViewContainer;

            setupTouchListeners();
            setupResizeListener();
        }

        private void setupTouchListeners() {
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

        private void setupResizeListener() {
            rootView.findViewById(R.id.resize_handle).setOnTouchListener((v, event) -> {
                switch (event.getAction()) {
                    case MotionEvent.ACTION_DOWN:
                        initialX = params.width;
                        initialY = params.height;
                        initialTouchX = event.getRawX();
                        initialTouchY = event.getRawY();
                        return true;
                    case MotionEvent.ACTION_MOVE:
                        params.width = Math.max(300, initialX + (int) (event.getRawX() - initialTouchX));
                        params.height = Math.max(200, initialY + (int) (event.getRawY() - initialTouchY));
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