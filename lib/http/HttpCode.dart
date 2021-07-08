class HttpCode {
  /// Http请求成功
  static const HttpSuccess = 200;

  /// 服务器请求成功
  static const Success = 0;

  /// 服务器请求成功 需要登录
  static const NoLogin = -1001;

  /// 自定义 服务器异常
  static const ServerError = 1001;

  /// 自定义 网路异常
  static const NetError = 1002;

  /// 自定义 代码异常
  static const CodeError = 1003;

  /// 自定义 暂无数据
  static const DataEmpty = 1004;

  /// 自定义 取消请求
  static const Cancel = 1005;
}
