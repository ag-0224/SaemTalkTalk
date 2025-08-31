part of '../app_theme.dart';

abstract class _OutlinedButtonTheme {
  static final light = OutlinedButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColor().white,
      disabledBackgroundColor: AppColor().white,
      foregroundColor: AppColor().brand1,
      disabledForegroundColor: AppColor().gray3,
      elevation: 0,
      side: BorderSide(color: AppColor().brand1),
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 13,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: AppTextStyle.body1.copyWith(
        color: AppColor().brand1,
      ),
    ),
  );
}