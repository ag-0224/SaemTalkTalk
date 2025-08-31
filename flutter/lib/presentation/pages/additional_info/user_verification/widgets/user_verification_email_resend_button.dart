part of '../user_verification_page.dart';

class _UserVerificationEmailResendButton extends StatelessWidget {
  const _UserVerificationEmailResendButton({
    required this.isActive,
    required this.secondLeft,
    this.secondaryType = true,
    this.onTap,
    super.key,
  });

  final bool isActive;
  final int secondLeft;
  final bool secondaryType;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    final backgroundColor =
    secondaryType ? AppColor.of.brand2 : AppColor.of.brand1;

    final foregroundColor =
    secondaryType ? AppColor.of.brand1 : AppColor.of.white;

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
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
            if (secondLeft > 0)
              SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  value: (30 - secondLeft) / 30.0,
                  strokeCap: StrokeCap.round,
                  color: AppColor.of.brand1,
                  backgroundColor: AppColor.of.white,
                  strokeWidth: 2,
                ),
              ),
            if (secondLeft > 0) const Gap(8),
            SizedBox(
              width: 42,
              child: Text(
                secondLeft > 0 ? '$secondLeft' : '재전송',
                style: AppTextStyle.body1.copyWith(color: foregroundColor),
              ),
            ),
          ],
        ),
      ),
    );
  }
}