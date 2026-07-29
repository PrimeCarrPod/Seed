package com.carrpod.vertebrae.ui

import android.Manifest
import android.app.Activity
import android.content.Context
import android.content.Intent
import android.content.pm.PackageManager
import android.graphics.PixelFormat
import android.net.Uri
import android.os.Build
import android.os.Bundle
import android.os.Handler
import android.os.Looper
import android.provider.Settings
import android.util.DisplayMetrics
import android.util.Log
import android.view.*
import android.widget.*
import androidx.appcompat.app.AlertDialog
import androidx.appcompat.app.AppCompatActivity
import androidx.core.app.ActivityCompat
import androidx.core.content.ContextCompat
import androidx.lifecycle.lifecycleScope
import androidx.recyclerview.widget.LinearLayoutManager
import androidx.recyclerview.widget.RecyclerView
import com.carrpod.vertebrae.R
import com.carrpod.vertebrae.model.*
import com.carrpod.vertebrae.service.FloatingWindowService
import com.carrpod.vertebrae.storage.SessionStorageManager
import kotlinx.coroutines.*
import java.util.concurrent.ConcurrentHashMap

class MainActivity : AppCompatActivity() {

    private val storage = SessionStorageManager.getInstance()
    private val floatingWindows = ConcurrentHashMap<String, FloatingWindow>()
    private var groupsAdapter: GroupsAdapter? = null
    private var sessionsAdapter: SessionsAdapter? = null
    private var groupExpanded = mutableSetOf<String>()
    private var currentGroupFilter: String? = null

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        setContentView(R.layout.activity_main)

        setSupportActionBar(findViewById(R.id.toolbar))
        supportActionBar?.setDisplayShowTitleEnabled(true)

