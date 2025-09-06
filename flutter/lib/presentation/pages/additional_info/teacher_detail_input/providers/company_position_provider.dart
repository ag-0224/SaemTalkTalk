import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/features/company/company.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/teacher_detail_input/providers/teacher_detail_input_route_arg_provider.dart';

part 'company_position_provider.g.dart';

@riverpod
class CompanyPosition extends _$CompanyPosition {
  @override
  FutureOr<List<String>> build() async {
    final companyId = ref.watch(teacherDetailInputRouteArgProvider).companyId;

    final positionResult = await getPositionListUseCase.call(companyId);

    return positionResult.fold(
      onSuccess: (data) => data
          .where((e) => e.positionName != '원장')
          .map((e) => e.positionName)
          .toList(),
      onFailure: (e) {
        throw e;
      },
    );
  }
}
