import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quliku/model/response/Reccomend_mandor_response.dart';

class Network {
  Future<ReccomendMandorResponse> getReccomendedMandor() async {
    var jsonText = await rootBundle.loadString('assets/json/list_mandor.json');
    return ReccomendMandorResponse.fromJson(json.decode(jsonText));
  }
}
