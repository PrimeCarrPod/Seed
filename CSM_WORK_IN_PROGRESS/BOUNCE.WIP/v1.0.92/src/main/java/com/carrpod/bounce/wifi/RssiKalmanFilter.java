package com.carrpod.bounce.wifi;

/**
 * 1D Kalman Filter for RSSI smoothing.
 * Smooths raw RSSI measurements before distance conversion.
 */
public class RssiKalmanFilter {

    private float x;      // state estimate (filtered RSSI)
    private float p;      // error covariance
    private final float q; // process noise covariance
    private final float r; // measurement noise covariance
    private boolean initialized = false;

    public RssiKalmanFilter(float initialRssi, float processNoise, float measurementNoise) {
        this.x = initialRssi;
        this.p = 1.0f;
        this.q = processNoise;
        this.r = measurementNoise;
        this.initialized = true;
    }

    public RssiKalmanFilter() {
        this.q = 0.005f;  // process noise
        this.r = 25.0f;   // measurement noise
    }

    /**
     * Update filter with new RSSI measurement
     * @param rawRssi raw RSSI measurement in dBm
     * @return filtered RSSI value
     */
    public float update(float rawRssi) {
        if (!initialized) {
            x = rawRssi;
            p = 1.0f;
            initialized = true;
            return x;
        }

        // Prediction step
        p = p + q;

        // Update step
        float k = p / (p + r);  // Kalman gain
        x = x + k * (rawRssi - x);
        p = (1 - k) * p;

        return x;
    }

    public float getFilteredValue() {
        return x;
    }

    public void reset(float initialRssi) {
        x = initialRssi;
        p = 1.0f;
    }

    public boolean isInitialized() {
        return initialized;
    }
}