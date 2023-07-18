import 'package:flutter/material.dart';
import 'package:quliku/model/model/mandor_details.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/model/model/mandor_data.dart';

class SearchMandorNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  final List<MandorData> _data = [];
  String _classification = "infra";
  String _city = "Surabaya";

  String get classification => _classification;

  String get city => _city;

  set classification(String _) {
    _classification = _;
    notifyListeners();
  }

  set city(String _) {
    _city = _;
    notifyListeners();
  }

  List<MandorData> get data => _data;

  FetchStatus get status => _status;

  Future<void> fetch(String name, String classification, String city) async {
    if (_status == FetchStatus.LOADING) return;
    _status = FetchStatus.LOADING;
    notifyListeners();
    try {
      var response = await network.getSearchMandor(name, classification, city);
      _data.clear();
      for (var _ in response.data) {
        var details = MandorDetails(
            subscription: _.details.subscription,
            status: _.details.status,
            isWork: _.details.isWork,
            city: _.details.city,
            waNumber: _.details.waNumber,
            classification: _.details.classification,
            description: _.details.description,
            experience: _.details.experience,
            minPeople: _.details.minPeople,
            maxPeople: _.details.maxPeople);
        _data.add(MandorData(
            id: _.id,
            name: _.name,
            username: _.username,
            email: _.email,
            role: _.role,
            profileUrl: _.profileUrl,
            rating: _.rating,
            details: details));
        _status = FetchStatus.SUCCESS;
      }
    } catch (e) {
      _data.clear();
      _status = FetchStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
