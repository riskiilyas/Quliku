class MandorReccomendationDetails {
  MandorReccomendationDetails({
      required this.subscription,
      required this.status,
      required this.isWork,
      required this.city,
      required this.waNumber,
      required this.classification,
      required this.description,
      required this.experience,
      required this.minPeople,
      required this.maxPeople,});

  MandorReccomendationDetails.fromJson(dynamic json) {
    subscription = json['subscription'];
    status = json['status'];
    isWork = json['is_work'];
    city = json['city'];
    waNumber = json['wa_number'];
    classification = json['classification'];
    description = json['description'];
    experience = json['experience'];
    minPeople = json['min_people'];
    maxPeople = json['max_people'];
  }
  late String subscription;
  late String status;
  late String isWork;
  late String city;
  late String waNumber;
  late String classification;
  late String description;
  late String experience;
  late String minPeople;
  late String maxPeople;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['subscription'] = subscription;
    map['status'] = status;
    map['is_work'] = isWork;
    map['city'] = city;
    map['wa_number'] = waNumber;
    map['classification'] = classification;
    map['description'] = description;
    map['experience'] = experience;
    map['min_people'] = minPeople;
    map['max_people'] = maxPeople;
    return map;
  }

}