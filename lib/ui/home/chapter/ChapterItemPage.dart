import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/item/ArticleItem.dart';

// ignore: must_be_immutable
class ChapterItemPage extends StatefulWidget {
  _ChapterItemPage? item;

  final int id;

  ChapterItemPage(this.id);

  @override
  State<StatefulWidget> createState() {
    item = _ChapterItemPage();
    return item!;
  }

  void scrollToTop() {
    item?.scrollToTop();
  }
}

class _ChapterItemPage extends BaseState<ChapterItemPage> {
  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 1;

  /// 数据源
  List<Article> _articles = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  bool keepAlive() => true;

  @override
  PreferredSizeWidget? buildAppBar() => null;

  @override
  Widget buildContent() {
    return SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(),
        onRefresh: () {
          _page = 1;
          start();
        },
        onLoading: () {
          start();
        },
        child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => ArticleItem(_articles[index]),
          itemCount: _articles.length,
        ));
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getChapterArticles(state, widget.id, _page).then((articles) {
      setState(() {
        _refreshController.finish(hasMore: articles?.hasMore);
        if (articles != null && articles.datas.isNotNullOrEmpty) {
          if (_page == 1) {
            _articles = articles.datas.orEmpty;
          } else {
            _articles.addAll(articles.datas.orEmpty);
          }
          _page++;
        }
      });
    });
  }

  void scrollToTop() {
    if (_scrollController.offset > Constant.limitOffset) {
      _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
