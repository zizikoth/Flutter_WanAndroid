/// data : [{"id":294,"name":"完整项目"}]
/// errorCode : 0
/// errorMsg : ""

class ProjectResponse {
  List<Project>? data;
  int? errorCode;
  String? errorMsg;

  ProjectResponse({this.data, this.errorCode, this.errorMsg});

  ProjectResponse.fromJson(dynamic json) {
    if (json["data"] != null) {
      data = [];
      json["data"].forEach((v) {
        data?.add(Project.fromJson(v));
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

/// id : 294
/// name : "完整项目"
class Project {
  int? id;
  String? name;

  Project({this.id, this.name});

  Project.fromJson(dynamic json) {
    id = json["id"];
    name = json["name"];
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{};
    map["id"] = id;
    map["name"] = name;
    return map;
  }
}
