import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ResAssets {
  static const root = "assets/images/";

  static const splash = root + "splash.png";
  static const icon_logo_splash = root + "icon_logo_splash.png";
  static const avatar = root + "avatar.png";
  static const icon_status_data_empty = root + "icon_status_data_empty.png";
  static const icon_status_net_error = root + "icon_status_net_error.png";
  static const icon_status_server_error = root + "icon_status_server_error.png";
  static const icon_status_web_error = root + "icon_status_web_error.png";

  static const ic_home_normal = root + "ic_home_normal.png";
  static const ic_home_select = root + "ic_home_select.png";
  static const ic_project_normal = root + "ic_project_normal.png";
  static const ic_project_select = root + "ic_project_select.png";
  static const ic_system_normal = root + "ic_system_normal.png";
  static const ic_system_select = root + "ic_system_select.png";
  static const ic_mine_normal = root + "ic_mine_normal.png";
  static const ic_mine_select = root + "ic_mine_select.png";
  static const ic_first = root + "ic_first.png";
  static const ic_second = root + "ic_second.png";
  static const ic_third = root + "ic_third.png";

  static const ic_search = root + "ic_search.png";
  static const ic_status_complete = root + "ic_status_complete.png";
}

class ResColors {
  static const TextDark = Color(0xff333333);
  static const TextNormal = Color(0xff666666);
  static const TextLight = Color(0xff999999);
  static const LightGray = Color(0xffaaaaaa);
  static const White = Color(0xffffffff);
  static const Black = Color(0xff000000);
  static const Red = Color(0xfff35656);
  static const Line = Color(0xffeeeeee);
  static const LightPink = Color(0xfffff5fd);
  static const TagColor = Color(0xffd3b8d4);

  static const TodoStatus = Color(0xfffbcead);
  static const TodoEdit = Color(0xff49A2FF);
  static const TodoDelete = Color(0xffff4365);

  static const ArticleDelete = Color(0xffff4365);
  static const ArticleMore = Color(0xff49A2FF);

  static const TodoWork = Color(0x11ff4365);
  static const TodoLife = Color(0x11f5e02b);
  static const TodoMine = Color(0x1194e2ff);
  static const TodoOther = Color(0x11b38776);

  static const TodoLabel = Color(0xff83AF9B);

  static const randomColors = [
    Color(0xffffeedb),
    Color(0xffffbd9b),
    Color(0xff346751),
    Color(0xffc84b31),
    Color(0xffcee5d0),
    Color(0xffd3b8d4),
    Color(0xff47597e),
    Color(0xffdbe6fd),
    Color(0xff1768ac),
    Color(0xfff54748)
  ];
}

class ResDimen {
  static var w5 = 5.0.w;
  static var w7_5 = 7.5.w;
  static var w10 = 10.0.w;
  static var w15 = 15.0.w;
  static var w20 = 20.0.w;
  static var w25 = 25.0.w;
  static var w30 = 30.0.w;
  static var w40 = 40.0.w;

  static var width = 1.sw;

  static var height = 1.sh;

  static var halfWidth = 0.5.sw;

  static var quarterWidth = 0.25.sw;

  static var line = 0.5.w;

  static var statusBarHeight = ScreenUtil().statusBarHeight;

  static var toolBarHeight = kToolbarHeight;

  static var barHeight = 45.0.w;

  static var halfBarHeight = 22.5.w;

  static var textSuperSmall = 10.0.sp;
  static var textSmall = 12.0.sp;
  static var textNormal = 15.0.sp;
  static var textLarge = 18.0.sp;
  static var textSuperLarge = 20.0.sp;
}
