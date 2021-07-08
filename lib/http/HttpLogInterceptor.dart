import 'package:dio/dio.dart';
import 'package:wan/tools/utils/Logger.dart';
import 'package:wan/tools/utils/TimeUtils.dart';

class HttpLogInterceptor extends Interceptor {
  HttpLogInterceptor({this.logEnable = true});

  bool logEnable;

  int _startTime = 0;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    if (logEnable) {
      var uri = options.uri.toString();
      var builder = StringBuffer();
      builder.write("----------------------------------------HTTP REQUEST START-----------------------------------------\n");
      _startTime = TimeUtils.nowTime().millis;
      builder.write("url：$uri \n");
      if (options.headers.isNotEmpty) {
        builder.write("Headers \n");
        options.headers.forEach((key, value) => builder.write("$key：$value \n"));
      }
      if (options.data != null) {
        builder.write("data：${options.data} \n");
      }
      builder.write("----------------------------------------HTTP REQUEST E N D-----------------------------------------\n\n");

      Logger.logTag("", builder);
    }
    handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    if (logEnable) {
      var builder = StringBuffer();
      builder.write("----------------------------------------HTTP RESPONSE START----------------------------------------\n");
      var uri = response.requestOptions.uri.toString();
      builder.write("url：$uri \n");
      builder.write("请求时长：${TimeUtils.nowTime().millis - _startTime}\n");
      builder.write("statusCode：${response.statusCode}\n");
      builder.write("response：\n");
      builder.write("${response.toString()}\n");
      builder.write("----------------------------------------HTTP RESPONSE E N D----------------------------------------\n");
      Logger.logTag("", builder);
    }
    handler.next(response);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    if (logEnable) {
      var builder = StringBuffer();
      builder.write("----------------------------------------HTTP   ERROR   Start----------------------------------------\n");
      builder.write("${err.requestOptions.uri}\n $err");
      builder.write("----------------------------------------HTTP   ERROR   E N D----------------------------------------\n");
      Logger.logTag("", builder);
    }
    handler.next(err);
  }
}
