part of '../teacher_detail_input_page.dart';

class _TeacherNameInputField extends ConsumerWidget with TeacherDetailInputEvent {
  const _TeacherNameInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => teacherNameValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '이름',
        ),
        onClear: () {
          teacherNameFieldClear(ref);
        },
        onChanged: (input) {
          teacherNameChanged(ref, input: input);
        },
      ),
    );
  }
}