package com.example.yookassa_black_background_demo

import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.android.FlutterActivityLaunchConfigs

class MainActivity: FlutterActivity() {

    // This workaround doesn't work: https://github.com/flutter/flutter/issues/74801#issuecomment-818406029
    /*
    override fun getBackgroundMode(): FlutterActivityLaunchConfigs.BackgroundMode {
        return FlutterActivityLaunchConfigs.BackgroundMode.transparent
    }
    */

}
