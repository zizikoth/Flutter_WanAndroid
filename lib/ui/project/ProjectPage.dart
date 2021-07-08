import 'package:flutter/material.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ProjectResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/project/ProjectItemPage.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class ProjectPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ProjectPage();
}

class _ProjectPage extends BaseState<ProjectPage> with TickerProviderStateMixin {
  /// 接口
  ApiService _api = ApiService();

  /// Tabs
  List<Project> _projects = [];

  /// 自组件集合
  List<ProjectItemPage> _children = [];

  /// Tab控制器
  TabController? _tabController;

  @override
  bool keepAlive() => true;

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "项目",
        showBack: false,
        bottom: PreferredSize(
          preferredSize: Size(ResDimen.width, ResDimen.barHeight),
          child: Container(
            width: double.infinity,
            height: ResDimen.barHeight,
            child: Theme(
              data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
              child: TabBar(
                  physics: BouncingScrollPhysics(),
                  tabs: _projects.map((e) => Tab(text: e.name.orEmpty)).toList(),
                  controller: _tabController,
                  isScrollable: _projects.length > 4,
                  indicatorColor: ResColors.Black,
                  labelColor: ResColors.TextDark,
                  unselectedLabelColor: ResColors.TextNormal,
                  labelStyle: TextStyle(fontSize: ResDimen.textNormal, fontWeight: FontWeight.bold),
                  unselectedLabelStyle: TextStyle(fontSize: ResDimen.textNormal)),
            ),
          ),
        ),
        onTitleTap: () {
          if (_children.isNotEmpty && _tabController != null) {
            _children[_tabController!.index].scrollToTop();
          }
        },
      );

  @override
  Widget buildContent() {
    return TabBarView(
      physics: BouncingScrollPhysics(),
      controller: _tabController,
      children: _children,
    );
  }

  @override
  void initialize() {
    _tabController = TabController(length: _projects.length, vsync: this);
  }

  @override
  void start() {
    _api.getProjectTree(state).then((value) {
      if (value != null) {
        setState(() {
          _projects = value;
          _children = _projects.map((e) => ProjectItemPage(e.id.orEmpty)).toList();
          _tabController = TabController(length: _children.length, vsync: this);
        });
      }
    });
  }

  @override
  void dispose() {
    _tabController?.dispose();
    super.dispose();
  }
}
