part of '../sign_in_page.dart';

class _SignInTextButton extends ConsumerWidget
    with SignInState, SignInEvent {
  const _SignInTextButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          onPressed: () => onSignUpBtnTapped(ref),
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            overlayColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            '회원가입',
            style: AppTextStyle.body3.copyWith(color: AppColor.of.gray3),
          ),
        ),

        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            minimumSize: Size.zero,
            padding: EdgeInsets.zero,
            overlayColor: Colors.transparent,
            splashFactory: NoSplash.splashFactory,
            tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          ),
          child: Text(
            '비밀번호 재설정',
            style: AppTextStyle.body3.copyWith(color: AppColor.of.gray3),
          ),
        ),
      ],
    );
  }
}
