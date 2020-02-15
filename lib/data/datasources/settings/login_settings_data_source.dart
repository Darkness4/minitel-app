import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:minitel_toolbox/core/error/exceptions.dart';
import 'package:minitel_toolbox/data/models/login_settings_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class LoginSettingsDataSource {
  Future<LoginSettingsModel> load();
  Future<void> save(LoginSettingsModel settings);
  Future<void> clear();
}

class LoginSettingsDataSourceImpl implements LoginSettingsDataSource {
  final SharedPreferences prefs;
  final FlutterSecureStorage storage;

  const LoginSettingsDataSourceImpl({
    @required this.prefs,
    @required this.storage,
  });

  @override
  Future<void> clear() {
    return Future.wait<dynamic>([
      prefs.remove("rememberMe"),
      prefs.remove("autoLogin"),
      prefs.remove("uid"),
      prefs.remove("selectedTime"),
      prefs.remove("selectedUrl"),
      storage.delete(key: "pswd"),
    ]);
  }

  @override
  Future<LoginSettingsModel> load() async {
    if (prefs.containsKey("autoLogin") &&
        prefs.containsKey("rememberMe") &&
        prefs.containsKey("selectedTime") &&
        prefs.containsKey("selectedUrl") &&
        prefs.containsKey("uid")) {
      return LoginSettingsModel(
        autoLogin: prefs.getBool("autoLogin"),
        pswd: (await storage.read(key: "pswd")) ?? "",
        rememberMe: prefs.getBool("rememberMe"),
        selectedTime: prefs.getString("selectedTime"),
        selectedUrl: prefs.getString("selectedUrl"),
        uid: prefs.getString("uid"),
      );
    } else {
      throw CacheException("No Login Settings saved.");
    }
  }

  @override
  Future<void> save(LoginSettingsModel settings) {
    return Future.wait<dynamic>([
      prefs.setBool("rememberMe", true),
      prefs.setBool("autoLogin", settings.autoLogin),
      prefs.setString("uid", settings.uid),
      prefs.setString("selectedTime", settings.selectedTime),
      prefs.setString("selectedUrl", settings.selectedUrl),
      storage.write(key: "pswd", value: settings.pswd),
    ]);
  }
}
