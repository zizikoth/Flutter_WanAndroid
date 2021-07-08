/// data : [{"id":8567,"link":"https://www.baidu.com","name":"百度"}]
/// errorCode : 0
/// errorMsg : ""

class WebsiteResponse {
  List<Website>? data;
  int? errorCode;
  String? errorMsg;

  WebsiteResponse({this.data, this.errorCode, this.errorMsg});

  WebsiteResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(Website.fromJson(v));
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

/// id : 8567
/// link : "https://www.baidu.com"
/// name : "百度"

class Website {
  int? id;
  String? link;
  String? name;

  Website({this.id, this.link, this.name});

  Website.fromJson(dynamic json) {
    id = json["id"];
    link = json["link"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["link"] = link;
    map["name"] = name;
    return map;
  }

  @override
  String toString() {
    return 'Website{id: $id, link: $link, name: $name}';
  }
}
