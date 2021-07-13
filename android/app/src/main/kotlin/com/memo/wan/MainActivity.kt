package com.memo.wan

import android.content.Context
import android.os.Bundle
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel

class MainActivity : FlutterActivity() {
    private val channel = "com.memo.wan/flutter"

    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState)
    }

    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        val methodChannel = MethodChannel(flutterEngine.dartExecutor, channel)
        methodChannel.setMethodCallHandler { call, result ->
            // 这里是Flutter调用安卓原生的方法,跳转Activity也是可以的
            if(call.method == "request"){
                result.success("来自安卓原生的方法")
            }else{
                result.notImplemented()
            }
        }
    }
}