        setupRecyclerViews()
        setupFab()
        loadData()
        checkOverlayPermission()
    }

    private fun setupRecyclerViews() {
        rv_groups.apply {
            layoutManager = LinearLayoutManager(this@MainActivity, LinearLayoutManager.HORIZONTAL, false)
            groupsAdapter = GroupsAdapter(
                onGroupClick = { group -> toggleGroupExpanded(group.id) },
                onGroupLongClick = { group -> showGroupOptions(group) },
                expandedGroups = groupExpanded,
            )
            adapter = groupsAdapter
        }

        rv_sessions.apply {
            layoutManager = LinearLayoutManager(this@MainActivity)
            sessionsAdapter = SessionsAdapter(
                onSessionClick = { session -> openFloatingWindow(session) },
                onSessionLongClick = { session -> showSessionOptions(session) },
                onFocusChange = { session, focused -> handleFocusChange(session, focused) },
            )
            adapter = sessionsAdapter
        }
    }

    private fun setupFab() {
        fab_add_session.setOnClickListener { showNewSessionDialog() }
    }

    private fun loadData() {
        lifecycleScope.launch {
            val groups = storage.loadAllGroups().await()
            val sessions = storage.loadAllSessions().await()

            groupsAdapter?.submitList(groups)
            val filteredSessions = if (currentGroupFilter != null) {
                sessions.filter { it.groupId == currentGroupFilter }
            } else {
                sessions
            }
            sessionsAdapter?.submitList(filteredSessions)
        }
    }

    private fun toggleGroupExpanded(groupId: String) {
        if (groupId in groupExpanded) groupExpanded.remove(groupId) else groupExpanded.add(groupId)
        loadData()
    }

    private fun showNewSessionDialog() {
        val input = EditText(this).apply {
            hint = getString(R.string.dialog_new_session_hint)
            inputType = android.text.InputType.TYPE_CLASS_TEXT
        }

        AlertDialog.Builder(this)
            .setTitle(R.string.dialog_new_session_title)
            .setView(input)
            .setPositiveButton(R.string.session_connect) { _, _ ->
                val sessionId = input.text.toString().trim()
                if (sessionId.isNotBlank()) {
                    createSession(sessionId)
                }
            }
            .setNegativeButton(android.R.string.cancel, null)
            .show()
    }

    private fun createSession(sessionId: String) {
        lifecycleScope.launch {
            val groupId = currentGroupFilter ?: "default"
            val session = KilosSession(
                sessionId = sessionId,
                groupId = groupId,
                name = "Session ${sessionId.takeLast(8)}",
            )
            storage.saveSession(session).await()
            loadData()

            // Auto-open floating window
            openFloatingWindow(session)
        }
    }

    private fun openFloatingWindow(session: KilosSession) {
        if (!Settings.canDrawOverlays(this)) {
            requestOverlayPermission()
            return
        }

        val existing = floatingWindows[session.id]
        if (existing != null) {
            existing.bringToFront()
            return
        }

        val window = FloatingWindow(this, session)
        floatingWindows[session.id] = window
        window.show()

        // Update session with window position
        lifecycleScope.launch {
            val updated = session.copyWith(
                windowX = window.params.x.toFloat(),
                windowY = window.params.y.toFloat(),
                windowWidth = window.params.width,
                windowHeight = window.params.height,
                isFloating = true,
            )
            storage.saveSession(updated).await()
        }
    }

    private fun handleFocusChange(session: KilosSession, focused: Boolean) {
        lifecycleScope.launch {
            val updated = session.copyWith(isFocused = focused)
            storage.saveSession(updated).await()
            // Notify other windows via inter-session comms
        }
    }

    private fun showSessionOptions(session: KilosSession) {
        AlertDialog.Builder(this)
            .setTitle(session.name)
            .setItems(arrayOf("Open Window", "Focus", "Disconnect", "Delete")) { _, which ->
                when (which) {
                    0 -> openFloatingWindow(session)
                    1 -> handleFocusChange(session, true)
                    2 -> disconnectSession(session)
                    3 -> deleteSession(session)
                }
            }
            .show()
    }

    private fun disconnectSession(session: KilosSession) {
        floatingWindows[session.id]?.close()
        floatingWindows.remove(session.id)
        lifecycleScope.launch {
            val updated = session.copyWith(status = KilosSession.SessionStatus.DISCONNECTED)
            storage.saveSession(updated).await()
            loadData()
        }
    }

    private fun deleteSession(session: KilosSession) {
        floatingWindows[session.id]?.close()
        floatingWindows.remove(session.id)
        lifecycleScope.launch {
            storage.deleteSession(session.id).await()
            loadData()
        }
    }

    private fun showGroupOptions(group: SessionGroup) {
        AlertDialog.Builder(this)
            .setTitle(group.name)
            .setItems(arrayOf("Rename", "Change Color", "Delete Group")) { _, which ->
                when (which) {
                    0 -> renameGroup(group)
                    1 -> changeGroupColor(group)
                    2 -> deleteGroup(group)
                }
            }
            .show()
    }

    private fun renameGroup(group: SessionGroup) {
        val input = EditText(this).apply { setText(group.name) }
        AlertDialog.Builder(this)
            .setTitle("Rename Group")
            .setView(input)
            .setPositiveButton(android.R.string.ok) { _, _ ->
                lifecycleScope.launch {
                    val updated = group.copyWith(name = input.text.toString())
                    storage.saveGroup(updated).await()
                    loadData()
                }
            }
            .setNegativeButton(android.R.string.cancel, null)
            .show()
    }

    private fun changeGroupColor(group: SessionGroup) {
        val colors = arrayOf("#74B9FF", "#00D4AA", "#A29BFE", "#FD79A8", "#FF6B6B", "#FDCB6E")
        AlertDialog.Builder(this)
            .setTitle("Group Color")
            .setSingleChoiceItems(colors, colors.indexOf(group.color)) { _, which ->
                lifecycleScope.launch {
                    val updated = group.copyWith(color = colors[which])
                    storage.saveGroup(updated).await()
                    loadData()
                }
                (it as AlertDialog).dismiss()
            }
            .show()
    }

    private fun deleteGroup(group: SessionGroup) {
        if (group.id == "default") {
            toast("Cannot delete default group")
            return
        }
        AlertDialog.Builder(this)
            .setMessage("Delete group '${group.name}'? Sessions will move to Default.")
            .setPositiveButton(android.R.string.ok) { _, _ ->
                lifecycleScope.launch {
                    storage.deleteGroup(group.id).await()
                    loadData()
                }
            }
            .setNegativeButton(android.R.string.cancel, null)
            .show()
    }

    private fun checkOverlayPermission() {
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.M && !Settings.canDrawOverlays(this)) {
            toast(getString(R.string.toast_overlay_permission))
        }
    }

    private fun requestOverlayPermission() {
        val intent = Intent(Settings.ACTION_MANAGE_OVERLAY_PERMISSION, Uri.parse("package:$packageName"))
        startActivityForResult(intent, 1001)
    }

    override fun onActivityResult(requestCode: Int, resultCode: Int, data: Intent?) {
        super.onActivityResult(requestCode, resultCode, data)
        if (requestCode == 1001) {
            if (Settings.canDrawOverlays(this)) {
                toast("Overlay permission granted")
            }
        }
    }

    private fun toast(msg: String) = Toast.makeText(this, msg, Toast.LENGTH_SHORT).show()

    override fun onDestroy() {
        floatingWindows.values.forEach { it.close() }
        floatingWindows.clear()
        super.onDestroy()
    }

    // Floating Window Implementation
    inner class FloatingWindow(
        private val context: Context,
        private val session: KilosSession,
    ) {
        private val windowManager = context.getSystemService(Context.WINDOW_SERVICE) as WindowManager
        private val params = WindowManager.LayoutParams(
            width = session.windowWidth.toInt(),
            height = session.windowHeight.toInt(),
            type = if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O)
                WindowManager.LayoutParams.TYPE_APPLICATION_OVERLAY
            else
                WindowManager.LayoutParams.TYPE_PHONE,
            format = PixelFormat.TRANSLUCENT,
            flags = WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE or
                    WindowManager.LayoutParams.FLAG_LAYOUT_NO_LIMITS or
                    WindowManager.LayoutParams.FLAG_WATCH_OUTSIDE_TOUCH,
        ).apply {
            x = session.windowX.toInt()
            y = session.windowY.toInt()
            gravity = Gravity.TOP or Gravity.START
        }

        private val view: View
        private var initialX = 0
        private var initialY = 0
        private var initialTouchX = 0f
        private var initialTouchY = 0f

        init {
            view = LayoutInflater.from(context).inflate(R.layout.floating_window, null)
            setupWindow()
        }

        private fun setupWindow() {
            val webView = view.findViewById<android.webkit.WebView>(R.id.webview_container).apply {
                // Will be replaced with actual WebView
            }

            // Create WebView programmatically
            val webView = android.webkit.WebView(context).apply {
                id = View.generateViewId()
                layoutParams = ViewGroup.LayoutParams(ViewGroup.LayoutParams.MATCH_PARENT, ViewGroup.LayoutParams.MATCH_PARENT)
                settings.javaScriptEnabled = true
                settings.domStorageEnabled = true
                settings.allowFileAccess = true
                settings.allowFileAccessFromFileURLs = true
                settings.allowUniversalAccessFromFileURLs = true
                settings.userAgentString = "Mozilla/5.0 (Linux; Android 13) Vertebrae/1.0 KiloAI-Client"
                webViewClient = object : android.webkit.WebViewClient() {
                    override fun shouldOverrideUrlLoading(view: android.webkit.WebView?, request: android.webkit.WebResourceRequest?): Boolean {
                        return false
                    }
                }
                loadUrl(session.url)
            }

            val container = view.findViewById<FrameLayout>(R.id.webview_container)
            container.addView(webView)

            // Header drag
            view.findViewById<View>(R.id.window_header).setOnTouchListener { v, event ->
                when (event.action) {
                    MotionEvent.ACTION_DOWN -> {
                        initialX = params.x
                        initialY = params.y
                        initialTouchX = event.rawX
                        initialTouchY = event.rawY
                        v.parent.requestDisallowInterceptTouchEvent(true)
                        true
                    }
                    MotionEvent.ACTION_MOVE -> {
                        params.x = initialX + (event.rawX - initialTouchX).toInt()
                        params.y = initialY + (event.rawY - initialTouchY).toInt()
                        windowManager.updateViewLayout(view, params)
                        true
                    }
                    MotionEvent.ACTION_UP -> {
                        saveWindowPosition()
                        true
                    }
                    else -> false
                }
            }

            // Resize handle
            view.findViewById<ImageView>(R.id.resize_handle).setOnTouchListener { v, event ->
                when (event.action) {
                    MotionEvent.ACTION_DOWN -> {
                        initialX = params.width
                        initialY = params.height
                        initialTouchX = event.rawX
                        initialTouchY = event.rawY
                        true
                    }
                    MotionEvent.ACTION_MOVE -> {
                        params.width = (initialX + (event.rawX - initialTouchX)).coerceAtLeast(300)
                        params.height = (initialY + (event.rawY - initialTouchY)).coerceAtLeast(200)
                        windowManager.updateViewLayout(view, params)
                        true
                    }
                    MotionEvent.ACTION_UP -> {
                        saveWindowPosition()
                        true
                    }
                    else -> false
                }
            }

            // Window controls
            view.findViewById<ImageButton>(R.id.btn_minimize).setOnClickListener { minimize() }
            view.findViewById<ImageButton>(R.id.btn_maximize).setOnClickListener { maximize() }
            view.findViewById<ImageButton>(R.id.btn_close).setOnClickListener { close() }

            // Focus handling
            view.setOnTouchListener { _, event ->
                if (event.action == MotionEvent.ACTION_DOWN) {
                    bringToFront()
                    notifyFocus(true)
                }
                false
            }
        }

        private fun saveWindowPosition() {
            lifecycleScope.launch {
                val updated = session.copyWith(
                    windowX = params.x.toFloat(),
                    windowY = params.y.toFloat(),
                    windowWidth = params.width,
                    windowHeight = params.height,
                )
                storage.saveSession(updated).await()
            }
        }

        private fun bringToFront() {
            params.flags = params.flags or WindowManager.LayoutParams.FLAG_NOT_FOCUSABLE
            windowManager.updateViewLayout(view, params)
        }

        private fun notifyFocus(focused: Boolean) {
            // Update session focus state
            lifecycleScope.launch {
                val updated = session.copyWith(isFocused = focused)
                storage.saveSession(updated).await()
            }
        }

        fun show() {
            windowManager.addView(view, params)
        }

        fun close() {
            try {
                windowManager.removeView(view)
            } catch (e: Exception) {
                Log.e("FloatingWindow", "Close error", e)
            }
        }

        fun minimize() {
            // Hide webview content, show only header
        }

        fun maximize() {
            val metrics = DisplayMetrics()
            windowManager.defaultDisplay.getMetrics(metrics)
            params.x = 0
            params.y = 0
            params.width = metrics.widthPixels
            params.height = metrics.heightPixels
            windowManager.updateViewLayout(view, params)
            saveWindowPosition()
        }
    }
}

