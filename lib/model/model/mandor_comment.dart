class MandorComment {
  MandorComment({
    required this.name,
    required this.rating,
    required this.description,
  });

  MandorComment.fromJson(dynamic json) {
    name = json['name'];
    rating = json['rating'];
    description = json['description'];
  }

  late String name;
  late String rating;
  late String description;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['rating'] = rating;
    map['description'] = description;
    return map;
  }
}
