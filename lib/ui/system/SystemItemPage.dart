import 'package:flutter/material.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/local/WrapItemEntity.dart';
import 'package:wan/entity/remote/SystemResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/system/SystemArticlePage.dart';
import 'package:wan/widget/item/SystemItem.dart';

class SystemItemPage extends StatefulWidget {
  /// 0 = 体系 1 = 导航
  final int type;

  SystemItemPage(this.type);

  @override
  State<StatefulWidget> createState() => _SystemItemPage();
}

class _SystemItemPage extends BaseState<SystemItemPage> {
  /// 接口
  ApiService _api = ApiService();

  /// 数据源
  List<System> _systems = [];

  @override
  bool keepAlive() => true;

  @override
  PreferredSizeWidget? buildAppBar() => null;

  @override
  Widget buildContent() {
    return Container(
        color: ResColors.White,
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Container(
            padding: EdgeInsets.only(left: 7.5.w, right: 7.5.w),
            child: Wrap(
              children: _systems
                  .map((e) => WrapItem(WrapItemEntity(e.name.orEmpty, e.id.orEmpty, e.isTitle ?? false, extra: e.link), onTap: _onItemTap))
                  .toList(),
            ),
          ),
        ));
  }

  void _onItemTap(WrapItemEntity item) {
    if (item.isTitle != true) {
      if (item.extra != null) {
        /// 跳转常用网页
        RouteManager.startWeb(item.title, item.extra.orEmpty);
      } else {
        /// 跳转体系文章
        if (item.id.isNotNullOrZero) {
          RouteManager.push(SystemArticlePage(item.title, item.id.orEmpty));
        }
      }
    }
  }

  @override
  void initialize() {}

  @override
  void start() {
    Future<List<System>?> request;
    if (widget.type == 0) {
      request = _api.getSystemTree(state);
    } else {
      request = _api.getNaviTree(state);
    }
    request.then((systems) {
      setState(() {
        if (systems.isNotNullOrEmpty) {
          _systems = systems!;
        }
      });
    });
  }
}
