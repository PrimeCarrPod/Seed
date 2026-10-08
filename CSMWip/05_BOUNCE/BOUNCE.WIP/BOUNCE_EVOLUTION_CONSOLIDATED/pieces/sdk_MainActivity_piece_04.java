
    private static class ReleaseInfo {
        String version;
        String filename;
        String url;
        ReleaseInfo(String version, String filename, String url) {
            this.version = version;
            this.filename = filename;
            this.url = url;
        }
    }

    private List<ReleaseInfo> fetchAvailableReleases() {
        List<ReleaseInfo> releases = new ArrayList<>();
        HttpURLConnection conn = null;
        try {
            URL url = new URL("https://api.github.com/repos/PrimeCarrPod/Seed/contents/CSMApps/_Current_Releases?ref=main");
            conn = (HttpURLConnection) url.openConnection();
            conn.setConnectTimeout(10000);
            conn.setReadTimeout(10000);
            conn.setRequestMethod("GET");
            conn.setRequestProperty("Accept", "application/vnd.github.v3+json");
            int code = conn.getResponseCode();
            if (code == HttpURLConnection.HTTP_OK) {
                java.io.BufferedReader in = new java.io.BufferedReader(new java.io.InputStreamReader(conn.getInputStream()));
                StringBuilder response = new StringBuilder();
                String line;
                while ((line = in.readLine()) != null) {
                    response.append(line);
                }
                in.close();
                
                String json = response.toString();
                // Parse JSON array for files matching Bounce-v*.apk
                int idx = 0;
                while (true) {
                    int nameIdx = json.indexOf("\"name\":\"", idx);
                    if (nameIdx == -1) break;
                    nameIdx += 8;
                    int nameEnd = json.indexOf("\"", nameIdx);
                    if (nameEnd == -1) break;
                    String name = json.substring(nameIdx, nameEnd);
                    
                    if (name.startsWith("Bounce-v") && name.endsWith(".apk")) {
                        String version = name.replace("Bounce-v", "").replace(".apk", "");
                        
                        // Find download_url for this file
                        int urlIdx = json.indexOf("\"download_url\":\"", idx);
                        String downloadUrl = "";
                        if (urlIdx != -1) {
                            urlIdx += 16;
                            int urlEnd = json.indexOf("\"", urlIdx);
                            if (urlEnd != -1) {
                                downloadUrl = json.substring(urlIdx, urlEnd);
                            }
                        }
                        
                        if (!downloadUrl.isEmpty()) {
                            releases.add(new ReleaseInfo(version, name, downloadUrl));
                        }
                    }
                    idx = nameEnd;
                }
            }
        } catch (Exception e) {
            android.util.Log.w("BounceUpdate", "Failed to fetch releases: " + e.getMessage());
        } finally {
            if (conn != null) conn.disconnect();
        }
        
        // Sort by version descending (newest first)
        releases.sort((a, b) -> compareVersions(b.version, a.version));
        return releases;
    }
    
    private int compareVersions(String v1, String v2) {
        try {
            String[] a = v1.split("\\.");
            String[] b = v2.split("\\.");
            for (int i = 0; i < Math.max(a.length, b.length); i++) {
                int av = i < a.length ? Integer.parseInt(a[i]) : 0;
                int bv = i < b.length ? Integer.parseInt(b[i]) : 0;
                if (av != bv) return Integer.compare(av, bv);
            }
            return 0;
        } catch (Exception e) {
            return 0;
        }
    }

    private boolean isNewerVersion(String remote, String current) {
        try {
            String[] r = remote.split("\\.");
            String[] c = current.split("\\.");
            for (int i = 0; i < Math.max(r.length, c.length); i++) {
                int rv = i < r.length ? Integer.parseInt(r[i]) : 0;
                int cv = i < c.length ? Integer.parseInt(c[i]) : 0;
                if (rv > cv) return true;
                if (rv < cv) return false;
            }
            return false;
        } catch (Exception e) {
