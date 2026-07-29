package com.carrpod.vertebrae.service

import android.app.Notification
import android.app.NotificationChannel
import android.app.NotificationManager
import android.app.Service
import android.content.Context
import android.content.Intent
import android.graphics.PixelFormat
import android.os.Build
import android.os.IBinder
import android.util.Log
import android.view.Gravity
import android.view.LayoutInflater
import android.view.MotionEvent
import android.view.View
import android.view.WindowManager
import android.widget.FrameLayout
import android.widget.ImageButton
import android.widget.TextView
import androidx.core.app.NotificationCompat
import com.carrpod.vertebrae.R
import com.carrpod.vertebrae.model.KilosSession
import com.carrpod.vertebrae.storage.SessionStorageManager
import kotlinx.coroutines.Dispatchers
import kotlinx.coroutines.withContext

class FloatingWindowService : Service() {

    private lateinit var storage: SessionStorageManager
    private val windowManager by lazy { getSystemService(Context.WINDOW_SERVICE) as WindowManager }
    private val windows = mutableMapOf<String, FloatingWindow>()
    private var notificationManager: NotificationManager? = null

    inner class FloatingWindow(
        val session: KilosSession,
        private val rootView: FrameLayout,
        private val params: WindowManager.LayoutParams,
    ) {
        private var initialX = 0f
        private var initialY = 0f
        private var initialTouchX = 0f
        private var initialTouchY = 0f

        init {
            rootView.setOnTouchListener { _, event ->
                when (event.action) {
                    MotionEvent.ACTION_DOWN -> {
                        initialX = params.x.toFloat()
                        initialY = params.y.toFloat()
                        initialTouchX = event.rawX
                        initialTouchY = event.rawY
                        bringToFront()
                        true
                    }
                    MotionEvent.ACTION_MOVE -> {
                        params.x = (initialX + event.rawX - initialTouchX).toInt()
                        params.y = (initialY + event.rawY - initialTouchY).toInt()
                        windowManager.updateViewLayout(rootView, params)
                        true
                    }
                    MotionEvent.ACTION_UP -> {
                        savePosition()
                        false
                    }
                    else -> false
                }
            }
        }

        fun bringToFront() {
            params.flags = params.flags or WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
            windowManager.updateViewLayout(rootView, params)
            params.flags = params.flags and WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE.inv()
            windowManager.updateViewLayout(rootView, params)
        }

        fun savePosition() {
            storage.saveSession(session.copyWith(
                windowX = params.x.toFloat(),
                windowY = params.y.toFloat()
            )).await()
        }

        fun updateSize(width: Int, height: Int) {
            params.width = width
            params.height = height
            windowManager.updateViewLayout(rootView, params)
            storage.saveSession(session.copyWith(
                windowWidth = width,
                windowHeight = height
            )).await()
        }

        fun setFocused(focused: Boolean) {
            val header = rootView.findViewById<View>(R.id.window_header)
            val border = rootView.findViewById<View>(R.id.window_border)
            header?.setBackgroundColor(if (focused) getColor(R.color.primary) else getColor(R.color.surface_elevated))
            border?.setBackgroundColor(if (focused) getColor(R.color.primary) else getColor(R.color.outline))
        }

        fun close() {
            windowManager.removeView(rootView)
        }
    }

    override fun onCreate() {
        super.onCreate()
        storage = SessionStorageManager(this)
        createNotificationChannel()
        startForegroundService()
    }

