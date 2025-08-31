part of '../app_theme.dart';

abstract class _FilledButtonTheme {
  static final light = FilledButtonThemeData(
    style: FilledButton.styleFrom(
      backgroundColor: AppColor().brand1,
      disabledBackgroundColor: AppColor().gray2,
      foregroundColor: AppColor().white,
      disabledForegroundColor: AppColor().white,
      elevation: 0,
      padding: const EdgeInsets.symmetric(
        horizontal: 36,
        vertical: 12,
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      textStyle: AppTextStyle.body1,
    ),
  );
}