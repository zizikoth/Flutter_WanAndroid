class CommUtils {
  static String fromHtml(String? html) {
    if (html == null) return "";
    RegExp regHtml = RegExp(r"<[^>]*>", multiLine: true, caseSensitive: true);
    RegExp regOther = RegExp("&.*;", multiLine: true, caseSensitive: true);
    return html.replaceAll(regHtml, '').replaceAll(regOther, '');
  }
}
