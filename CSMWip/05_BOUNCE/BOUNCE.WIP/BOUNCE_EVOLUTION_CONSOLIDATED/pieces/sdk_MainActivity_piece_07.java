            // Calculate 3D position relative to phone using phone orientation
            float relAzimuth = phoneAzimuth;
            float relPitch = phonePitch;
            
            // Convert to 3D coordinates (phone at origin, facing azimuth, tilted pitch)
            float horizontalDist = distance * (float) Math.cos(Math.toRadians(relPitch));
            device.x = horizontalDist * (float) Math.sin(Math.toRadians(relAzimuth));
            device.y = horizontalDist * (float) Math.cos(Math.toRadians(relAzimuth));
            device.z = distance * (float) Math.sin(Math.toRadians(relPitch)); // Positive = above, negative = below
            
            // Add to trajectory
            device.trajectory.add(new BtPositionSample(now, device.x, device.y, device.z, filteredRssi, distance, phoneAzimuth, phonePitch));
            if (device.trajectory.size() > 50) device.trajectory.remove(0);
            
            // Also store in global trajectory map for theory view
            List<BtPositionSample> traj = btTrajectories.get(addr);
            if (traj == null) { traj = new ArrayList<>(); btTrajectories.put(addr, traj); }
            traj.add(new BtPositionSample(now, device.x, device.y, device.z, filteredRssi, distance, phoneAzimuth, phonePitch));
            if (traj.size() > 100) traj.remove(0);

            // Capture values for lambda (must be final or effectively final)
            final float fx = device.x;
            final float fy = device.y;
            final float fz = device.z;
            final float fbrightness = device.brightness;
            final long fpersist = (now - device.firstSeen) / 1000;
            final float fazimuth = phoneAzimuth;
            final float fpitch = phonePitch;

            webView.post(() -> {
                // Call both handlers for compatibility: onBtResult for UI list, onBtResult3D for 3D
                String json3D = "{\"name\":\"" + escapeJson(name) + "\",\"addr\":\"" + addr
                    + "\",\"rssi\":" + rawRssi + ",\"filtRssi\":" + String.format("%.1f", filteredRssi)
                    + "\",\"dist\":" + String.format("%.1f", distance)
                    + "\",\"x\":" + String.format("%.2f", fx)
                    + "\",\"y\":" + String.format("%.2f", fy)
                    + "\",\"z\":" + String.format("%.2f", fz)
                    + "\",\"brightness\":" + String.format("%.2f", fbrightness)
                    + "\",\"active\":true"
                    + "\",\"persist\":" + fpersist
                    + "\",\"azimuth\":" + String.format("%.1f", fazimuth)
                    + "\",\"pitch\":" + String.format("%.1f", fpitch) + "}";
                injectJs("Bounce.onBtResult3D(" + json3D + ")");
                
                String jsonUI = "{\"name\":\"" + escapeJson(name) + "\",\"addr\":\"" + addr
                    + "\",\"rssi\":" + rawRssi + ",\"dist\":" + String.format("%.1f", distance) + "}";
                injectJs("Bounce.onBtResult(" + jsonUI + ")");
            });
        }
        public void onScanFailed(int errorCode) {
            injectJs("Bounce.onBtStatus({status:'failed',code:" + errorCode + "})");
        }
    };

    private void startSensors() {
        sensorManager = (SensorManager) getSystemService(SENSOR_SERVICE);
        if (sensorManager == null) return;

        sensorThread = new HandlerThread("BounceSpatialThread");
        sensorThread.start();
        sensorHandler = new Handler(sensorThread.getLooper());

        Sensor accel = sensorManager.getDefaultSensor(Sensor.TYPE_ACCELEROMETER);
        Sensor magnet = sensorManager.getDefaultSensor(Sensor.TYPE_MAGNETIC_FIELD);
        Sensor gyro = sensorManager.getDefaultSensor(Sensor.TYPE_GYROSCOPE);
        Sensor step = sensorManager.getDefaultSensor(Sensor.TYPE_STEP_DETECTOR);

        if (accel != null) sensorManager.registerListener(sensorListener, accel, SensorManager.SENSOR_DELAY_GAME, sensorHandler);
        if (magnet != null) sensorManager.registerListener(sensorListener, magnet, SensorManager.SENSOR_DELAY_GAME, sensorHandler);
        if (gyro != null) { sensorManager.registerListener(sensorListener, gyro, SensorManager.SENSOR_DELAY_GAME, sensorHandler); hasGyro = true; }
        if (step != null) sensorManager.registerListener(sensorListener, step, SensorManager.SENSOR_DELAY_FASTEST, sensorHandler);

        lastMovementTime = System.currentTimeMillis();
        Toast.makeText(this, "Spatial: accel+mag" + (hasGyro ? "+gyro" : "") + "+step", Toast.LENGTH_SHORT).show();
    }

    private final SensorEventListener sensorListener = new SensorEventListener() {
        public void onSensorChanged(SensorEvent event) {
            int type = event.sensor.getType();
            if (type == Sensor.TYPE_ACCELEROMETER) {
                System.arraycopy(event.values, 0, accelData, 0, 3);
                hasAccel = true;
                accelMagnitude = (float) Math.sqrt(event.values[0]*event.values[0] + event.values[1]*event.values[1] + event.values[2]*event.values[2]);
            } else if (type == Sensor.TYPE_MAGNETIC_FIELD) {
                System.arraycopy(event.values, 0, magnetData, 0, 3);
                hasMagnet = true;
            } else if (type == Sensor.TYPE_GYROSCOPE) {
                System.arraycopy(event.values, 0, gyroData, 0, 3);
                hasGyro = true;
            } else if (type == Sensor.TYPE_STEP_DETECTOR) {
                stepCount++;
            }

            long now = System.currentTimeMillis();
            if (hasAccel) {
                float[] R = new float[9], I = new float[9];
                if (hasMagnet && SensorManager.getRotationMatrix(R, I, accelData, magnetData)) {
                    float[] orientation = new float[3];
                    SensorManager.getOrientation(R, orientation);
                    float azimuth = (float) Math.toDegrees(orientation[0]);
                    if (azimuth < 0) azimuth += 360;
                    float pitch = (float) Math.toDegrees(orientation[1]);
