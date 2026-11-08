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
bool _ironVibeExactAlarmRequested = false;
bool _ironVibeReminderLifecycleAttached = false;

/// One automatic trip to the exact-alarm screen. A later opt-in alarm can ask again.
const String _kIronVibeExactAlarmAsked = 'ironvibeExactAlarmAsked';

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
    if (!_ironVibeReminderLifecycleAttached) {
      WidgetsBinding.instance.addObserver(_ironVibeReminderLifecycle);
      _ironVibeReminderLifecycleAttached = true;
    }
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

AndroidFlutterLocalNotificationsPlugin? _ironVibeAndroidNotifications() {
  return _ironVibeNotifications
      .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin
      >();
}

/// Notification permission and the app's own notification switch. On Android
/// 13+ a granted runtime permission can still be turned off in system settings,
/// and [requestNotificationsPermission] reports that case as allowed.
Future<bool> _ironVibeNotificationsEnabled() async {
  if (!_ironVibeRemindersSupported()) return true;
  try {
    if (defaultTargetPlatform == TargetPlatform.android) {
      // Null means the plugin could not answer. Skipping the schedule in that
      // case left the 21:00 reminder unarmed.
      final enabled = await _ironVibeAndroidNotifications()
          ?.areNotificationsEnabled();
      return enabled ?? true;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      final ios = _ironVibeNotifications
          .resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin
          >();
      final options = await ios?.checkPermissions();
      if (options == null) return true;
      return options.isEnabled;
    }
  } catch (err) {
    debugPrint('IronVibe reminders: enabled check failed: $err');
    return true;
  }
  return true;
}

Future<bool> _ironVibeRequestNotificationPermission() async {
  if (defaultTargetPlatform == TargetPlatform.android) {
    final android = _ironVibeAndroidNotifications();
    if (await android?.areNotificationsEnabled() ?? false) return true;
    try {
      await android?.requestNotificationsPermission();
    } catch (err) {
      debugPrint('IronVibe reminders: permission request failed: $err');
    }
    return await android?.areNotificationsEnabled() ?? false;
  }
  final ios = _ironVibeNotifications
      .resolvePlatformSpecificImplementation<
        IOSFlutterLocalNotificationsPlugin
      >();
  try {
    final ok = await ios?.requestPermissions(
      alert: true,
      badge: false,
      sound: true,
    );
    return ok ?? false;
  } catch (err) {
    debugPrint('IronVibe reminders: permission request failed: $err');
    return false;
  }
}

Future<void> _ironVibeRequestExactAlarmIfNeeded({bool once = false}) async {
  if (defaultTargetPlatform != TargetPlatform.android) return;
  if (_ironVibeExactAlarmRequested) return;
  final android = _ironVibeAndroidNotifications();
  try {
    final can = await android?.canScheduleExactNotifications() ?? true;
    if (can) return;
    if (once) {
      final prefs = await SharedPreferences.getInstance();
      if (prefs.getBool(_kIronVibeExactAlarmAsked) == true) return;
      await prefs.setBool(_kIronVibeExactAlarmAsked, true);
    }
    _ironVibeExactAlarmRequested = true;
    await android?.requestExactAlarmsPermission();
  } catch (err) {
    debugPrint('IronVibe reminders: exact alarm request failed: $err');
  }
}

Future<bool> _ironVibeOpenNotificationSettings() async {
  try {
    if (defaultTargetPlatform == TargetPlatform.android) {
      return await _ironVibeAndroidNotifications()?.openAppNotificationSettings() ??
          false;
    }
    if (defaultTargetPlatform == TargetPlatform.iOS) {
      return launchUrl(
        Uri.parse('app-settings:'),
        mode: LaunchMode.externalApplication,
      );
    }
  } catch (err) {
    debugPrint('IronVibe reminders: settings failed: $err');
  }
  return false;
}

