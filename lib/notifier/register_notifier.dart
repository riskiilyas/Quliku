import 'package:flutter/material.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/model/response/register/data.dart';

class RegisterNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  RegisterData? data;
  String error = "";

  FetchStatus get status => _status;

  Future<void> fetch(String name, String username, String email,
      String password, String passwordConfirmation) async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    try {
      var response = await network.register(
          name, username, email, password, passwordConfirmation);
      data = response.data;
      _status = FetchStatus.SUCCESS;
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
