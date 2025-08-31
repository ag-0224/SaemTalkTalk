part of '../app_theme.dart';

final _underlinedBorderLine = UnderlineInputBorder(
  borderSide: BorderSide(
    color: AppColor().gray2,
    width: 1.0,
  ),
);

abstract class _InputDecorationTheme {
  static final InputDecorationTheme light = InputDecorationTheme(
    contentPadding: const EdgeInsets.symmetric(
      vertical: 16,
    ),
    filled: true,
    fillColor: AppColor().background1,
    border: _underlinedBorderLine,
    enabledBorder: _underlinedBorderLine.copyWith(
      borderSide: BorderSide(
        color: AppColor().gray2,
      ),
    ),
    errorBorder: _underlinedBorderLine.copyWith(
      borderSide: BorderSide(
        color: AppColor().red3,
      ),
    ),
    focusedBorder: _underlinedBorderLine.copyWith(
      borderSide: BorderSide(
        color: AppColor().brand1,
      ),
    ),
    focusedErrorBorder: _underlinedBorderLine.copyWith(
      borderSide: BorderSide(
        color: AppColor().red3,
      ),
    ),
    hintStyle: AppTextStyle.body2.copyWith(
      color: AppColor().gray2,
    ),
  );
}