import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class CompanyPaginationIndicatorView extends StatelessWidget {
  const CompanyPaginationIndicatorView({
    super.key,
    this.title,
    required this.description,
    required this.btnText,
    required this.onBtnTapped,
    this.setFlexRatio = true,
    this.buttonStyle,
    this.titleTextStyle,
    this.descriptionTextStyle,
  });

  final String? title;
  final String description;
  final String btnText;
  final VoidCallback onBtnTapped;
  final bool setFlexRatio;
  final ButtonStyle? buttonStyle;
  final TextStyle? descriptionTextStyle;
  final TextStyle? titleTextStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        if (setFlexRatio) const SizedBox(height: 214),
        if (title != null)
          Text(
            title ?? '',
            style: titleTextStyle ?? AppTextStyle.title1,
          ),
        if (title != null) const Gap(8),
        Text(
          description,
          style: descriptionTextStyle ??
              AppTextStyle.body2.copyWith(
                color: AppColor.of.gray3,
              ),
          textAlign: TextAlign.center,
        ),
        const Gap(16),
        FilledButton(
          style: buttonStyle ??
              FilledButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 13,
                ),
              ),
          onPressed: onBtnTapped,
          child: Text(
            btnText,
          ),
        ),
        if (setFlexRatio) const SizedBox(height: 240),
      ],
    );
  }
}