// Adapters
class GroupsAdapter(
    private val onGroupClick: (SessionGroup) -> Unit,
    private val onGroupLongClick: (SessionGroup) -> Unit,
    private val expandedGroups: MutableSet<String>,
) : RecyclerView.Adapter<GroupsAdapter.GroupViewHolder>() {

    private var groups = emptyList<SessionGroup>()

    fun submitList(newGroups: List<SessionGroup>) {
        groups = newGroups
        notifyDataSetChanged()
    }

    inner class GroupViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val tvName: TextView = view.findViewById(R.id.tv_group_name)
        val indicator: View = view.findViewById(R.id.group_indicator)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): GroupViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_group_chip, parent, false)
        return GroupViewHolder(view)
    }

    override fun onBindViewHolder(holder: GroupViewHolder, position: Int) {
        val group = groups[position]
        val isExpanded = group.id in expandedGroups

        holder.tvName.text = group.name
        holder.tvName.setTextColor(android.graphics.Color.parseColor(group.color))
        holder.indicator.background.setTint(android.graphics.Color.parseColor(group.color))

        holder.itemView.setOnClickListener { onGroupClick(group) }
        holder.itemView.setOnLongClickListener { onGroupLongClick(group); true }
    }

    override fun getItemCount() = groups.size
}

