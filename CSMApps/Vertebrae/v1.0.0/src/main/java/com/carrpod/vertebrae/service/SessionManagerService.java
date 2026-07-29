package com.carrpod.vertebrae.service;

import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.app.Service;
import android.content.Context;
import android.content.Intent;
import android.os.Build;
import android.os.Handler;
import android.os.IBinder;
import android.os.Looper;
import android.util.Log;

import com.carrpod.vertebrae.R;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.network.WebSocketManager;
import com.carrpod.vertebrae.storage.SessionStorageManager;

public class SessionManagerService extends Service {

    private static final String TAG = "SessionManagerService";

    private SessionStorageManager storage;
    private WebSocketManager wsManager;
    private Handler handler = new Handler(Looper.getMainLooper());
    private Runnable reconnectRunnable;

    @Override
    public void onCreate() {
        super.onCreate();
        storage = SessionStorageManager.getInstance();
        wsManager = WebSocketManager.getInstance();

        createNotificationChannel();
        startForegroundService();
    }

    private void createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            NotificationChannel channel = new NotificationChannel(
                    "vertebrae_sessions",
                    getString(R.string.notification_channel_name),
                    NotificationManager.IMPORTANCE_LOW
            );
            channel.setDescription(getString(R.string.notification_channel_desc));
            channel.setShowBadge(false);
            getSystemService(NotificationManager.class).createNotificationChannel(channel);
        }
    }

    private void startForegroundService() {
        Notification notification = new Notification.Builder(this, "vertebrae_sessions")
                .setContentTitle(getString(R.string.app_name))
                .setContentText(getString(R.string.service_running))
                .setSmallIcon(R.drawable.ic_vertebrae_foreground)
                .setOngoing(true)
                .setPriority(Notification.PRIORITY_LOW)
                .setCategory(Notification.CATEGORY_SERVICE)
                .build();

        startForeground(1001, notification);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        restoreSessions();
        return START_STICKY;
    }

    private void restoreSessions() {
        for (KilosSession session : storage.loadAllSessions()) {
            if (session.isAutoReconnect() && session.getStatus() != KilosSession.SessionStatus.DISCONNECTED) {
                reconnectSession(session);
            }
        }

        reconnectRunnable = new Runnable() {
            @Override
            public void run() {
                checkSessions();
                handler.postDelayed(this, 30000);
            }
        };
        handler.post(reconnectRunnable);
    }

    private void checkSessions() {
        for (KilosSession session : storage.loadAllSessions()) {
            switch (session.getStatus()) {
                case CONNECTED:
                case HEARTBEAT_ACTIVE:
                    if (System.currentTimeMillis() - session.getLastHeartbeatAt() > session.getHeartbeatIntervalSeconds() * 2000L) {
                        wsManager.disconnectSession(session.getId());
                        reconnectSession(session);
                    }
                    break;
                case HEARTBEAT_FAILED:
                case ERROR:
                    if (session.isAutoReconnect()) {
                        reconnectSession(session);
                    }
                    break;
            }
        }
    }

    private void reconnectSession(KilosSession session) {
        KilosSession updated = session.copyWith(
            KilosSession.SessionStatus.RECONNECTING,
            null, null, null, null, null, null, null, null, null
        );
        storage.saveSession(updated);
        wsManager.connectSession(updated);
    }

    public void connectSession(KilosSession session) {
        wsManager.connectSession(session);
    }

    public void disconnectSession(String sessionId) {
        wsManager.disconnectSession(sessionId);
    }

    public void updateSession(KilosSession session) {
        storage.saveSession(session);
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (reconnectRunnable != null) {
            handler.removeCallbacks(reconnectRunnable);
        }
        wsManager.disconnectAll();
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}