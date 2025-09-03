import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:saem_talk_talk/app/util/timer_notifier_provider.dart';
import 'package:saem_talk_talk/presentation/pages/additional_info/user_verification/providers/auth_verify_notifier_provider.dart';
import 'package:saem_talk_talk/presentation/providers/user/user_auth_provider.dart';

mixin class UserVerificationState {
  ///
  /// 현재 유저의 이메일
  ///
  String? userEmail(WidgetRef ref) => ref.watch(userAuthProvider)?.email;

  ///
  /// 재전송 버튼 활성화까지 남은 시간
  ///
  TimerModel resendCooldown(WidgetRef ref) => ref.watch(timerNotifierProvider);
}
