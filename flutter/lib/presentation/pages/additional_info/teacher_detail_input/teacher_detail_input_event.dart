import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/department_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/position_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_detail_input_route_arg_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_info_provider.dart';

mixin class TeacherDetailInputEvent {
  ///
  /// 교사 이름 유효성 검사
  ///
  String? teacherNameValidation(WidgetRef ref, {required String? input}) {
    return ref
        .read(teacherNameInputProvider.notifier)
        .teacherNameValidation(input);
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
  void onTeacherDepartmentInputChanged(WidgetRef ref,
      {required String? input}) {
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

  ///
  /// '완료하기' 버튼을 눌렀을 때
  ///
  void onCompletedBtnTapped(WidgetRef ref) async {
    try {
      await EasyLoading.show();

      final userData = UserEntity(
        profileImgUrl: ref.read(userAuthProvider)?.photoURL,
        uid: ref.read(userAuthProvider)!.uid,
        email: ref.read(userAuthProvider)?.email,
        name: ref.read(teacherNameInputProvider)!,
        companyId: ref.read(teacherDetailInputRouteArgProvider).companyId,
        locale: 'ko',
        signUpDate: DateTime.now(),
        lastLoginDate: DateTime.now(),
      );

      await ref.read(userInfoProvider.notifier).createData(userData).then(
            (_) async {
          const MainRoute().go(ref.context);
        },
      );
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
