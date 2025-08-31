import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_type_select/providers/manager_user_type.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

mixin class UserTypeSelectEvent {
  ///
  /// user type card를 눌렀을 때
  ///
  void onUserTypeSelectCardTapped(WidgetRef ref) {
    ref.read(managerUserTypeProvider.notifier).toggle();
  }

  ///
  /// 계속하기 버튼을 눌렀을 때
  ///
  void onUserTypeSelectBtnTapped(WidgetRef ref) {
    final isSelectedManager = ref.read(managerUserTypeProvider);

    if (isSelectedManager) {
      const ManagerDetailInputRoute().push(ref.context);
    } else {
      const CompanySelectRoute().push(ref.context);
    }
  }

  ///
  /// 뒤로가기 버튼을 눌렀을 때
  ///
  void onBackBtnTapped(WidgetRef ref) {
    ref.read(userAuthProvider.notifier).signOut();
    const SignInRoute().go(ref.context);
  }
}