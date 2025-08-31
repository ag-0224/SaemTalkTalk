part of '../user_verification_page.dart';

class _UserVerificationButton extends HookConsumerWidget with UserVerificationState, UserVerificationEvent {
  const _UserVerificationButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return ActivationButton(
        text: '계속하기',
        onTap: () => onUserVerificationBtnTapped(ref),
        isActive: true
    );
  }
}