part of '../manager_detail_input_page.dart';

class _ManagerDetailInputButton extends HookConsumerWidget
    with ManagerDetailInputState, ManagerDetailInputEvent {
  const _ManagerDetailInputButton(
      {required this.companyNameFormKey,
      required this.managerNameFormKey,
      required this.companyEmailFormKey,
      required this.companyPhoneNumberFormKey,
      super.key});

  final GlobalKey<FormState> companyNameFormKey;
  final GlobalKey<FormState> managerNameFormKey;
  final GlobalKey<FormState> companyEmailFormKey;
  final GlobalKey<FormState> companyPhoneNumberFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBtnActivate = useState(false);

    ref.listen(companyNameInputProvider, (_, next) {
      isBtnActivate.value = companyNameFormKey.currentState!.validate() &&
          managerNameFormKey.currentState!.validate() &&
          companyEmailFormKey.currentState!.validate() &&
          companyPhoneNumberFormKey.currentState!.validate() &&
          (hasCompanyNameEntered(ref) &&
              hasManagerNameEntered(ref) &&
              hasCompanyEmailEntered(ref) &&
              hasCompanyPhoneNumberEntered(ref));
    });

    ref.listen(managerNameInputProvider, (_, next) {
      isBtnActivate.value = companyNameFormKey.currentState!.validate() &&
          managerNameFormKey.currentState!.validate() &&
          companyEmailFormKey.currentState!.validate() &&
          companyPhoneNumberFormKey.currentState!.validate() &&
          (hasCompanyNameEntered(ref) &&
              hasManagerNameEntered(ref) &&
              hasCompanyEmailEntered(ref) &&
              hasCompanyPhoneNumberEntered(ref));
    });

    ref.listen(companyEmailInputProvider, (_, next) {
      isBtnActivate.value = companyNameFormKey.currentState!.validate() &&
          managerNameFormKey.currentState!.validate() &&
          companyEmailFormKey.currentState!.validate() &&
          companyPhoneNumberFormKey.currentState!.validate() &&
          (hasCompanyNameEntered(ref) &&
              hasManagerNameEntered(ref) &&
              hasCompanyEmailEntered(ref) &&
              hasCompanyPhoneNumberEntered(ref));
    });

    ref.listen(companyPhoneNumberInputProvider, (_, next) {
      isBtnActivate.value = companyNameFormKey.currentState!.validate() &&
          managerNameFormKey.currentState!.validate() &&
          companyEmailFormKey.currentState!.validate() &&
          companyPhoneNumberFormKey.currentState!.validate() &&
          (hasCompanyNameEntered(ref) &&
              hasManagerNameEntered(ref) &&
              hasCompanyEmailEntered(ref) &&
              hasCompanyPhoneNumberEntered(ref));
    });

    return ActivationButton(
        text: '완료하기',
        onTap: isBtnActivate.value ? () {} : null,
        isActive: isBtnActivate.value);
  }
}
