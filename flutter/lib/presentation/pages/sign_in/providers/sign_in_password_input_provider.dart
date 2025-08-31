import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';
part 'sign_in_password_input_provider.g.dart';

@riverpod
class SignInPasswordInput extends _$SignInPasswordInput {

  @override
  String? build() {
    String? userPassword = '';

    return userPassword;
  }

  String? passwordValidation([String? value]) {
    String? input = value ?? state;

    if (input == null || input == '') {
      return '비밀번호를 입력해주세요';
    } else if (input.hasProperLength) {
      return '비밀번호가 올바르지 않습니다.';
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