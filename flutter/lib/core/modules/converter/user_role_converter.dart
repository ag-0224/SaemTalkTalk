import 'package:json_annotation/json_annotation.dart';
import 'package:saem_talk_talk/core/constants/user_role_enum.dart';

class UserRoleConverter implements JsonConverter<UserRoleTypes, String> {
  const UserRoleConverter();

  @override
  UserRoleTypes fromJson(String status) => UserRoleTypes.getByKey(status.toLowerCase());

  @override
  String toJson(UserRoleTypes userStatus) => userStatus.key.toUpperCase();
}