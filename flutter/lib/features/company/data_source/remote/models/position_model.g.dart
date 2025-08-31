// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'position_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PositionModel _$PositionModelFromJson(Map<String, dynamic> json) =>
    PositionModel(
      id: json['id'] as String,
      positionName: json['position_name'] as String,
      createdAt:
          const TimeStampConverter().fromJson(json['created_at'] as Timestamp),
      updatedAt:
          const TimeStampConverter().fromJson(json['updated_at'] as Timestamp),
    );

Map<String, dynamic> _$PositionModelToJson(PositionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'position_name': instance.positionName,
      'created_at': const TimeStampConverter().toJson(instance.createdAt),
      'updated_at': const TimeStampConverter().toJson(instance.updatedAt),
    };
