import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/app/style/index.dart';

class CustomToast extends StatelessWidget {
  const CustomToast({
    super.key,
    required this.message,
    this.backgroundColor,
    this.borderRadius,
    this.textStyle,
  });

  final String message;
  final Color? backgroundColor;
  final double? borderRadius;
  final TextStyle? textStyle;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 390),
      padding: const EdgeInsets.symmetric(vertical: 13),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(8.0),
      ),
      alignment: Alignment.center,
      child: Text(
        message,
        style: textStyle,
      ),
    );
  }
}

class NormalToast extends CustomToast {
  NormalToast({
    super.key,
    required super.message,
  }) : super(
    backgroundColor: AppColor.of.black.withOpacity(0.8),
    textStyle: AppTextStyle.body1.copyWith(
      color: Colors.white,
    ),
  );
}