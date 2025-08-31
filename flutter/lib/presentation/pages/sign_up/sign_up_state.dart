import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_confirm_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_password_input_provider.dart';

mixin class SignUpState {
  ///
  /// 이메일 입력 여부
  ///
  bool hasEmailEntered(WidgetRef ref) =>
      ref.watch(signUpEmailInputProvider) != null;

  ///
  /// 비밀번호 입력 여부
  ///
  bool hasPasswordEntered(WidgetRef ref) =>
      ref.watch(signUpPasswordInputProvider) != null;

  ///
  /// 비밀번호 확인 입력 여부
  ///
  bool hasConfirmPasswordEntered(WidgetRef ref) =>
      ref.watch(signUpConfirmPasswordInputProvider) != null;
}
