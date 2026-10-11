            cleanBtn.setText(cleanMode ? "SHOW" : "CLEAN");
            cleanBtn.setTextColor(Color.parseColor(cleanMode ? "#FF4466" : "#FF6600"));
            headerOverlay.setVisibility(cleanMode ? View.GONE : View.VISIBLE);
            saveState();
        });
        row.addView(cleanBtn);

        bar.addView(row);
        return bar;
    }

    private Button mkBtn(String text, String color, View.OnClickListener listener) {
        Button b = new Button(this);
        b.setText(text);
        b.setTextSize(10f);
        b.setTextColor(Color.parseColor(color));
        b.setBackgroundColor(Color.parseColor("#1A1A2E"));
        b.setPadding(dp(8), dp(8), dp(8), dp(8));
        b.setLayoutParams(new LinearLayout.LayoutParams(0, ViewGroup.LayoutParams.WRAP_CONTENT, 1f));
        b.setOnClickListener(listener);
