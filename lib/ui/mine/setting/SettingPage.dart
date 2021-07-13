import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/utils/CleanUtils.dart';
import 'package:wan/widget/custom/ItemBar.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class SettingPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SettingPage();
}

class _SettingPage extends CoreState<SettingPage> {
  ApiService _api = ApiService();

  String _cacheSize = "";

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar("设置");

  @override
  Widget buildBody() {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.all(15.w),
      child: Column(
        children: [
          Card(elevation: 10.w, child: ItemBar("清理缓存", onClick: _clearCache, extra: _cacheSize)),
          Padding(
              padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
              child: Card(
                  elevation: 10.2,
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    ItemBar("调用安卓方法", onClick: _callAndroid),
                  ]))),
          Spacer(),
          Container(
            padding: EdgeInsets.only(bottom: 40.w),
            child: MaterialButton(
              minWidth: ResDimen.width - 30.w,
              color: ResColors.Red,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(15),
              child: Text("退出登录", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.White)),
              onPressed: () {
                _loginOut();
              },
            ),
          )
        ],
      ),
    );
  }

  @override
  void init() {
    CleanUtils.getCacheSize().then((value) {
      setState(() {
        _cacheSize = value;
      });
    });
  }

  /// 清理缓存
  _clearCache() {
    CleanUtils.cleanCache().then((value) {
      TipUtils.toast("缓存已清理");
      setState(() {
        _cacheSize = "";
      });
    });
  }

  _callAndroid() {
    const methodChannel = MethodChannel("com.memo.wan/flutter");
    methodChannel.invokeMethod("request").then((value) {
      TipUtils.toast(value);
    });
  }

  /// 退出登录
  _loginOut() {
    showLoad();
    _api.loginOut().then((value) => hideLoad());
  }
}
