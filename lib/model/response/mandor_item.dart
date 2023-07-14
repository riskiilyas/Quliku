import 'package:equatable/equatable.dart';

import 'skill_item.dart';

class Mandor extends Equatable{
  Mandor({
    required this.id,
    required this.name,
    required this.rating,
    required this.experience,
    required this.minKuli,
    required this.maxKuli,
    required this.location,
    required this.skills,
  });

  Mandor.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    rating = json['rating'];
    experience = json['experience'];
    minKuli = json['min_kuli'];
    maxKuli = json['max_kuli'];
    location = json['location'];
    if (json['skills'] != null) {
      skills = [];
      json['skills'].forEach((v) {
        skills.add(Skills.fromJson(v));
      });
    }
  }

  late int id;
  late String name;
  late double rating;
  late int experience;
  late int minKuli;
  late int maxKuli;
  late String location;
  late List<Skills> skills;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['rating'] = rating;
    map['experience'] = experience;
    map['min_kuli'] = minKuli;
    map['max_kuli'] = maxKuli;
    map['location'] = location;
    map['skills'] = skills.map((v) => v.toJson()).toList();
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [id, name, rating, experience, minKuli, maxKuli, location, skills];
}
