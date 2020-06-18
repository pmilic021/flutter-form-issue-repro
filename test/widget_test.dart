// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:flutterapp/main.dart';

void main() {
  testWidgets('test', (WidgetTester tester) async {
    await tester.pumpWidget(MyApp());

    expect(find.text('Required'), findsNothing);

    await tester.tap(find.text('SUBMIT'));
    await tester.pump(const Duration(seconds: 1));

    expect(find.text('Required'), findsOneWidget);

    await tester.tap(find.text('aaa'));
    await tester.pump(const Duration(seconds: 1));

    // we see that it was indeed tapped
    expect(find.text('aaa'), findsNWidgets(2));

    // this should pass, since it should find no widgets
    expect(find.text('Required'), findsNothing);
  });
}
