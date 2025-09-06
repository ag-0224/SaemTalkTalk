import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/core/constants/user_status_enum.dart';
import 'package:saem_talk_talk/core/helper/string_generator.dart';
import 'package:saem_talk_talk/features/company/company.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/features/company/repository/entities/member_entity.dart';
import 'package:saem_talk_talk/features/company/use_case/create_company_use_case.dart';
import 'package:saem_talk_talk/features/user/repositories/entities/user_entity.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_phone_number_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/manager_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_info_provider.dart';

mixin class ManagerDetailInputEvent {
  ///
  /// 회사 이름 유효성 검사
  ///
  String? companyNameValidation(WidgetRef ref, {required String? input}) {
    return ref
        .read(companyNameInputProvider.notifier)
        .companyNameValidation(input);
  }

  ///
  /// 회사 이름이 입력되었을 때
  ///
  void onCompanyNameChanged(WidgetRef ref, {required String? input}) {
    return ref.read(companyNameInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 회사 이름 필드에 값이 clear 되었을 때
  ///
  void onCompanyNameFieldClear(WidgetRef ref) {
    ref.read(companyNameInputProvider.notifier).clearInput();
  }

  ///
  /// 대표 이름 유효성 검사
  ///
  String? managerNameValidation(WidgetRef ref, {required String? input}) {
    return ref
        .read(managerNameInputProvider.notifier)
        .managerNameValidation(input);
  }

  ///
  /// 대표 이름이 입력되었을 때
  ///
  void onManagerNameChanged(WidgetRef ref, {required String? input}) {
    return ref.read(managerNameInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 대표 이름 필드에 값이 clear 되었을 때
  ///
  void onManagerNameFieldClear(WidgetRef ref) {
    ref.read(managerNameInputProvider.notifier).clearInput();
  }

  ///
  /// 회사 이메일 유효성 검사
  ///
  String? companyEmailValidation(WidgetRef ref, {required String? input}) {
    return ref.read(companyEmailInputProvider.notifier).emailValidation(input);
  }

  ///
  /// 회사 이메일이 입력되었을 때
  ///
  void onCompanyEmailChanged(WidgetRef ref, {required String? input}) {
    return ref.read(companyEmailInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 회사 이메일 필드에 값이 clear 되었을 때
  ///
  void onCompanyEmailFieldClear(WidgetRef ref) {
    ref.read(companyEmailInputProvider.notifier).clearInput();
  }

  ///
  /// 회사 전화번호 유효성 검사
  ///
  String? companyPhoneNumberValidation(WidgetRef ref,
      {required String? input}) {
    return ref
        .read(companyPhoneNumberInputProvider.notifier)
        .companyPhoneNumberValidation(input);
  }

  ///
  /// 회사 전화번호가 입력되었을 때
  ///
  void onCompanyPhoneNumberChanged(WidgetRef ref, {required String? input}) {
    return ref
        .read(companyPhoneNumberInputProvider.notifier)
        .onInputChanged(input);
  }

  ///
  /// 회사 전화번호 필드에 값이 clear 되었을 때
  ///
  void onCompanyPhoneNumberFieldClear(WidgetRef ref) {
    ref.read(companyPhoneNumberInputProvider.notifier).clearInput();
  }

  ///
  /// '완료하기' 버튼을 눌렀을 때
  ///
  void onCompletedBtnTapped(WidgetRef ref) async {
    try {
      await EasyLoading.show();

      final companyId = StringGenerator.generateRandomString();

      final userData = UserEntity(
        profileImgUrl: ref.read(userAuthProvider)?.photoURL,
        uid: ref.read(userAuthProvider)!.uid,
        email: ref.read(userAuthProvider)?.email,
        name: ref.read(managerNameInputProvider)!,
        companyId: companyId,
        locale: 'ko',
        signUpDate: DateTime.now(),
        lastLoginDate: DateTime.now(),
      );

      final companyData = CompanyEntity(
        id: companyId,
        ceoName: ref.read(managerNameInputProvider)!,
        ceoUserId: ref.read(userAuthProvider)!.uid,
        companyName: ref.read(companyNameInputProvider)!,
        email: ref.read(companyEmailInputProvider)!,
        phoneNumber: ref.read(companyPhoneNumberInputProvider)!,
        status: UserStatusTypes.ACTIVE,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      );

      final memberData = MemberEntity(
        uid: ref.read(userAuthProvider)!.uid,
        name: ref.read(managerNameInputProvider)!,
        position: '원장',
        status: UserStatusTypes.ACTIVE,
      );

      await ref.read(userInfoProvider.notifier).createData(userData).then(
        (_) async {
          final result = await createCompanyUseCase.call(companyData);

          result.fold(
            onSuccess: (value) async {
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
