import 'package:saem_talk_talk/core/modules/base_use_case/base_use_case.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/member_entity.dart';

final class CreateMemberUseCase extends BaseUseCase<(MemberEntity, String), Result<void>> {
  CreateMemberUseCase(
      this._repository,
      );

  final CompanyRepository _repository;

  @override
  Future<Result<void>> call((MemberEntity, String) request) async {
    final memberEntity = request.$1;
    final companyId = request.$2;

    return _repository.createMember(memberEntity, companyId);
  }
}