import 'package:flutter/material.dart';
import 'package:quliku/model/response/mandor_item.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';

class ReccomendMandorNotifier with ChangeNotifier {
  FetchStatus status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  List<Mandor> _data = [];

  List<Mandor> get data => _data;

  Future<void> fetch() async {
    status = FetchStatus.LOADING;
    notifyListeners();
    var response = await network.getReccomendedMandor();
    _data = response.list;
    status = FetchStatus.SUCCESS;
    notifyListeners();
  }
}