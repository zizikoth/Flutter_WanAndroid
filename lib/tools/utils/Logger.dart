import 'package:wan/core/config/Config.dart';

class Logger {
  static const _tag = "Logger";
  static bool _debugMode = Config.debug;
  static int _maxLen = 4000;

  static void log(dynamic object) {
    if (_debugMode) _printLog(_tag, object);
  }

  static void logTag(String tag, dynamic object) {
    if (_debugMode) _printLog(tag, object);
  }

  static void _printLog(String? tag, dynamic object) {
    String data = object?.toString() ?? 'null';
    tag = tag ?? _tag;
    if (data.length <= _maxLen) {
      if (tag.isNotEmpty) tag = tag + "：";
      print('$tag$data');
      return;
    }
    print('----------------------------------------start----------------------------------------\n$tag');
    while (data.isNotEmpty) {
      if (data.length > _maxLen) {
        print('$tag| ${data.substring(0, _maxLen)}');
        data = data.substring(_maxLen, data.length);
      } else {
        print('$tag| $data');
        data = '';
      }
    }
    print('$tag\n----------------------------------------e n d----------------------------------------');
  }
}
