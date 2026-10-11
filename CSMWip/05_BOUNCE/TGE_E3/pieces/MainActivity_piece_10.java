                ViewGroup.LayoutParams.MATCH_PARENT,
                ViewGroup.LayoutParams.WRAP_CONTENT);
        hp.gravity = Gravity.TOP | Gravity.CENTER_HORIZONTAL;
        h.setLayoutParams(hp);

        TextView logo = new TextView(this);
        logo.setText("TGE E2");
        logo.setTextSize(26f);
        logo.setTextColor(Color.parseColor("#00D4AA"));
        logo.setTypeface(Typeface.DEFAULT_BOLD);
        logo.setGravity(Gravity.CENTER);

        tagTextView = new TextView(this);
        tagTextView.setText("Prime Electron Worldline · v2.0.0-E2");
        tagTextView.setTextSize(11f);
        tagTextView.setTextColor(Color.parseColor("#E8E8F0"));
        tagTextView.setGravity(Gravity.CENTER);

        TextView subtitle = new TextView(this);
        subtitle.setText("Single Electron Walking Worldline → Reflections | Prime Gap Universe");
