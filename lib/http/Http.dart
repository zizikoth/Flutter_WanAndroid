import 'dart:io';

import 'package:cookie_jar/cookie_jar.dart';
import 'package:dio/dio.dart';
import 'package:dio_cookie_manager/dio_cookie_manager.dart';
import 'package:path_provider/path_provider.dart';
import 'package:wan/core/base/CoreState.dart';
import 'package:wan/core/config/Config.dart';
import 'package:wan/entity/remote/BaseResponse.dart';
import 'package:wan/http/HttpCode.dart';
import 'package:wan/http/HttpErrorHandler.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/ext/CommonExt.dart';
import 'package:wan/tools/manager/RouteManager.dart';
import 'package:wan/tools/utils/TipUtils.dart';
import 'package:wan/ui/other/login/LoginPage.dart';

import 'HttpLogInterceptor.dart';

class Http {
  static const _GET = "GET";
  static const _POST = "POST";

  static var _dio = Dio(BaseOptions(baseUrl: Config.baseUrl, connectTimeout: 15000, receiveTimeout: 15000, sendTimeout: 15000));

  static PersistCookieJar? _cookieJar;

  static init() async {
    /// 日志打印
    _dio.interceptors.add(HttpLogInterceptor(logEnable: Config.debug));

    /// 缓存Cookie
    Directory tempDir = await getTemporaryDirectory();
    String cooliePath = tempDir.path + "/cookie";
    _cookieJar = PersistCookieJar(ignoreExpires: true, storage: FileStorage(cooliePath));
    _dio.interceptors.add(CookieManager(_cookieJar!));
  }

  static Future clearCookies() {
    return _cookieJar!.deleteAll();
  }

  static bool hasCookies() {
    return _cookieJar!.domainCookies.isNotEmpty;
  }

  static Future get(String path, CoreState? state, bool isFirst, {bool checkError = true, Map<String, dynamic>? params}) {
    return _request(_GET, path, state, isFirst, checkError, params);
  }

  static Future post(String path, CoreState? state, bool isFirst, {bool checkError = true, Map<String, dynamic>? params}) {
    return _request(_POST, path, state, isFirst, checkError, params);
  }

  static Future _request(String method, String path, CoreState? state, bool isFirst, bool checkError, Map<String, dynamic>? params) {
    return _dio.request(path, queryParameters: params, cancelToken: state?.cancelToken(), options: Options(method: method)).then((res) {
      /// 如果没有onSuccess回调 那么成功失败都不管 请求到服务端就好了
      var data = BaseResponse.fromJson(res.data);
      if (data.errorCode == HttpCode.Success) {
        /// 显示成功内容
        state?.changeState(HttpCode.Success);

        /// 返回数据
        return res.data;
      } else if (data.errorCode == HttpCode.NoLogin) {
        /// 如果不校验结果 那么直接退出
        if (!checkError) return;
        TipUtils.toast("请登录后尝试");

        /// 清空请求队列 不再进行后续请求
        _dio.clear();

        /// 清除Cookie
        clearCookies();

        /// 跳转登录
        RouteManager.push(LoginPage());
      } else {
        /// 如果不校验结果 那么直接退出
        if (!checkError) return;

        /// 服务器返回错误信息
        TipUtils.toast(data.errorMsg);
      }
    }).catchError((error) {
      /// 如果不校验结果 那么直接退出
      if (!checkError) return;
      int code = HttpErrorHandler.handleError(error);
      if (isFirst) state?.changeState(code);
    });
  }
}
