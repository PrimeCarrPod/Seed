
            // Prepare data for trilateration
            Trilateration.Point2D apPos = apPositions.get(bssid);
            if (apPos != null) {
                double weight = reliable ? 1.0 : 0.5;
                Trilateration.AccessPoint ap = new Trilateration.AccessPoint(
                    bssid, ssid, apPos, kDist, weight);
                apsForTrilateration.add(ap);
                apsForEKF.add(ap);
                measurementsForEKF.put(bssid, (double) kDist);
                measurementsForParticleFilter.put(bssid, (double) kDist);
            }

            ssidRssiHistory.put(bssid, (float) r.level);

            json.append("{\"ssid\":\"").append(ssid).append("\",\"bssid\":\"").append(bssid)
                .append("\",\"rssi\":").append(r.level).append(",\"freq\":").append(r.frequency)
                .append(",\"dist\":").append(String.format("%.1f", kDist))
                .append(",\"zone\":\"").append(zoneStr).append("\"")
                .append(",\"persist\":").append(persistence).append(",\"reliable\":").append(reliable).append(",\"caps\":\"\"}");
        }
        json.append("]");

        // Perform trilateration if we have 3+ APs with known positions
        Trilateration.Result trilaterationResult = null;
        if (apsForTrilateration.size() >= 3) {
            trilaterationResult = trilateration.trilaterate(apsForTrilateration);
        }

        // Update EKF with measurements
        if (!measurementsForEKF.isEmpty()) {
            positionEKF.processScanResults(apsForEKF, System.currentTimeMillis());
        }

        // Update Particle Filter
        if (!measurementsForParticleFilter.isEmpty()) {
            particleFilter.updateWeights(measurementsForParticleFilter);
            if (particleFilter.effectiveSampleSize() < 50) {  // Resample threshold
                particleFilter.resample();
            }
        }

        // Perform RTT ranging if available
        if (wifiRttRanging != null && wifiRttRanging.isRttSupported()) {
            // Convert scan results to RTT-capable APs
            List<android.net.wifi.ScanResult> scanResults = new ArrayList<>(results);
            executor.execute(() -> wifiRttRanging.startRanging(scanResults));
        }

        String meta = "{\"scanNum\":" + scanCount + ",\"elapsed\":" + elapsed + ",\"total\":" + ssidLog.size() + "}";
        
        // Enhanced meta with triangulation data
        StringBuilder metaJson = new StringBuilder(meta);
        if (metaJson.length() > 1) {
            metaJson.setLength(metaJson.length() - 1); // Remove closing }
            if (trilaterationResult != null && trilaterationResult.isValid()) {
                metaJson.append(",\"position\":{\"x\":").append(trilaterationResult.position.x)
                    .append(",\"y\":").append(trilaterationResult.position.y)
                    .append(",\"error\":").append(trilaterationResult.error)
                    .append(",\"gdop\":").append(trilaterationResult.gdop).append("}");
            } else {
                metaJson.append("}");
            }
        }
        String metaStr = metaJson.toString();

        // Enhanced JSON output with triangulation data
        StringBuilder enhancedJson = new StringBuilder();
        enhancedJson.append("{\"aps\":").append(json).append(",\"meta\":").append(metaStr).append("}");
        
        injectJs("Bounce.onScanResults(" + enhancedJson.toString() + ")");
    }

    private void updateApPosition(String bssid, int rssi) {
        // Simple position estimation based on RSSI and known AP locations
        // In a full implementation, this would use trilateration results to refine AP positions
        Trilateration.Point2D existing = apPositions.get(bssid);
        if (existing == null) {
            // Estimate position based on RSSI (rough initial estimate)
            double distance = Math.pow(10, (RSSI_1M - rssi) / (10.0 * PATH_LOSS_EXPONENT));
            // Place AP at estimated distance in a random direction (would be refined by trilateration)
            double angle = Math.random() * 2 * Math.PI;
            double x = distance * Math.cos(angle);
            double y = distance * Math.sin(angle);
            apPositions.put(bssid, new Trilateration.Point2D(x, y));
        }
    }

    private float estimateDistance(int rssi, int frequency) {
        float exp = (27.55f - (20f * (float) Math.log10(frequency > 0 ? frequency : 2400)) + Math.abs(rssi)) / 20f;
        return (float) Math.pow(10f, exp);
    }

    // Kalman-filtered RSSI state per BSSID for stable distance estimation
    private final Map<String, KalmanState> kalmanStates = new HashMap<>();
    private static final float KALMAN_Q = 0.005f;
    private static final float KALMAN_R = 25f;
    private static final float PATH_LOSS_EXPONENT = 2.8f;
    private static final float RSSI_1M = -40f;
    private static final float ZONE_IMMEDIATE = 2f;
    private static final float ZONE_NEAR = 10f;

