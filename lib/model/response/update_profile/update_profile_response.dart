import 'data.dart';

class UpdateProfileResponse {
  UpdateProfileResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  UpdateProfileResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data =
        (json['data'] != null ? UpdateProfileData.fromJson(json['data']) : null)!;
  }

  late bool success;
  late String message;
  late UpdateProfileData data;

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
