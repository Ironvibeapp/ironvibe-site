import 'package:flutter_test/flutter_test.dart';
import 'package:fitness_app/main.dart';
import 'package:fitness_app/l10n/app_localizations_en.dart';

TrainerSession _session({
  String client = 'Vasya',
  DateTime? date,
  List<ExerciseLog>? exercises,
  String note = '',
}) {
  return TrainerSession(
    date ?? DateTime(2026, 9, 2, 18, 30),
    client,
    note,
    exercises: exercises ?? const [],
  );
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  test('print rows skip empty names, empty sets, and RIR-only sets', () {
    final session = _session(
      exercises: [
        ExerciseLog('', [SetLog('60', '8', '2')]),
        ExerciseLog('Squat', [SetLog('', '', '1')]),
        ExerciseLog('Bench', [
          SetLog('', '', '0'),
          SetLog('60', '8', '2'),
          SetLog('62.5', '8', '1'),
        ]),
      ],
    );
    final rows = ironVibeSessionPrintRows(session);
    expect(rows, hasLength(1));
    expect(rows.single.name, 'BENCH');
    expect(rows.single.detail, '60×8  ·  62.5×8');
  });

  test('print rows format cardio as time · intensity', () {
    final session = _session(
      exercises: [
        ExerciseLog('Row', [
          SetLog(
            '',
            '',
            '',
            isCardio: true,
            duration: '20',
            intensity: '7',
          ),
        ], isCardio: true),
      ],
    );
    final rows = ironVibeSessionPrintRows(session);
    expect(rows, hasLength(1));
    expect(rows.single.name, 'ROW');
    expect(rows.single.detail, '20 · 7');
  });

  test('print rows keep one line per named exercise', () {
    final session = _session(
      exercises: [
        ExerciseLog('Squat', [SetLog('100', '5', '2')]),
        ExerciseLog('Bench', [SetLog('60', '8', '2')]),
        ExerciseLog('Row', [SetLog('70', '10', '1')]),
        ExerciseLog('Curl', [SetLog('12', '12', '0')]),
      ],
    );
    final rows = ironVibeSessionPrintRows(session);
    expect(rows.map((r) => r.name).toList(), [
      'SQUAT',
      'BENCH',
      'ROW',
      'CURL',
    ]);
  });

  test('print file stem sanitizes the client name and date', () {
    expect(
      ironVibeSessionPrintFileStem('Серёжа / A', DateTime(2026, 9, 2, 18, 5)),
      'IronVibe_Серёжа_A_2026_09_02',
    );
    expect(
      ironVibeSessionPrintFileStem('   ', DateTime(2026, 1, 1)),
      'IronVibe_Client_2026_01_01',
    );
  });

  test('print when matches the session header clock', () {
    expect(
      ironVibeSessionPrintWhen(DateTime(2026, 9, 2, 18, 5)),
      '02.09.2026 · 18:05',
    );
  });

  test('typical session pdf starts with the PDF header', () async {
    final session = _session(
      note: 'Starter',
      exercises: [
        ExerciseLog('Squat', [SetLog('100', '5', '2')]),
        ExerciseLog('Bench', [SetLog('60', '8', '2'), SetLog('62.5', '8', '1')]),
        ExerciseLog('Row', [SetLog('70', '10', '1')]),
        ExerciseLog('Curl', [SetLog('12', '12', '0')]),
      ],
    );
    final bytes = await ironVibeBuildSessionPdfBytes(
      session: session,
      l: AppLocalizationsEn(),
    );
    expect(String.fromCharCodes(bytes.take(5)), '%PDF-');
    expect(bytes.length, greaterThan(4000));
  });
}
