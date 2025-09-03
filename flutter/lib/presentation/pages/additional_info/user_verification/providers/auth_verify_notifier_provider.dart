import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:saem_talk_talk/app/util/timer_notifier_provider.dart';

final resendAuthEmailStateProvider = Provider((ref) {
  final timerState = ref.watch(timerNotifierProvider);

  if (timerState.isTimerTicking) {
    return ResendAuthEmailState.disabled;
  }

  if (timerState.timeLeft <= Duration.zero) {
    return ResendAuthEmailState.enabled;
  }
});

enum ResendAuthEmailState {
  disabled,
  enabled,
}
