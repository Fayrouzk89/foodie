class loginBody{
  String phone_number;
  String password;
  loginBody(this.phone_number,this.password);
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phone_number'] = phone_number;
    _data['password'] = password;
    return _data;
  }
}