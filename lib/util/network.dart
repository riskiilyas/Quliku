import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:quliku/model/response/Reccomend_mandor_response.dart';
import 'package:quliku/model/response/register/register_response.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';

class Network {
  Future<ReccomendMandorResponse> getReccomendedMandor() async {
    var jsonText = await rootBundle.loadString('assets/json/list_mandor.json');
    return ReccomendMandorResponse.fromJson(json.decode(jsonText));
  }

  Future<RegisterResponse> register(name, username, email, password, password_conf) async {
    var baseurl = dotenv.env['BASE_URL'] ?? "";

    final response = await http.Client().post(
      Uri.parse("$baseurl/api/contractor/auth/register"),
      headers: {
        "Content-Type": "application/x-www-form-urlencoded",
      },
      encoding: Encoding.getByName('utf-8'),
      body: {
        "name": name,
        "username": username,
        "email": email,
        "password": password,
        "password_confirmation": password_conf
      },
    );

    if (response.statusCode == 200) {
      return RegisterResponse.fromJson(json.decode(response.body));
    } else {
      throw Exception("Gagal mendaftar, pastikan email dan password sudah pas");
    }
  }
}
