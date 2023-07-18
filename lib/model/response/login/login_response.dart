import 'data.dart';

class LoginResponse {
  LoginResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  LoginResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = (json['data'] != null ? LoginData.fromJson(json['data']) : null)!;
  }

  late bool success;
  late String message;
  late LoginData data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['data'] = data.toJson();
    return map;
  }
}
