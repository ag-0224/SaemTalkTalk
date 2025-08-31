import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/department_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/position_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_name_input_provider.dart';

mixin class TeacherDetailInputEvent {
  ///
  /// 교사 이름 유효성 검사
  ///
  String? teacherNameValidation(WidgetRef ref, {required String? input}) {
    return ref.read(teacherNameInputProvider.notifier).teacherNameValidation(input);
  }

  ///
  /// 교사 이름이 입력되었을 때
  ///
  void teacherNameChanged(WidgetRef ref, {required String? input}) {
    return ref.read(teacherNameInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 교사 이름 필드에 값이 clear 되었을 때
  ///
  void teacherNameFieldClear(WidgetRef ref) {
    ref.read(teacherNameInputProvider.notifier).clearInput();
  }

  ///
  /// 부서가 입력되었을 때
  ///
  void onTeacherDepartmentInputChanged(WidgetRef ref, {required String? input}) {
    return ref.read(departmentInputProvider.notifier).onChanged(input);
  }

  ///
  /// 부서 필드에 값이 clear 되었을 때
  ///
  void onTeacherDepartmentFieldClear(WidgetRef ref) {
    ref.read(departmentInputProvider.notifier).clear();
  }

  ///
  /// 직급이 입력되었을 때
  ///
  void onTeacherPositionInputChanged(WidgetRef ref, {required String? input}) {
    return ref.read(positionInputProvider.notifier).onChanged(input);
  }

  ///
  /// 직급 필드에 값이 clear 되었을 때
  ///
  void onTeacherPositionFieldClear(WidgetRef ref) {
    ref.read(positionInputProvider.notifier).clear();
  }
}