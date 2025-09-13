import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/features/company/repository/entities/company_entity.dart';
import 'package:saem_talk_talk/presentation/pages/request/providers/company_info_provider.dart';

mixin class UserRequestState {
  ///
  /// 현재 가입한 회사 정보
  ///
  AsyncValue<CompanyEntity> company(WidgetRef ref) => ref.watch(companyInfoProvider);
}