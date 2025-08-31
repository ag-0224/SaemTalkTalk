// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'company_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CompanyModel _$CompanyModelFromJson(Map<String, dynamic> json) => CompanyModel(
      id: json['id'] as String,
      ceoName: json['ceo_name'] as String,
      ceoUserId: json['ceo_user_id'] as String,
      companyName: json['company_name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phone_number'] as String,
      status: const UserStatusConverter().fromJson(json['status'] as String),
      createdAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['created_at'], const TimeStampConverter().fromJson),
      updatedAt: _$JsonConverterFromJson<Timestamp, DateTime>(
          json['updated_at'], const TimeStampConverter().fromJson),
    );

Map<String, dynamic> _$CompanyModelToJson(CompanyModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'ceo_name': instance.ceoName,
      'ceo_user_id': instance.ceoUserId,
      'company_name': instance.companyName,
      'email': instance.email,
      'phone_number': instance.phoneNumber,
      'status': const UserStatusConverter().toJson(instance.status),
      'created_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimeStampConverter().toJson),
      'updated_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimeStampConverter().toJson),
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);
