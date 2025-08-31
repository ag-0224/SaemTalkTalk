import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';

abstract interface class UserRepository {
  ///
  /// 유저 정보 생성
  ///
  Future<Result<void>> createUser(UserEntity data);

  ///
  /// 유저 정보 호출
  ///
  Future<Result<UserEntity>> getUser([String? uid]);

  ///
  /// 유저 정보 업데이트
  ///
  Future<Result<void>> updateUser(UserEntity data);
}
