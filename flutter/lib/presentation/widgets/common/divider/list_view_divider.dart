import 'package:flutter/material.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';

class ListViewDivider extends StatelessWidget {
  const ListViewDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return  Divider(
      color: AppColor.of.gray2,
      height: 1,
      thickness: 1,
      indent: 0,
      endIndent: 0,
    );
  }
}
