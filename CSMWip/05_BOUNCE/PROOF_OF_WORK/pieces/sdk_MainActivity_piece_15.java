                    .append(",\"dist\":" + String.format("%.1f", s.distance))
                    .append(",\"azimuth\":" + String.format("%.1f", s.azimuth))
                    .append(",\"pitch\":" + String.format("%.1f", s.pitch) + "}");
            }
            json.append("]");
            return json.toString();
        }
        
        @JavascriptInterface
        public String getAllDevices() {
            StringBuilder json = new StringBuilder("[");
            boolean first = true;
            for (Map.Entry<String, BtDevice3D> entry : btDevices.entrySet()) {
                BtDevice3D d = entry.getValue();
                if (!first) json.append(",");
                first = false;
                json.append("{\"addr\":\"" + entry.getKey() + "\"")
                    .append(",\"name\":\"" + escapeJson(d.name) + "\"")
                    .append(",\"rssi\":" + (int)d.rssi)
                    .append(",\"dist\":" + String.format("%.1f", d.distance))
                    .append(",\"x\":" + String.format("%.2f", d.x))
                    .append(",\"y\":" + String.format("%.2f", d.y))
                    .append(",\"z\":" + String.format("%.2f", d.z))
                    .append(",\"brightness\":" + String.format("%.2f", d.brightness))
                    .append(",\"active\":" + d.active)
                    .append(",\"persist\":" + ((System.currentTimeMillis() - d.firstSeen) / 1000) + "}");
            }
            json.append("]");
            return json.toString();
        }

        @JavascriptInterface
        public void checkUpdate() {
            runOnUiThread(() -> checkUpdate());
        }

        @JavascriptInterface
        public void downloadRelease(String version, String url, String filename) {
            runOnUiThread(() -> downloadApk(version, url, filename));
        }

        @JavascriptInterface
        public void onUpdateSelected(String action) {
            runOnUiThread(() -> {
                if ("update".equals(action)) {
                    Toast.makeText(MainActivity.this, "Updating to v" + latestVersion + "...", Toast.LENGTH_SHORT).show();
                    prefs.edit().putInt("ignoreCount", 0).apply();
                } else if ("download".equals(action)) {
                    Toast.makeText(MainActivity.this, "Downloading Bounce v" + latestVersion + ".apk...", Toast.LENGTH_SHORT).show();
                    prefs.edit().putInt("ignoreCount", 0).apply();
                } else if ("ignore".equals(action)) {
                    prefs.edit().putInt("ignoreCount", 10).apply();
                    Toast.makeText(MainActivity.this, "Ignoring updates for 10 checks", Toast.LENGTH_SHORT).show();
                }
            });
        }

        private void downloadApk(String version, String url, String filename) {
            Toast.makeText(MainActivity.this, "Downloading Bounce v" + version + "...", Toast.LENGTH_LONG).show();
            new Thread(() -> {
                HttpURLConnection conn = null;
                try {
                    URL downloadUrl = new URL(url);
                    conn = (HttpURLConnection) downloadUrl.openConnection();
                    conn.setConnectTimeout(30000);
                    conn.setReadTimeout(120000);
                    conn.setRequestMethod("GET");
                    int code = conn.getResponseCode();
                    if (code == HttpURLConnection.HTTP_OK) {
                        java.io.InputStream in = conn.getInputStream();
                        java.io.File outputDir = getExternalFilesDir(null);
                        if (outputDir == null) outputDir = getFilesDir();
                        java.io.File outputFile = new java.io.File(outputDir, filename);
                        java.io.FileOutputStream out = new java.io.FileOutputStream(outputFile);
                        byte[] buffer = new byte[8192];
                        int len;
                        long total = 0;
                        while ((len = in.read(buffer)) > 0) {
                            out.write(buffer, 0, len);
                            total += len;
                        }
                        out.close();
                        in.close();
                        final String path = outputFile.getAbsolutePath();
                        final long totalFinal = total;
                        runOnUiThread(() -> {
                            Toast.makeText(MainActivity.this, "Downloaded: " + filename + " (" + (totalFinal/1024) + " KB)\nSaved to: " + path, Toast.LENGTH_LONG).show();
                            injectJs("Bounce.onDownloadComplete('" + version + "','" + path + "')");
                        });
                    } else {
                        runOnUiThread(() -> Toast.makeText(MainActivity.this, "Download failed: HTTP " + code, Toast.LENGTH_LONG).show());
                    }
                } catch (Exception e) {
                    android.util.Log.e("BounceUpdate", "Download error: " + e.getMessage());
                    runOnUiThread(() -> Toast.makeText(MainActivity.this, "Download error: " + e.getMessage(), Toast.LENGTH_LONG).show());
                } finally {
                    if (conn != null) conn.disconnect();
                }
            }).start();
        }
    }
}
