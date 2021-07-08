/// data : {"curPage":1,"datas":[{"coinCount":25,"date":1625189611000,"desc":"2021-07-02 09:33:31 签到 , 积分：11 + 14","id":458416,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":24,"date":1625117883000,"desc":"2021-07-01 13:38:03 签到 , 积分：11 + 13","id":457958,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":23,"date":1624068491000,"desc":"2021-06-19 10:08:11 签到 , 积分：11 + 12","id":451197,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":22,"date":1623761954000,"desc":"2021-06-15 20:59:14 签到 , 积分：11 + 11","id":449130,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":21,"date":1618312273000,"desc":"2021-04-13 19:11:13 签到 , 积分：11 + 10","id":410690,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":20,"date":1618161228000,"desc":"2021-04-12 01:13:48 签到 , 积分：11 + 9","id":409221,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":19,"date":1618136578000,"desc":"2021-04-11 18:22:58 签到 , 积分：11 + 8","id":409113,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":18,"date":1617157515000,"desc":"2021-03-31 10:25:15 签到 , 积分：11 + 7","id":402404,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":17,"date":1616985313000,"desc":"2021-03-29 10:35:13 签到 , 积分：11 + 6","id":400875,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":16,"date":1614760362000,"desc":"2021-03-03 16:32:42 签到 , 积分：11 + 5","id":384803,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":15,"date":1613459050000,"desc":"2021-02-16 15:04:10 签到 , 积分：11 + 4","id":374963,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":14,"date":1613135376000,"desc":"2021-02-12 21:09:36 签到 , 积分：11 + 3","id":374280,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":10,"date":1612921824000,"desc":"2021-02-10 09:50:24 分享文章 , 积分：10 + 0","id":373682,"reason":"分享文章","type":3,"userId":15368,"userName":"Mr.Memo"},{"coinCount":13,"date":1612887647000,"desc":"2021-02-10 00:20:47 签到 , 积分：11 + 2","id":373599,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":12,"date":1612835976000,"desc":"2021-02-09 09:59:36 签到 , 积分：11 + 1","id":372991,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":11,"date":1612746961000,"desc":"2021-02-08 09:16:01 签到 , 积分：11 + 0","id":372545,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":39,"date":1612627281000,"desc":"2021-02-07 00:01:21 签到 , 积分：10 + 29","id":371996,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":38,"date":1612591650000,"desc":"2021-02-06 14:07:30 签到 , 积分：10 + 28","id":371871,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":37,"date":1612492469000,"desc":"2021-02-05 10:34:29 签到 , 积分：10 + 27","id":371354,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":36,"date":1612401986000,"desc":"2021-02-04 09:26:26 签到 , 积分：10 + 26","id":370668,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"}],"offset":0,"over":false,"pageCount":3,"size":20,"total":46}
/// errorCode : 0
/// errorMsg : ""

class CoinListResponse {
  CoinListInfo? data;
  int? errorCode;
  String? errorMsg;

  CoinListResponse({this.data, this.errorCode, this.errorMsg});

