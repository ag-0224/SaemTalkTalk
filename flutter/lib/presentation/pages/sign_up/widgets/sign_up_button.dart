part of '../sign_up_page.dart';

class _SignUpButton extends HookConsumerWidget with SignUpState, SignUpEvent {
  const _SignUpButton(this.emailFormKey, this.passwordFormKey, this.confirmPasswordFormKey, {super.key});

  final GlobalKey<FormState> emailFormKey;
  final GlobalKey<FormState> passwordFormKey;
  final GlobalKey<FormState> confirmPasswordFormKey;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isBtnActivate = useState(false);

    // 공통 유효성 검사 함수
    void validateAllForms() {
      if (emailFormKey.currentState != null &&
          passwordFormKey.currentState != null &&
          confirmPasswordFormKey.currentState != null) {
        isBtnActivate.value = emailFormKey.currentState!.validate() &&
            passwordFormKey.currentState!.validate() &&
            confirmPasswordFormKey.currentState!.validate() &&
            hasEmailEntered(ref) &&
            hasPasswordEntered(ref) &&
            hasConfirmPasswordEntered(ref);
      }
    }

    // 이메일 입력 변경 감지
    ref.listen(signUpEmailInputProvider, (_, next) => validateAllForms());

    // 패스워드 입력 변경 감지
    ref.listen(signUpPasswordInputProvider, (_, next) => validateAllForms());

    // 패스워드 확인 입력 변경 감지
    ref.listen(signUpConfirmPasswordInputProvider, (_, next) => validateAllForms());

    return ActivationButton(
        text: '완료하기',
        onTap: isBtnActivate.value
            ? () {
          onSignUpBtnTapped(ref);
        }
            : null,
        isActive: isBtnActivate.value
    );
  }
}