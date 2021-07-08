import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/CoinListResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/item/CoinItem.dart';

class CoinPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _CoinPage();
}

class _CoinPage extends BaseState<CoinPage> {
  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 1;

  /// 数据源
  List<CoinItemInfo> _info = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "积分记录",
        onTitleTap: () {
          if (_scrollController.offset > Constant.limitOffset) {
            _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
          }
        },
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
          itemBuilder: (context, index) => CoinItem(_info[index]),
          itemCount: _info.length,
        ));
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getCoinList(state, _page).then((list) {
      setState(() {
        _refreshController.finish(hasMore: list?.hasMore);
        if (list != null && list.datas.isNotNullOrEmpty) {
          if (_page == 1) {
            _info = list.datas.orEmpty;
          } else {
            _info.addAll(list.datas.orEmpty);
          }
          _page++;
        }
      });
    });
  }
}
