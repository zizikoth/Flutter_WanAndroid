import 'dart:ui';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:wan/entity/local/Todo.dart';
import 'package:wan/entity/remote/TodoResponse.dart';
import 'package:wan/tools/Tools.dart';

class TodoItem extends StatefulWidget {
  final TodoItemInfo info;
  final SlidableController slidableController;
  final Function(TodoItemInfo) onStatus;
  final Function(TodoItemInfo) onEdit;
  final Function(TodoItemInfo) onDelete;

  TodoItem(this.info, this.slidableController, this.onStatus, this.onEdit, this.onDelete);

  @override
  State<StatefulWidget> createState() => _TodoItem();
}

class _TodoItem extends State<TodoItem> {
  @override
  Widget build(BuildContext context) {
    var todo = widget.info;

    return Slidable(
      controller: widget.slidableController,
      actionPane: SlidableDrawerActionPane(),
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.fromLTRB(15.w, 7.5.w, 15.w, 7.5.w),
        child: Card(
          elevation: ResDimen.w10,
          child: ClipRect(
            child: Banner(
              message: todo.getTypeDesc(),
              color: ResColors.TodoLabel,
              location: BannerLocation.topStart,
              child: Container(
                color: todo.getBackGroundColor(),
                child: Stack(
                  alignment: Alignment.bottomRight,
                  children: [
                    Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(15.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.fromLTRB(40.w, 0, 40.w, 0),
                            child: Text(
                              todo.title.orEmpty,
                              style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextDark, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                              padding: EdgeInsets.only(top: 10.w),
                              child: Text(
                                todo.content.orEmpty,
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10.w),
                              child: Text(
                                todo.getPriorityDesc(),
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )),
                          Padding(
                              padding: EdgeInsets.only(top: 10.w),
                              child: Text(
                                todo.dateStr.orEmpty,
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )),
                        ],
                      ),
                    ),
                    if (todo.status == TodoStatus.COMPLETE)
                      Padding(
                          padding: EdgeInsets.all(ResDimen.w15),
                          child: Image.asset(ResAssets.ic_status_complete, width: 40.w, height: 40.w))
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      secondaryActions: [
        Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Container(
              width: 70.w,
              height: 70.w,
              child: IconSlideAction(
                caption: todo.status == 0 ? '已完成' : '未完成',
                icon: todo.status == 0 ? Icons.stop_circle_outlined : Icons.play_circle_outline,
                foregroundColor: ResColors.White,
                color: ResColors.TodoStatus,
                onTap: () {
                  Slidable.of(context)?.close();
                  widget.onStatus(todo);
                },
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Container(
              width: 70.w,
              height: 70.w,
              child: IconSlideAction(
                caption: '修改',
                icon: Icons.edit,
                foregroundColor: ResColors.White,
                color: ResColors.TodoEdit,
                onTap: () {
                  Slidable.of(context)?.close();
                  widget.onEdit(todo);
                },
              ),
            ),
          ),
        ),
        Container(
          alignment: Alignment.center,
          child: ClipOval(
            child: Container(
              width: 70.w,
              height: 70.w,
              child: IconSlideAction(
                caption: '删除',
                icon: Icons.delete_forever,
                foregroundColor: ResColors.White,
                color: ResColors.TodoDelete,
                onTap: () {
                  Slidable.of(context)?.close();
                  widget.onDelete(todo);
                },
              ),
            ),
          ),
        ),
      ],
    );
  }
}
