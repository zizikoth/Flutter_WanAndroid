/// data : [{"articles":[{"link":"https://developers.google.cn/","title":"Google开发者"}],"name":"常用网站"}]
/// errorCode : 0
/// errorMsg : ""

class NaviResponse {
  List<NaviGroup>? data;
  int? errorCode;
  String? errorMsg;

  NaviResponse({this.data, this.errorCode, this.errorMsg});

  NaviResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(NaviGroup.fromJson(v));
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

/// articles : [{"link":"https://developers.google.cn/","title":"Google开发者"}]
/// name : "常用网站"

class NaviGroup {
  List<Navi>? articles;
  String? name;

  NaviGroup({this.articles, this.name});

  NaviGroup.fromJson(dynamic json) {
    if (json["articles"] != null) {
      articles = [];
      json["articles"].forEach((v) {
        articles?.add(Navi.fromJson(v));
      });
    }
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (articles != null) {
      map["articles"] = articles?.map((v) => v.toJson()).toList();
    }
    map["name"] = name;
    return map;
  }
}

/// link : "https://developers.google.cn/"
/// title : "Google开发者"

class Navi {
  String? link;
  String? title;

  Navi({this.link, this.title});

  Navi.fromJson(dynamic json) {
    link = json["link"];
    title = json["title"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["link"] = link;
    map["title"] = title;
    return map;
  }
}
