import 'data.dart';

class LoginResponse {
  LoginResponse({
    required this.status,
    required this.message,
    required this.error,
    required this.data,
  });

  LoginResponse.fromJson(dynamic json) {
    status = json['status'];
    message = json['message'];
    error = json['error'];
    data = (json['data'] != null ? LoginData.fromJson(json['data']) : null)!;
  }

  late bool status;
  late String message;
  late String error;
  late LoginData data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['message'] = message;
    map['error'] = message;
    map['data'] = data.toJson();
    return map;
  }
}
