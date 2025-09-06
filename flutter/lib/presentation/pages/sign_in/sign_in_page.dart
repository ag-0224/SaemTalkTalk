import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/style/app_color.dart';
import 'package:saem_talk_talk/app/style/app_text_style.dart';
import 'package:saem_talk_talk/core/constants/assets.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/providers/sign_in_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/providers/sign_in_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/sign_in_event.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/pages/sign_in/sign_in_state.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/input/custom_text_field.dart';

part 'widgets/sign_in_email_input_field.dart';

part 'widgets/sign_in_password_input_field.dart';

part 'widgets/sign_in_button.dart';

part 'widgets/sign_in_text_button.dart';

class SignInPage extends BasePage with SignInState {
  const SignInPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final emailFormKey = GlobalKey<FormState>();
    final passwordFormKey = GlobalKey<FormState>();

    return CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    Assets.logo,
                    width: 40,
                    height: 40,
                  ),
                  Gap(12),
                  SvgPicture.asset(
                    Assets.text_logo,
                    width: 75,
                    height: 45,
                  ),
                ],
              ),
              Gap(32),
              _SignInEmailInputField(emailFormKey),
              Gap(4),
              _SignInPasswordInputField(passwordFormKey),
              Gap(12),
              _SignInTextButton(),
              Gap(24),
              _SignInButton(emailFormKey, passwordFormKey),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppBar();
  }
}
