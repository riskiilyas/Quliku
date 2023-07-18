import 'package:quliku/model/response/mandor_detail/comment.dart';

import 'details.dart';
import 'images.dart';

class MandorDetailData {
  MandorDetailData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.profileUrl,
    required this.rating,
    required this.details,
    required this.images,
    required this.comments,
    required this.inWishlist,
  });

  MandorDetailData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    profileUrl = json['profile_url'];
    rating = json['rating'];
    details =
        (json['details'] != null ? MandorDetailDetails.fromJson(json['details']) : null)!;
    if (json['images'] != null) {
      images = [];
      json['images'].forEach((v) {
        images.add(MandorDetailImages.fromJson(v));
      });
    }
    if (json['comments'] != null) {
      comments = [];
      json['comments'].forEach((v) {
        comments.add(MandorDetailComment.fromJson(v));
      });
    }
    inWishlist = json['in_wishlist'];
  }

  late int id;
  late String name;
  late String username;
  late String email;
  late String role;
  late String profileUrl;
  late int rating;
  late MandorDetailDetails details;
  late List<MandorDetailImages> images;
  late List<MandorDetailComment> comments;
  late bool inWishlist;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['role'] = role;
    map['profile_url'] = profileUrl;
    map['rating'] = rating;
    if (details != null) {
      map['details'] = details.toJson();
    }
    if (images != null) {
      map['images'] = images.map((v) => v.toJson()).toList();
    }
    if (comments != null) {
      map['comments'] = comments.map((v) => v.toJson()).toList();
    }
    map['in_wishlist'] = inWishlist;
    return map;
  }
}
