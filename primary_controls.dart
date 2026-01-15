import 'package:flutter/material.dart';
import '../../application/timer_state.dart';

class PrimaryControls extends StatelessWidget {
  final TimerStatus status;
  final VoidCallback onStart;
  final VoidCallback onPause;
  final VoidCallback onResume;
  final VoidCallback onReset;

  const PrimaryControls({
    super.key,
    required this.status,
    required this.onStart,
    required this.onPause,
    required this.onResume,
    required this.onReset,
  });

  @override
  Widget build(BuildContext context) {
    final isIdle = status == TimerStatus.idle;
    final isRunning = status == TimerStatus.running;
    final isPaused = status == TimerStatus.paused;
    final isFinished = status == TimerStatus.finished;

    return Row(
      children: [
        Expanded(
          child: FilledButton(
            onPressed: isIdle ? onStart : (isPaused ? onResume : null),
            child: Text(isIdle ? 'Start' : (isPaused ? 'Resume' : 'Running')),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: OutlinedButton(
            onPressed: isRunning ? onPause : (isFinished || isPaused ? onReset : null),
            child: Text(isRunning ? 'Pause' : 'Reset'),
          ),
        ),
      ],
    );
  }
}
