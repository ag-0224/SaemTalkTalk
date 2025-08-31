import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';

class ClipOvalCircleAvatar extends StatelessWidget {
  const ClipOvalCircleAvatar({
    Key? key,
    this.imageUrl,
    required this.icon,
    required this.title,
    this.tag,
    required this.content,
    this.titleSmall = false,
  }) : super(key: key);

  factory ClipOvalCircleAvatar.create(
          {String? imageUrl,
          required IconData icon,
          required String title,
          String? tag,
          required String content,
          bool titleSmall = false}) =>
      ClipOvalCircleAvatar(
        imageUrl: imageUrl,
        icon: icon,
        title: title,
        tag: tag,
        content: content,
        titleSmall: titleSmall,
      );

  final String? imageUrl;
  final IconData icon;
  final String title;
  final String? tag;
  final String content;
  final bool titleSmall;

  @override
  Widget build(BuildContext context) {
    final hasImage = imageUrl != null && imageUrl!.isNotEmpty;

    return IntrinsicHeight(
      child: Row(
        children: [
          hasImage
              ? ClipOval(
                  child: Image.network(
                    imageUrl!,
                    width: 48,
                    height: 48,
                  ),
                )
              : ClipOval(
                  child: Container(
                    decoration: BoxDecoration(color: AppColor.of.brand2),
                    child: Icon(
                      icon,
                      color: AppColor.of.brand1,
                    ),
                    width: 48,
                    height: 48,
                  ),
                ),
          const SizedBox(
            width: 8.0,
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: titleSmall
                        ? AppTextStyle.title2.copyWith(color: AppColor.of.black)
                        : AppTextStyle.title1
                            .copyWith(color: AppColor.of.black),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  if (tag != null)
                    Text(
                      tag!,
                      style:
                          AppTextStyle.body3.copyWith(color: AppColor.of.gray3),
                    ),
                ],
              ),
              const SizedBox(
                height: 6.0,
              ),
              Text(
                content,
                style: AppTextStyle.body3.copyWith(color: AppColor.of.gray3),
              ),
            ],
          )
        ],
      ),
    );
  }
}
