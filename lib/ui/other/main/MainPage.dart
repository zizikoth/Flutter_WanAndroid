import 'package:flutter/material.dart';
import 'package:wan/core/base/MainState.dart';
import 'package:wan/res/Res.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/home/HomePage.dart';
import 'package:wan/ui/mine/MinePage.dart';
import 'package:wan/ui/project/ProjectPage.dart';
import 'package:wan/ui/system/SystemPage.dart';

class MainPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MainPage();
}

class _MainPage extends MainState<MainPage> {
  /// 底部标签栏目实际地址
  var _index = 0;

  /// 首页的4个分类
  var _pages = [HomePage(), ProjectPage(), SystemPage(), MinePage()];

  /// 滑动控制器
  var _pageController = PageController();

  @override
  Widget buildBody() {
    return PageView.builder(
        controller: _pageController,
        itemCount: _pages.length,
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _pages[index]);
  }

  @override
  Widget? buildBottomBar() {
    return BottomNavigationBar(
      currentIndex: _index,
      unselectedFontSize: ResDimen.textSmall,
      selectedFontSize: ResDimen.textSmall,
      unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
      unselectedItemColor: ResColors.TextLight,
      selectedItemColor: ResColors.TextDark,
      type: BottomNavigationBarType.fixed,
      items: [
        BottomNavigationBarItem(
            icon: Image.asset(ResAssets.ic_home_normal, width: 20, height: 20),
            activeIcon: Image.asset(ResAssets.ic_home_select, width: 20, height: 20),
            label: "首页"),
        BottomNavigationBarItem(
            icon: Image.asset(ResAssets.ic_project_normal, width: 20, height: 20),
            activeIcon: Image.asset(ResAssets.ic_project_select, width: 20, height: 20),
            label: "项目"),
        BottomNavigationBarItem(
            icon: Image.asset(ResAssets.ic_system_normal, width: 20, height: 20),
            activeIcon: Image.asset(ResAssets.ic_system_select, width: 20, height: 20),
            label: "体系"),
        BottomNavigationBarItem(
            icon: Image.asset(ResAssets.ic_mine_normal, width: 20, height: 20),
            activeIcon: Image.asset(ResAssets.ic_mine_select, width: 20, height: 20),
            label: "我的"),
      ],
      onTap: (index) {
        setState(() {
          _index = index;
          _pageController.jumpToPage(_index);
        });
      },
    );
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }
}
