import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/UserManager.dart';
import 'package:wan/ui/mine/about/AboutAuthorPage.dart';
import 'package:wan/ui/mine/coin/CoinPage.dart';
import 'package:wan/ui/mine/collection/CollectionPage.dart';
import 'package:wan/ui/mine/rank/RankPage.dart';
import 'package:wan/ui/mine/setting/SettingPage.dart';
import 'package:wan/ui/mine/share/MySharePage.dart';
import 'package:wan/ui/mine/square/SquarePage.dart';
import 'package:wan/ui/mine/todo/TodoPage.dart';
import 'package:wan/ui/mine/website/WebsiteCollectionPage.dart';
import 'package:wan/widget/custom/ItemBar.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class MinePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MinePage();
}

class _MinePage extends CoreState<MinePage> {
  ApiService _apiService = ApiService();
  String _userName = "请登录";
  String _collectionNum = "0";
  String _coinNum = "0";
  String _rankNum = "0";

  @override
  bool keepAlive() => true;

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "我的",
        showBack: false,
        actions: [
          IconButton(
              onPressed: () {
                RouteManager.push(SettingPage());
              },
              icon: Icon(
                Icons.settings_outlined,
                color: Colors.black,
                size: 20.w,
              ))
        ],
      );

  @override
  Widget buildBody() {
    return Column(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.all(15.w),
          child: Card(
            elevation: 10.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(padding: EdgeInsets.all(15.w), child: ClipOval(child: Image.asset(ResAssets.avatar, width: 80.w, height: 80.w))),
                Text(_userName, style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        UserManager.afterLogin(() => RouteManager.push(CollectionPage()));
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                        child: Column(
                          children: [
                            Text(_collectionNum, style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark)),
                            Text("收藏", style: TextStyle(fontSize: ResDimen.textSmall, color: ResColors.TextLight))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        UserManager.afterLogin(() => RouteManager.push(CoinPage()));
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                        child: Column(
                          children: [
                            Text(_coinNum, style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark)),
                            Text("积分", style: TextStyle(fontSize: ResDimen.textSmall, color: ResColors.TextLight))
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        UserManager.afterLogin(() => RouteManager.push(RankPage()));
                      },
                      child: Container(
                        width: 100.w,
                        padding: EdgeInsets.only(top: 15.w, bottom: 15.w),
                        child: Column(
                          children: [
                            Text(_rankNum, style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark)),
                            Text("排名", style: TextStyle(fontSize: ResDimen.textSmall, color: ResColors.TextLight))
                          ],
                        ),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
        Container(
          width: double.infinity,
          padding: EdgeInsets.fromLTRB(15.w, 0, 15.w, 15.w),
          child: Card(
            elevation: 10.w,
            child: Column(
              children: [
                ItemBar("未完清单", onClick: () => UserManager.afterLogin(() => RouteManager.push(TodoPage()))),
                Divider(height: 1.w, color: ResColors.Line),
                ItemBar("网址收藏", onClick: () => UserManager.afterLogin(() => RouteManager.push(WebsiteCollectionPage()))),
                Divider(height: 1.w, color: ResColors.Line),
                ItemBar("我的分享", onClick: () => UserManager.afterLogin(() => RouteManager.push(MySharePage()))),
                Divider(height: 1.w, color: ResColors.Line),
                ItemBar("社区广场", onClick: () => UserManager.afterLogin(() => RouteManager.push(SquarePage()))),
                Divider(height: 1.w, color: ResColors.Line),
                ItemBar("关于作者", onClick: () => RouteManager.push(AboutAuthorPage()))
              ],
            ),
          ),
        )
      ],
    );
  }

  @override
  void init() {
    _initData();
    _initListener();
  }

  _initData() {
    _initUser();
    _initCollection();
    _initCoin();
  }

  _initUser() {
    // 用户名称
    setState(() => _userName = UserManager.getUserName());
  }

  _initCollection() {
    // 收藏信息
    _apiService.getMineCollections().then((value) {
      setState(() {
        _collectionNum = value.toString();
      });
    });
  }

  _initCoin() {
    // 积分 排名
    _apiService.getMineCoinInfo().then((value) {
      if (value != null) {
        setState(() {
          _coinNum = value.coinCount.toString();
          _rankNum = value.rank.toString();
        });
      }
    });
  }

  _initListener() {
    EventManager.onLogin(this, () => _initData());
    EventManager.onCollection(this, () => _initCollection());
  }
}
