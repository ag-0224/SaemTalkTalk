import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';

part 'sign_up_email_input_provider.g.dart';

@riverpod
class SignUpEmailInput extends _$SignUpEmailInput {

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
      return '이메일 주소가 정확하지 않습니다';
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