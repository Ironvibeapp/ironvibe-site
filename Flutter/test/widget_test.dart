import 'dart:ui';

import 'package:flutter_test/flutter_test.dart';

import 'package:fitness_app/main.dart';

void main() {
  testWidgets('IronVibe home shows app title', (WidgetTester tester) async {
    await tester.binding.setSurfaceSize(const Size(800, 1600));
    addTearDown(() => tester.binding.setSurfaceSize(null));

    await tester.pumpWidget(const IronVibeApp());
    await tester.pumpAndSettle();

    expect(find.text('IRONVIBE'), findsOneWidget);
    expect(find.text('ironvibe.app'), findsOneWidget);
    expect(find.text('t.me/IronVibeapp'), findsOneWidget);
    expect(find.text('support@ironvibe.app'), findsOneWidget);
    expect(find.text('Privacy policy'), findsOneWidget);
  });
}
