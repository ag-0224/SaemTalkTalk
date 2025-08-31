import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/core/services/snack_bar_service.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

mixin class UserVerificationEvent {
  ///
  /// 계속하기 버튼을 눌렀을 때
  ///
  void onUserVerificationBtnTapped(WidgetRef ref) {
    final auth = ref.read(userAuthProvider);

    if (auth == null) {
      return;
    }

    ref.read(userAuthProvider.notifier).reloadUserAuth();

    if (!auth.emailVerified) {
      SnackBarService.showSnackBar('이메일 링크를 확인해주세요');
    }
    else {
      const UserTypeSelectRoute().go(ref.context);
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
