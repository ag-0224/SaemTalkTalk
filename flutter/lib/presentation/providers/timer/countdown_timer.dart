import 'dart:async';
import 'package:riverpod/riverpod.dart';

abstract class CountdownTimer extends AutoDisposeNotifier<int> {
  Timer? _timer;

  @override
  int build() {
    // 타이머가 autoDispose 될 때 정리
    ref.onDispose(() {
      _timer?.cancel();
    });
    return 0;
  }

  bool get isRunning => _timer?.isActive ?? false;

  void start() {
    if (isRunning || state == 0) return;

    _timer = Timer.periodic(const Duration(seconds: 1), (_) {
      if (state <= 1) {
        _timer?.cancel();
        state = 0;
      } else {
        state--;
      }
    });
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void reset([int seconds = 0]) {
    stop();
    state = seconds;
  }

  void restart([int seconds = 0]) {
    reset(seconds);
    start();
  }
}





