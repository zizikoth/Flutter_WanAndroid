import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/core/base/PageStatus.dart';
import 'package:wan/core/base/Status.dart';

abstract class BaseState<T extends StatefulWidget> extends CoreState<T> {
  /// 当前页面显示状态
  States _state = States.Loading;
  String _tip = "加载中";

  /// 初始化
  void initialize();

  /// 构建内容
  Widget buildContent();

  /// 网络请求
  void start();

  @override
  void init() {
    initialize();
    start();
  }

  @override
  Widget buildBody() {
    if (_state == States.Loading) {
      return LoadingState(_tip);
    } else if (_state == States.ServerError) {
      return ServerErrorState(() {
        changeState(States.Loading);
        start();
      });
    } else if (_state == States.NetError) {
      return NetErrorState(() {
        changeState(States.Loading);
        start();
      });
    } else if (_state == States.Empty) {
      return EmptyState();
    } else {
      return buildContent();
    }
  }

  /// 更改页面状态
  void changeState(States state, {String? tip}) {
    if (this._state != state) {
      setState(() {
        if (state == States.Loading && tip != null) {
          this._tip = tip;
        }
        this._state = state;
      });
    }
  }
}
