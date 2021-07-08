/// data : {"curPage":1,"datas":[{"coinCount":45211,"level":453,"nickname":"","rank":"1","userId":20382,"username":"g**eii"},{"coinCount":42518,"level":426,"nickname":"","rank":"2","userId":29303,"username":"深**士"},{"coinCount":33549,"level":336,"nickname":"","rank":"3","userId":2,"username":"x**oyang"},{"coinCount":28497,"level":285,"nickname":"","rank":"4","userId":3559,"username":"A**ilEyon"},{"coinCount":23749,"level":238,"nickname":"","rank":"5","userId":29185,"username":"轻**宇"},{"coinCount":22701,"level":228,"nickname":"","rank":"6","userId":27,"username":"y**ochoo"},{"coinCount":22671,"level":227,"nickname":"","rank":"7","userId":7809,"username":"1**23822235"},{"coinCount":22524,"level":226,"nickname":"","rank":"8","userId":14829,"username":"l**changwen"},{"coinCount":22305,"level":224,"nickname":"","rank":"9","userId":4886,"username":"z**iyun"},{"coinCount":22281,"level":223,"nickname":"","rank":"10","userId":7891,"username":"h**zkp"},{"coinCount":22131,"level":222,"nickname":"","rank":"11","userId":26707,"username":"p**xc.com"},{"coinCount":22011,"level":221,"nickname":"","rank":"12","userId":7710,"username":"i**Cola7"},{"coinCount":21957,"level":220,"nickname":"","rank":"13","userId":12351,"username":"w**igeny"},{"coinCount":21841,"level":219,"nickname":"","rank":"14","userId":7590,"username":"陈**啦啦啦"},{"coinCount":21305,"level":214,"nickname":"","rank":"15","userId":833,"username":"w**lwaywang6"},{"coinCount":21286,"level":213,"nickname":"","rank":"16","userId":2068,"username":"i**Cola"},{"coinCount":21151,"level":212,"nickname":"","rank":"17","userId":1534,"username":"j**gbin"},{"coinCount":21067,"level":211,"nickname":"","rank":"18","userId":3753,"username":"S**phenCurry"},{"coinCount":20536,"level":206,"nickname":"","rank":"19","userId":28457,"username":"w**dla"},{"coinCount":20526,"level":206,"nickname":"","rank":"20","userId":3825,"username":"请**娃哈哈"},{"coinCount":20521,"level":206,"nickname":"","rank":"21","userId":25419,"username":"蔡**打篮球"},{"coinCount":20518,"level":206,"nickname":"","rank":"22","userId":29390,"username":"L**ing"},{"coinCount":20493,"level":205,"nickname":"","rank":"23","userId":25128,"username":"f**wandroid"},{"coinCount":20120,"level":202,"nickname":"","rank":"24","userId":2160,"username":"R**iner"},{"coinCount":19892,"level":199,"nickname":"","rank":"25","userId":12331,"username":"R**kieJay"},{"coinCount":19578,"level":196,"nickname":"","rank":"26","userId":28694,"username":"c**ng0218"},{"coinCount":19217,"level":193,"nickname":"","rank":"27","userId":14839,"username":"x**y_sjc"},{"coinCount":19095,"level":191,"nickname":"","rank":"28","userId":25793,"username":"F**_2014"},{"coinCount":18262,"level":183,"nickname":"","rank":"29","userId":1580,"username":"k**od21"},{"coinCount":18183,"level":182,"nickname":"","rank":"30","userId":2786,"username":"8**408834@qq.com"}],"offset":0,"over":false,"pageCount":2572,"size":30,"total":77132}
/// errorCode : 0
/// errorMsg : ""

class RankListResponse {
  RankListInfo? data;
  int? errorCode;
  String? errorMsg;

  RankListResponse({this.data, this.errorCode, this.errorMsg});

