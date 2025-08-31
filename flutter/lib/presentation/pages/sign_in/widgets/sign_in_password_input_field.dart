part of '../sign_in_page.dart';

class _SignInPasswordInputField extends ConsumerWidget with SignInState, SignInEvent {
  const _SignInPasswordInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => signInPasswordValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '비밀번호',
        ),
        obscureText: true,
        activeObscureIcon: true,
        onClear: () {
          onSignInPasswordFieldClear(ref);
        },
        onChanged: (input) {
          onSignInPasswordChanged(ref, input: input);
        },
      ),
    );
  }
}