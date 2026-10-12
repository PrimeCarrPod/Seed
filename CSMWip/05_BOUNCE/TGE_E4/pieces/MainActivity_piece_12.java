
        LinearLayout row = new LinearLayout(this);
        row.setOrientation(LinearLayout.HORIZONTAL);
        row.setGravity(Gravity.CENTER);
        row.setPadding(0, dp(8), 0, dp(8));

        scanBtn = mkBtn("SCAN", "#00D4AA", v -> injectJs("TGE.onScanPressed()"));
        row.addView(scanBtn);

        menuBtn = mkBtn("MENU", "#F97316", v -> toggleMenu());
        row.addView(menuBtn);

        theoryBtn = mkBtn("THEORY", "#4488FF", v -> toggleTheory());
        row.addView(theoryBtn);

        fleetBtn = mkBtn("FLEET", "#A855F7", v -> injectJs("TGE.toggleFleet()"));
        row.addView(fleetBtn);

        cleanBtn = mkBtn("CLEAN", "#FF6600", v -> {
            cleanMode = !cleanMode;
