import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';

part 'company_phone_number_input_provider.g.dart';

@riverpod
class CompanyPhoneNumberInput extends _$CompanyPhoneNumberInput {

  @override
  String? build() {
    final phoneNumber = '';
    return phoneNumber;
  }

  String? companyPhoneNumberValidation([String? value]) {
    String? input = value ?? state;

    if (input == null || input == '') {
      return '전화번호를 입력해주세요';
    } else if (!RegExp(r'^[0-9]+$').hasMatch(input)) {
      return '숫자만 입력해주세요';
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