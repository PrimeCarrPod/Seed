        public void onReady(String j) {
            runOnUiThread(() ->
                    Toast.makeText(MainActivity.this, "TGE E2 — Prime Electron Worldline Active", Toast.LENGTH_SHORT).show()
            );
        }

        @JavascriptInterface
        public void updateHeaderText(String text) {
            runOnUiThread(() -> tagTextView.setText(text));
        }

        @JavascriptInterface
        public void setTheoryMode(boolean enabled) {
            theoryMode = enabled;
            runOnUiThread(() -> {
                String mode = enabled ? "THEORY" : "LIVE";
                tagTextView.setText("Prime Electron Worldline · v2.0.0-E2 · " + mode);
            });
        }

