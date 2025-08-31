import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'manager_name_input_provider.g.dart';

@riverpod
class ManagerNameInput extends _$ManagerNameInput {

  @override
  String? build() {
    final managerName = '';
    return managerName;
  }

  String? managerNameValidation([String? value]) {
    String? input = value ?? state;

    if (input == null || input == '') {
      return '대표 이름을 입력해주세요';
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