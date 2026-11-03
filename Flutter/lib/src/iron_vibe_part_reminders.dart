part of 'package:fitness_app/main.dart';

/// Evening before a training day. The hour is local time on the phone.
const int kIronVibeEveningReminderHour = 21;

const int kIronVibeDefaultRemindMinutes = 30;

const List<int> kIronVibeRemindMinuteChoices = [10, 15, 30, 45, 60, 90, 120];

/// How far ahead a reminder is armed. Opening the app refreshes the window.
const int kIronVibeReminderHorizonDays = 14;

const int _kRemindMinutesMin = 5;
const int _kRemindMinutesMax = 180;

/// Keeps a coach-chosen lead time, or drops a missing or absurd one.
int? ironVibeSanitizeRemindMinutes(Object? raw) {
  final int? value;
  if (raw is int) {
    value = raw;
  } else if (raw is num) {
    value = raw.toInt();
  } else {
    return null;
  }
  if (value < _kRemindMinutesMin || value > _kRemindMinutesMax) return null;
  return value;
}

String ironVibeReminderClock(DateTime when) {
  final hour = when.hour.toString().padLeft(2, '0');
  final minute = when.minute.toString().padLeft(2, '0');
  return '$hour:$minute';
}

int ironVibeEveningReminderId(DateTime day) {
  return 40000000 + day.year * 400 + day.month * 32 + day.day;
}

int ironVibeSessionReminderId(String key) {
  var hash = 0;
  for (final unit in key.codeUnits) {
    hash = (hash * 31 + unit) & 0x7fffffff;
  }
  return 1000000 + (hash % 20000000);
}

class IronVibeReminderPlan {
  final int id;
  final DateTime when;
  final String title;
  final String body;
  final bool alarm;

  const IronVibeReminderPlan({
    required this.id,
    required this.when,
    required this.title,
    required this.body,
    required this.alarm,
  });
}

bool ironVibeSessionCountsForReminder(TrainerSession session, DateTime now) {
  if (session.isImportedHistory || session.isCompleted) return false;
  return session.dateTime.isAfter(now);
}

class _ReminderEvent {
  final DateTime when;
  final int? remindMinutes;
  final String alarmLabel;
  final String idKey;

  const _ReminderEvent({
    required this.when,
    required this.remindMinutes,
    required this.alarmLabel,
    required this.idKey,
  });
}

/// One evening note per upcoming training day, plus an alarm only for
/// workouts where it was switched on while picking the time.
List<IronVibeReminderPlan> ironVibePlanReminders({
  required List<TrainerSession> sessions,
  List<WorkoutLog> personal = const [],
  required DateTime now,
  required AppLocalizations l10n,
  int horizonDays = kIronVibeReminderHorizonDays,
}) {
  final upcoming = <_ReminderEvent>[
    for (final session in sessions)
      if (ironVibeSessionCountsForReminder(session, now))
        _ReminderEvent(
          when: session.dateTime,
          remindMinutes: session.remindMinutesBefore,
          alarmLabel: () {
            final name = ironVibeSessionClientLabel(session).trim();
            return name.isEmpty ? l10n.reminderAlarmTitle : name;
          }(),
          idKey:
              session.id ??
              '${session.clientName}|${session.dateTime.toIso8601String()}',
        ),
    for (final log in personal)
      if (log.date.isAfter(now))
        _ReminderEvent(
          when: log.date,
          remindMinutes: log.remindMinutesBefore,
          alarmLabel: l10n.reminderAlarmTitle,
          idKey: 'personal:${log.id ?? log.date.toIso8601String()}',
        ),
  ]..sort((a, b) => a.when.compareTo(b.when));

  final byDay = <DateTime, List<_ReminderEvent>>{};
  for (final event in upcoming) {
    final day = ironVibeDateOnly(event.when);
    (byDay[day] ??= <_ReminderEvent>[]).add(event);
  }

  final horizonEnd = now.add(Duration(days: horizonDays));
  final today = ironVibeDateOnly(now);
  final used = <int>{};
  final plans = <IronVibeReminderPlan>[];

  final days = byDay.keys.toList()..sort();
  for (final day in days) {
    if (!day.isAfter(today)) continue;
    final eve = ironVibeDateOnly(day).subtract(const Duration(days: 1));
    final when = DateTime(
      eve.year,
      eve.month,
      eve.day,
      kIronVibeEveningReminderHour,
    );
    if (!when.isAfter(now) || !when.isBefore(horizonEnd)) continue;
    final thatDay = byDay[day]!;
    final first = thatDay.first.when;
    final id = ironVibeEveningReminderId(day);
    used.add(id);
    plans.add(
      IronVibeReminderPlan(
        id: id,
        when: when,
        title: l10n.reminderEveningTitle,
        body: l10n.reminderEveningBody(
          thatDay.length,
          ironVibeReminderClock(first),
        ),
        alarm: false,
      ),
    );
  }

  for (final event in upcoming) {
    final minutes = event.remindMinutes;
    if (minutes == null) continue;
    final when = event.when.subtract(Duration(minutes: minutes));
    if (!when.isAfter(now) || !when.isBefore(horizonEnd)) continue;
    final shown = event.alarmLabel;
    final key = event.idKey;
    var id = ironVibeSessionReminderId(key);
    while (used.contains(id)) {
      id = id >= 30000000 ? 1000000 : id + 1;
    }
    used.add(id);
    plans.add(
      IronVibeReminderPlan(
        id: id,
        when: when,
        title: l10n.reminderAlarmTitle,
        body: l10n.reminderAlarmBody(
          shown,
          ironVibeReminderClock(event.when),
        ),
        alarm: true,
      ),
    );
  }

  plans.sort((a, b) => a.when.compareTo(b.when));
  return plans;
}

