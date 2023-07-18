import 'package:flutter/material.dart';
import 'package:quliku/model/model/mandor_details.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:quliku/model/model/mandor_data.dart';

class ReccomendMandorNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  Network network = ServiceLocator.network;
  List<MandorData> _data = [];

  List<MandorData> get data => _data;

  FetchStatus get status => _status;

  Future<void> fetch(String token) async {
    _status = FetchStatus.LOADING;
    notifyListeners();
    var response = await network.getReccomendedMandor(token);
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
    }
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }
}
