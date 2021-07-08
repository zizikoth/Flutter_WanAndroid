import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/entity/remote/CoinResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/dialog/ShareBottomSheet.dart';
import 'package:wan/widget/item/ArticleItem.dart';

class MySharePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _MySharePage();
}

class _MySharePage extends BaseState<MySharePage> {
  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 1;

  /// 个人信息
  CoinInfo? _coinInfo;

  /// 数据源
  List<Article> _list = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滑动控制
  SlidableController _slidableController = SlidableController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "我的分享",
        onTitleTap: () {
          if (_scrollController.offset > Constant.limitOffset) {
            _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
          }
        },
        actions: [IconButton(onPressed: _addShare, icon: Icon(Icons.add_circle_outline, color: Colors.black, size: 20.w))],
      );

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
          itemBuilder: (context, index) => index == 0
              ? _buildHeader()
              : ArticleItem(_list[_coinInfo == null ? index : index - 1],
                  enableSlide: true, slidableController: _slidableController, onDelete: _onDelete),
          itemCount: _coinInfo == null ? _list.length : _list.length + 1,
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
                child: Text(_coinInfo?.username ?? "", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark))),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(_coinInfo?.coinCount?.toString() ?? "", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal)),
                Text(_coinInfo?.rank?.toString() ?? "", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal))
              ],
            ),
            Padding(padding: EdgeInsets.only(top: 20.w), child: Container(color: ResColors.Line, height: ResDimen.w5))
          ],
        ),
      );
  }

  /// 新增我的分享
  _addShare() {
    TipUtils.showWidgetBottomSheet(context, ShareBottomSheet((title, link) {
      showLoad();
      _api.addShare(title, link).then((value) {
        if (value) {
          _refreshController.requestRefresh();
        }
      }).whenComplete(() => hideLoad());
    }));
  }

  /// 删除我的分享
  _onDelete(Article article) {
    showLoad();
    _api.deleteShare(article.id ?? 0).then((value) {
      if (value) {
        var index = _list.lastIndexWhere((element) => article.id == element.id);
        if (index != -1) {
          if (_list.length == 1) {
            _refreshController.requestRefresh();
          }
          setState(() => _list.removeAt(index));
        }
      }
    }).whenComplete(() => hideLoad());
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getShareList(state, _page).then((data) {
      if (data != null) {
        setState(() {
          _refreshController.finish(hasMore: data.shareArticles?.hasMore);
          _coinInfo = data.coinInfo;
          if (data.shareArticles != null && data.shareArticles!.datas.isNotNullOrEmpty) {
            if (_page == 1) {
              _list = data.shareArticles!.datas.orEmpty;
            } else {
              _list.addAll(data.shareArticles!.datas.orEmpty);
            }
            _page++;
          }
        });
      }
    }).whenComplete(() => hideLoad());
  }
}
