class TodoType {
  /// 工作
  static const WORK = 1;

  /// 生活
  static const LIFE = 2;

  /// 个人
  static const MINE = 3;

  /// 其他
  static const OTHER = 4;

  /// 全部
  static const ALL = -1;
}

class TodoStatus {
  /// 未完成
  static const UN_COMPLETE = 0;

  /// 已完成
  static const COMPLETE = 1;

  /// 全部
  static const ALL = -1;
}

class TodoPriority {
  /// 紧急
  static const IMMEDIATE = 4;

  /// 重要
  static const HIGH = 3;

  /// 一般
  static const NORMAL = 2;

  /// 随便
  static const LOW = 1;

  /// 全部
  static const ALL = -1;
}

class TodoOrderBy {
  /// 完成时间升序
  static const COMPLETE_DATE_UP = 1;

  /// 完成时间倒叙
  static const COMPLETE_DATE_DOWN = 2;

  /// 创建时间升序
  static const CREATE_DATE_UP = 3;

  /// 创建时间倒叙
  static const CREATE_DATE_DOWN = 4;
}

class TodoFilter {
  int status = TodoStatus.ALL;
  int type = TodoType.ALL;
  int priority = TodoPriority.ALL;
  int orderBy = TodoOrderBy.CREATE_DATE_UP;

  void reset() {
    this.status = TodoStatus.ALL;
    this.type = TodoType.ALL;
    this.priority = TodoPriority.ALL;
    this.orderBy = TodoOrderBy.CREATE_DATE_UP;
  }

  @override
  String toString() {
    return 'TodoFilter{status: $status, type: $type, priority: $priority, orderBy: $orderBy}';
  }
}

class FilterEntity {
  int id;
  String name;

  FilterEntity(this.id, this.name);
}
