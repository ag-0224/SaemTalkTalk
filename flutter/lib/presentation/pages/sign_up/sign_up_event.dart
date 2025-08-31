import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_confirm_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

mixin class SignUpEvent {
  ///
  /// 이메일 유효성 검사
  ///
  String? signUpEmailValidation(WidgetRef ref, {required String? input}) {
    return ref.read(signUpEmailInputProvider.notifier).emailValidation(input);
  }

  ///
  /// 이메일이 입력되었을 때
  ///
  void onSignUpEmailChanged(WidgetRef ref, {required String? input}) {
    return ref.read(signUpEmailInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 이메일 필드에 값이 clear 되었을 때
  ///
  void onSignUpEmailFieldClear(WidgetRef ref) {
    ref.read(signUpEmailInputProvider.notifier).clearInput();
  }

  ///
  /// 비밀번호 유효성 검사
  ///
  String? signUpPasswordValidation(WidgetRef ref, {required String? input}) {
    return ref
        .read(signUpPasswordInputProvider.notifier)
        .passwordValidation(input);
  }

  ///
  /// 비밀번호가 입력되었을 때
  ///
  void onSignUpPasswordChanged(WidgetRef ref, {required String? input}) {
    return ref.read(signUpPasswordInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 비밀번호 필드에 값이 clear 되었을 때
  ///
  void onSignUpPasswordFieldClear(WidgetRef ref) {
    ref.read(signUpPasswordInputProvider.notifier).clearInput();
  }

  ///
  /// 비밀번호 확인 유효성 검사
  ///
  String? signUpConfirmPasswordValidation(WidgetRef ref, {required String? input}) {
    return ref
        .read(signUpConfirmPasswordInputProvider.notifier)
        .confirmPasswordValidation(ref);
  }

  ///
  /// 비밀번호가 확인 입력되었을 때
  ///
  void onSignUpConfirmPasswordChanged(WidgetRef ref, {required String? input}) {
    return ref.read(signUpConfirmPasswordInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 비밀번호 확인 필드에 값이 clear 되었을 때
  ///
  void onSignUpConfirmPasswordFieldClear(WidgetRef ref) {
    ref.read(signUpConfirmPasswordInputProvider.notifier).clearInput();
  }

  ///
  /// [provider]를 통해 회원가입을 실행한다.
  ///
  Future<void> _signUp(
      WidgetRef ref, {
        required String email,
        required String password,
      }) async {
    try {
      await EasyLoading.show().then(
            (_) {
          return ref
              .read(userAuthProvider.notifier).signUp(email, password);
        },
      ).then(
            (_) => const SignInRoute().go(ref.context),
      );
    } finally {
      await EasyLoading.dismiss();
    }
  }

  ///
  /// 완료하기 버튼을 클릭 했을 때
  ///
  Future<void> onSignUpBtnTapped(WidgetRef ref) async {
    FocusManager.instance.primaryFocus?.unfocus();

    final email = ref.read(signUpEmailInputProvider);
    final password = ref.read(signUpPasswordInputProvider);

    await _signUp(ref, email: email!, password: password!);
  }
}