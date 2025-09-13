import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/core/helper/string_extension.dart';
import 'package:saem_talk_talk/presentation/pages/request/user_request_event.dart';
import 'package:saem_talk_talk/presentation/pages/request/user_request_state.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/box/empty_box.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/common.dart';

part 'widgets/user_request_company_info_card.dart';

part 'widgets/user_request_company_approval_info_card.dart';

part 'widgets/user_request_company_button.dart';

class UserRequestPage extends BasePage with UserRequestEvent {
  const UserRequestPage({super.key});

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
                title: '등록이\n완료되었습니다',
                subTitle: '승인 후 서비스를\n이용하실 수 있습니다',
              ),
              Gap(32),
              _UserRequestCompanyInfoCard(
                title: '가입하신 유치원 정보',
              ),
              Gap(16),
              _UserRequestCompanyApprovalInfoCard(
                title: '예상 승인 시간',
                content: '해당 유치원의 원장님이 요청을 승인하시게 되면\n바로 서비스를 이용하실 수 있습니다',
              ),
              Spacer(),
              _UserRequestCompanyButton(),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppBar(
      onBackBtn: true,
      onBackBtnTap: () => onBackBtnTapped(ref),
    );
  }
}
