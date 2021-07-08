import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/item/ArticleItem.dart';

class SystemArticlePage extends StatefulWidget {
  final String title;
  final int id;

  SystemArticlePage(this.title, this.id);

  @override
  State<StatefulWidget> createState() => _SystemArticlePage();
}

class _SystemArticlePage extends BaseState<SystemArticlePage> {
  /// 接口
  ApiService _api = ApiService();

  /// 文章
  List<Article> _articles = [];

  /// 文章分页
  int _page = 0;

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(widget.title, onTitleTap: () {
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
        itemBuilder: (context, index) => ArticleItem(_articles[index]),
        itemCount: _articles.length,
      ),
    );
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getSystemArticles(state, widget.id, _page).then((articles) {
      setState(() {
        _refreshController.finish(hasMore: articles?.hasMore);
        if (articles != null) {
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
