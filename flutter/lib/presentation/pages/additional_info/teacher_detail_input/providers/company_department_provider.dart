import 'dart:developer';

import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/features/company/company.dart';

part 'company_department_provider.g.dart';

@riverpod
class CompanyDepartment extends _$CompanyDepartment {
  @override
  Future<List<String>> build() async {
    final result = await getDepartmentListUseCase.call();

    return result.fold(
      onSuccess: (data) => data.map((e) => e.departmentName).toList(),
      onFailure: (e) {
        log(e.toString());
        throw e;
      },
    );
  }
}