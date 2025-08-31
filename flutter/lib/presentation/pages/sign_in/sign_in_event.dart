import 'dart:async';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/core/services/snack_bar_service.dart';
import 'package:saem_talk_talk/features/auth/auth.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/providers/sign_in_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/providers/sign_in_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_info_provider.dart';

mixin class SignInEvent {
  ///
  /// 유저 지위에 따라 라우팅을 분기한다.
  ///
  Future<void> _routeByUserState(WidgetRef ref) async {
    final auth = ref.read(userAuthProvider);

    if (auth == null) {
      return;
    }

    await ref.read(userInfoProvider.future).then(
          (userData) async {
        if (userData == null) {

          if (!auth.emailVerified) {
            _sendEmailVerification();
            const UserVerificationRoute().go(ref.context);
          } else {
            const UserTypeSelectRoute().go(ref.context);
          }

        } else {
          // const MainRoute().go(ref.context);
        }
      },
    );
  }

  ///
  /// 이메일 인증을 전송한다
  ///
  Future<void> _sendEmailVerification() async {
    final result = await sendEmailVerificationUseCase();
    result.fold(
      onSuccess: (value) {
        SnackBarService.showSnackBar('이메일이 전송되었습니다.');
      },
      onFailure: (e) {
        SnackBarService.showSnackBar('오류가 발생하였습니다. 재전송을 시도해주세요.');
      },
    );
  }

  ///
  /// [provider]를 통해 로그인을 실행한다.
  ///
  Future<void> _signIn(
    WidgetRef ref, {
    required String email,
    required String password,
  }) async {
    try {
      await EasyLoading.show().then(
            (_) {
          return ref
              .read(userAuthProvider.notifier).signIn(email, password);
        },
      ).then(
            (_) => _routeByUserState(ref),
      );
    } finally {
      await EasyLoading.dismiss();
    }
  }

  ///
  /// 로그인 버튼을 클릭 했을 때
  ///
  Future<void> onSignInBtnTapped(WidgetRef ref) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final email = ref.read(signInEmailInputProvider);
    final password = ref.read(signInPasswordInputProvider);

    await _signIn(ref, email: email!, password: password!);
  }

  ///
  /// 이메일 유효성 검사
  ///
  String? signInEmailValidation(WidgetRef ref, {required String? input}) {
    return ref.read(signInEmailInputProvider.notifier).emailValidation(input);
  }

  ///
  /// 이메일이 입력되었을 때
  ///
  void onSignInEmailChanged(WidgetRef ref, {required String? input}) {
    return ref.read(signInEmailInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 이메일 필드에 값이 clear 되었을 때
  ///
  void onSignInEmailFieldClear(WidgetRef ref) {
    ref.read(signInEmailInputProvider.notifier).clearInput();
  }

  ///
  /// 비밀번호 유효성 검사
  ///
  String? signInPasswordValidation(WidgetRef ref, {required String? input}) {
    return ref
        .read(signInPasswordInputProvider.notifier)
        .passwordValidation(input);
  }

  ///
  /// 비밀번호가 입력되었을 때
  ///
  void onSignInPasswordChanged(WidgetRef ref, {required String? input}) {
    return ref.read(signInPasswordInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 비밀번호 필드에 값이 clear 되었을 때
  ///
  void onSignInPasswordFieldClear(WidgetRef ref) {
    ref.read(signInPasswordInputProvider.notifier).clearInput();
  }

  ///
  /// 회원가입 버튼을 눌렀을 때
  ///
  void onSignUpBtnTapped(WidgetRef ref) {
    const SignUpRoute().push(ref.context);
  }
}
