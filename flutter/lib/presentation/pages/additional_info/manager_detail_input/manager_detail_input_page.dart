import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/manager_detail_input_event.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/manager_detail_input_state.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_email_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/company_phone_number_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/manager_detail_input/providers/manager_name_input_provider.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/input/custom_text_field.dart';

part 'widgets/company_name_input_field.dart';

part 'widgets/manager_name_input_field.dart';

part 'widgets/company_email_input_field.dart';

part 'widgets/company_phone_number_input_field.dart';

part 'widgets/manager_detail_input_button.dart';

class ManagerDetailInputPage extends BasePage
    with ManagerDetailInputState, ManagerDetailInputEvent {
  const ManagerDetailInputPage({super.key});

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    final companyNameFormKey = GlobalKey<FormState>();
    final managerNameFormKey = GlobalKey<FormState>();
    final companyPhoneNumberFormKey = GlobalKey<FormState>();
    final companyEmailFormKey = GlobalKey<FormState>();

    return CustomScrollView(physics: ClampingScrollPhysics(), slivers: [
      SliverFillRemaining(
        hasScrollBody: false,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Column(
            children: [
              _CompanyNameInputField(companyNameFormKey),
              Gap(4),
              _ManagerNameInputField(managerNameFormKey),
              Gap(4),
              _CompanyPhoneNumberInputField(companyPhoneNumberFormKey),
              Gap(4),
              _CompanyEmailInputField(companyEmailFormKey),
              Spacer(),
              _ManagerDetailInputButton(
                  companyNameFormKey: companyNameFormKey,
                  managerNameFormKey: managerNameFormKey,
                  companyEmailFormKey: companyEmailFormKey,
                  companyPhoneNumberFormKey: companyPhoneNumberFormKey,
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
      title: '세부사항',
      onBackBtn: true,
    );
  }
}
