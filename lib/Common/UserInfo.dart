import 'dart:io';

class UserInfo {
  UserInfo({
    required this.id,
    required this.user_name,
    required this.email,
    required this.mobile,
    required this.password,

  });
  late final int id;
  late final String user_name;
  late final String email;
  late final String mobile;
  late final String password;
  String refresh="";
  String access="";
  UserInfo.fromJson(Map<String, dynamic> json){
    id = json['id'];

  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['id'] = id;

    return _data;
  }
}