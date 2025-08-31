import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_type_select/providers/manager_user_type.dart';

mixin class UserTypeSelectState {
  ///
  /// 선택한 [userType]이 [MANAGER]인지 여부
  ///
  bool selectedManager(WidgetRef ref) => ref.watch(managerUserTypeProvider);
}