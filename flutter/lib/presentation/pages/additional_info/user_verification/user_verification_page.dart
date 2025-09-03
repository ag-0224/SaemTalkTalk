import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/app/util/timer_notifier_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_verification/user_verification_event.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_verification/user_verification_state.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/common.dart';

part 'widgets/user_email_info_card.dart';

part 'widgets/user_verification_info_card.dart';

part 'widgets/user_verification_email_resend_button.dart';

part 'widgets/user_verification_button.dart';

class UserVerificationPage extends BasePage
    with UserVerificationState, UserVerificationEvent {
  const UserVerificationPage({super.key});

  @override
  void onInit(WidgetRef ref) {
    Future.delayed(Duration(seconds: 1)).then(
          (_) async {
        await sendEmailVerification(ref);
      },
    );
  }

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
                title: '본인 인증 이메일을\n확인해주세요',
                subTitle: '본인인증을 하기 위해\n인증 메일을 발송했습니다',
              ),
              Gap(32),
              _UserEmailInfoCard(
                title: '발송된 이메일 주소',
                subTitle: userEmail(ref),
              ),
              Gap(16),
              _UserVerificationInfoCard(
                title: '인증 방법',
                content: '해당 이메일 계정 내의 인증 링크를 클릭하면\n인증이 완료됩니다',
              ),
              Spacer(),
              _UserVerificationEmailResendButton(),
              _UserVerificationButton(),
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
