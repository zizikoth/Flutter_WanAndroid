import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/remote/WebsiteResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/dialog/WebsiteBottomSheet.dart';
import 'package:wan/widget/item/WebsiteItem.dart';

class WebsiteCollectionPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _WebsiteCollectionPage();
}

class _WebsiteCollectionPage extends BaseState<WebsiteCollectionPage> {
  /// 接口
  ApiService _api = ApiService();

  /// 数据源
  List<Website> _list = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滑动控制
  SlidableController _slidableController = SlidableController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "网址收藏",
        onTitleTap: () {
          if (_scrollController.offset > Constant.limitOffset) {
            _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
          }
        },
        actions: [IconButton(onPressed: _addWebsiteCollection, icon: Icon(Icons.add_circle_outline, color: Colors.black, size: 20.w))],
      );

  @override
  Widget buildContent() {
    return SmartRefresher(
        controller: _refreshController,
        enablePullUp: false,
        enablePullDown: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(noMore: ""),
        onRefresh: () {
          start();
        },
        child: ListView.builder(
          controller: _scrollController,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => WebsiteItem(_list[index], _slidableController, _onEdit, _onDelete),
          itemCount: _list.length,
        ));
  }

  /// 添加网址收藏
  _addWebsiteCollection() {
    TipUtils.showWidgetBottomSheet(
        context,
        WebsiteBottomSheet(Website(), (website) {
          showLoad();
          _api.addWebsite(website.name.orEmpty, website.link.orEmpty).then((value) {
            if (value) {
              start();
            } else {
              hideLoad();
            }
          });
        }));
  }

  /// 更新
  _onEdit(Website website) {
    var temp = Website(id: website.id, name: website.name, link: website.link);
    TipUtils.showWidgetBottomSheet(
        context,
        WebsiteBottomSheet(temp, (website) {
          showLoad();
          _api.updateWebsite(website).then((value) {
            if (value) {
              start();
            } else {
              hideLoad();
            }
          });
        }));
  }

  /// 删除
  _onDelete(Website website) {
    showLoad();
    _api.deleteWebsite(website.id ?? 0).then((value) {
      if (value) {
        var index = _list.lastIndexWhere((element) => website.id == element.id);
        setState(() {
          _list.removeAt(index);
          if (_list.length == 0) {
            showEmpty();
          }
        });
      }
    }).whenComplete(() => hideLoad());
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getWebsiteList(state).then((list) {
      if (list.isNotNullOrEmpty) {
        setState(() {
          _refreshController.finish();
          _list = list!;
        });
      }
    }).whenComplete(() => hideLoad());
  }

  @override
  void dispose() {
    _refreshController.dispose();
    _scrollController.dispose();
    super.dispose();
  }
}
