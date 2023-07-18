import 'data.dart';

class MandorWishlistResponse {
  MandorWishlistResponse({
    required this.success,
    required this.message,
    required this.data,
  });

  MandorWishlistResponse.fromJson(dynamic json) {
    success = json['success'];
    message = json['message'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data.add(MandorWishlistData.fromJson(v));
      });
    }
  }

  late bool success;
  late String message;
  late List<MandorWishlistData> data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['message'] = message;
    map['data'] = data.map((v) => v.toJson()).toList();
    return map;
  }
}
