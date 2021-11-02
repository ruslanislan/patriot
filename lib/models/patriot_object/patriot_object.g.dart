// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'patriot_object.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PatriotObject _$$_PatriotObjectFromJson(Map<String, dynamic> json) =>
    _$_PatriotObject(
      id: json['id'] as String?,
      agreementId: json['agreement_id'] as String?,
      consoleId: json['console_id'] as String?,
      consoleCode: json['console_code'] as String?,
      console: json['console'] as String?,
      serviceType: json['service_type'] as String?,
      objectName: json['object_name'] as String?,
      address: json['address'] as String?,
      monthlyPayment: json['monthly_payment'] as String?,
      createdAt: json['created_at'] == null
          ? null
          : DateTime.parse(json['created_at'] as String),
      updatedAt: json['updated_at'] == null
          ? null
          : DateTime.parse(json['updated_at'] as String),
      list: (json['list'] as List<dynamic>?)
              ?.map((e) => Status.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$$_PatriotObjectToJson(_$_PatriotObject instance) =>
    <String, dynamic>{
      'id': instance.id,
      'agreementId': instance.agreementId,
      'consoleId': instance.consoleId,
      'consoleCode': instance.consoleCode,
      'console': instance.console,
      'serviceType': instance.serviceType,
      'objectName': instance.objectName,
      'address': instance.address,
      'monthlyPayment': instance.monthlyPayment,
      'createdAt': instance.createdAt?.toIso8601String(),
      'updatedAt': instance.updatedAt?.toIso8601String(),
      'list': instance.list,
    };