  CoinListResponse.fromJson(dynamic json) {
    data = json["data"] != null ? CoinListInfo.fromJson(json["data"]) : null;
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

/// curPage : 1
/// datas : [{"coinCount":25,"date":1625189611000,"desc":"2021-07-02 09:33:31 签到 , 积分：11 + 14","id":458416,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":24,"date":1625117883000,"desc":"2021-07-01 13:38:03 签到 , 积分：11 + 13","id":457958,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":23,"date":1624068491000,"desc":"2021-06-19 10:08:11 签到 , 积分：11 + 12","id":451197,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":22,"date":1623761954000,"desc":"2021-06-15 20:59:14 签到 , 积分：11 + 11","id":449130,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":21,"date":1618312273000,"desc":"2021-04-13 19:11:13 签到 , 积分：11 + 10","id":410690,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":20,"date":1618161228000,"desc":"2021-04-12 01:13:48 签到 , 积分：11 + 9","id":409221,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":19,"date":1618136578000,"desc":"2021-04-11 18:22:58 签到 , 积分：11 + 8","id":409113,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":18,"date":1617157515000,"desc":"2021-03-31 10:25:15 签到 , 积分：11 + 7","id":402404,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":17,"date":1616985313000,"desc":"2021-03-29 10:35:13 签到 , 积分：11 + 6","id":400875,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":16,"date":1614760362000,"desc":"2021-03-03 16:32:42 签到 , 积分：11 + 5","id":384803,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":15,"date":1613459050000,"desc":"2021-02-16 15:04:10 签到 , 积分：11 + 4","id":374963,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":14,"date":1613135376000,"desc":"2021-02-12 21:09:36 签到 , 积分：11 + 3","id":374280,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":10,"date":1612921824000,"desc":"2021-02-10 09:50:24 分享文章 , 积分：10 + 0","id":373682,"reason":"分享文章","type":3,"userId":15368,"userName":"Mr.Memo"},{"coinCount":13,"date":1612887647000,"desc":"2021-02-10 00:20:47 签到 , 积分：11 + 2","id":373599,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":12,"date":1612835976000,"desc":"2021-02-09 09:59:36 签到 , 积分：11 + 1","id":372991,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":11,"date":1612746961000,"desc":"2021-02-08 09:16:01 签到 , 积分：11 + 0","id":372545,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":39,"date":1612627281000,"desc":"2021-02-07 00:01:21 签到 , 积分：10 + 29","id":371996,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":38,"date":1612591650000,"desc":"2021-02-06 14:07:30 签到 , 积分：10 + 28","id":371871,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":37,"date":1612492469000,"desc":"2021-02-05 10:34:29 签到 , 积分：10 + 27","id":371354,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"},{"coinCount":36,"date":1612401986000,"desc":"2021-02-04 09:26:26 签到 , 积分：10 + 26","id":370668,"reason":"签到","type":1,"userId":15368,"userName":"Mr.Memo"}]
/// offset : 0
/// over : false
/// pageCount : 3
/// size : 20
/// total : 46

class CoinListInfo {
  int? curPage;
  List<CoinItemInfo>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  bool get hasMore => over == false;

  CoinListInfo({this.curPage, this.datas, this.offset, this.over, this.pageCount, this.size, this.total});

  CoinListInfo.fromJson(dynamic json) {
    curPage = json["curPage"];
    if (json["datas"] != null) {
      datas = [];
      json["datas"].forEach((v) {
        datas?.add(CoinItemInfo.fromJson(v));
      });
    }
    offset = json["offset"];
    over = json["over"];
    pageCount = json["pageCount"];
    size = json["size"];
    total = json["total"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["curPage"] = curPage;
    if (datas != null) {
      map["datas"] = datas?.map((v) => v.toJson()).toList();
    }
    map["offset"] = offset;
    map["over"] = over;
    map["pageCount"] = pageCount;
    map["size"] = size;
    map["total"] = total;
    return map;
  }
}

/// coinCount : 25
/// date : 1625189611000
/// desc : "2021-07-02 09:33:31 签到 , 积分：11 + 14"
/// id : 458416
/// reason : "签到"
/// type : 1
/// userId : 15368
/// userName : "Mr.Memo"

class CoinItemInfo {
  int? coinCount;
  int? date;
  String? desc;
  int? id;
  String? reason;
  int? type;
  int? userId;
  String? userName;

  CoinItemInfo({this.coinCount, this.date, this.desc, this.id, this.reason, this.type, this.userId, this.userName});

  CoinItemInfo.fromJson(dynamic json) {
    coinCount = json["coinCount"];
    date = json["date"];
    desc = json["desc"];
    id = json["id"];
    reason = json["reason"];
    type = json["type"];
    userId = json["userId"];
    userName = json["userName"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["coinCount"] = coinCount;
    map["date"] = date;
    map["desc"] = desc;
    map["id"] = id;
    map["reason"] = reason;
    map["type"] = type;
    map["userId"] = userId;
    map["userName"] = userName;
    return map;
  }
}
