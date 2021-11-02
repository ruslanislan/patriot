import 'package:patriot/models/patriot_object/patriot_object.dart';
import 'package:patriot/models/status/status.dart';

import 'api_provider.dart';

class ApiService {
  final ApiProvider apiProvider = ApiProvider();

  dynamic _parse(Function parser) {
    try {
      return parser();
    } catch (ex) {
      throw Exception(ex);
    }
  }

  Future<List<PatriotObject>> getObjects() async {
    final data = await apiProvider.getObjects();
    return await _parse(
      () => List<PatriotObject>.from(
        data.map(
          (e) => PatriotObject.fromJson(e),
        ),
      ),
    );
  }

  Future<List<Status>> getStatuses(String id) async {
    final data = await apiProvider.getStatuses(id.replaceAll('/', '-'));
    return _parse(
      () => List<Status>.from(
        data.map(
          (e) => Status.fromJson(e),
        ),
      ),
    );
  }
}
