import 'package:dio/dio.dart';
import 'package:wan/http/Http.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/DataManager.dart';
import 'package:wan/tools/manager/RouteManager.dart';
import 'package:wan/ui/other/login/LoginPage.dart';

class UserManager {
  static Future<String> getUserName() async {
    return await DataManager.getUserName();
  }

  static setUserName(String userName) {
    DataManager.saveUserName(userName);
  }

  static loginOut() {
    DataManager.removeUserName();
    Http.clearCookies();
  }

  static afterLogin(VoidCallback afterLogin) {
    if (Http.hasCookies()) {
      afterLogin();
    } else {
      RouteManager.push(LoginPage());
    }
  }
}
