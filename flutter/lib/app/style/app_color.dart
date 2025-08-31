import 'package:flutter/material.dart';

class AppColor extends ThemeExtension<AppColor> {
  static final AppColor _light = AppColor._(
    white: const Color(0xFFFFFFFF),
    black: const Color(0xFF1E1E1E),
    brand1: const Color(0xFF007AFF),
    brand2: const Color(0xFFEAEFFF),
    gray1: const Color(0xFFF8F8F8),
    gray2: const Color(0xFFB3B3B3),
    gray3: const Color(0xFF757575),
    gray4: const Color(0xFFF8F9FC),
    gray5: const Color(0xFFE4E7EC),
    gray6: const Color(0xFF101828),
    background1: const Color(0xFFFFFFFF),
    blue1: const Color(0xFFEBF6FF),
    blue2: const Color(0xFFCAE8FF),
    blue3: const Color(0xFF0265DC),
    green1: const Color(0xFFEDFCF4),
    green2: const Color(0xFFB2EFCE),
    green3: const Color(0xFF007A4D),
    red1: const Color(0xFFFFF6F5),
    red2: const Color(0xFFFFDDD6),
    red3: const Color(0xFFD31510),
  );

  factory AppColor() => _light;

  static final AppColor _dark = AppColor._(
    white: const Color(0xFFFFFFFF),
    black: const Color(0xFF1E1E1E),
    brand1: const Color(0xFF007AFF),
    brand2: const Color(0xFFEAEFFF),
    gray1: const Color(0xFFF8F8F8),
    gray2: const Color(0xFFB3B3B3),
    gray3: const Color(0xFF757575),
    gray4: const Color(0xFFF8F9FC),
    gray5: const Color(0xFFE4E7EC),
    gray6: const Color(0xFF101828),
    background1: const Color(0xFFFFFFFF),
    blue1: const Color(0xFFEBF6FF),
    blue2: const Color(0xFFCAE8FF),
    blue3: const Color(0xFF0265DC),
    green1: const Color(0xFFEDFCF4),
    green2: const Color(0xFFB2EFCE),
    green3: const Color(0xFF007A4D),
    red1: const Color(0xFFFFF6F5),
    red2: const Color(0xFFFFDDD6),
    red3: const Color(0xFFD31510),
  );

  factory AppColor.dark() => _dark;

  AppColor._({
    required this.white,
    required this.black,
    required this.brand1,
    required this.brand2,
    required this.gray1,
    required this.gray2,
    required this.gray3,
    required this.gray4,
    required this.gray5,
    required this.gray6,
    required this.background1,
    required this.blue1,
    required this.blue2,
    required this.blue3,
    required this.green1,
    required this.green2,
    required this.green3,
    required this.red1,
    required this.red2,
    required this.red3,
  });

  final Color white;
  final Color black;
  final Color brand1;
  final Color brand2;
  final Color gray1;
  final Color gray2;
  final Color gray3;
  final Color gray4;
  final Color gray5;
  final Color gray6;
  final Color background1;
  final Color blue1;
  final Color blue2;
  final Color blue3;
  final Color green1;
  final Color green2;
  final Color green3;
  final Color red1;
  final Color red2;
  final Color red3;

  static late BuildContext _context;

  static void init(BuildContext context) => _context = context;

  static AppColor get of => Theme.of(_context).extension<AppColor>()!;

  static AppColor? get maybeOf => Theme.of(_context).extension<AppColor>();

  @override
  ThemeExtension<AppColor> copyWith({
    Color? white,
    Color? black,
    Color? brand1,
    Color? brand2,
    Color? gray1,
    Color? gray2,
    Color? gray3,
    Color? gray4,
    Color? gray5,
    Color? gray6,
    Color? background1,
    Color? blue1,
    Color? blue2,
    Color? blue3,
    Color? green1,
    Color? green2,
    Color? green3,
    Color? red1,
    Color? red2,
    Color? red3,
  }) {
    return AppColor._(
      white: white ?? this.white,
      black: black ?? this.black,
      brand1: brand1 ?? this.brand1,
      brand2: brand2 ?? this.brand2,
      gray1: gray1 ?? this.gray1,
      gray2: gray2 ?? this.gray2,
      gray3: gray3 ?? this.gray3,
      gray4: gray4 ?? this.gray4,
      gray5: gray5 ?? this.gray5,
      gray6: gray6 ?? this.gray6,
      background1: background1 ?? this.background1,
      blue1: blue1 ?? this.blue1,
      blue2: blue2 ?? this.blue2,
      blue3: blue3 ?? this.blue3,
      green1: green1 ?? this.green1,
      green2: green2 ?? this.green2,
      green3: green3 ?? this.green3,
      red1: red1 ?? this.red1,
      red2: red2 ?? this.red2,
      red3: red3 ?? this.red3,
    );
  }

  @override
  ThemeExtension<AppColor> lerp(
    covariant ThemeExtension<AppColor>? other,
    double t,
  ) {
    if (other is! AppColor) {
      return this;
    }
    return AppColor._(
      white: Color.lerp(white, other.white, t)!,
      black: Color.lerp(black, other.black, t)!,
      brand1: Color.lerp(brand1, other.brand1, t)!,
      brand2: Color.lerp(brand2, other.brand2, t)!,
      gray1: Color.lerp(gray1, other.gray1, t)!,
      gray2: Color.lerp(gray2, other.gray2, t)!,
      gray3: Color.lerp(gray3, other.gray3, t)!,
      gray4: Color.lerp(gray4, other.gray4, t)!,
      gray5: Color.lerp(gray5, other.gray5, t)!,
      gray6: Color.lerp(gray6, other.gray6, t)!,
      background1: Color.lerp(background1, other.background1, t)!,
      blue1: Color.lerp(blue1, other.blue1, t)!,
      blue2: Color.lerp(blue2, other.blue2, t)!,
      blue3: Color.lerp(blue3, other.blue3, t)!,
      green1: Color.lerp(green1, other.green1, t)!,
      green2: Color.lerp(green2, other.green2, t)!,
      green3: Color.lerp(green3, other.green3, t)!,
      red1: Color.lerp(red1, other.red1, t)!,
      red2: Color.lerp(red2, other.red2, t)!,
      red3: Color.lerp(red3, other.red3, t)!,
    );
  }
}
