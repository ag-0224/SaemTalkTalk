part of '../sign_up_page.dart';

class _SignUpPasswordInputField extends ConsumerWidget with SignUpState, SignUpEvent {
  const _SignUpPasswordInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => signUpPasswordValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '비밀번호',
        ),
        obscureText: true,
        activeObscureIcon: true,
        onClear: () {
          onSignUpPasswordFieldClear(ref);
        },
        onChanged: (input) {
          onSignUpPasswordChanged(ref, input: input);
        },
      ),
    );
  }
}