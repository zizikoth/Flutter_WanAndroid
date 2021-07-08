/// data : {"coinCount":990,"level":10,"nickname":"","rank":"1526","userId":15368,"username":"M**Memo"}
/// errorCode : 0
/// errorMsg : ""

class CoinResponse {
  CoinInfo? data;
  int? errorCode;
  String? errorMsg;

  CoinResponse({this.data, this.errorCode, this.errorMsg});

  CoinResponse.fromJson(dynamic json) {
    data = json["data"] != null ? CoinInfo.fromJson(json["data"]) : null;
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

/// coinCount : 990
/// level : 10
/// nickname : ""
/// rank : "1526"
/// userId : 15368
/// username : "M**Memo"

class CoinInfo {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  CoinInfo({this.coinCount, this.level, this.nickname, this.rank, this.userId, this.username});

  CoinInfo.fromJson(dynamic json) {
    coinCount = json["coinCount"];
    level = json["level"];
    nickname = json["nickname"];
    rank = json["rank"];
    userId = json["userId"];
    username = json["username"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coinCount"] = coinCount;
    map["level"] = level;
    map["nickname"] = nickname;
    map["rank"] = rank;
    map["userId"] = userId;
    map["username"] = username;
    return map;
  }
}
