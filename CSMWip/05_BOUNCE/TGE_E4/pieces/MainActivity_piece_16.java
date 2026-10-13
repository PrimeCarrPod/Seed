        theoryBtn.setTextColor(Color.parseColor(theoryMode ? "#10B981" : "#4488FF"));
    }

    private void saveState() {
        prefs.edit()
                .putBoolean("cleanMode", cleanMode)
                .putBoolean("theoryMode", theoryMode)
                .apply();
    }

    private void initializePrimeEngine() {
        new Thread(() -> {
            PrimeEngine.initialize(this);
            runOnUiThread(() -> {
                tagTextView.setText("Prime Electron Worldline · v2.0.0-E2 · " + PrimeEngine.getPrimeCount() + " primes loaded");
            });
        }).start();
    }

    private void startWorldlineSimulation() {
