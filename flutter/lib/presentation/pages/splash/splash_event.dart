import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/router/router.dart';
import 'package:saem_talk_talk/core/services/snack_bar_service.dart';
import 'package:saem_talk_talk/features/auth/auth.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_verification/user_verification_page.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_info_provider.dart';

mixin class SplashEvent {
  /// 초기화 실행중인지 여부
  ///
  /// 초기화를 한번만 실행하기 위해 사용
  static bool isInitializing = false;

  ///
  /// 이메일 인증을 전송한다
  ///
  Future<void> _sendEmailVerification() async {
    final result = await sendEmailVerificationUseCase();
    result.fold(
      onSuccess: (value) {
        SnackBarService.showSnackBar('이메일이 전송되었습니다.');
      },
      onFailure: (e) {
        SnackBarService.showSnackBar('오류가 발생하였습니다. 재전송을 시도해주세요.');
      },
    );
  }

  ///
  /// 유저 인증정보와 유저 정보를 토대로 라우팅을 분기한다.
  ///
  /// Auth 인증 정보가 없으면 [SignInPage],
  ///
  /// 이메일 인증 정보가 없으면 [UserVerificationPage],
  ///
  /// user 정보가 없으면 [UserTypeSelectPage],
  ///
  /// 모두 있는 유저라면 [MainPage]로 라우팅한다.
  ///
  Future<void> routeByUserAuthAndData(WidgetRef ref) async {
    final auth = ref.read(userAuthProvider);

    if (auth == null) {
      const SignInRoute().go(ref.context);
      return;
    }

    await ref.read(userInfoProvider.future).then(
      (userData) async {
        if (userData == null) {

          if (!auth.emailVerified) {
            _sendEmailVerification();
            const UserVerificationRoute().go(ref.context);
          } else {
            const UserTypeSelectRoute().go(ref.context);
          }

        } else {
          // const MainRoute().go(ref.context);
        }
      },
    );
  }
}
