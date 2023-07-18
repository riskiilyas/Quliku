import 'package:flutter/material.dart';
import 'package:quliku/model/response/login/data.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';

class LoginNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  String error = "";
  LoginData? loginData;

  FetchStatus get status => _status;

  Future<void> fetch(String email, String password) async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    try {
      var response = await network.login(email, password);
      _status = FetchStatus.SUCCESS;
      loginData = response.data;
    } catch (e) {
      _status = FetchStatus.ERROR;
      error = e.toString();
    } finally {
      notifyListeners();
    }
  }

  Future<void> init() async {
    _status = FetchStatus.INITIAL;
    notifyListeners();
  }
}