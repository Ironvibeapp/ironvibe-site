import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

TrainerSession _session({
  required DateTime when,
  required String name,
  required String id,
  int? remind,
  bool completed = false,
  bool imported = false,
}) {
  return TrainerSession(
    when,
    name,
    '',
    id: id,
    isScheduledPlan: true,
    isCompleted: completed,
    isImportedHistory: imported,
    remindMinutesBefore: remind,
  );
}

void main() {
  final en = lookupAppLocalizations(const Locale('en'));
  final ru = lookupAppLocalizations(const Locale('ru'));

  setUp(() {
    clients = [];
  });

  test('evening note counts tomorrow and names the earliest start', () {
    final plans = ironVibePlanReminders(
      now: DateTime(2026, 11, 3, 18),
      l10n: en,
      sessions: [
        _session(when: DateTime(2026, 11, 4, 10), name: 'Late', id: 'b'),
        _session(when: DateTime(2026, 11, 4, 8, 30), name: 'Early', id: 'a'),
        _session(when: DateTime(2026, 11, 4, 12), name: 'Mid', id: 'c'),
        _session(
          when: DateTime(2026, 11, 4, 7),
          name: 'Done',
          id: 'd',
          completed: true,
        ),
        _session(
          when: DateTime(2026, 11, 4, 6),
          name: 'Old',
          id: 'e',
          imported: true,
        ),
      ],
    );
    final evening = plans.where((plan) => !plan.alarm).toList();
    expect(evening, hasLength(1));
    expect(evening.single.when, DateTime(2026, 11, 3, 21));
    expect(evening.single.body, en.reminderEveningBody(3, '08:30'));
    expect(plans.where((plan) => plan.alarm), isEmpty);
  });

  test(
    'a missed 21:00 is not sent late, and the next training day still is',
    () {
      final plans = ironVibePlanReminders(
        now: DateTime(2026, 11, 3, 22),
        l10n: ru,
        sessions: [
          _session(when: DateTime(2026, 11, 4, 8, 30), name: 'Анна', id: 'a'),
          _session(when: DateTime(2026, 11, 6, 9), name: 'Борис', id: 'b'),
          _session(when: DateTime(2026, 11, 6, 11), name: 'Вера', id: 'c'),
        ],
      );
      final evening = plans.where((plan) => !plan.alarm).toList();
      expect(evening, hasLength(1));
      expect(evening.single.when, DateTime(2026, 11, 5, 21));
      expect(evening.single.body, ru.reminderEveningBody(2, '09:00'));
    },
  );

  test('russian evening copy follows the count', () {
    expect(
      ru.reminderEveningBody(1, '08:30'),
      'Завтра у вас одна тренировка, она начнётся в 08:30.',
    );
    expect(
      ru.reminderEveningBody(2, '08:30'),
      'Завтра у вас 2 тренировки, первая начнётся в 08:30.',
    );
    expect(
      ru.reminderEveningBody(5, '08:30'),
      'Завтра у вас 5 тренировок, первая начнётся в 08:30.',
    );
  });

  test(
    'the pre-workout alarm is opt-in and skipped once its lead time passed',
    () {
      final plans = ironVibePlanReminders(
        now: DateTime(2026, 11, 4, 8, 10),
        l10n: en,
        sessions: [
          _session(
            when: DateTime(2026, 11, 4, 8, 30),
            name: 'Ann',
            id: 'a',
            remind: 30,
          ),
          _session(
            when: DateTime(2026, 11, 4, 12),
            name: 'Bob Lee',
            id: 'b',
            remind: 30,
          ),
          _session(when: DateTime(2026, 11, 4, 18), name: 'Cara', id: 'c'),
        ],
      );
      final alarms = plans.where((plan) => plan.alarm).toList();
      expect(alarms, hasLength(1));
      expect(alarms.single.when, DateTime(2026, 11, 4, 11, 30));
      expect(alarms.single.body, 'Bob Lee starts at 12:00.');
      expect(plans.where((plan) => !plan.alarm), isEmpty);
    },
  );

  test('a workout beyond the horizon is not armed yet', () {
    final now = DateTime(2026, 11, 3, 10);
    final plans = ironVibePlanReminders(
      now: now,
      l10n: en,
      sessions: [
        _session(
          when: now.add(const Duration(days: 20)),
          name: 'Far',
          id: 'f',
          remind: 30,
        ),
      ],
    );
    expect(plans, isEmpty);
  });

  test('lead time survives a backup round trip and rejects nonsense', () {
    final session = TrainerSession(
      DateTime(2026, 11, 4, 8, 30),
      'Ann',
      'note',
      id: 'keep',
      remindMinutesBefore: 45,
    );
    final restored = TrainerSession.fromJson(session.toJson());
    expect(restored.remindMinutesBefore, 45);
    expect(ironVibeSanitizeRemindMinutes(4), isNull);
    expect(ironVibeSanitizeRemindMinutes(181), isNull);
    expect(ironVibeSanitizeRemindMinutes('30'), isNull);
    expect(ironVibeSanitizeRemindMinutes(15), 15);
  });

  test('reminder ids stay stable and inside 32 bits', () {
    expect(
      ironVibeSessionReminderId('session-a'),
      ironVibeSessionReminderId('session-a'),
    );
    expect(
      ironVibeEveningReminderId(DateTime(2026, 11, 4)),
      isNot(ironVibeEveningReminderId(DateTime(2026, 12, 31))),
    );
    expect(
      ironVibeEveningReminderId(DateTime(2099, 12, 31)),
      lessThan(0x7fffffff),
    );
  });
}
