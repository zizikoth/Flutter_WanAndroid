import 'package:shared_preferences/shared_preferences.dart';
import 'package:wan/tools/Tools.dart';

class DataManager {
  static const _avatars = [
    "https://pic1.zhimg.com/80/v2-53d98d025e653bcdd18516c66b4e7ded_720w.jpg",
    "https://pic2.zhimg.com/80/v2-d7bee94aabb2f2999f1d60523b724e63_720w.jpg",
    "https://pic2.zhimg.com/80/v2-c2439c09ef02f924583b04b2c05c8f71_720w.jpg",
    "https://pic1.zhimg.com/80/v2-1ed0f37177bd9735ab09dcdfde99c8f4_720w.jpg",
    "https://pic4.zhimg.com/80/v2-903b496f4563959da9291bf0bc58bb46_720w.jpg",
    "https://pic4.zhimg.com/80/v2-0e340beaa1d476abb2ced515bce189c6_720w.jpg",
    "https://pic1.zhimg.com/80/v2-98f9b30c77ba002974c349295eb15509_720w.jpg",
    "https://pic2.zhimg.com/80/v2-c75aca8c1bbd39219d01a427d521de45_720w.jpg",
    "https://pic2.zhimg.com/80/v2-17871d0eb2e7f84bac7636054a7c0dc1_720w.jpg",
    "https://pic2.zhimg.com/80/v2-7863881260af94eb248eb120f976a11f_720w.jpg"
  ];

  static String getAvatar(int? userId) {
    var id = 0;
    if (userId != null && userId > 0) {
      id = userId;
    }
    return _avatars[id % 10];
  }

  static Future<bool> saveUserName(String name) async {
    var sp = await SharedPreferences.getInstance();
    return sp.setString("UserName", name);
  }

  static Future<String> getUserName() async {
    var sp = await SharedPreferences.getInstance();
    return sp.getString("UserName").orEmpty;
  }

  static removeUserName() async {
    var sp = await SharedPreferences.getInstance();
    sp.remove("UserInfo");
  }

  static Future<bool> saveKeyWord(String keyWord) async {
    var sp = await SharedPreferences.getInstance();
    var histories = sp.getStringList("keywords").orEmpty;
    if (histories.length > 20) {
      histories.removeLast();
    }
    var index = histories.indexOf(keyWord);
    if (index == -1) {
      histories.insert(0, keyWord);
    } else {
      histories
        ..removeAt(index)
        ..insert(0, keyWord);
    }
    return sp.setStringList("keywords", histories);
  }

  static Future<List<String>> getKeyWord() async {
    var sp = await SharedPreferences.getInstance();
    return sp.getStringList("keywords").orEmpty;
  }
}
