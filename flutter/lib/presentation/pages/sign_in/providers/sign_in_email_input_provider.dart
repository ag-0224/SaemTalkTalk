import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';

part 'sign_in_email_input_provider.g.dart';

@riverpod
class SignInEmailInput extends _$SignInEmailInput {

  @override
  String? build() {
    final userEmail = '';
    return userEmail;
  }

  String? emailValidation([String? value]) {

    String? input = value ?? state;

    if (input == null || input == '') {
      return '이메일 주소를 입력해주세요';
    } else if (input.hasProperEmail) {
      return '이메일 주소를 확인하세요';
    }else {
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