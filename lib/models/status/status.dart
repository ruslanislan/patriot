import 'package:freezed_annotation/freezed_annotation.dart';

part 'status.freezed.dart';
part 'status.g.dart';

@freezed
class Status with _$Status {
  factory Status({
   int? id,
   String? objectId,
   String? rcChannelName,
   DateTime? eventDate,
   DateTime? saveDate,
   String? eventCode,
   String? eventType,
   String? eventName,
   String? eventDescription,
   DateTime? createdAt,
   DateTime? updatedAt,
}) = _Status;

  factory Status.fromJson(Map<String, dynamic> json) =>_$StatusFromJson(json);
}