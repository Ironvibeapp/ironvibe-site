import 'dart:io';
import 'dart:typed_data';

import 'package:fitness_app/l10n/app_localizations.dart';
import 'package:fitness_app/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';

const _longName = 'ГОРИЗОНТАЛЬНАЯ ТЯГА К ПОЯСУ ОДНОЙ РУКОЙ';

Future<void> _loadRoboto() async {
  final root = Platform.environment['FLUTTER_ROOT'];
  expect(root, isNotNull, reason: 'flutter test sets FLUTTER_ROOT');
  final dir = Directory('$root/bin/cache/artifacts/material_fonts');
  final loader = FontLoader('Roboto');
  for (final file in [
    'Roboto-Regular.ttf',
    'Roboto-Medium.ttf',
    'Roboto-Bold.ttf',
  ]) {
    final bytes = File('${dir.path}/$file').readAsBytesSync();
    loader.addFont(
      Future.value(ByteData.view(Uint8List.fromList(bytes).buffer)),
    );
  }
  await loader.load();
}

Widget _app(Widget home) {
  return MaterialApp(
    locale: const Locale('ru'),
    localizationsDelegates: AppLocalizations.localizationsDelegates,
    supportedLocales: AppLocalizations.supportedLocales,
    theme: ironVibeBuildTheme(Brightness.light),
    home: Scaffold(body: home),
  );
}

void _usePhone(WidgetTester tester) {
    tester.view.physicalSize = const Size(360, 1600);
  tester.view.devicePixelRatio = 1;
  addTearDown(tester.view.resetPhysicalSize);
  addTearDown(tester.view.resetDevicePixelRatio);
}

void _expectCompactNameStyle(TextStyle? style) {
  expect(style?.fontSize, kIronVibeExerciseNameFontSize);
  expect(style?.fontWeight, FontWeight.w600);
  expect(style?.letterSpacing, 0.1);
  expect(style?.height, 1.2);
}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();

  test('saved exercise names stay trimmed uppercase', () {
    expect(
      normalizeExerciseName('  горизонтальная тяга к поясу одной рукой  '),
      _longName,
    );
  });

  testWidgets('exercise name field uses compact two-line type', (tester) async {
    await _loadRoboto();
    _usePhone(tester);
    final data = ExerciseData(name: 'горизонтальная тяга к поясу одной рукой');
    addTearDown(data.nameController.dispose);
    for (final set in data.sets) {
      addTearDown(set.weight.dispose);
      addTearDown(set.reps.dispose);
      addTearDown(set.rir.dispose);
      addTearDown(set.duration.dispose);
      addTearDown(set.intensity.dispose);
    }

    await tester.pumpWidget(
      _app(SingleChildScrollView(child: ExerciseCard(data: data, exerciseIndex: 0))),
    );
    await tester.pump();

    final field = find.byWidgetPredicate(
      (widget) => widget is TextField && widget.controller?.text == _longName,
    );
    expect(field, findsOneWidget);
    final textField = tester.widget<TextField>(field);
    expect(textField.maxLines, kIronVibeExerciseNameMaxLines);
    expect(textField.minLines, 1);
    _expectCompactNameStyle(textField.style);

    final paragraph = tester.renderObject<RenderParagraph>(
      find.descendant(of: field, matching: find.byType(RichText)).first,
    );
    expect(paragraph.didExceedMaxLines, isFalse);
    expect(paragraph.text.style?.fontSize, kIronVibeExerciseNameFontSize);
  });

  testWidgets('typing keeps a trailing space in the name field', (tester) async {
    await _loadRoboto();
    _usePhone(tester);
    final data = ExerciseData();
    addTearDown(data.nameController.dispose);
    for (final set in data.sets) {
      addTearDown(set.weight.dispose);
      addTearDown(set.reps.dispose);
      addTearDown(set.rir.dispose);
      addTearDown(set.duration.dispose);
      addTearDown(set.intensity.dispose);
    }

    await tester.pumpWidget(_app(ExerciseCard(data: data, exerciseIndex: 0)));
    await tester.pump();

    final field = find.byWidgetPredicate(
      (widget) =>
          widget is TextField &&
          widget.decoration?.hintText == 'Введите название упражнения',
    );
    expect(field, findsOneWidget);
    await tester.enterText(field, 'становая ');
    await tester.pump();

    expect(tester.widget<TextField>(field).controller!.text, 'СТАНОВАЯ ');
    expect(data.nameController.text, 'СТАНОВАЯ ');
  });

  testWidgets('history row wraps a long uppercase name in two lines', (
    tester,
  ) async {
    await _loadRoboto();
    _usePhone(tester);
    workoutHistory
      ..clear()
      ..add(
        WorkoutLog(DateTime.now(), [
          ExerciseLog(_longName, [SetLog('32', '10', '2')]),
        ]),
      );
    addTearDown(workoutHistory.clear);

    await tester.pumpWidget(_app(const CalendarScreen()));
    await tester.pump();
    await tester.tap(find.byType(ExpansionTile));
    await tester.pump();
    await tester.pump(const Duration(milliseconds: 400));

    final history = find.textContaining(_longName);
    expect(history, findsOneWidget);
    final text = tester.widget<Text>(history);
    expect(text.maxLines, kIronVibeExerciseNameMaxLines);
    expect(text.overflow, TextOverflow.ellipsis);
    _expectCompactNameStyle(text.style);
    expect(text.data, contains(_longName));
    expect(text.data, isNot(contains('горизонтальная')));

    final paragraph = tester.renderObject<RenderParagraph>(history);
    expect(paragraph.didExceedMaxLines, isFalse);
    final oneLine = kIronVibeExerciseNameFontSize * 1.2;
    expect(paragraph.size.height, greaterThan(oneLine * 1.4));
    expect(paragraph.size.height, lessThanOrEqualTo(oneLine * 2.15));
  });
}
