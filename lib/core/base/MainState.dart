import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';

abstract class MainState<T extends StatefulWidget> extends State<T> {
  bool _quit = false;
  Timer? _quitTimer;

  Widget buildBody();

  Widget? buildBottomBar();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          body: buildBody(),
          bottomNavigationBar: buildBottomBar(),
        ),
        onWillPop: () async {
          if (_quit) {
            TipUtils.cancelToast();
            Utils.exit();
          } else {
            TipUtils.toast("再次点击退出应用");
            _quit = true;
            _quitTimer = Timer(Duration(milliseconds: 1500), () {
              _quit = false;
              _quitTimer?.cancel();
            });
            return false;
          }
          return true;
        });
  }

  @override
  void dispose() {
    _quitTimer?.cancel();
    super.dispose();
  }
}
