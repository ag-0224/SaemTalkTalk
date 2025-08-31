import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_confirm_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/providers/sign_up_password_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/sign_up_event.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/pages/sign_up/sign_up_state.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/input/custom_text_field.dart';

part 'widgets/sign_up_email_input_field.dart';

part 'widgets/sign_up_password_input_field.dart';

part 'widgets/sign_up_confirm_password_input_field.dart';

part 'widgets/sign_up_button.dart';

class SignUpPage extends BasePage with SignUpState {
  const SignUpPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final emailFormKey = GlobalKey<FormState>();
    final passwordFormKey = GlobalKey<FormState>();
    final confirmPasswordFormKey = GlobalKey<FormState>();

    return CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _SignUpEmailInputField(emailFormKey),
              Gap(4),
              _SignUpPasswordInputField(passwordFormKey),
              Gap(4),
              _SignUpConfirmPasswordInputField(confirmPasswordFormKey),
              Spacer(),
              _SignUpButton(
                emailFormKey,
                passwordFormKey,
                confirmPasswordFormKey,
              ),
            ],
          ),
        ),
      ),
    ]);
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppBar(
      title: '회원가입',
      onBackBtn: true,
    );
  }
}
