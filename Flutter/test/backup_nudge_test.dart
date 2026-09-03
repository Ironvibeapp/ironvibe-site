import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/main.dart';

void main() {
  final t0 = DateTime(2026, 1, 1, 12);

  test('backup nudge waits a full 28 days from last ack', () {
    expect(
      ironVibeBackupNudgeIsDue(
        now: t0.add(const Duration(days: 27, hours: 23)),
        lastAcknowledgedAt: t0,
        hasBackupWorthyData: true,
      ),
      isFalse,
    );
    expect(
      ironVibeBackupNudgeIsDue(
        now: t0.add(const Duration(days: 28)),
        lastAcknowledgedAt: t0,
        hasBackupWorthyData: true,
      ),
      isTrue,
    );
  });

  test('backup nudge does not fire without data or a started clock', () {
    expect(
      ironVibeBackupNudgeIsDue(
        now: t0.add(const Duration(days: 40)),
        lastAcknowledgedAt: t0,
        hasBackupWorthyData: false,
      ),
      isFalse,
    );
    expect(
      ironVibeBackupNudgeIsDue(
        now: t0.add(const Duration(days: 40)),
        lastAcknowledgedAt: null,
        hasBackupWorthyData: true,
      ),
      isFalse,
    );
  });
}
