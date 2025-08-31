import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_phone_number_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/manager_name_input_provider.dart';

mixin class ManagerDetailInputEvent {
  ///
  /// 회사 이름 유효성 검사
  ///
  String? companyNameValidation(WidgetRef ref, {required String? input}) {
    return ref.read(companyNameInputProvider.notifier).companyNameValidation(input);
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
    return ref.read(managerNameInputProvider.notifier).managerNameValidation(input);
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
}