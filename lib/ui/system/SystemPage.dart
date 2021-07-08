import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/system/SystemItemPage.dart';
import 'package:wan/widget/custom/TabRoundIndicator.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class SystemPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SystemPage();
}

class _SystemPage extends CoreState<SystemPage> with TickerProviderStateMixin {
  List<String> _systems = ["体系", "导航"];

  /// Tab控制器
  TabController? _tabController;

  @override
  bool keepAlive() => true;

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar("体系",
      showBack: false,
      bottom: PreferredSize(
        preferredSize: Size(ResDimen.halfWidth, ResDimen.barHeight),
        child: Container(
            alignment: Alignment.center,
            width: ResDimen.halfWidth,
            height: ResDimen.barHeight - 10.w,
            margin: EdgeInsets.only(top: 5.w, bottom: 5.w),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(ResDimen.halfBarHeight)),
                border: Border.all(width: 1, color: ResColors.Black)),
            child: Theme(
              data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
              child: TabBar(
                tabs: _systems.map((e) => Tab(text: e)).toList(),
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
      ));

  @override
  Widget buildBody() {
    return TabBarView(
      physics: BouncingScrollPhysics(),
      controller: _tabController,
      children: _systems.map((e) => SystemItemPage(_systems.indexOf(e))).toList(),
    );
  }

  @override
  void init() {
    _tabController = TabController(length: _systems.length, vsync: this);
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
