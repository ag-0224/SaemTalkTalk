import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_phone_number_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/manager_name_input_provider.dart';

mixin class ManagerDetailInputState {
  ///
  /// 회사 이름 입력 여부
  ///
  bool hasCompanyNameEntered(WidgetRef ref) =>
      ref.watch(companyNameInputProvider) != null;

  ///
  /// 대표 이름 입력 여부
  ///
  bool hasManagerNameEntered(WidgetRef ref) =>
      ref.watch(managerNameInputProvider) != null;

  ///
  /// 회사 이메일 입력 여부
  ///
  bool hasCompanyEmailEntered(WidgetRef ref) =>
      ref.watch(companyEmailInputProvider) != null;

  ///
  /// 회사 전화번호 (- 제외) 입력 여부
  ///
  bool hasCompanyPhoneNumberEntered(WidgetRef ref) =>
      ref.watch(companyPhoneNumberInputProvider) != null;
}