import 'package:dio/dio.dart';
import 'package:wan/http/Http.dart';
import 'package:wan/tools/Tools.dart';
import 'package:wan/tools/manager/DataManager.dart';
import 'package:wan/tools/manager/RouteManager.dart';
import 'package:wan/ui/other/login/LoginPage.dart';

class UserManager {
  static String _username = "";
  static List<String> _collections = [];

  static String getUserName() {
    if (_username.isNotNullOrEmpty)
      return _username;
    else
      return DataManager.getUserName();
  }

  static setUserName(String userName) {
    _username = userName;
    DataManager.saveUserName(userName);
  }

  static List<String> getUserCollections() {
    if (_collections.isNotNullOrEmpty)
      return _collections;
    else
      return DataManager.getUserCollections();
  }

  static setUserCollections(List<String> collections) {
    _collections = collections;
    DataManager.saveUserCollections(_collections);
  }

  static addUserCollections(String id) {
    if (!_collections.contains(id)) {
      _collections.add(id);
    }
    DataManager.saveUserCollections(_collections);
  }

  static removeUserCollections(String id) {
    if (_collections.contains(id)) {
      _collections.remove(id);
    }
    DataManager.saveUserCollections(_collections);
  }

  static loginOut() {
    _username = "";
    _collections = [];
    DataManager.removeUserName();
    DataManager.removeUserCollections();
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
