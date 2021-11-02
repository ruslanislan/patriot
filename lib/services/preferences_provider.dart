import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider {
  static PreferencesProvider? _instance;
  SharedPreferences? _preferences;

  factory PreferencesProvider() {
    _instance ??= PreferencesProvider._();
    return _instance!;
  }

  PreferencesProvider._() {
    _initPreferences();
  }

  Future<void> _initPreferences() async {
    _preferences = await SharedPreferences.getInstance();
  }

  Future<void> setToken(String value) async {
    await _initPreferences();
    await _preferences!.setString("Token", value);
  }

  Future<String?> getToken() async {
    await _initPreferences();
    return _preferences!.getString("Token");
  }
}
