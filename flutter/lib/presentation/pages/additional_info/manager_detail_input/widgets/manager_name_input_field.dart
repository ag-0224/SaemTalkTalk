part of '../manager_detail_input_page.dart';

class _ManagerNameInputField extends ConsumerWidget with ManagerDetailInputEvent {
  const _ManagerNameInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => managerNameValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '대표 이름',
        ),
        onClear: () {
          onManagerNameFieldClear(ref);
        },
        onChanged: (input) {
          onManagerNameChanged(ref, input: input);
        },
      ),
    );
  }
}