/// Shown when the system will not ask again and the switch is still off.
Future<bool> ironVibeOfferNotificationSettings(BuildContext context) async {
  final l = AppLocalizations.of(context)!;
  final open = await showDialog<bool>(
    context: context,
    builder: (ctx) {
      final pal = IronVibePalette.of(ctx);
      return AlertDialog(
        backgroundColor: pal.dialog,
        shape: ironVibeDialogShape(pal),
        title: Text(
          l.remindPermissionTitle,
          style: TextStyle(
            color: pal.textPrimary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        content: Text(
          l.remindPermissionDenied,
          style: TextStyle(color: pal.textSecondary),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx, false),
            child: Text(
              l.remindPermissionNotNow,
              style: TextStyle(color: pal.textMuted),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(ctx, true),
            child: Text(
              l.remindPermissionOpenSettings,
              style: TextStyle(
                color: pal.textPrimary,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      );
    },
  );
  if (open != true) return false;
  final launched = await _ironVibeOpenNotificationSettings();
  if (!launched) return false;
  await _ironVibeWaitForSettingsReturn();
  return _ironVibeNotificationsEnabled();
}

/// Asks the system to show notifications. The 21:00 note and the optional
/// pre-workout alarm both use an exact alarm when the phone allows it. Without
/// that grant the note is still scheduled, but Android may deliver it late.
///
/// When [context] is set and notifications are still off after the system
/// prompt, the person is offered the app's notification settings.
Future<bool> ironVibeEnsureReminderPermission({
  bool exact = false,
  BuildContext? context,
  bool prompt = true,
}) async {
  if (!_ironVibeRemindersSupported()) return true;
  await ironVibeRemindersStart();
  if (!_ironVibeRemindersReady) return false;
  var allowed = await _ironVibeRequestNotificationPermission();
  if (!allowed && prompt && context != null && context.mounted) {
    allowed = await ironVibeOfferNotificationSettings(context);
  }
  if (!allowed) return false;
  if (exact) await _ironVibeRequestExactAlarmIfNeeded();
  unawaited(ironVibeRescheduleReminders());
  return true;
}

bool _ironVibeHasPendingReminderPlan(DateTime now) {
  return ironVibePlanReminders(
    sessions: trainerSchedule,
    personal: workoutHistory,
    now: now,
    l10n: lookupAppLocalizations(ironVibeReminderLocale()),
  ).isNotEmpty;
}

/// The evening note is automatic, so permission is asked when a training day
/// is coming up, not only when the optional pre-workout alarm is switched on.
Future<void> ironVibeArmUpcomingReminders(BuildContext context) async {
  if (!_ironVibeRemindersSupported()) return;
  await ironVibeRemindersStart();
  if (!_ironVibeRemindersReady) return;
  if (!_ironVibeHasPendingReminderPlan(DateTime.now())) return;
  if (!context.mounted) return;
  final allowed = await ironVibeEnsureReminderPermission(
    context: context,
    prompt: true,
  );
  if (!allowed || !context.mounted) return;
  await _ironVibeRequestExactAlarmIfNeeded(once: true);
  await ironVibeRescheduleReminders();
}

Future<void> ironVibeRefreshReminders() async {
  if (!_ironVibeRemindersReady) return;
  await ironVibeRescheduleReminders();
}

void ironVibeRemindersAfterDataSaved() {
  if (!_ironVibeRemindersReady) return;
  unawaited(ironVibeRescheduleReminders());
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
  if (!await _ironVibeNotificationsEnabled()) {
    if (generation != _ironVibeRescheduleGeneration) return;
    // A later grant must schedule these. A stored fingerprint would skip it.
    _ironVibeReminderFingerprint = null;
    return;
  }
  final exact = await _ironVibeCanScheduleExact();
  if (generation != _ironVibeRescheduleGeneration) return;
  final locale = ironVibeReminderLocale();
  final today = ironVibeDateOnly(DateTime.now()).toIso8601String();
  final fingerprint =
      '${ironVibeReminderFingerprint(trainerSchedule, locale, personal: workoutHistory)}|$today|${exact ? 1 : 0}';
  if (fingerprint == _ironVibeReminderFingerprint) return;
  final plans = ironVibePlanReminders(
    sessions: trainerSchedule,
    personal: workoutHistory,
    now: DateTime.now(),
    l10n: lookupAppLocalizations(locale),
  );
  if (generation != _ironVibeRescheduleGeneration) return;
  await _ironVibeApplyLocalZone();
  if (generation != _ironVibeRescheduleGeneration) return;
  var failed = false;
  var armedExact = exact;
  try {
    final l10n = lookupAppLocalizations(locale);
    for (final plan in plans) {
      if (generation != _ironVibeRescheduleGeneration) return;
      try {
        final precise = await _ironVibeScheduleOne(
          plan,
          l10n: l10n,
          exact: exact,
        );
        if (!precise) armedExact = false;
      } catch (err, st) {
        failed = true;
        debugPrint('IronVibe reminders: skipped ${plan.id}: $err\n$st');
      }
    }
    if (!failed && generation == _ironVibeRescheduleGeneration) {
      try {
        await _ironVibeCancelRetiredReminders({
          for (final plan in plans) plan.id,
        });
      } catch (err, st) {
        debugPrint('IronVibe reminders: retire failed: $err\n$st');
      }
    }
  } catch (err, st) {
    failed = true;
    debugPrint('IronVibe reminders: schedule failed: $err\n$st');
  }
  if (generation != _ironVibeRescheduleGeneration) return;
  final armedStamp = armedExact == exact
      ? fingerprint
      : '${ironVibeReminderFingerprint(trainerSchedule, locale, personal: workoutHistory)}|$today|0';
  _ironVibeReminderFingerprint = failed ? null : armedStamp;
}

Future<void> _ironVibeCancelRetiredReminders(Set<int> keep) async {
  final pending = await _ironVibeNotifications.pendingNotificationRequests();
  for (final request in pending) {
    if (keep.contains(request.id)) continue;
    await _ironVibeNotifications.cancel(id: request.id);
  }
}

Future<bool> _ironVibeCanScheduleExact() async {
  if (defaultTargetPlatform != TargetPlatform.android) return false;
  try {
    final android = _ironVibeNotifications
        .resolvePlatformSpecificImplementation<
          AndroidFlutterLocalNotificationsPlugin
        >();
    return await android?.canScheduleExactNotifications() ?? false;
  } catch (err) {
    debugPrint('IronVibe reminders: exact check failed: $err');
    return false;
  }
}

Future<bool> _ironVibeScheduleOne(
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
  Future<void> schedule(AndroidScheduleMode mode) {
    return _ironVibeNotifications.zonedSchedule(
      id: plan.id,
      title: plan.title,
      body: plan.body,
      scheduledDate: when,
      notificationDetails: details,
      androidScheduleMode: mode,
    );
  }

  final mode = ironVibeReminderAndroidMode(exact: exact);
  if (mode == AndroidScheduleMode.exactAllowWhileIdle) {
    try {
      await schedule(mode);
      return true;
    } catch (err) {
      debugPrint(
        'IronVibe reminders: exact failed for ${plan.id}, using inexact ($err)',
      );
    }
  }
  await schedule(AndroidScheduleMode.inexactAllowWhileIdle);
  return !exact;
}

/// Inexact alarms wait for a maintenance window while the phone is idle, so
/// the 21:00 note often never shows. Exact is used for every reminder the
/// phone will allow, including that evening note.
AndroidScheduleMode ironVibeReminderAndroidMode({required bool exact}) {
  return exact
      ? AndroidScheduleMode.exactAllowWhileIdle
      : AndroidScheduleMode.inexactAllowWhileIdle;
}

final _ironVibeReminderLifecycle = _IronVibeReminderLifecycle();

class _IronVibeReminderLifecycle with WidgetsBindingObserver {
  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      unawaited(ironVibeRescheduleReminders());
    }
  }
}

class _IronVibeSettingsReturn with WidgetsBindingObserver {
  _IronVibeSettingsReturn(this._done) {
    _giveUp = Timer(const Duration(milliseconds: 1200), () {
      if (!_backgrounded && !_done.isCompleted) _done.complete();
    });
  }

  final Completer<void> _done;
  bool _backgrounded = false;
  late final Timer _giveUp;

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_done.isCompleted) return;
    if (state == AppLifecycleState.inactive ||
        state == AppLifecycleState.paused) {
      _backgrounded = true;
      return;
    }
    if (state == AppLifecycleState.resumed && _backgrounded) {
      _done.complete();
    }
  }

  void close() {
    _giveUp.cancel();
  }
}

Future<void> _ironVibeWaitForSettingsReturn() async {
  final completer = Completer<void>();
  final observer = _IronVibeSettingsReturn(completer);
  WidgetsBinding.instance.addObserver(observer);
  try {
    await completer.future.timeout(const Duration(minutes: 2));
  } on TimeoutException {
    // The settings screen stayed open. The next resume schedules whatever is allowed.
  } finally {
    observer.close();
    WidgetsBinding.instance.removeObserver(observer);
  }
}
