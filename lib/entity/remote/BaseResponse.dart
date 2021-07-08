class BaseResponse {
  int errorCode;
  String errorMsg;

  BaseResponse(this.errorCode, this.errorMsg);

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
      json['errorCode'],
      json['errorMsg'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['errorCode'] = this.errorCode;
    data['errorMsg'] = this.errorMsg;
    return data;
  }
}
