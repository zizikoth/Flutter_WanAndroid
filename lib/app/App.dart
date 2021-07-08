import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wan/core/config/Config.dart';
import 'package:wan/http/Http.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/other/main/MainPage.dart';

void main() async {
  runApp(App());
  Utils.setStatusBarTranslate();
}

final GlobalKey<NavigatorState> navigatorKey = new GlobalKey<NavigatorState>();

class App extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _App();
}

class _App extends State<App> {
  @override
  void initState() {
    super.initState();
    Http.init();
    DataManager.init();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: Size(375, 667),
        builder: () => MaterialApp(
              localizationsDelegates: [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: [Locale('zh', 'CN')],
              color: ResColors.Line,
              title: Config.projectName,
              debugShowCheckedModeBanner: Config.debug,
              navigatorKey: navigatorKey,
              home: Scaffold(
                body: MainPage(),
              ),
            ));
  }
}
