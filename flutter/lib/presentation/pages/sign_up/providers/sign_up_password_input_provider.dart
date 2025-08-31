import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';

part 'sign_up_password_input_provider.g.dart';

@riverpod
class SignUpPasswordInput extends _$SignUpPasswordInput {
  @override
  String? build() {
    final userPassword = '';
    return userPassword;
  }

  String? passwordValidation([String? value]) {
    String? input = value ?? state;

    if (input == null || input == '') {
      return '비밀번호를 입력해주세요';
    } else if (input.hasProperLength) {
      return '비밀번호는 8 ~ 32자이내로 입력해주세요';
    } else if (input.hasProperPasswordCharacter) {
      return '영문 + 숫자 + 특수문자 조합으로 입력해주세요';
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
