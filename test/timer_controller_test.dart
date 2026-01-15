import 'package:egg_timer/features/timer/application/timer_controller.dart';
import 'package:egg_timer/features/timer/application/timer_state.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('setTotal resets to idle with matching remaining', () {
    final c = TimerController();
    c.setTotal(const Duration(minutes: 2));
    expect(c.state.total, const Duration(minutes: 2));
    expect(c.state.remaining, const Duration(minutes: 2));
    expect(c.state.status, TimerStatus.idle);
  });

  test('reset returns remaining to total', () {
    final c = TimerController();
    c.setTotal(const Duration(seconds: 10));
    c.start();
    c.reset();
    expect(c.state.remaining, c.state.total);
    expect(c.state.status, TimerStatus.idle);
  });
}
