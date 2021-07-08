import 'dart:ui';

import 'package:wan/entity/local/Todo.dart';
import 'package:wan/res/Res.dart';
import 'package:wan/tools/Tools.dart';

/// data : {"curPage":1,"datas":[{"completeDate":null,"completeDateStr":"","content":"内容","date":1625155200000,"dateStr":"2021-07-02","id":25349,"priority":3,"status":0,"title":"标题修改","type":2,"userId":15368},{"completeDate":null,"completeDateStr":"","content":"摸摸摸写作业(｡･&amp;amp;omega;･｡)ﾉ♡","date":1625155200000,"dateStr":"2021-07-02","id":25353,"priority":4,"status":0,"title":"标题党委书记员工提交了吗","type":3,"userId":15368},{"completeDate":1612886400000,"completeDateStr":"2021-02-10","content":"修改后的内容","date":1612195200000,"dateStr":"2021-02-02","id":17069,"priority":1,"status":1,"title":"修改后的标题","type":1,"userId":15368}],"offset":0,"over":true,"pageCount":1,"size":20,"total":3}
/// errorCode : 0
/// errorMsg : ""

class TodoResponse {
  TodoListInfo? data;
  int? errorCode;
  String? errorMsg;

  TodoResponse({this.data, this.errorCode, this.errorMsg});

  TodoResponse.fromJson(dynamic json) {
    data = json["data"] != null ? TodoListInfo.fromJson(json["data"]) : null;
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }
}

/// curPage : 1
/// datas : [{"completeDate":null,"completeDateStr":"","content":"内容","date":1625155200000,"dateStr":"2021-07-02","id":25349,"priority":3,"status":0,"title":"标题修改","type":2,"userId":15368},{"completeDate":null,"completeDateStr":"","content":"摸摸摸写作业(｡･&amp;amp;omega;･｡)ﾉ♡","date":1625155200000,"dateStr":"2021-07-02","id":25353,"priority":4,"status":0,"title":"标题党委书记员工提交了吗","type":3,"userId":15368},{"completeDate":1612886400000,"completeDateStr":"2021-02-10","content":"修改后的内容","date":1612195200000,"dateStr":"2021-02-02","id":17069,"priority":1,"status":1,"title":"修改后的标题","type":1,"userId":15368}]
/// offset : 0
/// over : true
/// pageCount : 1
/// size : 20
/// total : 3

class TodoListInfo {
  int? curPage;
  List<TodoItemInfo>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  TodoListInfo({this.curPage, this.datas, this.offset, this.over, this.pageCount, this.size, this.total});

  bool get hasMore => over == false;

  TodoListInfo.fromJson(dynamic json) {
    curPage = json["curPage"];
    if (json["datas"] != null) {
      datas = [];
      json["datas"].forEach((v) {
        datas?.add(TodoItemInfo.fromJson(v));
      });
    }
    offset = json["offset"];
    over = json["over"];
    pageCount = json["pageCount"];
    size = json["size"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = curPage;
    if (datas != null) {
      map["datas"] = datas?.map((v) => v.toJson()).toList();
    }
    map["offset"] = offset;
    map["over"] = over;
    map["pageCount"] = pageCount;
    map["size"] = size;
    map["total"] = total;
    return map;
  }
}

/// completeDate : null
/// completeDateStr : ""
/// content : "内容"
/// date : 1625155200000
/// dateStr : "2021-07-02"
/// id : 25349
/// priority : 3
/// status : 0
/// title : "标题修改"
/// type : 2
/// userId : 15368

class TodoItemInfo {
  String? completeDateStr;
  String? content;
  int? date;
  String? dateStr;
  int? id;
  int? priority;
  int? status;
  String? title;
  int? type;
  int? userId;

  TodoItemInfo(
      {this.completeDateStr,
      this.content,
      this.date,
      this.dateStr,
      this.id,
      this.priority,
      this.status,
      this.title,
      this.type,
      this.userId});

  TodoItemInfo.fromJson(dynamic json) {
    completeDateStr = json["completeDateStr"];
    content = json["content"];
    date = json["date"];
    dateStr = json["dateStr"];
    id = json["id"];
    priority = json["priority"];
    status = json["status"];
    title = json["title"];
    type = json["type"];
    userId = json["userId"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["completeDateStr"] = completeDateStr;
    map["content"] = content;
    map["date"] = date;
    map["dateStr"] = dateStr;
    map["id"] = id;
    map["priority"] = priority;
    map["status"] = status;
    map["title"] = title;
    map["type"] = type;
    map["userId"] = userId;
    return map;
  }

  Color getBackGroundColor() {
    return this.type == TodoType.WORK
        ? ResColors.TodoWork
        : this.type == TodoType.LIFE
            ? ResColors.TodoLife
            : this.type == TodoType.MINE
                ? ResColors.TodoMine
                : ResColors.TodoOther;
  }

  String getTypeDesc() {
    return this.type == TodoType.WORK
        ? '工作'
        : this.type == TodoType.LIFE
            ? '生活'
            : this.type == TodoType.MINE
                ? '个人'
                : '其他';
  }

  String getStatusDesc() {
    return this.status == TodoStatus.UN_COMPLETE ? '未完成' : '已完成';
  }

  String getPriorityDesc() {
    return this.priority == TodoPriority.IMMEDIATE
        ? '紧急！！！'
        : this.priority == TodoPriority.HIGH
            ? '重要！！'
            : this.priority == TodoPriority.NORMAL
                ? '一般！'
                : '随便';
  }

  @override
  String toString() {
    return 'TodoItemInfo{content: $content, id: $id, priority: $priority, status: $status, title: $title, type: $type}';
  }
}
