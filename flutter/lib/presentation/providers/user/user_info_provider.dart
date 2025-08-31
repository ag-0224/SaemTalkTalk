import 'dart:async';
import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/features/user/user.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

part 'user_info_provider.g.dart';

@Riverpod(keepAlive: true)
class UserInfo extends _$UserInfo {
  @override
  FutureOr<UserEntity?> build() async {
    final userAuth = ref.watch(userAuthProvider);

    if (userAuth == null) {
      throw Exception('유저 인증 정보가 존재하지 않습니다(로그아웃 이후 다시 로그인 시도할 경우 정상적인 시도입니다)');
    }

    final userData = await getUserUseCase();

    return userData.fold(
      onSuccess: (info) {
        AppUserInfo().initialize(info);
        return info;
      },
      onFailure: (e) {
        return null;
      },
    );
  }

  Future<void> createData(UserEntity data) async {
    final createUserData = await createUserUseCase(data);
    await createUserData.fold(
      onSuccess: (value) async {
        ref.invalidateSelf();

        await future;
      },
      onFailure: (e) {
        throw e;
      },
    );
  }

  // ///
  // /// 회원탈퇴
  // ///
  // Future<void> resign() async {
  //   final response = await resignUserUseCase(state.requireValue!);
  //   response.fold(
  //     onSuccess: (value) {
  //       ref.invalidateSelf();
  //     },
  //     onFailure: (e) {
  //       throw e;
  //     },
  //   );
  // }
}

final class AppUserInfo {
  static final AppUserInfo _instance = AppUserInfo._internal();

  factory AppUserInfo() => _instance;

  AppUserInfo._internal();

  UserEntity? instance;

  void initialize(UserEntity? info) {
    instance = info;
  }
}
