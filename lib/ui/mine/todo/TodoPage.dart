import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:wan/app/Constant.dart';
import 'package:wan/core/base/BaseState.dart';
import 'package:wan/entity/local/Todo.dart';
import 'package:wan/entity/remote/TodoResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/ui/mine/todo/TodoEditPage.dart';
import 'package:wan/widget/custom/Refresh.dart';
import 'package:wan/widget/custom/TitleBar.dart';
import 'package:wan/widget/dialog/TodoBottomSheet.dart';
import 'package:wan/widget/item/TodoItem.dart';

class TodoPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TodoPage();
}

class _TodoPage extends BaseState<TodoPage> {
  /// 筛选条件
  TodoFilter _filter = TodoFilter();

  /// 接口
  ApiService _api = ApiService();

  /// 分页
  int _page = 1;

  /// 数据源
  List<TodoItemInfo> _list = [];

  /// 刷新控制
  RefreshController _refreshController = RefreshController();

  /// 滑动控制
  SlidableController _slidableController = SlidableController();

  /// 滚动控制
  ScrollController _scrollController = ScrollController();

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar(
        "未完清单",
        onTitleTap: () {
          if (_scrollController.offset > Constant.limitOffset) {
            _scrollController.animateTo(0, duration: Duration(milliseconds: 500), curve: Curves.ease);
          }
        },
        actions: [IconButton(onPressed: _todoFilter, icon: Icon(Icons.filter_list, color: Colors.black, size: 20.w))],
      );

  @override
  Widget buildContent() {
    return SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        enablePullDown: true,
        header: MaterialClassicHeader(),
        footer: RefreshFooter(noMore: ""),
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
          itemBuilder: (context, index) => TodoItem(_list[index], _slidableController, _onStatus, _onEdit, _onDelete),
          itemCount: _list.length,
        ));
  }

  @override
  Widget? buildFloatingButton() {
    return FloatingActionButton(
        child: Icon(Icons.edit, color: ResColors.White),
        elevation: 10.w,
        backgroundColor: ResColors.Black,
        onPressed: () {
          RouteManager.push(TodoEditPage()).then((isChanged) {
            /// 如果新增了数据 重新刷新界面
            if (isChanged == true) {
              _filter.reset();
              _page = 1;
              _refreshController.requestRefresh();
            }
          });
        });
  }

  /// 显示筛选框
  _todoFilter() {
    TipUtils.showWidgetBottomSheet(context, TodoBottomSheet(_filter, _onFilter));
  }

  /// 筛选Todo列表
  _onFilter(TodoFilter filter) {
    _filter = filter;
    _page = 1;
    showLoad().then((value) => start());
  }

  /// 修改Todo状态
  _onStatus(TodoItemInfo todo) {
    showLoad();
    _api.updateTodoStatus(todo.id ?? 0, todo.status == TodoStatus.UN_COMPLETE).then((value) {
      if (value) {
        setState(() {
          var index = _list.lastIndexWhere((item) => item.id == todo.id);
          if (index != -1) {
            _list[index].status = todo.status == TodoStatus.UN_COMPLETE ? TodoStatus.COMPLETE : TodoStatus.UN_COMPLETE;
          }
        });
      }
    }).whenComplete(() => hideLoad());
  }

  /// 修改Todo内容
  _onEdit(TodoItemInfo todo) {
    var temp =
        TodoItemInfo(content: todo.content, id: todo.id, priority: todo.priority, status: todo.status, title: todo.title, type: todo.type);
    RouteManager.push(TodoEditPage(info: temp)).then((isChanged) {
      /// 如果发生了修改 重新刷新界面
      if (isChanged == true) {
        _filter.reset();
        _page = 1;
        _refreshController.requestRefresh();
      }
    });
  }

  /// 删除Todo
  _onDelete(TodoItemInfo todo) {
    showLoad();
    _api.deleteTodo(todo.id ?? 0).then((value) {
      if (value) {
        setState(() {
          var index = _list.lastIndexWhere((item) => item.id == todo.id);
          if (index != -1) {
            _list.removeAt(index);
          }
        });
      }
    }).whenComplete(() => hideLoad());
  }

  @override
  void initialize() {}

  @override
  void start() {
    _api.getTodoList(state, _page, _filter).then((list) {
      if (list == null || list.datas.isNullOrEmpty) {
        showEmpty();
      }
      setState(() {
        _refreshController.finish(hasMore: list?.hasMore);
        if (list != null && list.datas.isNotNullOrEmpty) {
          if (_page == 1) {
            _list = list.datas.orEmpty;
          } else {
            _list.addAll(list.datas.orEmpty);
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