class SessionsAdapter(
    private val onSessionClick: (KilosSession) -> Unit,
    private val onSessionLongClick: (KilosSession) -> Unit,
    private val onFocusChange: (KilosSession, Boolean) -> Unit,
) : RecyclerView.Adapter<SessionsAdapter.SessionViewHolder>() {

    private var sessions = emptyList<KilosSession>()

    fun submitList(newSessions: List<KilosSession>) {
        sessions = newSessions
        notifyDataSetChanged()
    }

    inner class SessionViewHolder(view: View) : RecyclerView.ViewHolder(view) {
        val tvName: TextView = view.findViewById(R.id.tv_session_name)
        val tvStatus: TextView = view.findViewById(R.id.tv_session_status)
        val tvGroup: TextView = view.findViewById(R.id.tv_session_group)
        val btnFocus: ImageButton = view.findViewById(R.id.btn_focus)
        val statusIndicator: View = view.findViewById(R.id.status_indicator)
    }

    override fun onCreateViewHolder(parent: ViewGroup, viewType: Int): SessionViewHolder {
        val view = LayoutInflater.from(parent.context).inflate(R.layout.item_session, parent, false)
        return SessionViewHolder(view)
    }

    override fun onBindViewHolder(holder: SessionViewHolder, position: Int) {
        val session = sessions[position]

        holder.tvName.text = session.name
        holder.tvStatus.text = session.status.name
        holder.tvGroup.text = session.groupId

        val statusColor = when (session.status) {
            KilosSession.SessionStatus.CONNECTED -> 0xFF3FB950
            KilosSession.SessionStatus.CONNECTING -> 0xFFD29922
            KilosSession.SessionStatus.HEARTBEAT_ACTIVE -> 0xFF3FB950
            KilosSession.SessionStatus.ERROR -> 0xFFF85149
            else -> 0xFF8B949E
        }
        holder.statusIndicator.setBackgroundColor(statusColor)

        holder.btnFocus.setImageResource(
            if (session.isFocused) android.R.drawable.star_on else android.R.drawable.star_off
        )
        holder.btnFocus.setOnClickListener { onFocusChange(session, !session.isFocused) }

        holder.itemView.setOnClickListener { onSessionClick(session) }
        holder.itemView.setOnLongClickListener { onSessionLongClick(session); true }
    }

    override fun getItemCount() = sessions.size
}