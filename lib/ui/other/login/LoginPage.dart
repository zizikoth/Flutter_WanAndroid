import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/TabRoundIndicator.dart';

class LoginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginPage();
}

class _LoginPage extends CoreState<LoginPage> with TickerProviderStateMixin {
  ApiService _api = ApiService();
  TabController? _tabController;

  List _titles = ["登录", "注册"];
  String _account = "Mr.Memo";
  String _pwd = "zhx931024";
  String _rePwd = "zhx931024";

  @override
  PreferredSizeWidget? buildAppBar() => null;

  @override
  Widget buildBody() {
    return Stack(
      children: [
        Container(
            width: double.infinity,
            height: double.infinity,
            color: Color(0xffEEEAE9),
            alignment: Alignment.center,
            child: Image.asset(
              ResAssets.icon_logo_splash,
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.fitWidth,
            )),
        Container(
          width: double.infinity,
          height: double.infinity,
          padding: EdgeInsets.only(top: ResDimen.toolBarHeight),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                  alignment: Alignment.center,
                  width: ResDimen.halfWidth,
                  height: ResDimen.barHeight - 10.w,
                  margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(ResDimen.halfBarHeight)),
                      border: Border.all(width: 1, color: ResColors.Black)),
                  child: Theme(
                    data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
                    child: TabBar(
                      tabs: _titles.map((e) => Tab(text: e)).toList(),
                      controller: _tabController,
                      indicatorColor: Colors.black,
                      isScrollable: false,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.black,
                      labelStyle: TextStyle(fontSize: ResDimen.textNormal),
                      unselectedLabelStyle: TextStyle(fontSize: ResDimen.textNormal),
                      indicator: TabRoundIndicator(radius: ResDimen.halfBarHeight),
                    ),
                  )),
              Container(
                margin: EdgeInsets.only(top: ResDimen.toolBarHeight - ResDimen.statusBarHeight),
                width: 300.w,
                height: 500.w,
                decoration:
                    BoxDecoration(color: Color(0x88ffffff), borderRadius: BorderRadius.all(Radius.circular(ResDimen.halfBarHeight))),
                child: SingleChildScrollView(
                  child: Container(
                    width: 300.w,
                    height: 500.w,
                    child: TabBarView(
                      controller: _tabController,
                      children: [
                        /// 登录
                        Container(
                          padding: EdgeInsets.fromLTRB(20.w, 60.w, 20.w, 60.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  TextField(
                                      maxLines: 1,
                                      maxLength: 20,
                                      cursorColor: ResColors.TextDark,
                                      decoration: InputDecoration(
                                          hintText: "请输入账号",
                                          hintStyle: TextStyle(color: ResColors.TextLight),
                                          labelText: "请输入账号",
                                          labelStyle: TextStyle(color: ResColors.TextLight),
                                          counterStyle: TextStyle(color: ResColors.TextLight),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                                      onChanged: (value) {
                                        _account = value;
                                      }),
                                  Container(height: 20.w),
                                  TextField(
                                      maxLines: 1,
                                      maxLength: 20,
                                      obscureText: true,
                                      cursorColor: ResColors.TextDark,
                                      decoration: InputDecoration(
                                          hintText: "请输入密码",
                                          hintStyle: TextStyle(color: ResColors.TextLight),
                                          labelText: "请输入密码",
                                          labelStyle: TextStyle(color: ResColors.TextLight),
                                          counterStyle: TextStyle(color: ResColors.TextLight),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                                      onChanged: (value) {
                                        _pwd = value;
                                      }),
                                ],
                              ),
                              MaterialButton(
                                minWidth: ResDimen.width - 40.w,
                                color: ResColors.Black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.all(15),
                                child: Text("登录", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.White)),
                                onPressed: () {
                                  _login();
                                },
                              ),
                            ],
                          ),
                        ),

                        /// 注册
                        Container(
                          padding: EdgeInsets.fromLTRB(20.w, 60.w, 20.w, 60.w),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                children: [
                                  TextField(
                                      maxLines: 1,
                                      maxLength: 20,
                                      cursorColor: ResColors.TextDark,
                                      decoration: InputDecoration(
                                          hintText: "请输入账号",
                                          hintStyle: TextStyle(color: ResColors.TextLight),
                                          labelText: "请输入账号",
                                          labelStyle: TextStyle(color: ResColors.TextLight),
                                          counterStyle: TextStyle(color: ResColors.TextLight),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                                      onChanged: (value) {
                                        _account = value;
                                      }),
                                  Container(height: 20.w),
                                  TextField(
                                      maxLines: 1,
                                      maxLength: 20,
                                      obscureText: true,
                                      cursorColor: ResColors.TextDark,
                                      decoration: InputDecoration(
                                          hintText: "请输入密码",
                                          hintStyle: TextStyle(color: ResColors.TextLight),
                                          labelText: "请输入密码",
                                          labelStyle: TextStyle(color: ResColors.TextLight),
                                          counterStyle: TextStyle(color: ResColors.TextLight),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                                      onChanged: (value) {
                                        _pwd = value;
                                      }),
                                  Container(height: 20.w),
                                  TextField(
                                      maxLines: 1,
                                      maxLength: 20,
                                      obscureText: true,
                                      cursorColor: ResColors.TextDark,
                                      decoration: InputDecoration(
                                          hintText: "请再次输入密码",
                                          hintStyle: TextStyle(color: ResColors.TextLight),
                                          labelText: "请再次输入密码",
                                          labelStyle: TextStyle(color: ResColors.TextLight),
                                          counterStyle: TextStyle(color: ResColors.TextLight),
                                          focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                                          enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                                      onChanged: (value) {
                                        _rePwd = value;
                                      }),
                                ],
                              ),
                              MaterialButton(
                                minWidth: ResDimen.width - 40.w,
                                color: ResColors.Black,
                                shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                                padding: EdgeInsets.all(15),
                                child: Text("注册", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.White)),
                                onPressed: () {
                                  _register();
                                },
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void init() {
    EventManager.onLogin(this, () {
      RouteManager.pop();
    });
    _tabController = TabController(length: _titles.length, vsync: this);
  }

  _login() {
    if (_account.isNullOrEmpty) {
      TipUtils.toast("请输入账号");
    } else if (_pwd.isNullOrEmpty) {
      TipUtils.toast("请输入密码");
    } else {
      // 登录
      showLoad();
      _api.login(_account, _pwd).then((res) => hideLoad());
    }
  }

  _register() {
    if (_account.isNullOrEmpty) {
      TipUtils.toast("请输入账号");
    } else if (_pwd.isNullOrEmpty) {
      TipUtils.toast("请输入密码");
    } else if (_pwd != _rePwd) {
      TipUtils.toast("两次输入的密码不一致");
    } else {
      // 注册
      showLoad();
      _api.register(_account, _pwd, _rePwd).then((res) => hideLoad());
    }
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
