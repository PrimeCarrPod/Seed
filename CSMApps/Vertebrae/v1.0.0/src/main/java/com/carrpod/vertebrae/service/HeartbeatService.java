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

import androidx.core.app.NotificationCompat;

import com.carrpod.vertebrae.R;
import com.carrpod.vertebrae.model.KilosSession;
import com.carrpod.vertebrae.network.WebSocketManager;
import com.carrpod.vertebrae.storage.SessionStorageManager;

public class HeartbeatService extends Service {

    private static final String TAG = "HeartbeatService";
    private static final long HEARTBEAT_INTERVAL = 15000L; // 15 seconds

    private SessionStorageManager storage;
    private WebSocketManager wsManager;
    private Handler handler = new Handler(Looper.getMainLooper());
    private Runnable heartbeatRunnable;

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
                    "vertebrae_heartbeat",
                    getString(R.string.heartbeat_channel_name),
                    NotificationManager.IMPORTANCE_MIN
            );
            channel.setDescription(getString(R.string.heartbeat_channel_desc));
            channel.setShowBadge(false);
            getSystemService(NotificationManager.class).createNotificationChannel(channel);
        }
    }

    private void startForegroundService() {
        Notification notification = new NotificationCompat.Builder(this, "vertebrae_heartbeat")
                .setContentTitle(getString(R.string.heartbeat_service_title))
                .setContentText(getString(R.string.heartbeat_service_running))
                .setSmallIcon(R.drawable.ic_vertebrae_foreground)
                .setOngoing(true)
                .setPriority(NotificationCompat.PRIORITY_MIN)
                .setCategory(NotificationCompat.CATEGORY_SERVICE)
                .build();

        startForeground(1002, notification);
    }

    @Override
    public int onStartCommand(Intent intent, int flags, int startId) {
        startHeartbeatLoop();
        return START_STICKY;
    }

    private void startHeartbeatLoop() {
        heartbeatRunnable = new Runnable() {
            @Override
            public void run() {
                sendHeartbeats();
                handler.postDelayed(this, HEARTBEAT_INTERVAL);
            }
        };
        handler.post(heartbeatRunnable);
    }

    private void sendHeartbeats() {
        for (KilosSession session : storage.loadAllSessions()) {
            if (session.getStatus() == KilosSession.SessionStatus.CONNECTED ||
                session.getStatus() == KilosSession.SessionStatus.HEARTBEAT_ACTIVE) {

                wsManager.sendHeartbeat(session.getId(), success -> {
                    KilosSession updated;
                    if (success) {
                        updated = session.copyWith(
                                KilosSession.SessionStatus.HEARTBEAT_ACTIVE,
                                null,
                                System.currentTimeMillis(),
                                null, null, null, null, null, null, null
                        );
                    } else {
                        updated = session.copyWith(
                                KilosSession.SessionStatus.HEARTBEAT_FAILED,
                                null, null, null, null, null, null, null, null, null
                        );
                    }
                    storage.saveSession(updated);
                });
            }
        }
    }

    public void forceHeartbeat(String sessionId) {
        KilosSession session = storage.loadSession(sessionId);
        if (session != null) {
            wsManager.sendHeartbeat(session.getId(), success -> {
                KilosSession updated;
                if (success) {
                    updated = session.copyWith(
                            KilosSession.SessionStatus.HEARTBEAT_ACTIVE,
                            null,
                            System.currentTimeMillis(),
                            null, null, null, null, null, null, null
                    );
                } else {
                    updated = session.copyWith(
                            KilosSession.SessionStatus.HEARTBEAT_FAILED,
                            null, null, null, null, null, null, null, null, null
                    );
                }
                storage.saveSession(updated);
            });
        }
    }

    @Override
    public void onDestroy() {
        super.onDestroy();
        if (heartbeatRunnable != null) {
            handler.removeCallbacks(heartbeatRunnable);
        }
    }

    @Override
    public IBinder onBind(Intent intent) {
        return null;
    }
}