import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/core/constants/user_status_enum.dart';
import 'package:saem_talk_talk/features/company/company.dart';
import 'package:saem_talk_talk/features/company/repository/entities/member_entity.dart';
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

      final memberData = MemberEntity(
        uid: ref.read(userAuthProvider)!.uid,
        name: ref.read(teacherNameInputProvider)!,
        department: ref.read(departmentInputProvider),
        position: ref.read(positionInputProvider),
        status: UserStatusTypes.NOT_AUTH,
      );

      await ref.read(userInfoProvider.notifier).createData(userData).then(
        (_) async {
          final companyId = ref.read(teacherDetailInputRouteArgProvider).companyId;

          final result = await createMemberUseCase.call((memberData, companyId));

          result.fold(
            onSuccess: (value) {
              const MainRoute().go(ref.context);
            },
            onFailure: (e) {
              // TODO: 탈퇴 기능 구현
            },
          );
        },
      );
    } finally {
      await EasyLoading.dismiss();
    }
  }
}
