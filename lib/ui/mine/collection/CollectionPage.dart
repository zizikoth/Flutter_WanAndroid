import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/dialog/CollectionBottomSheet.dart';
import 'package:wan/widget/item/ArticleItem.dart';

class CollectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CollectionPage();
}

class _CollectionPage extends BaseState<CollectionPage> {
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
  PreferredSizeWidget? buildAppBar() => TitleBar("我的收藏", onTitleTap: () {
        if (_scrollController.offset > Constant.limitOffset) {
          _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
        }
      }, actions: [
        IconButton(
          onPressed: () {
            _collectOutArticle();
          },
          icon: Icon(Icons.add_circle_outline_sharp),
          color: Colors.black,
        ),
      ]);

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
          itemBuilder: (context, index) => ArticleItem(
            _articles[index],
            enableSlide: true,
            slidableController: _slidableController,
            onDelete: (article) {
              _unCollection(article.id ?? 0, article.originId ?? -1);
            },
          ),
          itemCount: _articles.length,
        ));
  }

  _collectOutArticle() {
    TipUtils.showWidgetBottomSheet(context, CollectionBottomSheet((title, author, link) {
      showLoad();
      _api.collectOutsideArticle(title, author, link).then((value) {
        if (value) {
          /// 通知收藏数据更新
          EventManager.fireCollect();

          /// 刷新当前页面数据
          _page = 0;
          start();
        } else {
          hideLoad();
        }
      });
    }));
  }

  _unCollection(int id, int originId) {
    showLoad();
    _api.unCollectArticleInList(id, originId).then((value) {
      var index = _articles.indexWhere((article) => article.id == id);
      if (index != -1) {
        /// 如果只有一个数据的时候那么重新请求一下数据
        if (_articles.length == 1) {
          _refreshController.requestRefresh();
        }
        setState(() {
          _articles.removeAt(index);
        });
      }

      /// 通知收藏数据更新
      EventManager.fireCollect();
    }).whenComplete(() => hideLoad());
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getCollections(state, _page).then((articles) {
      if (articles == null || articles.datas.isNullOrEmpty) {
        showEmpty();
      }
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
    }).whenComplete(() => hideLoad());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
