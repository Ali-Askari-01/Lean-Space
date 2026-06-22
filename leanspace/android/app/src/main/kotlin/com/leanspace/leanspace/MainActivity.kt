package com.leanspace.leanspace

import android.content.Intent
import android.net.Uri
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channelName = "com.leanspace/shortcuts"
    private var channel: MethodChannel? = null
    private var pendingShortcut: String? = null

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        channel = MethodChannel(flutterEngine.dartExecutor.binaryMessenger, channelName)
        channel?.setMethodCallHandler { call, result ->
            when (call.method) {
                "getPendingShortcut" -> {
                    result.success(pendingShortcut)
                    pendingShortcut = null
                }
                else -> result.notImplemented()
            }
        }
        pendingShortcut?.let { deliverShortcut(it) }
    }

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
        captureIntent(intent)
    }

    override fun onNewIntent(intent: Intent) {
        super.onNewIntent(intent)
        setIntent(intent)
        captureIntent(intent)
    }

    private fun captureIntent(intent: Intent?) {
        val uri: Uri = intent?.data ?: return
        if (uri.scheme == "leanspace" && uri.host == "shortcut") {
            val path = uri.path ?: "/"
            pendingShortcut = path
            deliverShortcut(path)
        }
    }

    private fun deliverShortcut(path: String) {
        channel?.invokeMethod("onShortcut", path)
    }
}
