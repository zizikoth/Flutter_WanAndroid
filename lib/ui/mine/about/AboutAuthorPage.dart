import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/res/Res.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class AboutAuthorPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _AboutAuthorPage();
}

class _AboutAuthorPage extends CoreState<AboutAuthorPage> {
  @override
  PreferredSizeWidget? buildAppBar() => TitleBar("关于作者");

  @override
  Widget buildBody() {
    return Container(
      color: ResColors.White,
      alignment: Alignment.topCenter,
      padding: EdgeInsets.only(top: 20.w),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ClipOval(child: Image.asset(ResAssets.avatar, width: 80.w, height: 80.w)),
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: Text("周个大个侠", style: TextStyle(fontSize: ResDimen.textLarge, color: ResColors.TextDark)),
          ),
          Padding(
            padding: EdgeInsets.only(top: 20.w),
            child: Text("zhou_android@163.com", style: TextStyle(fontSize: ResDimen.textLarge, color: ResColors.TextDark)),
          ),
          GestureDetector(
            onTap: () {
              RouteManager.startWeb("zizikoth", "https://github.com/zizikoth");
            },
            child: Padding(
              padding: EdgeInsets.only(top: 20.w),
              child: Text("https://github.com/zizikoth",
                  style: TextStyle(
                    fontSize: ResDimen.textLarge,
                    color: ResColors.Red,
                    decoration: TextDecoration.underline,
                  )),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(20.w),
            child: Text("练习之作，刚开始学习Flutter，项目应该Bug很多，有事联系",
                textAlign: TextAlign.center, style: TextStyle(fontSize: ResDimen.textLarge, color: ResColors.TextDark)),
          ),
        ],
      ),
    );
  }

  @override
  void init() {}
}
