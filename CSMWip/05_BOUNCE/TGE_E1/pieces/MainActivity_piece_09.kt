            runOnUiThread {
                tagTextView?.text = "Prime Electron Worldline · v1.0.0-E1 · ${PrimeEngine.getPrimeCount()} primes loaded"
            }
        }
    }

    private fun startWorldlineSimulation() {
        scanHandler.postDelayed(object : Runnable {
            override fun run() {
                injectJs("WorldlineRenderer.step()")
                scanHandler.postDelayed(this, 16)
            }
        }, 16)
    }

    override fun onSensorChanged(event: SensorEvent) {
        val v = event.values
        if (event.sensor.type == Sensor.TYPE_ACCELEROMETER) {
            injectJs("WorldlineRenderer.updateMotion(${v[0]},${v[1]},${v[2]},WorldlineRenderer.gx,WorldlineRenderer.gy,WorldlineRenderer.gz)")
        } else if (event.sensor.type == Sensor.TYPE_GYROSCOPE) {
            injectJs("WorldlineRenderer.updateMotion(WorldlineRenderer.ax,WorldlineRenderer.ay,WorldlineRenderer.az,${v[0]},${v[1]},${v[2]})")
        }
    }

    override fun onAccuracyChanged(sensor: Sensor, accuracy: Int) {}

    override fun onResume() {
        super.onResume()
        if (accelerometer != null) sensorManager?.registerListener(this, accelerometer, SensorManager.SENSOR_DELAY_GAME)
        if (gyroscope != null) sensorManager?.registerListener(this, gyroscope, SensorManager.SENSOR_DELAY_GAME)
    }

    override fun onPause() {
        super.onPause()
        sensorManager?.unregisterListener(this)
