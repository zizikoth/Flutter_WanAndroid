import 'package:flutter/material.dart';
import 'package:wan/entity/local/Todo.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/widget/custom/LaberBar.dart';

class TodoBottomSheet extends StatefulWidget {
  final TodoFilter filter;
  final Function(TodoFilter) onFilter;

  TodoBottomSheet(this.filter, this.onFilter);

  @override
  State<StatefulWidget> createState() => _TodoBottomSheet();
}

class _TodoBottomSheet extends State<TodoBottomSheet> {
  final List<int> statusList = [TodoStatus.ALL, TodoStatus.COMPLETE, TodoStatus.UN_COMPLETE];
  final List<String> statusTitles = ['全部', '已完成', '未完成'];

  final List<int> typeList = [TodoType.ALL, TodoType.WORK, TodoType.LIFE, TodoType.MINE, TodoType.OTHER];
  final List<String> typeTitles = ['全部', '工作', '生活', '个人', '其他'];

  final List<int> priorityList = [TodoPriority.ALL, TodoPriority.IMMEDIATE, TodoPriority.HIGH, TodoPriority.NORMAL, TodoPriority.LOW];
  final List<String> priorityTitles = ['全部', '立刻', '重要', '一般', '随便'];

  final List<int> orderByList = [
    TodoOrderBy.CREATE_DATE_UP,
    TodoOrderBy.CREATE_DATE_DOWN,
    TodoOrderBy.COMPLETE_DATE_UP,
    TodoOrderBy.COMPLETE_DATE_DOWN
  ];
  final List<String> orderByTitles = ['创建时间升序', '创建时间降序', '完成时间升序', '完成时间降序'];

  @override
  Widget build(BuildContext context) {
    var filter = widget.filter;
    return Container(
      width: double.infinity,
      height: ResDimen.height * 0.8,
      padding: EdgeInsets.all(ResDimen.w15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            width: double.infinity,
            height: ResDimen.toolBarHeight,
            alignment: Alignment.center,
            child: Text(
              "筛选",
              style: TextStyle(color: Colors.black, fontSize: ResDimen.textLarge, fontWeight: FontWeight.bold),
            ),
          ),
          Column(
            children: [
              LabelBar("完成状态", ResColors.TextDark),
              Wrap(
                  children: statusList
                      .map((e) => Container(
                          width: (ResDimen.width - 30.w) / 3,
                          height: ResDimen.halfBarHeight,
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: e,
                                  groupValue: filter.status,
                                  activeColor: ResColors.TextDark,
                                  onChanged: (value) {
                                    setState(() {
                                      filter.status = value!;
                                    });
                                  }),
                              Text(
                                statusTitles[statusList.indexOf(e)],
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )
                            ],
                          )))
                      .toList()),
              LabelBar("清单类型", ResColors.TextDark),
              Wrap(
                  children: typeList
                      .map((e) => Container(
                          width: (ResDimen.width - 30.w) / 3,
                          height: 35.w,
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: e,
                                  groupValue: filter.type,
                                  activeColor: ResColors.TextDark,
                                  onChanged: (value) {
                                    setState(() {
                                      filter.type = value!;
                                    });
                                  }),
                              Text(
                                typeTitles[typeList.indexOf(e)],
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )
                            ],
                          )))
                      .toList()),
              LabelBar("优先级别", ResColors.TextDark),
              Wrap(
                  children: priorityList
                      .map((e) => Container(
                          width: (ResDimen.width - 30.w) / 3,
                          height: 35.w,
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: e,
                                  groupValue: filter.priority,
                                  activeColor: ResColors.TextDark,
                                  onChanged: (value) {
                                    setState(() {
                                      filter.priority = value!;
                                    });
                                  }),
                              Text(
                                priorityTitles[priorityList.indexOf(e)],
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )
                            ],
                          )))
                      .toList()),
              LabelBar("时间排序", ResColors.TextDark),
              Wrap(
                  children: orderByList
                      .map((e) => Container(
                          width: (ResDimen.width - 30.w) / 2,
                          height: 35.w,
                          child: Row(
                            children: [
                              Radio<int>(
                                  value: e,
                                  groupValue: filter.orderBy,
                                  activeColor: ResColors.TextDark,
                                  onChanged: (value) {
                                    setState(() {
                                      filter.orderBy = value!;
                                    });
                                  }),
                              Text(
                                orderByTitles[orderByList.indexOf(e)],
                                style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.TextNormal),
                              )
                            ],
                          )))
                      .toList()),
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 20.w, bottom: 20.w),
            child: MaterialButton(
              minWidth: ResDimen.width - 40.w,
              color: ResColors.Black,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
              padding: EdgeInsets.all(15),
              child: Text("确定", style: TextStyle(fontSize: ResDimen.textNormal, color: ResColors.White)),
              onPressed: () {
                RouteManager.pop();
                widget.onFilter(filter);
              },
            ),
          )
        ],
      ),
    );
  }
}
