import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:patriot/models/status/status.dart';

part 'patriot_object.freezed.dart';
part 'patriot_object.g.dart';

@freezed
class PatriotObject with _$PatriotObject {
  factory PatriotObject({
    String? id,
    String? agreementId,
    String? consoleId,
    String? consoleCode,
    String? console,
    String? serviceType,
    String? objectName,
    String? address,
    String? monthlyPayment,
    DateTime? createdAt,
    DateTime? updatedAt,
    @Default([]) List<Status>? list,
}) = _PatriotObject;

factory PatriotObject.fromJson(Map<String, dynamic> json) =>_$PatriotObjectFromJson(json);
}