                    float roll = (float) Math.toDegrees(orientation[2]);
                    String orn = Math.abs(pitch) < 20 ? "flat" : Math.abs(pitch) > 60 ? "upright" : "tilted";

                    // Store phone orientation for Bluetooth 3D positioning with low-pass filter
                    if (firstSensorUpdate) {
                        smoothAzimuth = azimuth;
                        smoothPitch = pitch;
                        smoothRoll = roll;
                        firstSensorUpdate = false;
                    } else {
                        // Handle azimuth wrap-around (0/360 boundary)
                        float azDiff = azimuth - smoothAzimuth;
                        if (azDiff > 180) azDiff -= 360;
                        else if (azDiff < -180) azDiff += 360;
                        smoothAzimuth += SENSOR_ALPHA * azDiff;
                        if (smoothAzimuth >= 360) smoothAzimuth -= 360;
                        else if (smoothAzimuth < 0) smoothAzimuth += 360;
                        
                        smoothPitch += SENSOR_ALPHA * (pitch - smoothPitch);
                        smoothRoll += SENSOR_ALPHA * (roll - smoothRoll);
                    }
                    phoneAzimuth = smoothAzimuth;
                    phonePitch = smoothPitch;
                    phoneRoll = smoothRoll;

                    final float az = azimuth;
                    final float pt = pitch;
                    final float rl = roll;
                    final String or = orn;
                    if (webView != null) {
                        webView.post(() -> injectJs("Bounce.onCompass(" + az + "," + pt + "," + rl + ",'" + or + "')"));
                    }
                }

                // Send spatial movement packet every ~200ms
                if (now - lastMovementTime > 200 && webView != null) {
                    lastMovementTime = now;
                    final float mag = accelMagnitude;
                    final float gyX = gyroData[0], gyY = gyroData[1], gyZ = gyroData[2];
                    final int steps = stepCount;
                    final float alt = altitude;
                    final float pitchDeg = (float) Math.toDegrees(Math.asin(Math.max(-1f, Math.min(1f, accelData[1] / 9.81f))));

                    webView.post(() -> {
                        injectJs("Bounce.onMovement({mag:" + String.format("%.2f", mag)
                            + ",gx:" + String.format("%.3f", gyX) + ",gy:" + String.format("%.3f", gyY) + ",gz:" + String.format("%.3f", gyZ)
                            + ",steps:" + steps + ",alt:" + String.format("%.1f", alt)
                            + ",pitch:" + String.format("%.1f", pitchDeg) + ",gyro:" + hasGyro + "})");
                    });
                }
            }
        }
        public void onAccuracyChanged(Sensor sensor, int accuracy) {}
    };

    private long broadcastStartTime = 0;
    private boolean transitionInProgress = false;
    private Handler timeoutHandler = new Handler(Looper.getMainLooper());
    private Runnable transitionTimeout = null;

    private boolean preflightCheck() {
        if (p2pManager == null || p2pChannel == null) return false;
        if (wifiManager == null || !wifiManager.isWifiEnabled()) return false;
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M) {
            if (checkSelfPermission(Manifest.permission.ACCESS_FINE_LOCATION) != PackageManager.PERMISSION_GRANTED)
                return false;
        }
        return true;
    }

    private void armTransitionTimeout() {
        if (transitionTimeout != null) timeoutHandler.removeCallbacks(transitionTimeout);
        transitionTimeout = new Runnable() { public void run() {
            if (transitionInProgress) {
                transitionInProgress = false;
                injectJs("Bounce.onBroadcastStatus({status:'timeout'})");
            }
        }};
        timeoutHandler.postDelayed(transitionTimeout, 10000);
    }

    private void disarmTransitionTimeout() {
        if (transitionTimeout != null) {
            timeoutHandler.removeCallbacks(transitionTimeout);
            transitionTimeout = null;
        }
    }

    public void startP2pBroadcast(String ssidCode) {
        if (transitionInProgress) {
            injectJs("Bounce.onBroadcastStatus({status:'busy'})");
            return;
        }
        if (!preflightCheck()) {
            injectJs("Bounce.onBroadcastStatus({status:'not_ready',reason:'check_wifi_perms'})");
            return;
        }
        if (ssidCode == null || ssidCode.isEmpty()) {
            injectJs("Bounce.onBroadcastStatus({status:'invalid_code'})");
            return;
        }

