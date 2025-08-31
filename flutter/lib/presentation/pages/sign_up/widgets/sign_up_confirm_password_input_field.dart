part of '../sign_up_page.dart';

class _SignUpConfirmPasswordInputField extends ConsumerWidget with SignUpState, SignUpEvent {
  const _SignUpConfirmPasswordInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => signUpConfirmPasswordValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '비밀번호 확인',
        ),
        obscureText: true,
        activeObscureIcon: true,
        onClear: () {
          onSignUpConfirmPasswordFieldClear(ref);
        },
        onChanged: (input) {
          onSignUpConfirmPasswordChanged(ref, input: input);
        },
      ),
    );
  }
}