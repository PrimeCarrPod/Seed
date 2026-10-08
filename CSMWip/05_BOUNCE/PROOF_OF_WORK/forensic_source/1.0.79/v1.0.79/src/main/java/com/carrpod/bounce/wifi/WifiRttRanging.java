package com.carrpod.bounce.wifi;

import android.content.Context;
import android.net.wifi.rtt.RangingRequest;
import android.net.wifi.rtt.RangingResult;
import android.net.wifi.rtt.WifiRttManager;
import android.net.wifi.ScanResult;
import android.util.Log;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.Executor;

/**
 * Wi-Fi RTT (802.11mc) ranging support for precise distance measurements.
 * Uses Android's WifiRttManager API for IEEE 802.11mc Fine Timing Measurement (FTM).
 */
public class WifiRttRanging {

    private static final String TAG = "WifiRttRanging";

    private final WifiRttManager rttManager;
    private final Context context;
    private final RangingCallback callback;
    private final Executor executor;

    // RTT results cache
    private final Map<String, RangingResult> rttResults = new HashMap<>();
    private long lastRttScanTime = 0;

    // Configuration
    private static final int MAX_RTT_APS = 15;  // Max APs per RTT request
    private static final long MIN_RTT_INTERVAL_MS = 2000;  // Min interval between RTT scans

    public interface RttCallback {
        void onRttResults(Map<String, RangingResult> results);
        void onRttFailure(int errorCode);
    }

    public WifiRttRanging(Context context, RttCallback callback) {
        this.context = context;
        this.callback = callback;
        this.rttManager = (WifiRttManager) context.getSystemService(Context.WIFI_RTT_RANGING_SERVICE);
        this.executor = java.util.concurrent.Executors.newSingleThreadExecutor();
    }

    /**
     * Check if device supports Wi-Fi RTT.
     */
    public boolean isRttSupported() {
        return rttManager != null && rttManager.isAvailable();
    }

    /**
     * Start RTT ranging for a list of scan results.
     * Filters for RTT-capable APs (802.11mc capable).
     */
    public void startRanging(List<ScanResult> scanResults) {
        if (!isRttSupported()) {
            if (callback != null) {
                callback.onRttFailure(WifiRttManager.STATUS_UNSUPPORTED);
            }
            return;
        }

        long now = System.currentTimeMillis();
        if (now - lastRttScanTime < MIN_RTT_INTERVAL_MS) {
            // Throttle RTT scans
            return;
        }
        lastRttScanTime = System.currentTimeMillis();

        // Filter for RTT-capable APs
        List<ScanResult> rttCapableAps = new ArrayList<>();
        for (ScanResult result : scanResults) {
            if (result.is80211mcResponder()) {
                rttCapableAps.add(result);
            }
        }

        if (rttCapableAps.isEmpty()) {
            Log.d(TAG, "No RTT-capable APs found");
            if (callback != null) {
                callback.onRttFailure(WifiRttManager.STATUS_NO_AP_FOUND);
            }
            return;
        }

        // Limit to max APs per request
        if (rttCapableAps.size() > MAX_RTT_APS) {
            rttCapableAps = rttCapableAps.subList(0, MAX_RTT_APS);
        }

        // Build ranging request
        List<RangingRequest> requests = new ArrayList<>();
        for (ScanResult ap : rttCapableAps) {
            RangingRequest request = new RangingRequest.Builder()
                    .setMacAddress(android.net.MacAddress.fromString(ap.BSSID))
                    .setMinMmWaveFrequency(0)  // Use all supported bands
                    .setMaxMmWaveFrequency(0)
                    .setRssiThreshold(-100)  // Include weak signals
                    .build();
            requests.add(request);
        }

        // Start ranging
        RangingRequest.Builder builder = new RangingRequest.Builder();
        builder.addAccessPoints(requests);
        
        rttManager.startRanging(builder.build(), executor, new WifiRttManager.RangingResultCallback() {
            @Override
            public void onRangingResults(List<RangingResult> results) {
                onRttResultsReceived(results);
            }

            @Override
            public void onRangingFailure(int errorCode) {
                Log.w(TAG, "RTT ranging failed: " + errorCode);
                if (callback != null) {
                    callback.onRttFailure(errorCode);
                }
            }
        });
    }

    private void onRttResultsReceived(List<RangingResult> results) {
        Map<String, RangingResult> newResults = new HashMap<>();
        long now = System.currentTimeMillis();

        for (RangingResult result : results) {
            String bssid = result.getMacAddress().toString();
            rttResults.put(bssid, result);
            newResults.put(bssid, result);
        }

        // Notify callback
        if (callback != null) {
            callback.onRttResults(newResults);
        }

        Log.d(TAG, "Received " + results.size() + " RTT results");
    }

    /**
     * Get cached RTT result for a BSSID.
     */
    public RangingResult getRttResult(String bssid) {
        return rttResults.get(bssid);
    }

    /**
     * Get distance in meters from cached RTT result.
     * Returns -1 if not available or invalid.
     */
    public double getDistanceMeters(String bssid) {
        RangingResult result = rttResults.get(bssid);
        if (result == null) return -1;

        int status = result.getStatus();
        if (status != RangingResult.STATUS_SUCCESS) {
            return -1;
        }

        // Distance in mm, convert to meters
        return result.getDistanceMm() / 1000.0;
    }

    /**
     * Get all cached RTT distances.
     */
    public Map<String, Double> getAllDistances() {
        Map<String, Double> distances = new HashMap<>();
        for (Map.Entry<String, RangingResult> entry : rttResults.entrySet()) {
            double dist = getDistanceMeters(entry.getKey());
            if (dist >= 0) {
                distances.put(entry.getKey(), dist);
            }
        }
        return distances;
    }

    /**
     * Get RTT measurement details for an AP.
     */
    public RttMeasurement getMeasurement(String bssid) {
        RangingResult result = rttResults.get(bssid);
        if (result == null || result.getStatus() != RangingResult.STATUS_SUCCESS) {
            return null;
        }

        return new RttMeasurement(
            bssid,
            result.getDistanceMm() / 1000.0,
            result.getDistanceStdDevMm() / 1000.0,
            result.getRssi(),
            result.getBurstNum(),
            result.getMeasurementTimestamp()
        );
    }

    /**
     * RTT measurement data container.
     */
    public static class RttMeasurement {
        public final String bssid;
        public final double distanceMeters;
        public final double distanceStdDevMeters;
        public final int rssi;
        public final int burstNum;
        public final long timestamp;

        public RttMeasurement(String bssid, double distanceMeters, double distanceStdDevMeters,
                              int rssi, int burstNum, long timestamp) {
            this.bssid = bssid;
            this.distanceMeters = distanceMeters;
            this.distanceStdDevMeters = distanceStdDevMeters;
            this.rssi = rssi;
            this.burstNum = burstNum;
            this.timestamp = timestamp;
        }

        @Override
        public String toString() {
            return String.format("RttMeasurement{bssid=%s, dist=%.2fm±%.2fm, rssi=%d, burst=%d}",
                bssid, distanceMeters, distanceStdDevMeters, rssi, burstNum);
        }
    }

    /**
     * Clear cached results.
     */
    public void clearCache() {
        rttResults.clear();
        lastRttScanTime = 0;
    }
}