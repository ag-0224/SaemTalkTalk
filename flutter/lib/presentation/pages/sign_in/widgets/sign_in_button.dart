part of '../sign_in_page.dart';

class _SignInButton extends HookConsumerWidget with SignInState, SignInEvent {
  const _SignInButton(this.emailFormKey, this.passwordFormKey, {super.key});

  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> passwordFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBtnActivate = useState(false);

    // 공통 유효성 검사 함수
    void validateAllForms() {
      if (emailFormKey.currentState != null && passwordFormKey.currentState != null) {
        isBtnActivate.value = emailFormKey.currentState!.validate() &&
            passwordFormKey.currentState!.validate() &&
            hasEmailEntered(ref) && hasPasswordEntered(ref);
      }
    }

    // 이메일 입력 변경 감지
    ref.listen(signInEmailInputProvider, (_, next) => validateAllForms());

    // 패스워드 입력 변경 감지
    ref.listen(signInPasswordInputProvider, (_, next) => validateAllForms());

    return ActivationButton(
        text: '로그인',
        onTap: isBtnActivate.value
            ? () {
                onSignInBtnTapped(ref);
              }
            : null,
        isActive: isBtnActivate.value);
  }
}
