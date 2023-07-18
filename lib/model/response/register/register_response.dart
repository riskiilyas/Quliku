import 'data.dart';

class RegisterResponse {
  RegisterResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  RegisterResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = (json['data'] != null ? RegisterData.fromJson(json['data']) : null)!;
  }

  late bool success;
  late String message;
  late RegisterData data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data.toJson();
    }
    return map;
  }
}
