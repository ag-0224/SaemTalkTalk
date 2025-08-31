import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/app_back_button.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({
    super.key,
    this.title,
    this.onBackBtn = false,
    this.onBackBtnTap,
    this.actions,
  });

  final String? title;
  final bool onBackBtn;
  final VoidCallback? onBackBtnTap;
  final List<Widget>? actions;

  static const double appbarHeight = 56;

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(56),
      child: AppBar(
        title: Text(
          title ?? '',
          style: AppTextStyle.headline1,
        ),
        titleSpacing: 0,
        scrolledUnderElevation: 0,
        backgroundColor: AppColor.of.white,
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: actions,
        toolbarHeight: appbarHeight,
        leading: onBackBtn
            ? AppBackButton(
                onBackBtnTapped: onBackBtnTap ?? context.pop,
              )
            : null,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(56);
}
