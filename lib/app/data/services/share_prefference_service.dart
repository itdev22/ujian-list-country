import 'dart:developer';

import 'package:shared_preferences/shared_preferences.dart';

// import '../models/filter_model.dart';
// import '../models/user_model.dart';

class SharedPrefferenceService {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  // void saveUserModel(UserModel userModel) async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setString('userModel', jsonEncode(userModel));
  //   log('sharepreference : save userModel');
  // }

  Future<String?> getUserModel() async {
    SharedPreferences pref = await _prefs;
    return pref.getString('userModel');
  }

  Future<void> saveToken(String token) async {
    SharedPreferences pref = await _prefs;
    pref.setString('token', token);
    log('sharepreference : save token $token');
  }

  Future<String?> getToken() async {
    SharedPreferences pref = await _prefs;
    return pref.getString('token');
  }

  Future<void> saveUrl(String url) async {
    SharedPreferences pref = await _prefs;
    pref.setString('url', url);
    log('sharepreference : save token $url');
  }

  Future<String?> getUrl() async {
    SharedPreferences pref = await _prefs;
    return pref.getString('url');
  }

  // Future<void> saveAuthLogin(UserModelResponse data) async {
  //   saveUserModel(data.authLogin!.user!);
  //   saveToken(data.authLogin!.token!);
  // }

  Future<void> saveLat(double lat) async {
    SharedPreferences pref = await _prefs;
    pref.setDouble('lat', lat);
    log('sharepreference : save latitude $lat');
  }

  Future<double?> getLat() async {
    SharedPreferences pref = await _prefs;
    return pref.getDouble('lat');
  }

  Future<void> saveLong(double long) async {
    SharedPreferences pref = await _prefs;
    pref.setDouble('long', long);
    log('sharepreference : save longtitude $long');
  }

  Future<double?> getLong() async {
    SharedPreferences pref = await _prefs;
    return pref.getDouble('long');
  }

  Future<void> saveOnBoarding(bool onboarding) async {
    SharedPreferences pref = await _prefs;
    pref.setBool('onboarding', onboarding);
    log('sharepreference : save onboarding $onboarding');
  }

  Future<bool?> getOnBoarding() async {
    SharedPreferences pref = await _prefs;
    return pref.getBool('onboarding');
  }

  // void saveFilterModel(FilterModel filterModel) async {
  //   SharedPreferences pref = await _prefs;
  //   pref.setString('filterModel', jsonEncode(filterModel));
  //   log('sharepreference : save filter');
  // }

  // Future<String?> getFilterModel() async {
  //   SharedPreferences pref = await _prefs;
  //   return pref.getString('filterModel');
  // }

  void clearFilterModel() async {
    SharedPreferences pref = await _prefs;
    pref.remove('filterModel');
  }

  void clear() async {
    SharedPreferences pref = await _prefs;
    pref.clear();
  }
}
