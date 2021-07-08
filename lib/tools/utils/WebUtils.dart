class WebUtils {
  static List<String> _schemes = [
    /// 应用商城
    "appmarket",

    /// 邮件
    "mailto",

    /// 电话
    "tell",

    /// 百度
    "baidu",

    /// B站
    "bilibili",

    /// 微信
    "wexin",

    /// 支付宝
    "alipays",

    /// 大众点评
    "dianping",

    /// 淘宝
    "tbopen",

    /// 天猫
    "tmast",

    /// 京东
    "openapp.jdmobile",

    /// 拼多多
    "pinduoduo",

    /// 简书
    "jianshu",

    /// CSDN
    "wvhzpj"
  ];

  static List<String> _blacks = [
    /// 淘宝
    "www.taobao.com",

    /// 京东
    "www.jd.com"
  ];

  static bool shouldBlockUrl(String url) {
    var shouldBlock = false;

    /// 如果是跳转
    for (var i = 0; i < _schemes.length; i++) {
      if (url.toLowerCase().startsWith(_schemes[i])) {
        shouldBlock = true;
        break;
      }
    }

    /// 如果在黑名单里面
    for (var i = 0; i < _blacks.length; i++) {
      if (url.toLowerCase().contains(_blacks[i])) {
        shouldBlock = true;
        break;
      }
    }
    return shouldBlock;
  }
}
