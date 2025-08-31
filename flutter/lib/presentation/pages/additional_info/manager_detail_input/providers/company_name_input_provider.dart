import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';

part 'company_name_input_provider.g.dart';

@riverpod
class CompanyNameInput extends _$CompanyNameInput {

  @override
  String? build() {
    final companyName = '';
    return companyName;
  }

  String? companyNameValidation([String? value]) {
    String? input = value ?? state;

    if (input == null || input == '') {
      return '회사이름을 입력해주세요';
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