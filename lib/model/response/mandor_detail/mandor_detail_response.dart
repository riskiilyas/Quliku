import 'data.dart';

class MandorDetailResponse {
  MandorDetailResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  MandorDetailResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    data = (json['data'] != null ? MandorDetailData.fromJson(json['data']) : null)!;
  }

  late bool success;
  late String message;
  late MandorDetailData data;

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
