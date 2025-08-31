import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'countdown_timer.dart';

part 'timers.g.dart';

@riverpod
class AuthExpireTimer extends CountdownTimer {
  @override
  int build() => 0;
}

@riverpod
class ResendCooldownTimer extends CountdownTimer {
  @override
  int build() => 0;
}

