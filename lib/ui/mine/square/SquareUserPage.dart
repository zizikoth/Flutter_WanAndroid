import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/entity/remote/CoinResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/item/ArticleItem.dart';

class SquareUserPage extends StatefulWidget {
  final Article article;

  SquareUserPage(this.article);

  @override
  State<StatefulWidget> createState() => _SquareUserPage();
}

class _SquareUserPage extends BaseState<SquareUserPage> {
  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 1;

  /// 个人信息
  CoinInfo? _coinInfo;

  /// 数据源
  List<Article> _articles = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(widget.article.shareUser.orEmpty, onTitleTap: () {
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
          _page = 1;
          start();
        },
        onLoading: () {
          start();
        },
        child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => index == 0 ? _buildHeader() : ArticleItem(_articles[_coinInfo == null ? index : index - 1]),
          itemCount: _coinInfo == null ? _articles.length : _articles.length + 1,
        ));
  }

  /// 构建头布局
  Widget _buildHeader() {
    if (_coinInfo == null)
      return Container(width: 0, height: 0);
    else
      return Container(
        color: ResColors.White,
        padding: EdgeInsets.only(top: 20.w),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipOval(child: Image.asset(ResAssets.avatar, width: 100.w, height: 100.w)),
            Padding(
                padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
                child: Text(_coinInfo?.nickname ?? "", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("积分：${_coinInfo?.coinCount?.toString() ?? "0"}",
                    style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal)),
                Text("排名：${_coinInfo?.rank?.toString() ?? "0"}",
                    style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal))
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.w), child: Container(color: ResColors.Line, height: ResDimen.w5))
          ],
        ),
      );
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getSquareUserList(state, widget.article.userId.orEmpty, _page).then((data) {
      if (data != null) {
        setState(() {
          _refreshController.finish(hasMore: data.shareArticles?.hasMore);
          _coinInfo = data.coinInfo;
          if (data.shareArticles != null && data.shareArticles!.datas.isNotNullOrEmpty) {
            if (_page == 1) {
              _articles = data.shareArticles!.datas.orEmpty;
            } else {
              _articles.addAll(data.shareArticles!.datas.orEmpty);
            }
            _page++;
          }
        });
      }
    });
  }
}
