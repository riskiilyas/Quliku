import 'data.dart';

class MandorReccomendationResponse {
  MandorReccomendationResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  MandorReccomendationResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(MandorReccoemndationData.fromJson(v));
      });
    }
  }

  late bool success;
  late String message;
  late List<MandorReccoemndationData> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['data'] = data.map((v) => v.toJson()).toList();
    return map;
  }
}
