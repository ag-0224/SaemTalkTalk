import 'package:saem_talk_talk/core/modules/base_use_case/base_use_case.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';

final class GetCompanyUseCase
    extends BaseUseCase<String, Result<CompanyEntity>> {
  GetCompanyUseCase(
    this._repository,
  );

  final CompanyRepository _repository;

  Future<Result<CompanyEntity>> call(String companyId) async {
    return _repository.getCompany(companyId);
  }
}
