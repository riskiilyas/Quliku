class MandorDetailImages {
  MandorDetailImages({
    required this.photoUrl,
    required this.type,
  });

  MandorDetailImages.fromJson(dynamic json) {
    photoUrl = json['photo_url'];
    type = json['type'];
  }

  late String photoUrl;
  late String type;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['photo_url'] = photoUrl;
    map['type'] = type;
    return map;
  }
}
