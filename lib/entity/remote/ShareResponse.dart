import 'package:wan/entity/remote/ArticlesResponse.dart';
import 'package:wan/entity/remote/CoinResponse.dart';

/// data : {"coinInfo":{"coinCount":1136,"level":12,"nickname":"","rank":"1394","userId":15368,"username":"M**Memo"},"shareArticles":{"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":494,"chapterName":"广场","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18891,"link":"https://juejin.cn/post/6926822995142918152","niceDate":"3小时前","niceShareDate":"3小时前","origin":"","prefix":"","projectLink":"","publishTime":1625650702000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1625650702000,"shareUser":"Mr.Memo","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"细数那些不为人知的 Chrome DevTools 骚操作，你会使用几个？","type":0,"userId":15368,"visible":0,"zan":0}],"offset":0,"over":true,"pageCount":1,"size":20,"total":1}}
/// errorCode : 0
/// errorMsg : ""

class ShareResponse {
  ShareInfo? data;
  int? errorCode;
  String? errorMsg;

  ShareResponse({this.data, this.errorCode, this.errorMsg});

  ShareResponse.fromJson(dynamic json) {
    data = json["data"] != null ? ShareInfo.fromJson(json["data"]) : null;
    errorCode = json["errorCode"];
    errorMsg = json["errorMsg"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (data != null) {
      map["data"] = data?.toJson();
    }
    map["errorCode"] = errorCode;
    map["errorMsg"] = errorMsg;
    return map;
  }
}

/// coinInfo : {"coinCount":1136,"level":12,"nickname":"","rank":"1394","userId":15368,"username":"M**Memo"}
/// shareArticles : {"curPage":1,"datas":[{"apkLink":"","audit":1,"author":"","canEdit":false,"chapterId":494,"chapterName":"广场","collect":false,"courseId":13,"desc":"","descMd":"","envelopePic":"","fresh":true,"host":"","id":18891,"link":"https://juejin.cn/post/6926822995142918152","niceDate":"3小时前","niceShareDate":"3小时前","origin":"","prefix":"","projectLink":"","publishTime":1625650702000,"realSuperChapterId":493,"selfVisible":0,"shareDate":1625650702000,"shareUser":"Mr.Memo","superChapterId":494,"superChapterName":"广场Tab","tags":[],"title":"细数那些不为人知的 Chrome DevTools 骚操作，你会使用几个？","type":0,"userId":15368,"visible":0,"zan":0}],"offset":0,"over":true,"pageCount":1,"size":20,"total":1}

class ShareInfo {
  CoinInfo? coinInfo;
  Articles? shareArticles;

  ShareInfo({this.coinInfo, this.shareArticles});

  ShareInfo.fromJson(dynamic json) {
    coinInfo = json["coinInfo"] != null ? CoinInfo.fromJson(json["coinInfo"]) : null;
    shareArticles = json["shareArticles"] != null ? Articles.fromJson(json["shareArticles"]) : null;
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (coinInfo != null) {
      map["coinInfo"] = coinInfo?.toJson();
    }
    if (shareArticles != null) {
      map["shareArticles"] = shareArticles?.toJson();
    }
    return map;
  }
}
