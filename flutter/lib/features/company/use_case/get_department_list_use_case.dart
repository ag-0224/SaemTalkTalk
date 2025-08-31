import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/core/modules/base_use_case/base_use_case.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/department_entity.dart';

final class GetDepartmentListUseCase
    extends BaseUseCase<String, Result<List<DepartmentEntity>>> {
  GetDepartmentListUseCase(this._repository);

  final CompanyRepository _repository;

  @override
  FutureOr<Result<List<DepartmentEntity>>> call(String id) async {
    return _repository.getDepartments(id);
  }
}