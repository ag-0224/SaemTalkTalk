import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class StepIntroMessage extends StatelessWidget {
  const StepIntroMessage({
    super.key,
    required this.title,
    this.subTitle,
  });

  final String title;
  final String? subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Gap(16),
        Text(
          title,
          style: AppTextStyle.highlight.copyWith(
            color: AppColor.of.black,
          ),
        ),
        const Gap(8),
        if (subTitle != null)
          Text(
            subTitle!,
            style: AppTextStyle.body2.copyWith(
              color: AppColor.of.gray3,
            ),
          ),
      ],
    );
  }
}
