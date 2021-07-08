class TimeUtils {
  static Now nowTime() {
    var now = DateTime.now();
    return Now(
        now.year,
        now.month,
        now.day,
        now.hour,
        now.minute,
        now.second,
        now.millisecondsSinceEpoch,
        "${now.year}-${_formatNum(now.month)}-${_formatNum(now.day)}",
        "${now.year}-${_formatNum(now.month)}-${_formatNum(now.day)} ${_formatNum(now.hour)}:${_formatNum(now.minute)}",
        "${now.year}-${_formatNum(now.month)}-${_formatNum(now.day)} ${_formatNum(now.hour)}:${_formatNum(now.minute)}:${_formatNum(now.second)}",
        "${now.year}年${_formatNum(now.month)}月${_formatNum(now.day)}日",
        "${now.year}年${_formatNum(now.month)}月${_formatNum(now.day)}日 ${_formatNum(now.hour)}时${_formatNum(now.minute)}分",
        "${now.year}年${_formatNum(now.month)}月${_formatNum(now.day)}日 ${_formatNum(now.hour)}时${_formatNum(now.minute)}分${_formatNum(now.second)}秒",
        isLeapYear(now.year));
  }

  static bool isLeapYear(int year) {
    return year % 4 == 0 && year % 100 != 0 || year % 400 == 0;
  }

  static String _formatNum(int num) {
    if (num < 10) {
      return "0$num";
    } else {
      return num.toString();
    }
  }
}

class Now {
  int year;
  int month;
  int day;
  int hour;
  int minute;
  int seconds;
  int millis;
  String YMD;
  String YMDHM;
  String YMDHMS;
  String CHN_YMD;
  String CHN_YMDHM;
  String CHN_YMDHMS;
  bool isLeapYear;

  Now(this.year, this.month, this.day, this.hour, this.minute, this.seconds, this.millis, this.YMD, this.YMDHM, this.YMDHMS, this.CHN_YMD,
      this.CHN_YMDHM, this.CHN_YMDHMS, this.isLeapYear);

  @override
  String toString() {
    return 'Now{year: $year, month: $month, day: $day, hour: $hour, minute: $minute, seconds: $seconds, millis: $millis, YMD: $YMD, YMDHM: $YMDHM, YMDHMS: $YMDHMS, CHN_YMD: $CHN_YMD, CHN_YMDHM: $CHN_YMDHM, CHN_YMDHMS: $CHN_YMDHMS, isLeapYear: $isLeapYear}';
  }
}
