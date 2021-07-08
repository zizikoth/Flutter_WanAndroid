/// data : [{"children":[{"id":60,"name":"Android Studio相关"}],"name":"开发环境"}]
/// errorCode : 0
/// errorMsg : ""

class SystemResponse {
  List<SystemGroup>? data;
  int? errorCode;
  String? errorMsg;

  SystemResponse({this.data, this.errorCode, this.errorMsg});

  SystemResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(SystemGroup.fromJson(v));
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

/// children : [{"id":60,"name":"Android Studio相关"}]
/// name : "开发环境"

class SystemGroup {
  List<System>? children;
  String? name;

  SystemGroup({this.children, this.name});

  SystemGroup.fromJson(dynamic json) {
    if (json["children"] != null) {
      children = [];
      json["children"].forEach((v) {
        children?.add(System.fromJson(v));
      });
    }
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    if (children != null) {
      map["children"] = children?.map((v) => v.toJson()).toList();
    }
    map["name"] = name;
    return map;
  }
}

/// id : 60
/// name : "Android Studio相关"

class System {
  bool? isTitle;
  int? id;
  String? name;
  String? link;

  System({this.isTitle, this.id, this.name, this.link});

  System.fromJson(dynamic json) {
    isTitle = json["isTitle"];
    id = json["id"];
    name = json["name"];
    link = json["link"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["isTitle"] = isTitle;
    map["id"] = id;
    map["name"] = name;
    map["link"] = link;
    return map;
  }
}
