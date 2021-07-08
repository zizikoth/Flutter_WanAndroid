/// data : [{"desc":"扔物线","id":29,"imagePath":"https://wanandroid.com/blogimgs/31c2394c-b07c-4699-afd1-95aa7a3bebc6.png","isVisible":1,"order":0,"title":"View 嵌套太深会卡？来用 Jetpack Compose，随便套&mdash;&mdash;Compose 的 Intrinsic Measurement","type":0,"url":"https://www.bilibili.com/video/BV1ZA41137gr"},{"desc":"","id":6,"imagePath":"https://www.wanandroid.com/blogimgs/62c1bd68-b5f3-4a3c-a649-7ca8c7dfabe6.png","isVisible":1,"order":1,"title":"我们新增了一个常用导航Tab~","type":1,"url":"https://www.wanandroid.com/navi"},{"desc":"一起来做个App吧","id":10,"imagePath":"https://www.wanandroid.com/blogimgs/50c115c2-cf6c-4802-aa7b-a4334de444cd.png","isVisible":1,"order":1,"title":"一起来做个App吧","type":1,"url":"https://www.wanandroid.com/blog/show/2"},{"desc":"","id":20,"imagePath":"https://www.wanandroid.com/blogimgs/90c6cc12-742e-4c9f-b318-b912f163b8d0.png","isVisible":1,"order":2,"title":"flutter 中文社区 ","type":1,"url":"https://flutter.cn/"}]
/// errorCode : 0
/// errorMsg : ""

class BannerResponse {
  List<HomeBanner>? data;
  int? errorCode;
  String? errorMsg;

  BannerResponse({this.data, this.errorCode, this.errorMsg});

  BannerResponse.fromJson(dynamic json) {
    data = [];
    if (json["data"] != null) {
      json["data"].forEach((v) {
        data?.add(HomeBanner.fromJson(v));
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

/// desc : "扔物线"
/// id : 29
/// imagePath : "https://wanandroid.com/blogimgs/31c2394c-b07c-4699-afd1-95aa7a3bebc6.png"
/// isVisible : 1
/// order : 0
/// title : "View 嵌套太深会卡？来用 Jetpack Compose，随便套&mdash;&mdash;Compose 的 Intrinsic Measurement"
/// type : 0
/// url : "https://www.bilibili.com/video/BV1ZA41137gr"

class HomeBanner {
  String? desc;
  int? id;
  String? imagePath;
  int? isVisible;
  int? order;
  String? title;
  int? type;
  String? url;

  HomeBanner({this.desc, this.id, this.imagePath, this.isVisible, this.order, this.title, this.type, this.url});

  HomeBanner.fromJson(dynamic json) {
    desc = json["desc"];
    id = json["id"];
    imagePath = json["imagePath"];
    isVisible = json["isVisible"];
    order = json["order"];
    title = json["title"];
    type = json["type"];
    url = json["url"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["desc"] = desc;
    map["id"] = id;
    map["imagePath"] = imagePath;
    map["isVisible"] = isVisible;
    map["order"] = order;
    map["title"] = title;
    map["type"] = type;
    map["url"] = url;
    return map;
  }
}
