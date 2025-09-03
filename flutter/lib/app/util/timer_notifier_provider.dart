  import 'dart:async';

  import 'package:flutter_riverpod/flutter_riverpod.dart';

  final timerNotifierProvider = StateNotifierProvider<TimerNotifier, TimerModel>(
        (ref) => TimerNotifier(),
  );

  class TimerNotifier extends StateNotifier<TimerModel> {
    TimerNotifier() : super(_initialState);

    static const int _initialDurationInSeconds = 60;
    static const Duration _initialDuration =
    Duration(seconds: _initialDurationInSeconds);
    static final _initialState = TimerModel(
      timeLeftString: _durationString(_initialDurationInSeconds),
      timeLeft: _initialDuration,
      isTimerTicking: false,
    );

    final Ticker _ticker = Ticker();
    StreamSubscription<int>? _tickerSubscription;

    static String _durationString(int duration) {
      // final minutes = ((duration / 60) % 60).floor().toString().padLeft(2, '0');
      final seconds = (duration % 60).toString().padLeft(2, '0');
      // return '$minutes:$seconds';
      return '$seconds';
    }

    @override
    void dispose() {
      _tickerSubscription?.cancel();
      super.dispose();
    }

    void start() {
      _startTimer();
    }

    void _startTimer() {
      _tickerSubscription?.cancel();

      _tickerSubscription =
          _ticker.tick(ticks: _initialDurationInSeconds).listen((duration) {
            state = TimerModel(
              timeLeftString: _durationString(duration),
              timeLeft: Duration(seconds: duration),
              isTimerTicking: true,
            );
          });

      _tickerSubscription?.onDone(() {
        state = TimerModel(
          timeLeftString: state.timeLeftString,
          timeLeft: state.timeLeft,
          isTimerTicking: false,
        );
      });

      state = TimerModel(
        timeLeftString: _durationString(_initialDurationInSeconds),
        timeLeft: _initialDuration,
        isTimerTicking: true,
      );
    }

    void reset(int duration) {
      _tickerSubscription?.cancel();
      state = TimerModel(
        timeLeftString: _durationString(duration),
        timeLeft: Duration(seconds: duration),
        isTimerTicking: false,
      );;
    }
  }

  class Ticker {
    Stream<int> tick({required int ticks}) {
      return Stream.periodic(
        const Duration(seconds: 1),
            (x) => ticks - x - 1,
      ).take(ticks);
    }
  }

  class TimerModel {
    const TimerModel({
      required this.timeLeftString,
      required this.timeLeft,
      required this.isTimerTicking,
    });
    final String timeLeftString;
    final Duration timeLeft;
    final bool isTimerTicking;
  }