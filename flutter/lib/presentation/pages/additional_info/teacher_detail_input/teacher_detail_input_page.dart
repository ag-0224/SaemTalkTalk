import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_detail_input_route_arg_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/teacher_detail_input_event.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/teacher_detail_input_state.dart';
import 'package:saem_talk_talk/presentation/widgets/base/base_page.dart';
import 'package:saem_talk_talk/presentation/widgets/common/appbar/custom_app_bar.dart';
import 'package:saem_talk_talk/presentation/widgets/common/box/empty_box.dart';
import 'package:saem_talk_talk/presentation/widgets/common/button/activation_button.dart';
import 'package:saem_talk_talk/presentation/widgets/common/dropdown/custom_dropdown_button_field.dart';
import 'package:saem_talk_talk/presentation/widgets/common/input/custom_text_field.dart';

part 'widgets/teacher_name_input_field.dart';

part 'widgets/teacher_department_input_field.dart';

part 'widgets/teacher_position_input_field.dart';

part 'widgets/teacher_detail_input_button.dart';

part 'widgets/scaffold.p.dart';

class TeacherDetailInputPage extends BasePage with TeacherDetailInputEvent {
  TeacherDetailInputPage({super.key});

  final nameFormKey = GlobalKey<FormState>();

  @override
  Widget buildPage(BuildContext context, WidgetRef ref) {
    useAutomaticKeepAlive();

    return _Scaffold(
      userNameTextField: _TeacherNameInputField(nameFormKey),
      positionDropdownButtonFormField: _TeacherPositionInputField(),
      departmentDropdownButtonFormField: _TeacherDepartmentInputField(),
      bottomFixedBtn: _TeacherDetailInputButton(nameFormKey),
    );
  }

  @override
  PreferredSizeWidget? buildAppBar(BuildContext context, WidgetRef ref) {
    return CustomAppBar(
      title: '세부사항',
      onBackBtn: true,
    );
  }
}
