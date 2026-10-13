        scanHandler.postDelayed(new Runnable() {
            @Override
            public void run() {
                injectJs("WorldlineRenderer.step()");
                scanHandler.postDelayed(this, 16);
            }
        }, 16);
    }

    @Override
    public void onSensorChanged(SensorEvent event) {
        float[] v = event.values;
        if (event.sensor.getType() == Sensor.TYPE_ACCELEROMETER) {
            injectJs("WorldlineRenderer.updateMotion(" + v[0] + "," + v[1] + "," + v[2] + ",WorldlineRenderer.gx,WorldlineRenderer.gy,WorldlineRenderer.gz)");
        } else if (event.sensor.getType() == Sensor.TYPE_GYROSCOPE) {
            injectJs("WorldlineRenderer.updateMotion(WorldlineRenderer.ax,WorldlineRenderer.ay,WorldlineRenderer.az," + v[0] + "," + v[1] + "," + v[2] + ")");
        }
    }

    @Override
