import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'teacher_name_input_provider.g.dart';

@riverpod
class TeacherNameInput extends _$TeacherNameInput {

  @override
  String? build() {
    final teacherName = '';
    return teacherName;
  }

  String? teacherNameValidation([String? value]) {
    String? input = value ?? state;

    if (input == null || input == '') {
      return '이름을 입력해주세요';
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