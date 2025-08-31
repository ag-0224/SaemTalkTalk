import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_password_input_provider.dart';

part 'sign_up_confirm_password_input_provider.g.dart';

@riverpod
class SignUpConfirmPasswordInput extends _$SignUpConfirmPasswordInput {
  @override
  String? build() {
    final userConfirmPassword = '';
    return userConfirmPassword;
  }

  String? confirmPasswordValidation(WidgetRef ref, [String? value]) {
    String? input = value ?? state;

    final originalPassword = ref.watch(signUpPasswordInputProvider);

    if (input == null || input == '') {
      return '비밀번호를 다시 한 번 더 입력해주세요';
    } else if (input != originalPassword) {
      return '비밀번호가 일치하지 않습니다.';
    } else {
      return null;
    }
  }

  void clearInput() {
    state = '';
  }

  void onInputChanged(String? input) {
    state = input;
  }
}