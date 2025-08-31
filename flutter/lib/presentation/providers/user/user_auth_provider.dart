import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/constants/firebase_auth_error_code_enum.dart';
import 'package:saem_talk_talk/core/services/snack_bar_service.dart';
import 'package:saem_talk_talk/features/auth/auth.dart';

part 'user_auth_provider.g.dart';

/// 앱 사용자 권한 프로바이더
@Riverpod(keepAlive: true)
class UserAuth extends _$UserAuth {
  @override
  User? build() {
    return FirebaseAuth.instance.currentUser;
  }

  ///
  /// Email/Password Auth 인증을 통해 로그인한다.
  ///
  Future<void> signIn(String email, String password) async {
    final result = await signInUseCase(email, password);
    result.fold(
      onSuccess: (value) {
        state = value.user;
      },
      onFailure: (e) {
        print(e);
        final message = FirebaseAuthErrorCode.fromCode((e as FirebaseAuthException).code)?.message;
        SnackBarService.showSnackBar('$message');
      },
    );
  }

  ///
  /// Email/Password Auth를 통해 회원가입한다.
  ///
  Future<void> signUp(String email, String password) async {
    final result = await signUpUseCase(email, password);
    result.fold(
      onSuccess: (value) {
        // state = value.user;
        SnackBarService.showSnackBar('회원가입이 성공적으로 완료되었습니다.');
      },
      onFailure: (e) {
        final message = FirebaseAuthErrorCode.fromCode((e as FirebaseAuthException).code)?.message;
        SnackBarService.showSnackBar('$message');
      },
    );
  }

  ///
  /// user Auth를 최신 상태로 갱신한다.
  ///
  void reloadUserAuth() async {
    await state?.reload();

    state = FirebaseAuth.instance.currentUser;
  }

  ///
  /// 로그아웃을 시도한다.
  ///
  Future<void> signOut() async {
    final result = await signOutUseCase();
    result.fold(
      onSuccess: (value) => ref.invalidateSelf(),
      onFailure: (e) {
        final message = FirebaseAuthErrorCode.fromCode((e as FirebaseAuthException).code)?.message;
        SnackBarService.showSnackBar('$message');
      },
    );
  }
}
