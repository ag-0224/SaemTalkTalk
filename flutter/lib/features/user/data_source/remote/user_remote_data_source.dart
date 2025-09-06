import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';
import 'package:saem_talk_talk/features/user/user.dart';

abstract interface class UserRemoteDataSource {
  ///
  /// 유저 정보 생성
  ///
  Future<void> createUser(UserEntity data);

  ///
  /// 유저 정보 업데이트
  ///
  Future<void> updateUser(UserEntity data);

  ///
  /// 유저 정보 호출
  ///
  Future<UserModel> getUser([String? uid]);

  ///
  /// 유저 정보 삭제
  ///
  Future<void> deleteUser(UserModel user);

  ///
  /// 마지막 접속 일자 갱신
  ///
  Future<void> updateLastLoginDate();
}
