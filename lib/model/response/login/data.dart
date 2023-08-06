class LoginData {
  LoginData({
    required this.role,
    required this.token,
  });

  LoginData.fromJson(dynamic json) {
    role = json['role'];
    token = json['token'];
  }

  late String role;
  late String token;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['role'] = role;
    map['token'] = token;
    return map;
  }
}
