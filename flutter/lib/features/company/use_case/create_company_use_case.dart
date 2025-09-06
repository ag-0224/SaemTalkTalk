import 'package:saem_talk_talk/core/index.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';

final class CreateCompanyUseCase extends BaseUseCase<CompanyEntity, Result<void>> {
  CreateCompanyUseCase(
    this._repository,
  );

  final CompanyRepository _repository;

  @override
  Future<Result<void>> call(CompanyEntity data) async {
    return _repository.createCompany(data);
  }
}
