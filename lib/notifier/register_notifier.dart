import 'package:flutter/material.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';

class RegisterNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;

  FetchStatus get status => _status;

  Future<void> fetch() async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    Future.delayed(const Duration(seconds: 2), (){
      _status = FetchStatus.SUCCESS;
      notifyListeners();
    });
  }

  Future<void> init() async {
    _status = FetchStatus.INITIAL;
    notifyListeners();
  }
}