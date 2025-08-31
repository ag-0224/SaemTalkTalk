import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class ActivationButton extends StatelessWidget {
  const ActivationButton({
    required this.text,
    required this.isActive,
    this.secondaryType = false,
    this.onTap,
    super.key,
  });

  final bool isActive;
  final bool secondaryType;
  final void Function()? onTap;
  final String text;

  @override
  Widget build(BuildContext context) {
    final activeBgColor =
        secondaryType ? AppColor.of.brand2 : AppColor.of.brand1;

    final inactiveBgColor = secondaryType
        ? Color.alphaBlend(
            AppColor.of.white.withOpacity(0.5),
            AppColor.of.brand2,
          )
        : Color.alphaBlend(
            AppColor.of.white.withOpacity(0.5),
            AppColor.of.brand1,
          );

    final activeFgColor =
        secondaryType ? AppColor.of.brand1 : AppColor.of.white;

    final inactiveFgColor = activeFgColor.withOpacity(0.5); // 흐릿한 텍스트

    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: isActive ? onTap : null,
        style: ElevatedButton.styleFrom(
          backgroundColor: activeBgColor,
          foregroundColor: activeFgColor,
          disabledBackgroundColor: inactiveBgColor,
          disabledForegroundColor: inactiveFgColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8.0),
          ),
          padding: EdgeInsets.zero,
          elevation: 0,
          shadowColor: Colors.transparent,
        ),
        child: Text(
          text,
          style: AppTextStyle.body1.copyWith(
            color: isActive ? activeFgColor : inactiveFgColor,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
