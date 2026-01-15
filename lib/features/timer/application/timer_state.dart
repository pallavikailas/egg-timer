enum TimerStatus { idle, running, paused, finished }

class TimerState {
  final Duration total;
  final Duration remaining;
  final TimerStatus status;

  const TimerState({
    required this.total,
    required this.remaining,
    required this.status,
  });

  factory TimerState.initial() => const TimerState(
        total: Duration(minutes: 7),
        remaining: Duration(minutes: 7),
        status: TimerStatus.idle,
      );

  TimerState copyWith({
    Duration? total,
    Duration? remaining,
    TimerStatus? status,
  }) {
    return TimerState(
      total: total ?? this.total,
      remaining: remaining ?? this.remaining,
      status: status ?? this.status,
    );
  }
}
