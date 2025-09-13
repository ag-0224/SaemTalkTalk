import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/features/company/company.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_info_provider.dart';

part 'company_info_provider.g.dart';

@riverpod
class CompanyInfo extends _$CompanyInfo {
  @override
  FutureOr<CompanyEntity> build() async {
    final companyId =
        await ref.watch(userInfoProvider).asData!.value!.companyId;

    final result = await getCompanyUseCase.call(companyId);

    return result.fold(
      onSuccess: (data) => data,
      onFailure: (e) {
        throw e;
      },
    );
  }
}
