import 'package:dio/dio.dart';

class ApiProvider {
  static const _defaultUrl = "http://89.190.249.251/api";
  static const _loginPath = '/auth/createToken';
  static const _objectsPath = "/objects";

  final dio = Dio(BaseOptions(baseUrl: _defaultUrl));

  static final _instance = ApiProvider._internal();

  factory ApiProvider() {
    return _instance;
  }

  ApiProvider._internal();

  Future<dynamic> _request(Function request) async {
    try {
      final res = (await request());
      return res.data;
    } on DioError catch (ex) {
      print(ex);
    }
  }

  void setToken(String? token) {
    if (token == null) {
      dio.options.headers.remove('Authorization');
    } else {
      //print(token);
      dio.options.headers = {'Authorization': "Bearer " + token};
    }
  }

  Future<dynamic> login(String email, String password, String deviceId) async {
    return _request(
      () => dio.get(
        _loginPath,
        queryParameters: {
          "email": email,
          "device_id": deviceId,
          "password": password
        }
      ),
    );
  }

  Future<dynamic> getObjects() async {
    return _request(() => dio.get(_objectsPath,),);
  }

  Future<dynamic> getStatuses(String id) async {
    return _request(() => dio.get(_objectsPath + "/statuses/$id?limit=99"),);
  }
}
