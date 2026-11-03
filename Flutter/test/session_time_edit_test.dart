import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  late List<TrainerSession> savedSchedule;
  late List<Client> savedClients;

  setUp(() {
    SharedPreferences.setMockInitialValues(<String, Object>{});
    savedSchedule = List.of(trainerSchedule);
    savedClients = List.of(clients);
    trainerSchedule = [];
    clients = [];
  });

  tearDown(() {
    trainerSchedule = savedSchedule;
    clients = savedClients;
  });

  test('a planned session moves to a new clock on the same day', () {
    final session = ironVibeNewTrainerSession(
      dateTime: DateTime(2026, 11, 4, 15, 20),
      clientName: 'Анна',
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('20', '8', '2')]),
      ],
      isScheduledPlan: true,
      remindMinutesBefore: 30,
    );
    expect(ironVibeTrainerSessionTimeIsEditable(session), isTrue);

    ironVibeApplyTrainerSessionTime(
      session,
      const TimeOfDay(hour: 16, minute: 20),
    );

    expect(session.dateTime, DateTime(2026, 11, 4, 16, 20));
    expect(session.exercises.single.name, 'ЖИМ');
    expect(session.exercises.single.sets.single.weight, '20');
    expect(session.remindMinutesBefore, 30);
    expect(session.isScheduledPlan, isTrue);
  });

  test('a finished session does not offer a time change', () {
    final now = DateTime.now();
    final session = ironVibeNewTrainerSession(
      dateTime: DateTime(now.year, now.month, now.day, 9, 0),
      clientName: 'Анна',
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('20', '8', '2')]),
      ],
      isCompleted: true,
    );
    expect(ironVibeTrainerSessionTimeIsEditable(session), isFalse);
  });

  testWidgets('the calendar pencil opens the planned session clock', (
    tester,
  ) async {
    tester.view.physicalSize = const Size(400, 1600);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final now = DateTime.now();
    final planned = ironVibeNewTrainerSession(
      dateTime: DateTime(now.year, now.month, now.day, 15, 20),
      clientName: 'Анна',
      exercises: [
        ExerciseLog('ЖИМ', [SetLog('20', '8', '2')]),
      ],
      isScheduledPlan: true,
      remindMinutesBefore: 30,
    );
    final done = ironVibeNewTrainerSession(
      dateTime: DateTime(now.year, now.month, now.day, 18, 0),
      clientName: 'Борис',
      exercises: [
        ExerciseLog('ТЯГА', [SetLog('40', '10', '2')]),
      ],
      isCompleted: true,
    );
    trainerSchedule.addAll([planned, done]);

    await tester.pumpWidget(
      MaterialApp(
        locale: const Locale('ru'),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
        theme: ironVibeBuildTheme(Brightness.light),
        home: const TrainerScreen(),
      ),
    );
    await tester.pumpAndSettle();

    expect(find.byTooltip('Изменить время'), findsOneWidget);
    expect(find.text('Анна'), findsOneWidget);
    expect(find.text('Борис'), findsOneWidget);

    await tester.tap(find.byTooltip('Изменить время'));
    await tester.pumpAndSettle();

    expect(find.text('Изменить время'), findsWidgets);
    expect(find.text('15:20'), findsWidgets);

    await tester.tap(find.text('Сохранить'));
    await tester.pumpAndSettle();

    expect(planned.dateTime.hour, 15);
    expect(planned.dateTime.minute, 20);

    await tester.longPress(find.text('Анна'));
    await tester.pumpAndSettle();
    expect(find.text('Изменить время'), findsWidgets);
    await tester.tap(find.text('Отмена'));
    await tester.pumpAndSettle();
  });
}