  RankListResponse.fromJson(dynamic json) {
    data = json["data"] != null ? RankListInfo.fromJson(json["data"]) : null;
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
/// datas : [{"coinCount":45211,"level":453,"nickname":"","rank":"1","userId":20382,"username":"g**eii"},{"coinCount":42518,"level":426,"nickname":"","rank":"2","userId":29303,"username":"深**士"},{"coinCount":33549,"level":336,"nickname":"","rank":"3","userId":2,"username":"x**oyang"},{"coinCount":28497,"level":285,"nickname":"","rank":"4","userId":3559,"username":"A**ilEyon"},{"coinCount":23749,"level":238,"nickname":"","rank":"5","userId":29185,"username":"轻**宇"},{"coinCount":22701,"level":228,"nickname":"","rank":"6","userId":27,"username":"y**ochoo"},{"coinCount":22671,"level":227,"nickname":"","rank":"7","userId":7809,"username":"1**23822235"},{"coinCount":22524,"level":226,"nickname":"","rank":"8","userId":14829,"username":"l**changwen"},{"coinCount":22305,"level":224,"nickname":"","rank":"9","userId":4886,"username":"z**iyun"},{"coinCount":22281,"level":223,"nickname":"","rank":"10","userId":7891,"username":"h**zkp"},{"coinCount":22131,"level":222,"nickname":"","rank":"11","userId":26707,"username":"p**xc.com"},{"coinCount":22011,"level":221,"nickname":"","rank":"12","userId":7710,"username":"i**Cola7"},{"coinCount":21957,"level":220,"nickname":"","rank":"13","userId":12351,"username":"w**igeny"},{"coinCount":21841,"level":219,"nickname":"","rank":"14","userId":7590,"username":"陈**啦啦啦"},{"coinCount":21305,"level":214,"nickname":"","rank":"15","userId":833,"username":"w**lwaywang6"},{"coinCount":21286,"level":213,"nickname":"","rank":"16","userId":2068,"username":"i**Cola"},{"coinCount":21151,"level":212,"nickname":"","rank":"17","userId":1534,"username":"j**gbin"},{"coinCount":21067,"level":211,"nickname":"","rank":"18","userId":3753,"username":"S**phenCurry"},{"coinCount":20536,"level":206,"nickname":"","rank":"19","userId":28457,"username":"w**dla"},{"coinCount":20526,"level":206,"nickname":"","rank":"20","userId":3825,"username":"请**娃哈哈"},{"coinCount":20521,"level":206,"nickname":"","rank":"21","userId":25419,"username":"蔡**打篮球"},{"coinCount":20518,"level":206,"nickname":"","rank":"22","userId":29390,"username":"L**ing"},{"coinCount":20493,"level":205,"nickname":"","rank":"23","userId":25128,"username":"f**wandroid"},{"coinCount":20120,"level":202,"nickname":"","rank":"24","userId":2160,"username":"R**iner"},{"coinCount":19892,"level":199,"nickname":"","rank":"25","userId":12331,"username":"R**kieJay"},{"coinCount":19578,"level":196,"nickname":"","rank":"26","userId":28694,"username":"c**ng0218"},{"coinCount":19217,"level":193,"nickname":"","rank":"27","userId":14839,"username":"x**y_sjc"},{"coinCount":19095,"level":191,"nickname":"","rank":"28","userId":25793,"username":"F**_2014"},{"coinCount":18262,"level":183,"nickname":"","rank":"29","userId":1580,"username":"k**od21"},{"coinCount":18183,"level":182,"nickname":"","rank":"30","userId":2786,"username":"8**408834@qq.com"}]
/// offset : 0
/// over : false
/// pageCount : 2572
/// size : 30
/// total : 77132

class RankListInfo {
  int? curPage;
  List<RankItemInfo>? datas;
  int? offset;
  bool? over;
  int? pageCount;
  int? size;
  int? total;

  bool get hasMore => over == false;

  RankListInfo({this.curPage, this.datas, this.offset, this.over, this.pageCount, this.size, this.total});

  RankListInfo.fromJson(dynamic json) {
    curPage = json["curPage"];
    if (json["datas"] != null) {
      datas = [];
      json["datas"].forEach((v) {
        datas?.add(RankItemInfo.fromJson(v));
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

/// coinCount : 45211
/// level : 453
/// nickname : ""
/// rank : "1"
/// userId : 20382
/// username : "g**eii"

class RankItemInfo {
  int? coinCount;
  int? level;
  String? nickname;
  String? rank;
  int? userId;
  String? username;

  RankItemInfo({this.coinCount, this.level, this.nickname, this.rank, this.userId, this.username});

  RankItemInfo.fromJson(dynamic json) {
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
