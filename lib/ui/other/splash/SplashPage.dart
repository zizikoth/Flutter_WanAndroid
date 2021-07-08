import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/RouteManager.dart';
import 'package:wan/ui/other/main/MainPage.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 1000), () {
      RouteManager.popAndPush(MainPage());
    });
    return Image.asset(
      ResAssets.splash,
      width: double.infinity,
      height: double.infinity,
      fit: BoxFit.fill,
    );
  }
}
