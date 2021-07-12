import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/entity/remote/BannerResponse.dart';
import 'package:wan/entity/remote/ChaptersResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/home/search/ArticleSearchPage.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/item/ArticleItem.dart';
import 'package:wan/widget/item/BannerSwipe.dart';
import 'package:wan/widget/item/ChapterGrid.dart';

class HomePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _HomePage();
}

class _HomePage extends BaseState<HomePage> {
  /// 接口
  ApiService _api = ApiService();

  /// 轮播图
  List<HomeBanner> _banners = [];

  /// 公共号
  List<Chapter> _chapters = [];

  /// 置顶文章+首页文章
  List<Article> _articles = [];

  /// 文章分页
  int _page = 0;

  /// 标题的透明度
  double _titleOpacity = 0;

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
    return Stack(
      alignment: AlignmentDirectional.topEnd,
      children: [
        SmartRefresher(
          controller: _refreshController,
          enablePullUp: true,
          enablePullDown: true,
          header: MaterialClassicHeader(),
          footer: RefreshFooter(),
          onRefresh: () {
            start();
          },
          onLoading: () {
            getArticles();
          },
          child: ListView.builder(
            controller: _scrollController,
            physics: BouncingScrollPhysics(),
            itemBuilder: _buildItem,
            itemCount: _itemCount(),
          ),
        ),
        Opacity(
            opacity: _titleOpacity,
            child: Container(
              height: ResDimen.toolBarHeight + ResDimen.statusBarHeight,
              child: TitleBar(
                "首页",
                showBack: false,
                onTitleTap: () {
                  /// 点击回到顶部
                  if (_titleOpacity == 1) {
                    _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
                  }
                },
              ),
            )),
        Container(
            width: ResDimen.barHeight,
            height: ResDimen.toolBarHeight,
            margin: EdgeInsets.only(top: ResDimen.statusBarHeight),
            alignment: Alignment.center,
            child: IconButton(
                icon: Image.asset(ResAssets.ic_search, width: ResDimen.w20, height: ResDimen.w20),
                onPressed: () {
                  RouteManager.push(ArticleSearchPage());
                }))
      ],
    );
  }

  /// ListView中每一个Item的组件
  Widget _buildItem(BuildContext context, int index) {
    /// 如果有banner
    if (_banners.isNotNullOrEmpty && index == 0) {
      return BannerSwipe(_banners);
    } else if (_chapters.isNotNullOrEmpty && index == 1) {
      return ChapterGrid(_chapters);
    } else {
      var size = index;
      if (_banners.isNotNullOrEmpty) size--;
      if (_chapters.isNotNullOrEmpty) size--;
      return ArticleItem(_articles[size]);
    }
  }

  /// 计算实际上列表的长度
  int _itemCount() {
    var itemCount = _articles.length;
    if (_banners.isNotNullOrEmpty) itemCount++;
    if (_chapters.isNotNullOrEmpty) itemCount++;
    return itemCount;
  }

  @override
  void initialize() {
    _scrollController.addListener(() {
      setState(() {
        /// 标题栏的透明度
        var opacity = _scrollController.offset / Constant.limitOffset;
        if (opacity < 0) {
          _titleOpacity = 0;
        } else if (opacity > 1) {
          _titleOpacity = 1;
        } else {
          _titleOpacity = opacity;
        }
      });
    });
  }

  @override
  void start() {
    _page = 0;
    _api.getHomeData(state).then((zip) {
      setState(() {
        _refreshController.finish();
        if (zip != null) {
          _banners = zip.first;
          _chapters = zip.second;
          _articles = zip.third;
          _page++;
        }
      });
    });
  }

  void getArticles() {
    _api.getArticles(state, _page).then((articles) {
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

  @override
  void dispose() {
    _scrollController.dispose();
    _refreshController.dispose();
    super.dispose();
  }
}
