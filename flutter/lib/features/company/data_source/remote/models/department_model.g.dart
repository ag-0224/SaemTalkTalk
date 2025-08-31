// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'department_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DepartmentModel _$DepartmentModelFromJson(Map<String, dynamic> json) =>
    DepartmentModel(
      id: json['id'] as String,
      departmentName: json['department_name'] as String,
      createdAt:
          const TimeStampConverter().fromJson(json['created_at'] as Timestamp),
      updatedAt:
          const TimeStampConverter().fromJson(json['updated_at'] as Timestamp),
    );

Map<String, dynamic> _$DepartmentModelToJson(DepartmentModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'department_name': instance.departmentName,
      'created_at': const TimeStampConverter().toJson(instance.createdAt),
      'updated_at': const TimeStampConverter().toJson(instance.updatedAt),
    };
