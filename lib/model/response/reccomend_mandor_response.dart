import 'package:equatable/equatable.dart';
import 'package:quliku/model/response/mandor_item.dart';

class ReccomendMandorResponse extends Equatable {
  ReccomendMandorResponse({
    required this.status,
    required this.list,
  });

  ReccomendMandorResponse.fromJson(dynamic json) {
    status = json['status'];
    if (json['list'] != null) {
      list = [];
      json['list'].forEach((v) {
        list.add(Mandor.fromJson(v));
      });
    }
  }

  late String status;
  late List<Mandor> list;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['status'] = status;
    map['list'] = list.map((v) => v.toJson()).toList();
    return map;
  }

  @override
  // TODO: implement props
  List<Object?> get props => [status, list];
}