final FlutterLocalNotificationsPlugin _ironVibeNotifications =
    FlutterLocalNotificationsPlugin();

bool _ironVibeRemindersReady = false;
Future<void>? _ironVibeRemindersStarting;
bool _ironVibeZonesReady = false;
String? _ironVibeReminderFingerprint;
int _ironVibeRescheduleGeneration = 0;

Locale ironVibeReminderLocale() {
  return basicLocaleListResolution(
    WidgetsBinding.instance.platformDispatcher.locales,
    AppLocalizations.supportedLocales,
  );
}

bool _ironVibeRemindersSupported() {
  if (kIsWeb) return false;
  return defaultTargetPlatform == TargetPlatform.android ||
      defaultTargetPlatform == TargetPlatform.iOS;
}

Future<void> ironVibeRemindersStart() {
  if (_ironVibeRemindersReady) return Future<void>.value();
  final pending = _ironVibeRemindersStarting;
  if (pending != null) return pending;
  final run = _ironVibeRemindersStartBody();
  _ironVibeRemindersStarting = run;
  return run.whenComplete(() {
    if (identical(_ironVibeRemindersStarting, run)) {
      _ironVibeRemindersStarting = null;
    }
  });
}

Future<void> _ironVibeRemindersStartBody() async {
  if (!_ironVibeRemindersSupported()) return;
  try {
    if (!_ironVibeZonesReady) {
      tzdata.initializeTimeZones();
      _ironVibeZonesReady = true;
    }
    await _ironVibeApplyLocalZone();
    const android = AndroidInitializationSettings('ic_stat_ironvibe');
    const darwin = DarwinInitializationSettings(
      requestAlertPermission: false,
      requestBadgePermission: false,
      requestSoundPermission: false,
    );
    await _ironVibeNotifications.initialize(
      settings: const InitializationSettings(android: android, iOS: darwin),
    );
    _ironVibeRemindersReady = true;
  } catch (err, st) {
    debugPrint('IronVibe reminders: $err\n$st');
  }
}

Future<void> _ironVibeApplyLocalZone() async {
  try {
    final info = await FlutterTimezone.getLocalTimezone();
    tz.setLocalLocation(tz.getLocation(info.identifier));
    return;
  } catch (err) {
    debugPrint('IronVibe reminders: timezone fallback ($err)');
  }
  final offset = DateTime.now().timeZoneOffset;
  tz.setLocalLocation(
    tz.Location('ironvibe-local', const [0], const [0], [
      tz.TimeZone(offset, isDst: false, abbreviation: 'LCL'),
    ]),
  );
}

/// Asks the system to show notifications. Exact timing is requested only for
/// the optional pre-workout alarm. Returns false when the person said no.
Future<bool> ironVibeEnsureReminderPermission({bool exact = false}) async {
  if (!_ironVibeRemindersSupported()) return true;
  await ironVibeRemindersStart();
  if (!_ironVibeRemindersReady) return false;
  if (defaultTargetPlatform == TargetPlatform.android) {
    final android = _ironVibeNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    final granted = await android?.requestNotificationsPermission();
    if (granted == false) return false;
    if (exact) {
      final can = await android?.canScheduleExactNotifications() ?? false;
      if (!can) {
        await android?.requestExactAlarmsPermission();
      }
    }
    return true;
  }
  final ios = _ironVibeNotifications
      .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin
      >();
  final ok = await ios?.requestPermissions(
    alert: true,
    badge: false,
    sound: true,
  );
  return ok ?? false;
}

Future<void> ironVibeRefreshReminders({bool askPermission = false}) async {
  if (!_ironVibeRemindersReady) return;
  if (askPermission &&
      _ironVibeHasUpcomingReminder(DateTime.now())) {
    await ironVibeEnsureReminderPermission();
  }
  await ironVibeRescheduleReminders();
}

void ironVibeRemindersAfterDataSaved() {
  if (!_ironVibeRemindersReady) return;
  unawaited(ironVibeRescheduleReminders());
}

