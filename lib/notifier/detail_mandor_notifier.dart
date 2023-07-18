import 'package:flutter/material.dart';
import 'package:quliku/model/response/mandor_detail/data.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';

class DetailMandorNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  MandorDetailData? _data;

  MandorDetailData get data => _data!;
  FetchStatus get status => _status;

  Future<void> fetch(String token, String id) async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    try {
      var response = await network.getDetailMandor(token, id);
      _data = response.data;
      _status = FetchStatus.SUCCESS;
    } catch (e) {
      _status = FetchStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }

  Future<void> init() async {
    _status = FetchStatus.INITIAL;
    notifyListeners();
  }
}
