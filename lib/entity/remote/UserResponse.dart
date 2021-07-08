/// data : {"admin":false,"chapterTops":[],"coinCount":0,"collectIds":[1165],"email":"","icon":"","id":15368,"nickname":"Mr.Memo","password":"","publicName":"Mr.Memo","token":"","type":0,"username":"Mr.Memo"}
/// errorCode : 0
/// errorMsg : ""

class UserResponse {
  UserInfo? data;
  int? errorCode;
  String? errorMsg;

  UserResponse({this.data, this.errorCode, this.errorMsg});

  UserResponse.fromJson(dynamic json) {
    data = json["data"] != null ? UserInfo.fromJson(json["data"]) : null;
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

/// admin : false
/// chapterTops : []
/// coinCount : 0
/// collectIds : [1165]
/// email : ""
/// icon : ""
/// id : 15368
/// nickname : "Mr.Memo"
/// password : ""
/// publicName : "Mr.Memo"
/// token : ""
/// type : 0
/// username : "Mr.Memo"

class UserInfo {
  String? username;

  UserInfo({this.username});

  UserInfo.fromJson(dynamic json) {
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["username"] = username;
    return map;
  }

  @override
  String toString() {
    return 'UserInfo{username: $username}';
  }
}
