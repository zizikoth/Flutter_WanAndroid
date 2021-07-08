import 'dart:io';

import 'package:dio/dio.dart';
import 'package:wan/http/HttpCode.dart';
import 'package:wan/tools/utils/TipUtils.dart';

class HttpErrorHandler {
  static int handleError(error) {
    int code;
    var message;
    if (error is DioError) {
      switch (error.type) {
        case DioErrorType.connectTimeout:
        case DioErrorType.sendTimeout:
        case DioErrorType.receiveTimeout:
        case DioErrorType.response:
          message = "服务器异常，请稍后重试";
          code = HttpCode.ServerError;
          break;
        case DioErrorType.cancel:
          code = HttpCode.Cancel;
          break;
        case DioErrorType.other:
          if (error.error is SocketException) {
            code = HttpCode.NetError;
            message = "网络异常，请检查网络";
          } else {
            code = HttpCode.CodeError;
            message = "应用异常，请稍后尝试";
          }
          break;
      }
    } else {
      code = HttpCode.CodeError;
      message = "应用异常，请稍后尝试";
    }

    TipUtils.toast(message);
    return code;
  }
}
