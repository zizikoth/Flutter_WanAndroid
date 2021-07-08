import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/core/base/Status.dart';
import 'package:wan/http/HttpCode.dart';

extension CoreStateExt on CoreState? {
  void changeState(int code) {
    if (this is BaseState) {
      var state = this as BaseState;
      if (code == HttpCode.NetError) {
        state.changeState(States.NetError);
      } else if (code == HttpCode.ServerError) {
        state.changeState(States.ServerError);
      } else if (code == HttpCode.DataEmpty) {
        state.changeState(States.Empty);
      } else if (code == HttpCode.Success) {
        state.changeState(States.Content);
      }
    }
  }

  void showLoading(String tip) {
    if (this is BaseState) {
      (this as BaseState).changeState(States.Loading);
    }
  }

  void showEmpty() {
    if (this is BaseState) {
      (this as BaseState).changeState(States.Empty);
    }
  }

  void showContent() {
    if (this is BaseState) {
      (this as BaseState).changeState(States.Content);
    }
  }

  void showServerError() {
    if (this is BaseState) {
      (this as BaseState).changeState(States.ServerError);
    }
  }

  void showNetError() {
    if (this is BaseState) {
      (this as BaseState).changeState(States.NetError);
    }
  }
}

extension RefreshExt on RefreshController {
  void finish({bool? hasMore}) {
    if (this.isRefresh) {
      this.resetNoData();
      this.refreshCompleted();
    } else if (this.isLoading) {
      if (hasMore ?? true) {
        this.loadComplete();
      }
    }
    if (hasMore == false) {
      this.loadNoData();
    }
  }
}
