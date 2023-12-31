import 'package:flutter/material.dart';
import 'package:quliku/util/constants.dart';
import 'package:quliku/util/fetch_status.dart';
import 'package:quliku/util/service_locator.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefNotifier with ChangeNotifier {
  FetchStatus _status = FetchStatus.INITIAL;
  int _id = 0;
  String _name = "";
  String _username = "";
  String _email = "";
  String _password = "";
  String _role = "";
  String _profileUrl = "";
  String _token = "";
  SharedPreferences? _pref;

  FetchStatus get status => _status;

  int get id => _id;
  String get name => _name;
  String get username => _name;
  String get email => _email;
  String get password => _password;
  String get role => _role;
  String get profileUrl => _profileUrl;
  String get token => _token;

  Future<void> init() async {
    _pref = await ServiceLocator.prefs;
    _id = _pref!.getInt(Constants.PREF_UID) ?? 0;
    _name = _pref!.getString(Constants.PREF_NAME) ?? "";
    _username = _pref!.getString(Constants.PREF_USERNAME) ?? "";
    _email = _pref!.getString(Constants.PREF_EMAIL) ?? "";
    _password = _pref!.getString(Constants.PREF_PASSWORD) ?? "";
    _role = _pref!.getString(Constants.PREF_ROLE) ?? "";
    _profileUrl = _pref!.getString(Constants.PREF_PROFILE_URL) ?? "";
    _token = _pref!.getString(Constants.PREF_TOKEN) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setId(int id) async {
    _pref!.setInt(Constants.PREF_UID, id);
    _id = _pref!.getInt(Constants.PREF_UID) ?? 0;
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setName(String name) async {
    _pref!.setString(Constants.PREF_NAME, name);
    _name = _pref!.getString(Constants.PREF_NAME) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setUsername(String username) async {
    _pref!.setString(Constants.PREF_USERNAME, username);
    _username = _pref!.getString(Constants.PREF_USERNAME) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setEmail(String email) async {
    _pref!.setString(Constants.PREF_EMAIL, email);
    _email = _pref!.getString(Constants.PREF_EMAIL) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setPassword(String password) async {
    _pref!.setString(Constants.PREF_PROFILE_URL, password);
    _password = _pref!.getString(Constants.PREF_PASSWORD) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setRole(String role) async {
    _pref!.setString(Constants.PREF_ROLE, role);
    _role = _pref!.getString(Constants.PREF_ROLE) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setProfileUrl(String profileUrl) async {
    _pref!.setString(Constants.PREF_PROFILE_URL, profileUrl);
    _profileUrl = _pref!.getString(Constants.PREF_PROFILE_URL) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }

  Future<void> setToken(String token) async {
    _pref!.setString(Constants.PREF_TOKEN, token);
    _token = _pref!.getString(Constants.PREF_TOKEN) ?? "";
    _status = FetchStatus.SUCCESS;
    notifyListeners();
  }
}