    private fun createNotificationChannel() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O) {
            val channel = NotificationChannel(
                "vertebrae_floating",
                getString(R.string.floating_channel_name),
                NotificationManager.IMPORTANCE_LOW
            ).apply {
                description = getString(R.string.floating_channel_desc)
                setShowBadge(false)
            }
            notificationManager = getSystemService(NotificationManager::class.java)
            notificationManager?.createNotificationChannel(channel)
        }
    }

    private fun startForegroundService() {
        val notification = NotificationCompat.Builder(this, "vertebrae_floating")
            .setContentTitle(getString(R.string.app_name))
            .setContentText(getString(R.string.floating_windows_active))
            .setSmallIcon(R.drawable.ic_vertebrae_foreground)
            .setOngoing(true)
            .setPriority(NotificationCompat.PRIORITY_LOW)
            .setCategory(NotificationCompat.CATEGORY_SERVICE)
            .build()

        startForeground(1003, notification)
    }

    override fun onStartCommand(intent: Intent?, flags: Int, startId: Int): Int {
        if (intent?.action == "CREATE_WINDOW") {
            val sessionId = intent.getStringExtra("session_id") ?: return START_STICKY
            createWindow(sessionId)
        } else if (intent?.action == "CLOSE_WINDOW") {
            val sessionId = intent.getStringExtra("session_id") ?: return START_STICKY
            closeWindow(sessionId)
        } else if (intent?.action == "UPDATE_WINDOW") {
            val sessionId = intent.getStringExtra("session_id") ?: return START_STICKY
            val width = intent.getIntExtra("width", -1)
            val height = intent.getIntExtra("height", -1)
            if (width > 0 && height > 0) {
                windows[sessionId]?.updateSize(width, height)
            }
        }
        return START_STICKY
    }

    private fun createWindow(sessionId: String) {
        storage.loadSession(sessionId).await()?.let { session ->
            if (windows.containsKey(sessionId)) return@let

            val inflater = LayoutInflater.from(this)
            val rootView = inflater.inflate(R.layout.floating_window, null) as FrameLayout

            // Set up header
            val header = rootView.findViewById<TextView>(R.id.window_title)
            header.text = session.name

            val closeBtn = rootView.findViewById<ImageButton>(R.id.btn_close)
            closeBtn.setOnClickListener { closeWindow(sessionId) }

            val minimizeBtn = rootView.findViewById<ImageButton>(R.id.btn_minimize)
            minimizeBtn.setOnClickListener { minimizeWindow(sessionId) }

            val maximizeBtn = rootView.findViewById<ImageButton>(R.id.btn_maximize)
            maximizeBtn.setOnClickListener { maximizeWindow(sessionId) }

            // Load WebView content
            val webViewContainer = rootView.findViewById<FrameLayout>(R.id.webview_container)
            // WebView will be added by MainActivity via intent

            val params = WindowManager.LayoutParams(
                session.windowWidth.toInt(),
                session.windowHeight.toInt(),
                if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                    WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
                else
                    WindowManager.LayoutParams.TYPE_PHONE,
                WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
                    or WindowManager.LayoutParams.FLAG_LAYOUT_IN_SCREEN
                    or WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
                PixelFormat.TRANSLUCENT
            ).apply {
                gravity = Gravity.TOP or Gravity.START
                x = session.windowX.toInt()
                y = session.windowY.toInt()
            }

            windowManager.addView(rootView, params)

            windows[sessionId] = FloatingWindow(session, rootView, params)
        }
    }

    private fun closeWindow(sessionId: String) {
        windows.remove(sessionId)?.close()
    }

    private fun minimizeWindow(sessionId: String) {
        windows[sessionId]?.rootView?.visibility = View.GONE
    }

    private fun maximizeWindow(sessionId: String) {
        // Implement maximize logic
    }

    override fun onDestroy() {
        windows.values.forEach { it.close() }
        windows.clear()
        super.onDestroy()
    }

    override fun onBind(intent: Intent?): IBinder? = null

    companion object {
        fun createWindow(context: Context, sessionId: String) {
            val intent = Intent(context, FloatingWindowService::class.java)
            intent.action = "CREATE_WINDOW"
            intent.putExtra("session_id", sessionId)
            context.startForegroundService(intent)
        }

        fun closeWindow(context: Context, sessionId: String) {
            val intent = Intent(context, FloatingWindowService::class.java)
            intent.action = "CLOSE_WINDOW"
            intent.putExtra("session_id", sessionId)
            context.startForegroundService(intent)
        }

        fun updateWindow(context: Context, sessionId: String, width: Int, height: Int) {
            val intent = Intent(context, FloatingWindowService::class.java)
            intent.action = "UPDATE_WINDOW"
            intent.putExtra("session_id", sessionId)
            intent.putExtra("width", width)
            intent.putExtra("height", height)
            context.startForegroundService(intent)
        }
    }
}