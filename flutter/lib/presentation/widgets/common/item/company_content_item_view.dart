import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/core/constants/assets.dart';
import 'package:saem_talk_talk/core/helper/string_extension.dart';

///
/// 회사 컨텐츠 항목 뷰
///
class CompanyContentItemView extends StatelessWidget {
  const CompanyContentItemView({
    super.key,
    required this.companyName,
    required this.ceoName,
    required this.phoneNumber,
  });

  final String companyName;
  final String ceoName;
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    companyName,
                    style: AppTextStyle.title2,
                  ),
                  Gap(4),
                  Text(
                    ceoName,
                    style:
                        AppTextStyle.body3.copyWith(color: AppColor.of.gray3),
                  ),
                ],
              ),
              Gap(6),
              Text(
                phoneNumber.formatAsPhoneNumber,
                style: AppTextStyle.body3.copyWith(color: AppColor.of.gray3),
              ),
            ],
          ),
          SvgPicture.asset(
            Assets.arrow_insert,
            width: 20,
            height: 20,
          ),
        ],
      ),
    );
  }
}
