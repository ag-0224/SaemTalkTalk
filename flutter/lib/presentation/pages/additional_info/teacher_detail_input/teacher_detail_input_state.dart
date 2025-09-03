import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/company_department_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/company_position_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/department_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/position_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_name_input_provider.dart';

mixin class TeacherDetailInputState {
  ///
  /// 이름 입력 여부
  ///
  bool hasNameEntered(WidgetRef ref) =>
      ref.watch(teacherNameInputProvider) != null;

  ///
  /// 선생님 부서
  ///
  String? teacherDepartment(WidgetRef ref) =>
      ref.watch(departmentInputProvider);

  ///
  /// 선생님 직급
  ///
  String? teacherPosition(WidgetRef ref) => ref.watch(positionInputProvider);

  ///
  /// 부서 리스트
  ///
  AsyncValue<List<String>> departmentList(WidgetRef ref) =>
      ref.watch(companyDepartmentProvider);

  ///
  /// 직급 리스트
  ///
  AsyncValue<List<String>> positionList(WidgetRef ref) =>
      ref.watch(companyPositionProvider);
}
