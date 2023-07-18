import 'details.dart';
import 'comments.dart';

class MandorWishlistData {
  MandorWishlistData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.profileUrl,
    required this.rating,
    required this.details,
    required this.comments,
  });

  MandorWishlistData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    profileUrl = json['profile_url'];
    rating = json['rating'];
    details = (json['details'] != null
        ? MandorWishlistDetails.fromJson(json['details'])
        : null)!;
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments.add(MandorWishlistComments.fromJson(v));
      });
    }
  }

  late int id;
  late String name;
  late String username;
  late String email;
  late String role;
  late String profileUrl;
  late int rating;
  late MandorWishlistDetails details;
  late List<MandorWishlistComments> comments;

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
    map['comments'] = comments.map((v) => v.toJson()).toList();
    return map;
  }
}
