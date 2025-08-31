part of '../sign_in_page.dart';

class _SignInEmailInputField extends ConsumerWidget with SignInState, SignInEvent {
  const _SignInEmailInputField(this.formKey, {super.key});

  final GlobalKey<FormState> formKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: CustomTextField(
        textInputAction: TextInputAction.done,
        validator: (input) => signInEmailValidation(ref, input: input),
        inputDecoration: InputDecoration(
          hintText: '이메일 주소',
        ),
        onClear: () {
          onSignInEmailFieldClear(ref);
        },
        onChanged: (input) {
          onSignInEmailChanged(ref, input: input);
        },
      ),
    );
  }
}