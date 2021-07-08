import 'package:flutter/material.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/entity/local/ItemEntity.dart';
import 'package:wan/entity/local/Todo.dart';
import 'package:wan/entity/remote/TodoResponse.dart';
import 'package:wan/http/ApiService.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/ItemBar.dart';
import 'package:wan/widget/custom/LaberBar.dart';
import 'package:wan/widget/custom/TitleBar.dart';

class TodoEditPage extends StatefulWidget {
  final TodoItemInfo? info;
  final bool isEdit;

  TodoEditPage({this.info, this.isEdit = true});

  @override
  State<StatefulWidget> createState() => _TodoEditPage();
}

class _TodoEditPage extends CoreState<TodoEditPage> {
  ApiService _api = ApiService();

  TodoItemInfo _info =
      TodoItemInfo(title: "", content: "", type: TodoType.OTHER, priority: TodoPriority.NORMAL, status: TodoStatus.UN_COMPLETE);

  TextEditingController _titleController = TextEditingController();
  FocusNode _titleFocusNode = FocusNode();
  TextEditingController _contentController = TextEditingController();
  FocusNode _contentFocusNode = FocusNode();

  List<ItemEntity> _types = [
    ItemEntity(TodoType.LIFE.toString(), "生活"),
    ItemEntity(TodoType.WORK.toString(), "工作"),
    ItemEntity(TodoType.MINE.toString(), "个人"),
    ItemEntity(TodoType.OTHER.toString(), "其他")
  ];

  List<ItemEntity> _priorities = [
    ItemEntity(TodoPriority.IMMEDIATE.toString(), "紧急"),
    ItemEntity(TodoPriority.HIGH.toString(), "重要"),
    ItemEntity(TodoPriority.NORMAL.toString(), "一般"),
    ItemEntity(TodoPriority.LOW.toString(), "随便")
  ];

  @override
  PreferredSizeWidget? buildAppBar() => TitleBar("未完清单",
      actions: widget.isEdit ? [IconButton(onPressed: _saveTodo, icon: Icon(Icons.save, color: Colors.black, size: 20.w))] : null);

  @override
  Widget buildBody() {
    return Container(
      child: Column(
        children: [
          LabelBar("标题", ResColors.Black),
          Container(
            padding: EdgeInsets.only(left: 15.w, right: 15.w),
            child: TextField(
                maxLines: 1,
                maxLength: 20,
                cursorColor: ResColors.TextDark,
                controller: _titleController,
                focusNode: _titleFocusNode,
                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark),
                decoration: InputDecoration(
                    hintText: "请输入标题",
                    hintStyle: TextStyle(color: ResColors.TextLight),
                    labelText: "请输入标题",
                    labelStyle: TextStyle(color: ResColors.TextLight),
                    counterStyle: TextStyle(color: ResColors.TextLight),
                    focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                    enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                onChanged: (value) {
                  _info.title = value;
                }),
          ),
          LabelBar("内容", ResColors.Black),
          Container(
              padding: EdgeInsets.only(left: 15.w, right: 15.w),
              child: TextField(
                  minLines: 5,
                  maxLines: 5,
                  maxLength: 100,
                  cursorColor: ResColors.TextDark,
                  controller: _contentController,
                  focusNode: _contentFocusNode,
                  scrollPhysics: BouncingScrollPhysics(),
                  style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark),
                  decoration: InputDecoration(
                      hintText: "请输入内容",
                      hintStyle: TextStyle(color: ResColors.TextLight),
                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextDark)),
                      enabledBorder: OutlineInputBorder(borderSide: BorderSide(color: ResColors.TextLight))),
                  onChanged: (value) {
                    _info.content = value;
                  })),
          LabelBar("类型", ResColors.Black),
          ItemBar(_info.getTypeDesc(), isSelect: true, onClick: _selectType),
          LabelBar("级别", ResColors.Black),
          ItemBar(
            _info.getPriorityDesc(),
            isSelect: true,
            onClick: _selectPriority,
          ),
        ],
      ),
    );
  }

  _selectType() {
    /// 让输入框失去焦点
    _titleFocusNode.unfocus();
    _contentFocusNode.unfocus();
    TipUtils.showBottomSheet(context, "类型", _types, (item) {
      setState(() {
        _info.type = int.parse(item.id);
      });
    });
  }

  _selectPriority() {
    /// 让输入框失去焦点
    _titleFocusNode.unfocus();
    _contentFocusNode.unfocus();
    TipUtils.showBottomSheet(context, "级别", _priorities, (item) {
      setState(() {
        _info.priority = int.parse(item.id);
      });
    });
  }

  /// 保存Todo
  _saveTodo() async {
    if (_info.title.isNullOrEmpty) {
      TipUtils.toast("请输入标题");
    } else if (_info.content.isNullOrEmpty) {
      TipUtils.toast("请输入内容");
    } else {
      showLoad();
      bool isSuccess;
      if (_info.id != null) {
        // 修改
        isSuccess = await _api.updateTodoInfo(_info.id!, _info.title!, _info.content!, _info.type!, _info.priority!);
      } else {
        // 新增
        isSuccess = await _api.addTodo(_info.title!, _info.content!, _info.type!, _info.priority!);
      }
      hideLoad();
      if (isSuccess) {
        RouteManager.pop(isSuccess);
      }
    }
  }

  @override
  void init() {
    /// 初始化数据
    if (widget.info != null) {
      _info = widget.info!;
    }
    _titleController.text = _info.title.orEmpty;
    _contentController.text = _info.content.orEmpty;
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _titleFocusNode.dispose();
    _contentFocusNode.dispose();
    super.dispose();
  }
}
