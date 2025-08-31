import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'department_input_provider.g.dart';

@riverpod
class DepartmentInput extends _$DepartmentInput {

  @override
  String? build() {
    final department = null;
    return department;
  }

  void clear() {
    state = null;
  }

  void onChanged(String? department) {
    state = department;
  }
}