import 'package:connectivity/connectivity.dart';
import 'package:patriot/services/preferences_provider.dart';

import 'api_provider.dart';

class AuthService {
  final PreferencesProvider _preferencesProvider = PreferencesProvider();
  final ApiProvider _apiProvider = ApiProvider();

  Future<String> _deviceId() async {
    // final deviceInfo = DeviceInfoPlugin();
    // String deviceId;
    // if (Platform.isIOS) {
    //   deviceId = (await deviceInfo.iosInfo).identifierForVendor;
    // } else {
    //   deviceId = (await deviceInfo.androidInfo).androidId;
    // }
    // return deviceId;
    return "1";
  }

  Future<bool> login(String login, String password) async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult != ConnectivityResult.none) {
      try {
        final deviceId = await _deviceId();
        final response = await _apiProvider.login(login, password, deviceId);
        await _preferencesProvider.setToken(response['token']);
        _apiProvider.setToken(response['token']);
        return response["token"] != null;
      } catch (e) {
        throw Exception('Неверный логин или пароль');
      }
    } else {
      throw Exception('Пожалуйста, перезапустите приложение со включенным интернетом и введите пин-код заново.');
    }
  }
}
