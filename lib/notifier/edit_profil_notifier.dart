
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:quliku/model/response/update_profile/data.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/network.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class EditProfilNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  UpdateProfileData? data;
  Network network = ServiceLocator.network;

  Future<void> update(String name, String email, String password, String passwordConfirm, String token, File img) async {
    _status = FetchStatus.LOADING;
    try {
      var response = await network.updateProfile(token, name, email, password, passwordConfirm, img);
      data = response.data;
    } catch (e) {
      _status = FetchStatus.ERROR;
    } finally {
      notifyListeners();
    }
  }
}
