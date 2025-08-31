part of '../manager_detail_input_page.dart';

class _CompanyPhoneNumberInputField extends ConsumerWidget with ManagerDetailInputEvent {
  const _CompanyPhoneNumberInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => companyPhoneNumberValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '전화번호 (-제외)',
        ),
        onClear: () {
          onCompanyPhoneNumberFieldClear(ref);
        },
        onChanged: (input) {
          onCompanyPhoneNumberChanged(ref, input: input);
        },
      ),
    );
  }
}