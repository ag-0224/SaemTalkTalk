part of '../manager_detail_input_page.dart';

class _CompanyNameInputField extends ConsumerWidget with ManagerDetailInputEvent {
  const _CompanyNameInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => companyNameValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '회사 이름',
        ),
        onClear: () {
          onCompanyNameFieldClear(ref);
        },
        onChanged: (input) {
          onCompanyNameChanged(ref, input: input);
        },
      ),
    );
  }
}