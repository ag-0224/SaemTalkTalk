import 'package:flutter/cupertino.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/app/util/timer_notifier_provider.dart';
import 'package:saem_talk_talk/core/services/snack_bar_service.dart';
import 'package:saem_talk_talk/features/auth/auth.dart';
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
    } else {
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

  ///
  /// 이메일 인증을 전송한다
  ///
  Future<void> _sendEmailVerification(WidgetRef ref) async {
    final timer = ref.watch(timerNotifierProvider);

    if (timer.isTimerTicking) {
      ref.read(timerNotifierProvider.notifier).reset(30);
    }

    final result = await sendEmailVerificationUseCase();

    result.fold(
      onSuccess: (value) {
        ref.read(timerNotifierProvider.notifier).start();
        SnackBarService.showSnackBar('이메일이 전송되었습니다.');
      },
      onFailure: (e) {
        ref.read(timerNotifierProvider.notifier).reset(0);
        SnackBarService.showSnackBar('오류가 발생하였습니다. 재전송을 시도해주세요.');
      },
    );
  }

  ///
  /// 이메일 인증 페이지 접속시 설정
  ///
  Future<void> sendEmailVerification(WidgetRef ref) async {
    await _sendEmailVerification(ref);
  }

  ///
  /// 이메일 재전송 버튼을 눌렀을 때
  ///
  void onResendEmailVerificationBtnTapped(WidgetRef ref) {
    _sendEmailVerification(ref);
    ref.read(timerNotifierProvider.notifier).start();
  }
}
