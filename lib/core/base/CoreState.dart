import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/utils/TipUtils.dart';

abstract class CoreState<T extends StatefulWidget> extends State<T> with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => keepAlive();

  /// 是否显示了加载框
  var _isShowLoading = false;

  /// self
  CoreState? state;

  /// 事件总线列表
  List<StreamSubscription> _subscribes = [];

  /// 网络请求CancelToken
  CancelToken _cancelToken = CancelToken();

  /// 初始化操作
  void init();

  /// 是否保持状态
  bool keepAlive() => false;

  /// 双击退出
  bool doubleExit() => false;

  /// 标题栏
  PreferredSizeWidget? buildAppBar();

  /// 内容
  Widget buildBody();

  /// 底部导航栏
  Widget? buildBottomBar() => null;

  /// 悬浮按钮
  Widget? buildFloatingButton() => null;

  /// 悬浮按钮位置
  FloatingActionButtonLocation? buildFloatingButtonLocation() => null;

  @override
  void initState() {
    super.initState();
    state = this;
    init();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    doBeforeBuild();
    return Scaffold(
      appBar: buildAppBar(),
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: buildFloatingButton(),
      floatingActionButtonLocation: buildFloatingButtonLocation(),
      resizeToAvoidBottomInset: false,
    );
  }

  /// 在Build之前完成
  void doBeforeBuild() {}

  /// 添加事件总线
  void addEvent(StreamSubscription event) {
    _subscribes.add(event);
  }

  /// 获取网络请求的CancelToken
  CancelToken cancelToken() => _cancelToken;

  /// 显示加载框
  Future showLoad() async {
    if (!_isShowLoading) {
      Future.delayed(Duration.zero, () {
        _isShowLoading = true;
        TipUtils.showLoading(context);
      });
    }
  }

  /// 隐藏加载框
  Future hideLoad() async {
    if (_isShowLoading) {
      _isShowLoading = false;
      Navigator.pop(context);
    }
  }

  @override
  void dispose() {
    /// 清空所有的事件总线
    _subscribes.forEach((subscribe) {
      subscribe.cancel();
    });

    /// 清空网络请求
    if (!_cancelToken.isCancelled) {
      _cancelToken.cancel("页面关闭，请求取消");
    }
    super.dispose();
  }
}
