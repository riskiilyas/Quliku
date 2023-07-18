import 'details.dart';

class MandorReccoemndationData {
  MandorReccoemndationData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.profileUrl,
    required this.rating,
    required this.details,
  });

  MandorReccoemndationData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    profileUrl = json['profile_url'];
    rating = json['rating'];
    details = (json['details'] != null
        ? MandorReccomendationDetails.fromJson(json['details'])
        : null)!;
  }

  late String id;
  late String name;
  late MandorReccomendationDetails details;
  late String username;
  late String email;
  late String role;
  late String profileUrl;
  late int rating;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['role'] = role;
    map['profile_url'] = profileUrl;
    map['rating'] = rating;
    map['details'] = details.toJson();
    return map;
  }
}
