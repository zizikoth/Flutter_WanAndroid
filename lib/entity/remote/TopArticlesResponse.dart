import 'package:wan/entity/remote/ArticlesResponse.dart';

/// data : [{"apkLink":"","audit":1,"author":"扔物线","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":12554,"link":"https://www.bilibili.com/video/BV1CA41177Se","niceDate":"刚刚","niceShareDate":"2020-03-23 16:36","origin":"","prefix":"","projectLink":"","publishTime":1626537600000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1584952597000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"Android 面试黑洞&mdash;&mdash;当我按下 Home 键再切回来，会发生什么？","type":1,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"享学","canEdit":false,"chapterId":249,"chapterName":"干货资源","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18330,"link":"https://mp.weixin.qq.com/s/UD3KUPq-EKSAg3iDzgMNzA","niceDate":"13小时前","niceShareDate":"2021-05-17 21:13","origin":"","prefix":"","projectLink":"","publishTime":1622390400000,"realSuperChapterId":248,"selfVisible":0,"shareDate":1621257191000,"shareUser":"","superChapterId":249,"superChapterName":"干货资源","tags":[],"title":"知乎高赞！字节跳动技术大神亲授内部音视频开发笔记，熬夜撸完后，感觉之前学的都是渣渣","type":1,"userId":-1,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>更近聊到一种编译优化的方案，号称秒级别：</p>\r\n<ol>\r\n<li>每次拿到修改 java 文件，编译为 class；</li>\r\n<li>将 1 中的 class 转成 dex；</li>\r\n<li>push 到 sdcard，然后重启生效；</li>\r\n</ol>\r\n<p>问题来了：</p>\r\n<ol>\r\n<li>第一步中将特定的 Java 文件转成 class 如何操作？如何极快的操作？</li>\r\n<li>如果是 kotlin 文件呢？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18453,"link":"https://www.wanandroid.com/wenda/show/18453","niceDate":"2021-05-28 00:28","niceShareDate":"2021-05-28 00:28","origin":"","prefix":"","projectLink":"","publishTime":1622132933000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1622132918000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | 极致的编译优化如何实现？","type":1,"userId":2,"visible":1,"zan":0},{"apkLink":"","audit":1,"author":"xiaoyang","canEdit":false,"chapterId":440,"chapterName":"官方","collect":false,"courseId":13,"desc":"<p>在我们的印象里，如果构造一个 Dialog 传入一个非 Activiy 的 context，则可能会出现 bad token exception。</p>\r\n<p>今天我们就来彻底搞清楚这一块，问题来了：</p>\r\n<ol>\r\n<li>为什么传入一个非 Activity 的 context 会出现错误？</li>\r\n<li>传入的 context 一定要是 Activity 吗？</li>\r\n</ol>","descMd":"","envelopePic":"","fresh":false,"host":"","id":18281,"link":"https://www.wanandroid.com/wenda/show/18281","niceDate":"2021-05-13 21:21","niceShareDate":"2021-05-13 00:20","origin":"","prefix":"","projectLink":"","publishTime":1620912076000,"realSuperChapterId":439,"selfVisible":0,"shareDate":1620836414000,"shareUser":"","superChapterId":440,"superChapterName":"问答","tags":[{"name":"本站发布","url":"/article/list/0?cid=440"},{"name":"问答","url":"/wenda"}],"title":"每日一问 | Dialog 的构造方法的 context 必须传入 Activity吗？","type":1,"userId":2,"visible":1,"zan":8}]
/// errorCode : 0
/// errorMsg : ""

class TopArticlesResponse {
  List<Article>? data;
  int? errorCode;
  String? errorMsg;

  TopArticlesResponse({this.data, this.errorCode, this.errorMsg});

  TopArticlesResponse.fromJson(dynamic json) {
    data = [];
    if (json["data"] != null) {
      json["data"].forEach((v) {
        data?.add(Article.fromJson(v));
      });
    }
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.map((v) => v.toJson()).toList();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }
}
