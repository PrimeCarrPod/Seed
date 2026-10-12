        return b;
    }

    private void toggleMenu() {
        menuVisible = !menuVisible;
        menuBtn.setText(menuVisible ? "CLOSE" : "MENU");
        menuBtn.setTextColor(Color.parseColor(menuVisible ? "#10B981" : "#F97316"));
        injectJs("TGE.toggleMenu(" + menuVisible + ")");
    }

    private void toggleTheory() {
        theoryMode = !theoryMode;
        theoryBtn.setText(theoryMode ? "LIVE" : "THEORY");
        theoryBtn.setTextColor(Color.parseColor(theoryMode ? "#10B981" : "#4488FF"));
        injectJs("TGE.setTheoryMode(" + theoryMode + ")");
        tagTextView.setText("Prime Electron Worldline · v2.0.0-E2 · " + (theoryMode ? "THEORY" : "LIVE"));
        saveState();
    }

    private void injectJs(String s) {
