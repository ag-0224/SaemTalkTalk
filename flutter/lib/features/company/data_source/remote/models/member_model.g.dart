// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'member_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MemberModel _$MemberModelFromJson(Map<String, dynamic> json) => MemberModel(
      uid: json['uid'] as String,
      name: json['name'] as String,
      department: json['department'] as String?,
      position: json['position'] as String?,
      status: const UserStatusConverter().fromJson(json['status'] as String),
    );

Map<String, dynamic> _$MemberModelToJson(MemberModel instance) =>
    <String, dynamic>{
      'uid': instance.uid,
      'name': instance.name,
      'department': instance.department,
      'position': instance.position,
      'status': const UserStatusConverter().toJson(instance.status),
    };
