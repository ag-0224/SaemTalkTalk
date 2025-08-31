import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/company_select/provider/company_search_input_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_detail_input_route_arg_provider.dart';

mixin class CompanySelectEvent {
  ///
  /// 회사 이름이 입력되었을 때
  ///
  void onSearchedCompanyNameChanged(WidgetRef ref, {required String? input}) {
    return ref.read(companySearchInputProvider.notifier).onInputChanged(input);
  }

  ///
  /// 회사 이름 필드에 값이 clear 되었을 때
  ///
  void onSearchedCompanyNameFieldClear(WidgetRef ref) {
    ref.read(companySearchInputProvider.notifier).clearInput();
  }

  void onCompanyContentTapped(BuildContext context, String id, String companyName) async {
    await TeacherDetailInputRoute(TeacherDetailInputRouteArg(companyId: id, companyName: companyName)).push(context);
  }
}