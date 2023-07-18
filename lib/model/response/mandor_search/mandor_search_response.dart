import 'data.dart';

class MandorSearchResponse {
  MandorSearchResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  MandorSearchResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(MandorSearchData.fromJson(v));
      });
    }
  }

  late bool success;
  late String message;
  late List<MandorSearchData> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    if (data != null) {
      map['data'] = data.map((v) => v.toJson()).toList();
    }
    return map;
  }
}
