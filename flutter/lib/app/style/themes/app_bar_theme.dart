part of '../app_theme.dart';

abstract class _AppBarTheme {
  static final light = AppBarTheme(
    systemOverlayStyle: SystemUiOverlayStyle.dark,
    color: AppColor().white,
    elevation: 0,
    scrolledUnderElevation: 0,
    centerTitle: true,
    titleTextStyle: AppTextStyle.headline1.copyWith(
      color: AppColor().black,
    ),
  );
}
