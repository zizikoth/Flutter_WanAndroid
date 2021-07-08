import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/RouteManager.dart';
import 'package:wan/ui/mine/square/SquareUserPage.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/item/ArticleItem.dart';

class SquarePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _SquarePage();
}

class _SquarePage extends BaseState<SquarePage> {
  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 0;

  /// 数据源
  List<Article> _articles = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滑动控制
  SlidableController _slidableController = SlidableController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar("社区广场", onTitleTap: () {
        if (_scrollController.offset > Constant.limitOffset) {
          _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      });

  @override
  Widget buildContent() {
    return SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(),
        onRefresh: () {
          _page = 0;
          start();
        },
        onLoading: () {
          start();
        },
        child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(_articles[index],
              enableSlide: true, slidableController: _slidableController, showDelete: false, showMore: true, onMore: _onMore),
          itemCount: _articles.length,
        ));
  }

  _onMore(Article article) {
    RouteManager.push(SquareUserPage(article));
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getSquareList(state, _page).then((articles) {
      setState(() {
        _refreshController.finish(hasMore: articles?.hasMore);
        if (articles != null && articles.datas.isNotNullOrEmpty) {
          if (_page == 0) {
            _articles = articles.datas.orEmpty;
          } else {
            _articles.addAll(articles.datas.orEmpty);
          }
          _page++;
        }
      });
    });
  }
}