bool _ironVibeHasUpcomingReminder(DateTime now) {
  if (trainerSchedule.any(
    (session) => ironVibeSessionCountsForReminder(session, now),
  )) {
    return true;
  }
  return workoutHistory.any((log) => log.date.isAfter(now));
}

String ironVibeReminderFingerprint(
  List<TrainerSession> sessions,
  Locale locale, {
  List<WorkoutLog> personal = const [],
}) {
  final copy = [...sessions]..sort((a, b) => a.dateTime.compareTo(b.dateTime));
  final buffer = StringBuffer(locale.languageCode)..write('|');
  final logs = [...personal]..sort((a, b) => a.date.compareTo(b.date));
  for (final log in logs) {
    buffer
      ..write('p:')
      ..write(log.id)
      ..write(',')
      ..write(log.date.toIso8601String())
      ..write(',')
      ..write(log.remindMinutesBefore)
      ..write(';');
  }
  for (final session in copy) {
    buffer
      ..write(session.id)
      ..write(',')
      ..write(session.dateTime.toIso8601String())
      ..write(',')
      ..write(session.remindMinutesBefore)
      ..write(',')
      ..write(session.isCompleted)
      ..write(',')
      ..write(session.isImportedHistory)
      ..write(',')
      ..write(ironVibeSessionClientLabel(session))
      ..write(';');
  }
  return buffer.toString();
}

Future<void> ironVibeRescheduleReminders() async {
  if (!_ironVibeRemindersReady) return;
  final generation = ++_ironVibeRescheduleGeneration;
  final locale = ironVibeReminderLocale();
  final fingerprint = ironVibeReminderFingerprint(
    trainerSchedule,
    locale,
    personal: workoutHistory,
  );
  if (fingerprint == _ironVibeReminderFingerprint) return;
  final plans = ironVibePlanReminders(
    sessions: trainerSchedule,
    personal: workoutHistory,
    now: DateTime.now(),
    l10n: lookupAppLocalizations(locale),
  );
  if (generation != _ironVibeRescheduleGeneration) return;
  try {
    final exact = await _ironVibeCanScheduleExact();
    if (generation != _ironVibeRescheduleGeneration) return;
    await _ironVibeNotifications.cancelAllPendingNotifications();
    if (generation != _ironVibeRescheduleGeneration) return;
    final l10n = lookupAppLocalizations(locale);
    for (final plan in plans) {
      if (generation != _ironVibeRescheduleGeneration) return;
      try {
        await _ironVibeScheduleOne(plan, l10n: l10n, exact: exact);
      } catch (err, st) {
        debugPrint('IronVibe reminders: skipped ${plan.id}: $err\n$st');
      }
    }
    _ironVibeReminderFingerprint = fingerprint;
  } catch (err, st) {
    debugPrint('IronVibe reminders: schedule failed: $err\n$st');
  }
}

Future<bool> _ironVibeCanScheduleExact() async {
  if (defaultTargetPlatform != TargetPlatform.android) return false;
  final android = _ironVibeNotifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();
  return await android?.canScheduleExactNotifications() ?? false;
}

Future<void> _ironVibeScheduleOne(
  IronVibeReminderPlan plan, {
  required AppLocalizations l10n,
  required bool exact,
}) async {
  final when = tz.TZDateTime(
    tz.local,
    plan.when.year,
    plan.when.month,
    plan.when.day,
    plan.when.hour,
    plan.when.minute,
  );
  final mode = plan.alarm && exact
      ? AndroidScheduleMode.exactAllowWhileIdle
      : AndroidScheduleMode.inexactAllowWhileIdle;
  final details = NotificationDetails(
    android: AndroidNotificationDetails(
      plan.alarm ? 'ironvibe_workout_alarm' : 'ironvibe_evening',
      plan.alarm ? l10n.reminderChannelAlarm : l10n.reminderChannelEvening,
      channelDescription: plan.alarm
          ? l10n.reminderChannelAlarmDesc
          : l10n.reminderChannelEveningDesc,
      importance: plan.alarm ? Importance.max : Importance.high,
      priority: plan.alarm ? Priority.max : Priority.high,
      category: plan.alarm
          ? AndroidNotificationCategory.alarm
          : AndroidNotificationCategory.reminder,
      audioAttributesUsage: plan.alarm
          ? AudioAttributesUsage.alarm
          : AudioAttributesUsage.notification,
      icon: 'ic_stat_ironvibe',
    ),
    iOS: const DarwinNotificationDetails(
      presentAlert: true,
      presentSound: true,
      presentBanner: true,
      presentList: true,
    ),
  );
  await _ironVibeNotifications.zonedSchedule(
    id: plan.id,
    title: plan.title,
    body: plan.body,
    scheduledDate: when,
    notificationDetails: details,
    androidScheduleMode: mode,
  );
}
