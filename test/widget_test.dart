// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:testing/main.dart';
import 'package:testing/pages/products.dart';

void main() {

  group('Find by Type',()
  {
    testWidgets('Test to see that MaterialApp widget is in the tree', (
        WidgetTester tester) async {
      await tester.pumpWidget(MyApp());

      expect(find.byType(MaterialApp), findsOneWidget);
    });

    testWidgets('Test to see that ListView widget is in the tree', (
        WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(home: Products(),
        ),
      );

      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile),findsNothing);
    });
  });
}
