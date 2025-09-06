part of '../user_verification_page.dart';

class _UserVerificationEmailResendButton extends ConsumerWidget
    with UserVerificationState, UserVerificationEvent {
  const _UserVerificationEmailResendButton({
    this.secondaryType = true,
    super.key,
  });

  final bool secondaryType;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final backgroundColor =
        secondaryType ? AppColor.of.brand2 : AppColor.of.brand1;

    final foregroundColor =
        secondaryType ? AppColor.of.brand1 : AppColor.of.white;

    final timerState = resendCooldown(ref).timeLeft.inSeconds;

    final isActive = !resendCooldown(ref).isTimerTicking;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: () => isActive ? onResendEmailVerificationBtnTapped(ref) : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: backgroundColor,
          foregroundColor: foregroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (timerState > 0)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: (30 - timerState) / 30.0,
                  strokeCap: StrokeCap.round,
                  color: AppColor.of.brand1,
                  backgroundColor: AppColor.of.white,
                  strokeWidth: 2,
                ),
              ),
            if (timerState > 0) const Gap(8),
            SizedBox(
              width: 42,
              child: Text(
                timerState > 0 ? '$timerState' : '재전송',
                style: AppTextStyle.body1.copyWith(color: foregroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
