import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/other/web/WebPage.dart';

class RouteManager {
  static Future push(Widget page) async {
    if (Utils.getContext() != null) {
      return Navigator.push(Utils.getContext()!, CupertinoPageRoute<void>(builder: (context) => page));
    }
  }

  static Future popAllAndPush(Widget page) async {
    if (Utils.getContext() != null) {
      return Utils.safeWork(() {
        Navigator.pushAndRemoveUntil(Utils.getContext()!, CupertinoPageRoute<void>(builder: (context) => page), (route) => false);
      });
    }
  }

  static Future popAndPush(Widget page) async {
    if (Utils.getContext() != null) {
      return Utils.safeWork(() {
        Navigator.pushReplacement(Utils.getContext()!, CupertinoPageRoute<void>(builder: (context) => page));
      });
    }
  }

  static Future pop<T extends Object?>([T? result]) async {
    if (Utils.getContext() != null) {
      return Utils.safeWork(() {
        Navigator.pop(Utils.getContext()!, result);
      });
    }
  }

  static Future startWeb(String title, String url) async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        if (Utils.getContext() != null) {
          return Utils.safeWork(() {
            Navigator.push(Utils.getContext()!, CupertinoPageRoute<void>(builder: (context) => WebPage(title, url)));
          });
        }
      } else if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      Logger.logTag("网页异常", "无法打开网页");
    }
  }

  static startArticleWeb(String title, String url, int id) async {
    try {
      if (Platform.isAndroid || Platform.isIOS) {
        if (Utils.getContext() != null) {
          return Utils.safeWork(() {
            Navigator.push(Utils.getContext()!, CupertinoPageRoute<void>(builder: (context) => WebPage(title, url, id: id)));
          });
        }
      } else if (await canLaunch(url)) {
        await launch(url);
      }
    } catch (e) {
      Logger.logTag("网页异常", "无法打开网页");
    }
  }
}
