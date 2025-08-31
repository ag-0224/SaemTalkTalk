part of '../sign_up_page.dart';

class _SignUpEmailInputField extends ConsumerWidget with SignUpState, SignUpEvent {
  const _SignUpEmailInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => signUpEmailValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '이메일 주소',
        ),
        onClear: () {
          onSignUpEmailFieldClear(ref);
        },
        onChanged: (input) {
          onSignUpEmailChanged(ref, input: input);
        },
      ),
    );
  }
}