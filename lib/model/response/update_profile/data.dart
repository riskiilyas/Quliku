class UpdateProfileData {
  UpdateProfileData({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.role,
    required this.profileUrl,
  });

  UpdateProfileData.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
    username = json['username'];
    email = json['email'];
    role = json['role'];
    profileUrl = json['profile_url'];
  }

  late int id;
  late String name;
  late String username;
  late String email;
  late String role;
  late String profileUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    map['username'] = username;
    map['email'] = email;
    map['role'] = role;
    map['profile_url'] = profileUrl;
    return map;
  }
}
