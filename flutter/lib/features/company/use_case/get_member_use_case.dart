import 'package:saem_talk_talk/core/modules/base_use_case/base_use_case.dart';
import 'package:saem_talk_talk/core/modules/error_handling/result.dart';
import 'package:saem_talk_talk/features/company/repository/company_repository.dart';
import 'package:saem_talk_talk/features/company/repository/entities/member_entity.dart';

final class GetMemberUseCase
    extends BaseUseCase<(String, String), Result<MemberEntity>> {
  GetMemberUseCase(
    this._repository,
  );

  final CompanyRepository _repository;

  Future<Result<MemberEntity>> call((String, String) request) async {
    final companyId = request.$1;
    final uid = request.$2;

    return _repository.getMember(companyId, uid);
  }
}
