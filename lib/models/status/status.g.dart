// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Status _$$_StatusFromJson(Map<String, dynamic> json) => _$_Status(
      id: json['id'] as int?,
      objectId: json['object_id'] as String?,
      rcChannelName: json['rc_channel_name'] as String?,
      eventDate: json['event_date'] == null
          ? null
          : DateTime.parse(json['event_date'] as String),
      saveDate: json['save_date'] == null
          ? null
          : DateTime.parse(json['save_date'] as String),
      eventCode: json['event_code'] as String?,
      eventType: json['event_type'] as String?,
      eventName: json['event_name'] as String?,
      eventDescription: json['event_description'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
    );

Map<String, dynamic> _$$_StatusToJson(_$_Status instance) => <String, dynamic>{
      'id': instance.id,
      'objectId': instance.objectId,
      'rcChannelName': instance.rcChannelName,
      'eventDate': instance.eventDate?.toIso8601String(),
      'saveDate': instance.saveDate?.toIso8601String(),
      'eventCode': instance.eventCode,
      'eventType': instance.eventType,
      'eventName': instance.eventName,
      'eventDescription': instance.eventDescription,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
    };
