import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan/app/App.dart';

class Utils {
  static setStatusBarTranslate() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(
          SystemUiOverlayStyle(statusBarColor: Colors.transparent, statusBarIconBrightness: Brightness.dark));
    }
  }

  static setStatusBarWhite() {
    if (Platform.isAndroid) {
      SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(statusBarColor: Colors.white, statusBarIconBrightness: Brightness.dark));
    }
  }

  static Future safeWork(VoidCallback work) {
    return Future.delayed(Duration.zero, work);
  }

  static NavigatorState? getCurrentState() {
    return navigatorKey.currentState;
  }

  static BuildContext? getContext() {
    return getCurrentState()?.overlay?.context;
  }

  static void exit() {
    SystemNavigator.pop(animated: true);
  }
}
