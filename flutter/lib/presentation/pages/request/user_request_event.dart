import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

mixin class UserRequestEvent {
  ///
  /// 뒤로가기 버튼을 눌렀을 때
  ///
  void onBackBtnTapped(WidgetRef ref) {
    ref.read(userAuthProvider.notifier).signOut();
    const SignInRoute().go(ref.context);
  }
}