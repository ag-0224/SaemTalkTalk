import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/providers/sign_in_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/providers/sign_in_password_input_provider.dart';

mixin class SignInState {
  ///
  /// 이메일
  ///
  String? userEmail(WidgetRef ref) => ref.watch(signInEmailInputProvider);

  ///
  /// 이메일 입력 여부
  ///
  bool hasEmailEntered(WidgetRef ref) =>
      ref.watch(signInEmailInputProvider) != null;

  ///
  /// 비밀번호 입력 여부
  ///
  bool hasPasswordEntered(WidgetRef ref) =>
      ref.watch(signInPasswordInputProvider) != null;
}
