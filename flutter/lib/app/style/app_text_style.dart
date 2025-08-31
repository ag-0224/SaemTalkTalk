import 'package:flutter/material.dart';

abstract class AppTextStyle {
  static TextStyle pretendardStyle(double size, double? height) => TextStyle(
        fontFamily: 'Pretendard',
        leadingDistribution: TextLeadingDistribution.even,
        fontSize: size,
        height: height == null ? null : height / size,
      );

  static TextStyle pretendardRegularStyle(double size, double? height) =>
      pretendardStyle(size, height).copyWith(
        fontWeight: FontWeight.w400,
      );

  static TextStyle pretendardMediumStyle(double size, double? height) =>
      pretendardStyle(size, height).copyWith(
        fontWeight: FontWeight.w500,
      );

  static TextStyle pretendardSemiBoldStyle(double size, double? height) =>
      pretendardStyle(size, height).copyWith(
        fontWeight: FontWeight.w600,
      );

  static final TextStyle highlight = pretendardSemiBoldStyle(24, 34);
  static final TextStyle headline1 = pretendardSemiBoldStyle(20, 28);
  static final TextStyle title1 = pretendardSemiBoldStyle(20, 28);
  static final TextStyle title2 = pretendardSemiBoldStyle(16, 22);
  static final TextStyle body1 = pretendardSemiBoldStyle(16, 22);
  static final TextStyle body2 = pretendardMediumStyle(16, 22);
  static final TextStyle body3 = pretendardMediumStyle(14, 20);
  static final TextStyle body4 = pretendardRegularStyle(16, 22);

  static final TextStyle alert1 = pretendardSemiBoldStyle(12, 17);
  static final TextStyle alert2 = pretendardStyle(12, 17);
}
