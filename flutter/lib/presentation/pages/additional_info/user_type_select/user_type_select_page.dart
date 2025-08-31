import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/core/constants/assets.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_type_select/providers/manager_user_type.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_type_select/user_type_select_event.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_type_select/user_type_select_state.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/message/step_intro_message.dart';

part 'widgets/user_type_select_cards.dart';
part 'widgets/user_type_select_button.dart';

class UserTypeSelectPage extends BasePage with UserTypeSelectEvent {
  const UserTypeSelectPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    return CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              StepIntroMessage(
                title: '어떤 유형의\n회원이신가요?',
                subTitle: '회원 유형을 선택해주세요',
              ),
              Gap(32),
              _UserTypeSelectCards(),
              Spacer(),
              _UserTypeSelectButton(),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppBar(
      title: '회원 유형',
      onBackBtn: true,
      onBackBtnTap: () => onBackBtnTapped(ref),
    );
  }
}