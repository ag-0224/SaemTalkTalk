part of '../manager_detail_input_page.dart';

class _CompanyEmailInputField extends ConsumerWidget with ManagerDetailInputEvent {
  const _CompanyEmailInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => companyEmailValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '회사 이메일 주소',
        ),
        onClear: () {
          onCompanyEmailFieldClear(ref);
        },
        onChanged: (input) {
          onCompanyEmailChanged(ref, input: input);
        },
      ),
    );
  }
}