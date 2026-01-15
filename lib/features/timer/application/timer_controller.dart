import 'dart:async';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'timer_state.dart';

final timerControllerProvider =
    StateNotifierProvider<TimerController, TimerState>(
  (ref) => TimerController(),
);

class TimerController extends StateNotifier<TimerState> {
  TimerController() : super(TimerState.initial());

  Timer? _ticker;

  void setTotal(Duration total) {
    _stopTicker();
    state = state.copyWith(
      total: total,
      remaining: total,
      status: TimerStatus.idle,
    );
  }

  void start() {
    if (state.remaining.inSeconds <= 0) return;
    state = state.copyWith(status: TimerStatus.running);
    _startTicker();
  }

  void pause() {
    if (state.status != TimerStatus.running) return;
    _stopTicker();
    state = state.copyWith(status: TimerStatus.paused);
  }

  void resume() {
    if (state.status != TimerStatus.paused) return;
    state = state.copyWith(status: TimerStatus.running);
    _startTicker();
  }

  void reset() {
    _stopTicker();
    state = state.copyWith(
      remaining: state.total,
      status: TimerStatus.idle,
    );
  }

  void _startTicker() {
    _stopTicker();
    _ticker = Timer.periodic(const Duration(seconds: 1), (_) {
      final next = state.remaining - const Duration(seconds: 1);
      if (next.inSeconds <= 0) {
        _stopTicker();
        state = state.copyWith(
          remaining: Duration.zero,
          status: TimerStatus.finished,
        );
      } else {
        state = state.copyWith(remaining: next);
      }
    });
  }

  void _stopTicker() {
    _ticker?.cancel();
    _ticker = null;
  }

  @override
  void dispose() {
    _stopTicker();
    super.dispose();
  }
}
