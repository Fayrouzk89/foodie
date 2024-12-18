
class LoginResponse {
  String? detail;
  bool success=false;
  String? refresh;
  String? access;
  LoginResponse({this.detail});

  LoginResponse.fromJson(Map<String, dynamic> json) {
    detail = json['detail']??"";
    if(json["refresh"]!=null)
      {
        success=true;
        refresh = json['refresh'];
        access = json['access'];
      }
    else
      {
        success=false;
      }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['detail'] = this.detail;
    return data;
  }
}