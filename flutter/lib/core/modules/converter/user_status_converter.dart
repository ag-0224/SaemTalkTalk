import 'package:json_annotation/json_annotation.dart';
import 'package:saem_talk_talk/core/constants/user_status_enum.dart';

class UserStatusConverter implements JsonConverter<UserStatusTypes, String> {
  const UserStatusConverter();

  @override
  UserStatusTypes fromJson(String status) => UserStatusTypes.getByKey(status.toLowerCase());

  @override
  String toJson(UserStatusTypes userStatus) => userStatus.key.toUpperCase();
}
