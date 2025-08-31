import 'package:flutter/cupertino.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/helper/validation_extension.dart';

part 'company_search_input_provider.g.dart';

@riverpod
class CompanySearchInput extends _$CompanySearchInput {

  @override
  String? build() {
    final company = '';
    return company;
  }

  void clearInput() {
    state = '';
  }

  void onInputChanged(String? input) {
    state = input;
  }
}