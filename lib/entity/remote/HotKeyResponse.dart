/// data : [{"name":"面试"}]
/// errorCode : 0
/// errorMsg : ""

class HotKeyResponse {
  List<HotKey>? data;
  int? errorCode;
  String? errorMsg;

  HotKeyResponse({this.data, this.errorCode, this.errorMsg});

  HotKeyResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(HotKey.fromJson(v));
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

/// name : "面试"

class HotKey {
  String? name;

  HotKey({this.name});

  HotKey.fromJson(dynamic json) {
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["name"] = name;
    return map;
  }
}
