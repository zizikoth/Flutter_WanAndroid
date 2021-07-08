import 'package:flutter/material.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ChaptersResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/home/chapter/ChapterItemPage.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class ChapterPage extends StatefulWidget {
  final int id;

  ChapterPage(this.id);

  @override
  State<StatefulWidget> createState() => _ChapterPage();
}

class _ChapterPage extends BaseState<ChapterPage> with TickerProviderStateMixin {
  /// 接口
  ApiService _api = ApiService();

  /// Tabs
  List<Chapter> _chapters = [];

  /// 自组件集合
  List<ChapterItemPage> _children = [];

  /// Tab控制器
  TabController? _tabController;

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "公众号",
        bottom: PreferredSize(
          preferredSize: Size(ResDimen.width, ResDimen.barHeight),
          child: Container(
            width: double.infinity,
            height: ResDimen.barHeight,
            child: Theme(
              data: ThemeData(splashColor: Colors.transparent, highlightColor: Colors.transparent),
              child: TabBar(
                  physics: BouncingScrollPhysics(),
                  tabs: _chapters.map((e) => Tab(text: e.name.orEmpty)).toList(),
                  controller: _tabController,
                  isScrollable: _chapters.length > 4,
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
    _tabController = TabController(length: _chapters.length, vsync: this);
  }

  @override
  void start() {
    _api.getChapterTree(state).then((value) {
      if (value != null) {
        setState(() {
          _chapters = value;
          _children = _chapters.map((e) => ChapterItemPage(e.id.orEmpty)).toList();
          _tabController = TabController(length: _children.length, vsync: this);
          var index = _chapters.map((e) => e.id).toList().indexOf(widget.id);
          _tabController!.index = index < 0 ? 0 : index;
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
