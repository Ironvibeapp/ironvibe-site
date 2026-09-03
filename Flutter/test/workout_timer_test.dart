import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/src/workout_timer_controller.dart';

void main() {
  test('addRestMinutes after countdown hits 0 starts again', () {
    final c = WorkoutTimerController();
    addTearDown(c.dispose);
    c.addRestMinutes(1);
    expect(c.running, isTrue);
    c.running = false;
    c.countdownRemainingMs = 0;
    c.addRestMinutes(1);
    expect(c.running, isTrue);
    expect(c.countdownRemainingMs, 60 * 1000);
  });
}
