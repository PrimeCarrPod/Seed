package com.tgapp.electron.v3;

import android.content.Context;
import android.view.WindowInsets;
import android.widget.FrameLayout;

public class InsetFrameLayout extends FrameLayout {
    private MainActivity activity;
    public InsetFrameLayout(Context context, MainActivity activity) {
        super(context);
        this.activity = activity;
    }
    @Override
    public WindowInsets onApplyWindowInsets(WindowInsets insets) {
        if (android.os.Build.VERSION.SDK_INT >= android.os.Build.VERSION_CODES.R) {
            final int sbh = insets.getInsets(WindowInsets.Type.statusBars()).top;
            if (activity.webView != null) {
                activity.webView.post(new InsetsRunnable(activity, sbh));
            }
        }
        return super.onApplyWindowInsets(insets);
    }
}
