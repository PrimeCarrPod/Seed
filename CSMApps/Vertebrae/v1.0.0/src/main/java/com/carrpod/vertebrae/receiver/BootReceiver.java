package com.carrpod.vertebrae.receiver;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

import com.carrpod.vertebrae.service.HeartbeatService;
import com.carrpod.vertebrae.service.SessionManagerService;
import com.carrpod.vertebrae.service.FloatingWindowService;
import com.carrpod.vertebrae.comm.InterSessionServer;

public class BootReceiver extends BroadcastReceiver {

    @Override
    public void onReceive(Context context, Intent intent) {
        if (intent.getAction() == null) return;

        if (intent.getAction().equals(Intent.ACTION_BOOT_COMPLETED) ||
            "android.intent.action.QUICKBOOT_POWERON".equals(intent.getAction())) {

            Log.d("VertebraeBoot", "Boot completed, starting services");

            Intent[] services = {
                new Intent(context, SessionManagerService.class),
                new Intent(context, HeartbeatService.class),
                new Intent(context, FloatingWindowService.class),
                new Intent(context, InterSessionServer.class)
            };

            for (Intent serviceIntent : services) {
                if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.O) {
                    context.startForegroundService(serviceIntent);
                } else {
                    context.startService(serviceIntent);
                }
            }
        }
    }
}