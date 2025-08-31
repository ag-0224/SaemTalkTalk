import 'package:cupertino_will_pop_scope/cupertino_will_pop_scope.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

part 'themes/app_bar_theme.dart';
part 'themes/filled_button_theme.dart';
part 'themes/input_decoration_theme.dart';
part 'themes/outlined_button_theme.dart';

class AppTheme {
  static final ThemeData light = ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
    primaryColor: AppColor().brand1,
    primarySwatch: Colors.blue,
    textTheme: ThemeData().textTheme.apply(
          fontFamily: 'pretendard',
          bodyColor: AppColor().black,
          displayColor: AppColor().black,
        ),
    textSelectionTheme: TextSelectionThemeData(
      selectionColor: Color(0xFFBADEFE),
      cursorColor: AppColor().brand1,
      selectionHandleColor: AppColor().brand1,
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(
      color: AppColor().brand1,
    ),
    filledButtonTheme: _FilledButtonTheme.light,
    outlinedButtonTheme: _OutlinedButtonTheme.light,
    inputDecorationTheme: _InputDecorationTheme.light,
    cupertinoOverrideTheme: NoDefaultCupertinoThemeData(
      primaryColor: AppColor().brand2,
    ),
    appBarTheme: _AppBarTheme.light,
    // 플랫폼별 라우팅 애니메이션 속성
    pageTransitionsTheme: const PageTransitionsTheme(
      builders: {
        TargetPlatform.android: ZoomPageTransitionsBuilder(),
        TargetPlatform.iOS: CupertinoWillPopScopePageTransionsBuilder(),
      },
    ),
    extensions: <ThemeExtension<dynamic>>[
      AppColor(),
    ],
  );
  static final ThemeData dark = ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    textTheme: ThemeData().textTheme.apply(
          fontFamily: 'pretendard',
          bodyColor: AppColor().black,
          displayColor: AppColor().black,
        ),
    extensions: <ThemeExtension<dynamic>>[
      AppColor.dark(),
    ],
  );
}
