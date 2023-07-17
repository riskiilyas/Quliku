import 'package:equatable/equatable.dart';

class Skills extends Equatable{
  Skills({
    required this.name,
  });

  Skills.fromJson(dynamic json) {
    name = json['name'];
  }

  late String name;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [name];
}
